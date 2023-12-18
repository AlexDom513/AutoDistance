-----------------------------------------------------------------------------------------------
--    Alexander Domagala --- 12/9/23
-----------------------------------------------------------------------------------------------
--    Inspired by: https://github.com/deepc94/pid-fpga-vhdl/blob/master/pid.vhd
--    Notes on computing PID_Position:
--      We allow +/- 90 degrees of motor rotation from the calibrated 0 point
--      Motor has 1.8 degree step size, but we utilize (1/8) microstepping -> (0.225 degrees)
--      90 degrees / 0.225 degrees per motor step = 400 motor step maximum in either direction
--      Thus, PID_Position has an allowable range [-400, 400]. We must perform our calculations
--      so that there is as little saturation as possible. We want movement of the cart along
--      the ramp to yield movement of the motor system.
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PidController is
  generic (
    gTarget_Dist      : natural := 14
  );
  port (
    Clk               : in  std_logic;
    Rst               : in  std_logic;
    Curr_Dist_Valid   : in  std_logic;
    Curr_Dist         : in  signed(18 downto 0);
    PID_Position      : out signed(11 downto 0)                                         -- (Q12.0), indicates where stepper should be relative to calibration point
  );
end PidController;

architecture Behavioral of PidController is

  -- constants
  constant cKp            : signed(12 downto 0) := to_signed(1,5) & "00000000";         -- (Q5.8), (1)
  constant cKi            : signed(12 downto 0) := to_signed(1,5) & "00000000";         -- (Q5.8), (2)
  constant cKd            : signed(12 downto 0) := to_signed(2,5) & "00000000";         -- (Q5.8), (2)
  constant cTarget_Dist   : signed(18 downto 0) := to_signed(gTarget_Dist,7) & x"000";  -- (Q7.12), target distance = 25.0 cm
  constant cSat_Max       : signed(11 downto 0) := to_signed(400,12);                   -- (Q12.0), +400
  constant cSat_Min       : signed(11 downto 0) := to_signed(-400,12);                  -- (Q12.0), -400

  -- control
  signal sI_disable       : std_logic;                                                  -- to prevent integral windup

  -- data
  signal sCurr_Dist       : signed(18 downto 0);                                        -- (Q7.12)  current distance to cart
  signal sDist_Error      : signed(18 downto 0);                                        -- (Q7.12)  error = target - current
  signal sDist_Error_d1   : signed(18 downto 0);                                        -- (Q7.12)  previously computed error
  signal sP               : signed(31 downto 0);                                        -- (Q12.20) proportional
  signal sI               : signed(31 downto 0);                                        -- (Q12.20) integral
  signal sD               : signed(31 downto 0);                                        -- (Q12.20) derivative
  signal sPID_Position    : signed(31 downto 0);                                        -- (Q12.20)

  -- state machine
  type tPid_State is (IDLE, ERR, PID, RES, SCALE, SAT);
  signal sState : tPid_State := IDLE;

begin

  ----------------------------------------------------------------------
  -- PID Computation
  ----------------------------------------------------------------------
  process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sI_disable            <= '0';
        sP                    <= (others => '0');
        sI                    <= (others => '0');
        sDist_Error           <= (others => '0');
        sDist_Error_d1        <= (others => '0');
        sPID_Position         <= (others => '0');
        PID_Position          <= (others => '0');
        sState                <= IDLE;
      else
        case sState is

          -- IDLE state, wait for valid distance reading
          when IDLE =>
            if (Curr_Dist_Valid = '1') then
              sCurr_Dist      <= Curr_Dist;
              sState          <= ERR;
            end if;

          -- ERR state, compute new error and register previous error
          when ERR =>
            sDist_Error       <= cTarget_Dist - sCurr_Dist;
            sDist_Error_d1    <= sDist_Error;
            sState            <= PID;

          -- PID state, perform PID computation
          -- sP (Q12.20) = cKP (Q5.8) * sDist_Error  (Q7.12)
          -- sI (Q12.20) = cKI (Q5.8) * (sDist_Error (Q7.12) + sDist_Error_d1 (Q7.12))
          -- sD (Q12.20) = cKD (Q5.8) * (sDist_Error (Q7.12) - sDist_Error_d1 (Q7.12))
          when PID =>
            sP                <= cKp * sDist_Error;
            sD                <= cKd * (sDist_Error - sDist_Error_d1);
            
            -- disable integral when in saturation to prevent integral windup
            if (sI_disable = '0') then
              sI              <= cKi * (sDist_Error + sDist_Error_d1);
            else
              sI              <= (others => '0');
            end if;
            sState            <= RES;

          -- RES state, new stepper angle = previous stepper angle + gains
          when RES =>
            sPID_Position     <= sP + sI + sD;
            sState            <= SCALE;

          when SCALE =>
            sPID_Position     <= shift_left(sPID_Position,3);
            sState            <= SAT;
          
          -- SAT state, saturate the result if necessary and provide scaling for microstepping
          when SAT =>
            if (sPID_Position(sPID_Position'high downto sPID_Position'high-11) > cSat_Max) then
              sI_disable      <= '1';
              PID_Position    <= cSat_Max;
            elsif (sPID_Position(sPID_Position'high downto sPID_Position'high-11) < cSat_Min) then
              sI_disable      <= '1';
              PID_Position    <= cSat_Min;
            else
              sI_disable      <= '0';
              PID_Position    <= sPID_Position(sPID_Position'high downto sPID_Position'high-11);
            end if;
            sState <= IDLE;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
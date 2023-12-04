-----------------------------------------------------------------------------------------------
--    AlexDom513 --- 11/23/23
-----------------------------------------------------------------------------------------------
--    Inspired by: https://github.com/deepc94/pid-fpga-vhdl/blob/master/pid.vhd
--    Notes on computing PID_Position:
--      We allow +/- 90 degrees of motor rotation from the calibrated 0 point
--      90 degrees / 1.8 degrees per motor step = 50 motor step maximum in either direction
--      Thus, PID_Position has an allowable range [-50, 50]. We must perform our calculations
--      so that there is as little saturation as possible. We want movement of the cart along
--      the ramp to yield movement of the motor system.
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PidController is
  generic (
    gTarget_Dist : natural := 14
  );
  port (
    Clk               : in  std_logic;
    Rst               : in  std_logic;
    Curr_Dist         : in  signed(18 downto 0);
    Curr_Dist_Valid   : in  std_logic;
    PID_Position      : out signed(11 downto 0)                                   --(Q12.0), indicates where stepper should be relative to calibration point
  );
end PidController;

architecture Behavioral of PidController is

  -- constants
  constant cKp            : signed(12 downto 0) := to_signed(2,5) & "00000000";         --(Q5.8), (4)
  constant cKi            : signed(12 downto 0) := to_signed(0,5) & "00000000";         --(Q5.8), (0)
  constant cKd            : signed(12 downto 0) := to_signed(0,5) & "00000000";         --(Q5.8), (0)
  constant cTarget_Dist   : signed(18 downto 0) := to_signed(gTarget_Dist,7) & x"000";  --(Q7.12), target distance = 25.0 cm
  constant cSat_Max       : signed(11 downto 0) := to_signed(50,12);                    --(Q12.0), +50
  constant cSat_Min       : signed(11 downto 0) := to_signed(-50,12);                   --(Q12.0), -50

  -- data
  signal sCurr_Dist       : signed(18 downto 0);                                        --(Q7.12)  current distance to cart
  signal sDist_Error      : signed(18 downto 0);                                        --(Q7.12)  error = target - current
  signal sDist_Error_d1   : signed(18 downto 0);                                        --(Q7.12)  previously computed error
  signal sP               : signed(31 downto 0);                                        --(Q12.20) proportional
  signal sI               : signed(31 downto 0);                                        --(Q12.20) integral
  signal sD               : signed(31 downto 0);                                        --(Q12.20) derivative
  signal sPID_Position    : signed(31 downto 0);                                        --(Q12.20)

  -- state machine
  type tPid_State is (IDLE, ERR, PID, RES, SAT);
  signal sState : tPid_State := IDLE;

begin

  ----------------------------------------------------------------------
  -- PID Computation
  ----------------------------------------------------------------------
  process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sDist_Error     <= (others => '0');
        sDist_Error_d1  <= (others => '0');
        PID_Position    <= (others => '0');
        sPID_Position   <= (others => '0');
        sState          <= IDLE;
      else
        case sState is

          -- IDLE state, wait for valid distance reading
          when IDLE =>
            if (Curr_Dist_Valid = '1') then
              sCurr_Dist  <= Curr_Dist;
              sState      <= ERR;
            end if;

          -- ERR state, compute error
          when ERR =>
            sDist_Error   <= cTarget_Dist - sCurr_Dist;
            sState        <= PID;

          -- PID state, perform PID computation
          -- sP (Q12.20) = cKP (Q5.8) * sDist_Error (Q7.12)
          when PID =>
            sP            <= cKp * sDist_Error;
            sState        <= RES;

          -- RES state, add together the gains to obtain the result
          when RES =>
            sPID_Position <= sP;
            sState        <= SAT;
          
          -- SAT state, saturate the result if necessary
          when SAT =>
            if (sPID_Position(sPID_Position'high downto sPID_Position'high-11) > cSat_Max) then
              PID_Position <= cSat_Max;
            elsif (sPID_Position(sPID_Position'high downto sPID_Position'high-11) < cSat_Min) then
              PID_Position <= cSat_Min;
            else
              PID_Position <= sPID_Position(sPID_Position'high downto sPID_Position'high-11);
            end if;
            sState <= IDLE;
        end case;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------
  -- FIR Filter
  ----------------------------------------------------------------------
  -- smooth the target stepper angle
end Behavioral;
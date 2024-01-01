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
  constant cKp            : signed(12 downto 0) := to_signed(3,5) & "00000000";         -- (Q5.8), (3)
  constant cKi            : signed(12 downto 0) := to_signed(0,5) & "00100000";         -- (Q5.8), (0.125)
  constant cKd            : signed(12 downto 0) := to_signed(2,5) & "10000000";         -- (Q5.8), (2.5)
  constant cTarget_Dist   : signed(18 downto 0) := to_signed(gTarget_Dist,7) & x"000";  -- (Q7.12), target distance = 25.0 cm
  constant cSat_Max       : signed(11 downto 0) := to_signed(400,12);                   -- (Q12.0), +400
  constant cSat_Min       : signed(11 downto 0) := to_signed(-400,12);                  -- (Q12.0), -400

  -- data
  signal sCurr_Dist       : signed(18 downto 0);                                        -- (Q7.12)  current distance to cart
  signal sDist_Error      : signed(18 downto 0);                                        -- (Q7.12)  error = target - current
  signal sDist_Error_d1   : signed(18 downto 0);                                        -- (Q7.12)  previously computed error
  signal sDist_Error_Sum  : signed(18 downto 0);                                        -- (Q7.12)  cumulative error over time
  signal sP               : signed(31 downto 0);                                        -- (Q12.20) proportional
  signal sI               : signed(31 downto 0);                                        -- (Q12.20) integral
  signal sD               : signed(31 downto 0);                                        -- (Q12.20) derivative
  signal sPID_Position    : signed(31 downto 0);                                        -- (Q12.20)

  -- state machine
  type tPid_State is (IDLE, ERR, ERR_PREV, PID, RES, SCALE, SAT);
  signal sState : tPid_State := IDLE;

begin

  ----------------------------------------------------------------------
  -- PID Computation
  ----------------------------------------------------------------------
  process(Clk) is
    variable vDist_Error_Sum_Check : signed(18 downto 0);
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        vDist_Error_Sum_Check := (others => '0');
        sP                    <= (others => '0');
        sI                    <= (others => '0');
        sDist_Error           <= (others => '0');
        sDist_Error_Sum       <= (others => '0');
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
            sState            <= ERR_PREV;

          -- ERR_PREV state, monitor deadzone or compute cumulative error for integral gain
          when ERR_PREV =>

            -- error deadzone, error is less than threshold, return to idle
            if (sDist_Error(sDist_Error'high) = '0' and signed(sDist_Error(18 downto 12)) < 1) then
              PID_Position    <= (others => '0');
              sState          <= IDLE;
            elsif (sDist_Error(sDist_Error'high) = '1' and signed(sDist_Error(18 downto 12)) > -1) then
              PID_Position    <= (others => '0');
              sState          <= IDLE;
            else

              -- Note on overflow: 
              --    sDist_Error can only be values between 0 and 50 due to the length of the ramp.
              --    This means sP and sD will not overflow. However, sI is cumulative and
              --    will eventually lead to overflow if the cart is held in place.
              --    We need to constrain sI (really sDist_Error_Sum) and ensure it does not overflow.

              -- compute new error value
              vDist_Error_Sum_Check := sDist_Error_Sum + sDist_Error;

              -- if the signs of both inputs are equal to each other, then check for overflow
              if (sDist_Error_Sum(sDist_Error_Sum'high) = sDist_Error(sDist_Error'high)) then

                -- if the result has a different sign than the inputs, keep previous value
                if (vDist_Error_Sum_Check(vDist_Error_Sum_Check'high) /= sDist_Error(sDist_Error'high)) then
                  sDist_Error_Sum <= sDist_Error_Sum;
                else
                  sDist_Error_Sum <= vDist_Error_Sum_Check;
                end if;
              else
                sDist_Error_Sum <= vDist_Error_Sum_Check;
              end if;
              sState            <= PID;
            end if;

          -- PID state, perform PID computation
          when PID =>

            -- Calculations:
            -- sP (Q12.20) = cKP (Q5.8) * sDist_Error (Q7.12)
            -- sI (Q12.20) = cKI (Q5.8) * sDist_Error_Sum (Q7.12)
            -- sD (Q12.20) = cKD (Q5.8) * (sDist_Error (Q7.12) - sDist_Error_d1 (Q7.12))

            sP                <= cKp * sDist_Error;
            sI                <= cKi * (sDist_Error_Sum);
            sD                <= cKd * (sDist_Error - sDist_Error_d1);
            sState            <= RES;

          -- RES state, new stepper angle = summation of gains
          when RES =>
            sPID_Position     <= sP + sI + sD;
            sState            <= SCALE;

          when SCALE =>
            sPID_Position     <= shift_left(sPID_Position,3);
            sState            <= SAT;
          
          -- SAT state, saturate the result if necessary and provide scaling for microstepping
          when SAT =>
            if (sPID_Position(sPID_Position'high downto sPID_Position'high-11) > cSat_Max) then
              PID_Position    <= cSat_Max;
            elsif (sPID_Position(sPID_Position'high downto sPID_Position'high-11) < cSat_Min) then
              PID_Position    <= cSat_Min;
            else
              PID_Position    <= sPID_Position(sPID_Position'high downto sPID_Position'high-11);
            end if;
            sState <= IDLE;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
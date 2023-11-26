-----------------------------------------------------------------------------------------------
--    AlexDom513 --- 11/23/23
-----------------------------------------------------------------------------------------------
--    based on: https://github.com/deepc94/pid-fpga-vhdl/blob/master/pid.vhd
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PidController is
  port (
    Clk               : in  std_logic;
    Rst               : in  std_logic;
    Curr_Dist         : in  signed(18 downto 0);
    Curr_Dist_Valid   : in  std_logic;
    PID_Postion       : out signed(35 downto 0)
  );
end PidController;

architecture Behavioral of PidController is

  --constants
  constant cKp            : signed(12 downto 0) := "00010" & "00000000";  --(Q5.8), (2)
  constant cKi            : signed(12 downto 0) := "00000" & "00000000";  --(Q5.8), (0)
  constant cKd            : signed(12 downto 0) := "00000" & "00000000";  --(Q5.8), (0)
  constant cTarget_Dist   : signed(18 downto 0) := "0011001" & x"000";    --(Q7.12) target distance = 25.0 cm
  constant cDeg_Steps     : signed(6 downto 0)  := "0100100";             --(Q1.6) (1/1.8) = .5555

  --data
  signal sCurr_Dist       : signed(18 downto 0);                          --(Q7.12)  current distance to cart
  signal sDist_Error      : signed(18 downto 0);                          --(Q7.12)  error = target - current
  signal sDist_Error_d1   : signed(18 downto 0);                          --(Q7.12)  previously computed error
  signal sP               : signed(31 downto 0);                          --(Q12.20) proportional
  signal sI               : signed(31 downto 0);                          --(Q12.20) integral
  signal sD               : signed(31 downto 0);                          --(Q12.20) derivative
  signal sTheta           : signed(35 downto 0);                          --(Q16.20) output
  signal sTheta_d1        : signed(35 downto 0);                          --(Q16.20) previously computed output

  --state machine
  type tPid_State is (IDLE, ERR, PID, RES);
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
        PID_Postion     <= (others => '0');
        sTheta          <= (others => '0');
        sTheta_d1       <= (others => '0');
        sState          <= IDLE;
      else
        case sState is

          --IDLE state, wait for valid distance reading
          when IDLE =>
            if (Curr_Dist_Valid = '1') then
              sCurr_Dist  <= Curr_Dist;
              sState      <= ERR;
            end if;

          --ERR state, compute error
          when ERR =>
            sDist_Error     <= cTarget_Dist - sCurr_Dist;
            sDist_Error_d1  <= sDist_Error;
            sState          <= PID;

          --PID state, perform PID computation
          when PID =>
            sP      <= cKp * sDist_Error;
            sI      <= cKi * (sDist_Error + sDist_Error_d1);
            sD      <= cKd * (sDist_Error - sDist_Error_d1);
            sState  <= RES;

          --RES state, compute result
          when RES =>
            PID_Postion    <= resize(sP * cDeg_Steps, PID_Postion'length);--=sTheta_d1 + sP + sI + sD;
            --sTheta_d1 <= sTheta;
            sState    <= IDLE;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
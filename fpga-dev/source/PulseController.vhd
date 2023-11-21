library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PulseController is
  generic (

    --initialized for use with 125 MHz clock (8 ns period), 8 ns * cConstant = target time
    cTrig_Count : integer := 1500;        -- > 10 us trigger pulse
    cRecv_Count : integer := 477;         -- ~2^-18 (s) receive resolution
    cWait_Count : integer := 7500000;     -- 60 ms retransmit window
    cPause_Count: integer := 7500000      -- 60 ms pause
  );
  port (
    Clk             : in  std_logic;                --input clock
    Rst             : in  std_logic;                --reset signal
    Trig_Enable     : in  std_logic;                --enable/disable ultrasonic
    Recv_Pulse      : in  std_logic;                --recvieved pulse from ultrasonic
    Trig_Pulse      : out std_logic;                --trigger pulse sent to ultrasonic
    Curr_Dist       : out unsigned(26 downto 0);    --(Q8.19) current distance 
    Led0            : out std_logic;
    Led1            : out std_logic;
    Led2            : out std_logic;
    Led3            : out std_logic
    );
end PulseController;

architecture Behavioral of PulseController is

  --constants
  constant cTime_to_Dist  : unsigned(8 downto 0) := "101010111";  --(Q8.1) conversion factor, represents (speed of sound)/2 = 171.5 m/s

  --time increment
  signal sRecv_Time       : unsigned(17 downto 0);                --(Q0.18) round-trip pulse travel time
  signal ledRecv_Time     : unsigned(17 downto 0);

  --counters
  signal sTrig_Counter    : integer range 0 to cTrig_Count;
  signal sWait_Counter    : integer range 0 to cWait_Count;
  signal sRecv_Counter    : integer range 0 to cRecv_Count;     --replace all with unsigned!!!
  signal sPause_Counter   : integer range 0 to cPause_Count;

  --state machine
  type tPulse_State is (IDLE, TRIG, ANTCP, RECV, PAUSE);
  signal sState : tPulse_State := IDLE;

begin

  --used for on-board development/debugging
  ledIndicator: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      Led0 <= '0';
      Led1 <= '0';
      Led2 <= '0';
      Led3 <= '0';
      if (ledRecv_Time < 50) then
        Led0 <= '1';
      elsif (ledRecv_Time < 100) then
        Led1 <= '1';
      elsif (ledRecv_Time < 200) then
        Led2 <= '1';
      else
        Led3 <= '1';
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------
  -- PulseController State Machine
  -- creates stimulus pulse to start HC-SR04
  -- processes length of returned wavefrom to discern pulse travel time
  ----------------------------------------------------------------------
  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then

      --reset logic, state machine to IDLE, output sRecv_Time to zero, disable trigger pulse
      if (Rst = '1') then
        sState        <= IDLE;
        sRecv_Time    <= (others => '0');
        Curr_Dist     <= (others => '0');
        Trig_Pulse    <= '0';
      else
        case sState is
          
          --IDLE state, prepare to interact with ultrasonic module (perform resets), only proceed if Trig_Enable = '1'
          when IDLE =>
            sRecv_Time     <= (others=>'0');
            sTrig_Counter  <= 0;
            sWait_Counter  <= 0;
            sRecv_Counter  <= 0;
            sPause_Counter <= 0;
            if (Trig_Enable = '1') then
              sState <= TRIG;
            else
              sState <= IDLE;
            end if;

          --TRIG state, send 10 us pulse (assuming 125 MHz clk), then proceed to ANTCP state
          when TRIG =>
            if (sTrig_Counter < cTrig_Count-1) then 
              Trig_Pulse <= '1';
              sTrig_Counter <= sTrig_Counter + 1;
              sState <= TRIG;
            else
              Trig_Pulse <= '0';
              sTrig_Counter <= 0;
              sState <= ANTCP;
            end if;

          --ANTCP state, anticipate echo signal, proceed to RECV state when return pulse is received, otherwise re-trigger
          when ANTCP =>
            if (Recv_Pulse = '1') then
              sWait_Counter <= 0;
              sState <= RECV;
            elsif (sWait_Counter > cWait_Count-1) then
              sWait_Counter <= 0;
              sState <= TRIG;
            else
              sWait_Counter <= sWait_Counter + 1;
              sState <= ANTCP;
            end if;
        
          --RECV state, recieve echo pulse and determine length, sRecv_Time incremented by 1 after ever cRecv_Count
          when RECV =>
            if (Recv_Pulse = '1') then
              if (sRecv_Counter > cRecv_Count-1) then
                sRecv_Counter <= 0;
                sRecv_Time <= sRecv_Time + 1;
              else
                sRecv_Counter <= sRecv_Counter + 1;
              end if;
            else
              Curr_Dist <= sRecv_Time * cTime_to_Dist;
              ledRecv_Time <= sRecv_Time;
              sState <= PAUSE;
            end if;

          --PAUSE state, allow minimum of 60 ms to prevent trigger signal from affecting echo
          when PAUSE =>
            if (sPause_Counter < cPause_Count-1) then
              sPause_Counter <= sPause_Counter + 1;
              sState <= PAUSE;
            else
              sState <= IDLE;
            end if;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
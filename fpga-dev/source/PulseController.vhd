-----------------------------------------------------------------------------------------------
--    AlexDom513 --- 11/23/23
-----------------------------------------------------------------------------------------------
--    Module interacts with HC-SR04 by sending a trigger pulse and then processes the pulse
--    returned from the sensor. We convert the duration of the received pulse (in us) to
--    distance by multiplying by the speed of sound (cm/us) and dividing by 2 (we only care
--    about the distance to travel one way, not the entire path).
-----------------------------------------------------------------------------------------------
--    Conversions:
--      actual time (s) = (sRecv_Time)(gRecv_Count)(8 ns clock period when 125 MHz)
--      calculated distance (cm) = (sRecv_Time)(cTime_to_Dist)
----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PulseController is
  generic (
    gTrig_Count : natural := 1500;                  -- > 10 us trigger pulse
    gRecv_Count : natural := 125;                   -- 1 us receive resolution
    gWait_Count : natural := 7500000;               -- 60 ms retransmit window      --(TEST ONLY with 1250)
    gPause_Count: natural := 7500000                -- 60 ms pause                  --(TEST ONLY with 1250)
  );
  port (
    Clk             : in  std_logic;                --input clock
    Rst             : in  std_logic;                --reset signal
    Trig_Enable     : in  std_logic;                --enable/disable ultrasonic
    Recv_Pulse      : in  std_logic;                --recvieved pulse from ultrasonic
    Trig_Pulse      : out std_logic;                --trigger pulse sent to ultrasonic
    Curr_Dist       : out signed(18 downto 0);      --(Q7.12) current distance (cm)
    Curr_Dist_Valid : out std_logic;
    Led0            : out std_logic;
    Led1            : out std_logic;
    Led2            : out std_logic;
    Led3            : out std_logic
  );
end PulseController;

architecture Behavioral of PulseController is

  --constants
  constant cTime_to_Dist  : unsigned(11 downto 0) := "000001000110";  --(Q0.12) conversion factor, represents (speed of sound)/2 = 0.0175 cm/s

  --data
  signal sRecv_Time       : unsigned(11 downto 0);                    --(Q12.0) round-trip pulse travel time (us)
  signal sCurr_Dist       : unsigned(23 downto 0);                    --(Q12.12) current distance (cm)
  signal sLed_Recv_Time   : unsigned(11 downto 0);

  --counters
  signal sTrig_Counter    : natural range 0 to gTrig_Count;
  signal sWait_Counter    : natural range 0 to gWait_Count;
  signal sRecv_Counter    : natural range 0 to gRecv_Count;
  signal sPause_Counter   : natural range 0 to gPause_Count;

  --state machine
  type tPulse_State is (IDLE, TRIG, ANTCP, RECV, PAUSE);
  signal sState : tPulse_State := IDLE;

begin

  ----------------------------------------------------------------------
  -- Distance Output
  ----------------------------------------------------------------------
  --Establish signed format Q(7.12) for the ouptut distance
  --Only need 6 actual integer bits because maximum track length is 50 cm 
  Curr_Dist <= signed('0' & sCurr_Dist(17 downto 0));

  ----------------------------------------------------------------------
  -- LED Output
  ----------------------------------------------------------------------
  --used for on-board development/debugging
  ledIndicator: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      Led0 <= '0';
      Led1 <= '0';
      Led2 <= '0';
      Led3 <= '0';
      if (sLed_Recv_Time < 500) then
        Led0 <= '1';
      elsif (sLed_Recv_Time < 1000) then
        Led1 <= '1';
      elsif (sLed_Recv_Time < 2000) then
        Led2 <= '1';
      else
        Led3 <= '1';
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------
  -- PulseController State Machine
  ----------------------------------------------------------------------
  -- creates stimulus pulse to start HC-SR04
  -- processes length of returned wavefrom to discern pulse travel time

  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then

      --reset logic, state machine to IDLE, output sRecv_Time to zero, disable trigger pulse
      if (Rst = '1') then
        sState            <= IDLE;
        sRecv_Time        <= (others => '0');
        sCurr_Dist        <= (others => '0');
        Trig_Pulse        <= '0';
        Curr_Dist_Valid   <= '0';
      else
        case sState is
          
          --IDLE state, prepare to interact with ultrasonic module (perform resets), only proceed if Trig_Enable = '1'
          when IDLE =>
            sRecv_Time     <= (others => '0');
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
            if (sTrig_Counter < gTrig_Count-1) then 
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
            elsif (sWait_Counter > gWait_Count-1) then
              sWait_Counter <= 0;
              sState <= TRIG;
            else
              sWait_Counter <= sWait_Counter + 1;
              sState <= ANTCP;
            end if;
        
          --RECV state, recieve echo pulse and determine length, sRecv_Time incremented by 1 after every gRecv_Count
          when RECV =>
            if (Recv_Pulse = '1') then
              if (sRecv_Counter > gRecv_Count-1) then
                sRecv_Counter <= 0;
                sRecv_Time <= sRecv_Time + 1;
              else
                sRecv_Counter <= sRecv_Counter + 1;
              end if;
            else
              sCurr_Dist <= sRecv_Time * cTime_to_Dist;
              Curr_Dist_Valid <= '1';
              sLed_Recv_Time <= sRecv_Time;
              sState <= PAUSE;
            end if;

          --PAUSE state, allow minimum of 60 ms to prevent trigger signal from affecting echo
          when PAUSE =>
            Curr_Dist_Valid <= '0';
            if (sPause_Counter < gPause_Count-1) then
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
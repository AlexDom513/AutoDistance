library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PulseController is
  generic (

    --initialized for use with 125 MHz clock
    cTrig_Count : integer := 1250;        --10 us trigger pulse
    cRecv_Count : integer := 1250;        --0.01 ms receive granularity
    cWait_Count : integer := 7500000      --60 ms retransmit/waiting window
  );
  port (
    Clk             : in  std_logic;                          --input clock
    Rst             : in  std_logic;                          --reset signal
    Trig_Enable     : in  std_logic;                          --enable/disable ultrasonic
    Recv_Pulse      : in  std_logic;                          --recvieved pulse from ultrasonic
    Trig_Pulse      : out std_logic;                          --trigger pulse sent to ultrasonic
    Recv_Time       : out std_logic_vector(7 downto 0);       --proportional to pulse width recieved from ultrasonic
    Led0            : out std_logic;
    Led1            : out std_logic;
    Led2            : out std_logic;
    Led3            : out std_logic
    );
end PulseController;

architecture Behavioral of PulseController is

  --time increment
  signal sRecv_Time       : unsigned(7 downto 0);

  --counters
  signal sTrig_Counter    : integer range 0 to cTrig_Count;
  signal sWait_Counter    : integer range 0 to cWait_Count;
  signal sRecv_Counter    : integer range 0 to cRecv_Count;

  --state machine
  type tPulse_State is (IDLE, TRIG, ANTCP, RECV, PAUSE);
  signal sState : tPulse_State := IDLE;

begin

  --usesd for on-board development/debugging
  ledIndicator: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      Led0 <= '0';
      Led1 <= '0';
      Led2 <= '0';
      Led3 <= '0';
      if (sRecv_Time < 20) then
        Led0 <= '1';
      elsif (sRecv_Time < 50) then
        Led1 <= '1';
      elsif (sRecv_Time < 100) then
        Led2 <= '1';
      else
        Led3 <= '1';
      end if;
    end if;
  end process;

  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then

      --reset logic, state machine to IDLE, output Recv_Time to zero, disable trigger pulse
      if (Rst = '1') then
        sState        <= IDLE;
        Recv_Time     <= (others => '0');
        Trig_Pulse    <= '0';
      else
        case sState is
          
          --IDLE state, prepare to interact with ultrasonic module (perform resets), only proceed if Trig_Enable = '1'
          when IDLE =>
            sRecv_Time    <= (others=>'0');
            sTrig_Counter <= 0;
            sWait_Counter <= 0;
            sRecv_Counter <= 0;
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
        
          --RECV state, recieve echo pulse and determine length, sRecv_Time incremented by 1 after every 0.01 ms
          when RECV =>
            if (Recv_Pulse = '1') then
              if (sRecv_Counter > cRecv_Count-1) then
                sRecv_Counter <= 0;
                sRecv_Time <= sRecv_Time + 1;
              else
                sRecv_Counter <= sRecv_Counter + 1;
              end if;
            else
              Recv_Time <= std_logic_vector(sRecv_Time);
              sWait_Counter <= 0;
              sState <= PAUSE;
            end if;

          --PAUSE state, allow minimum of 60 ms to prevent trigger signal from affecting echo
          when PAUSE =>
            if (sWait_Counter < cWait_Count-1) then
              sWait_Counter <= sWait_Counter + 1;
              sState <= PAUSE;
            else
              sState <= IDLE;
            end if;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
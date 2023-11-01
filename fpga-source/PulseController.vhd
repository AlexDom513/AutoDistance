library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PulseController is
  generic (

    --initialized for use with 125 MHz clock
    c_trigScaling : integer := 1250;        --10 us trigger pulse
    c_waitScaling : integer := 750000;      --6 ms retransmit window
    c_recvScaling : integer := 1250         --0.01 ms receive granularity 
  );
  port (
    Clk             : in  std_logic;                           --input clock
    Rst             : in  std_logic;                          --reset signal
    Trig_Enable     : in  std_logic;                          --enable/disable ultrasonic
    Recv_Pulse      : in  std_logic;                          --recvieved pulse from ultrasonic
    Trig_Pulse      : out std_logic;                          --trigger pulse sent to ultrasonic
    Recv_Time       : out std_logic_vector(7 downto 0);       --proportional to pulse width recieved from ultrasonic

    --indicator leds
    Led0          : out std_logic;
    Led1          : out std_logic;
    Led2          : out std_logic;
    Led3          : out std_logic
    );
end PulseController;

architecture Behavioral of PulseController is

  --time tracking
  signal sRecv_Time       : unsigned(7 downto 0);

  --counters
  signal sTrig_Counter    : integer range 0 to c_trigScaling;
  signal sWait_Counter    : integer range 0 to c_waitScaling;
  signal sRecv_Counter    : integer range 0 to c_recvScaling;

  --state machine
  type tPulse_State is (IDLE, TRIG, ANTCP, RECV);
  signal sState : tPulse_State := IDLE;

begin

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
      if (Rst = '1') then
        sState <= IDLE;
        sRecv_Time <= (others => '0');
        Trig_Pulse <= '0';
      else
        case sState is
          when IDLE =>

            --reset signals/counters
            sRecv_Time <= (others=>'0');
            sTrig_Counter <= 0;
            sWait_Counter <= 0;
            sRecv_Counter <= 0;

            --only leave IDLE state if Trig_Enable = '1'
            if (Trig_Enable = '1') then
              sState <= TRIG;
            else
              sState <= IDLE;
            end if;

          --send 10 microsecond pulse (assuming 125 MHz clk)
          when TRIG =>
            if (sTrig_Counter < c_trigScaling-1) then
              Trig_Pulse <= '1';
              sTrig_Counter <= sTrig_Counter + 1;
              sState <= TRIG;
            else
              Trig_Pulse <= '0';
              sTrig_Counter <= 0;
              sState <= ANTCP;
            end if;

          --anticipate echo signal, re-trigger if signal is not recieved within 6 ms (no objects within 1 m)
          when ANTCP =>
            if (Recv_Pulse = '1') then
              sWait_Counter <= 0;
              sState <= RECV;
            elsif (sWait_Counter > c_waitScaling-1) then
              sWait_Counter <= 0;
              sState <= TRIG;
            else
              sWait_Counter <= sWait_Counter + 1;
              sState <= ANTCP;
            end if;
        
          --recieve echo pulse and determine length (0.01 ms granularity)
          when RECV =>
            if (Recv_Pulse = '1') then

              --after each 0.01 ms increment, increment sRecv_Time by 1
              if (sRecv_Counter > c_recvScaling-1) then
                sRecv_Counter <= 0;
                sRecv_Time <= sRecv_Time + 1;
              else
                sRecv_Counter <= sRecv_Counter + 1;
              end if;

            --return to IDLE state
            else
              Recv_Time <= std_logic_vector(sRecv_Time);
              sState <= IDLE;
            end if;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
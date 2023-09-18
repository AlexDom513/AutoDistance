library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PulseController is
    generic (

        --initialized for use with 125 MHz clock
        c_trigScaling : integer := 1250;        --10 us trigger pulse
        c_waitScaling : integer := 750000;      --6 ms retransmit window
        c_recvScaling : integer := 12500        --0.1 ms receive granularity 
    );
    Port (
        i_clk           : in std_logic;                         --input clock
        i_rst           : in std_logic;                         --reset signal
        i_trigEnable    : in std_logic;                         --enable/disable ultrasonic
        i_recvPulse     : in std_logic;                         --recvieved pulse from ultrasonic
        o_trigPulse     : out std_logic;                        --trigger pulse sent to ultrasonic
        o_recvReady     : out std_logic;                        --strobe indicates when recvTime value is ready
        o_recvTime      : out std_logic_vector(7 downto 0)     --proportional to pulse width recieved from ultrasonic
    );
end PulseController;

architecture Behavioral of PulseController is

    --time tracking
    signal w_recvTime : std_logic_vector(7 downto 0);

    --counters
    signal w_trigCounter : integer range 0 to c_trigScaling;
    signal w_waitCounter : integer range 0 to c_waitScaling;
    signal w_recvCounter : integer range 0 to c_recvScaling;

    --state machine
    type t_pulseState is (IDLE, TRIG, ANTCP, RECV);
    signal w_state : t_pulseState := IDLE;

begin

    stateMachine: process(i_clk, i_rst) is
    begin
        if (i_rst = '1') then
            w_state <= IDLE;
        
        elsif (rising_edge(i_clk)) then
            case w_state is

                when IDLE =>

                    --reset signals/counters
                    o_recvReady <= '0';
                    w_recvTime <= (others=>'0');
                    w_trigCounter <= 0;
                    w_waitCounter <= 0;
                    w_recvCounter <= 0;

                    --only leave IDLE state if i_trigEnable = '1'
                    if (i_trigEnable = '1') then
                        w_state <= TRIG;
                    else
                        w_state <= IDLE;
                    end if;

                --send 10 microsecond pulse (assuming 125 MHz clk)
                when TRIG =>
                    if (w_trigCounter < c_trigScaling-1) then
                        o_trigPulse <= '1';
                        w_trigCounter <= w_trigCounter + 1;
                        w_state <= TRIG;
                    else
                        o_trigPulse <= '0';
                        w_trigCounter <= 0;
                        w_state <= ANTCP;
                    end if;

                --anticipate echo signal, re-trigger if signal is not recieved within 6 ms (no objects within 1 m)
                when ANTCP =>
                    if (i_recvPulse = '1') then
                        w_waitCounter <= 0;
                        w_state <= RECV;
                    elsif (w_waitCounter > c_waitScaling-1) then
                        w_waitCounter <= 0;
                        w_state <= TRIG;
                    else
                        w_waitCounter <= w_waitCounter + 1;
                        w_state <= ANTCP;
                    end if;
                
                --recieve echo pulse and determine length (0.1 ms granularity)
                when RECV =>

                    if (i_recvPulse = '1') then

                        --after each 0.1 ms increment, increment w_recvTime by 1
                        if (w_recvCounter > c_recvScaling-1) then
                            w_recvCounter <= 0;
                            w_recvTime <= std_logic_vector(unsigned(w_recvTime) + 1);
                        else
                            w_recvCounter <= w_recvCounter + 1;
                        end if;

                    --return to IDLE state
                    else
                        o_recvReady <= '1';
                        o_recvTime <= w_recvTime;
                        w_state <= IDLE;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
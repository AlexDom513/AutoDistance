library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PulseController_tb is
end PulseController_tb;

architecture Behavioral of PulseController_tb is

    component PulseController
        Port (
            i_clk : in std_logic;                                   --input clock
            i_rst : in std_logic;                                   --reset signal
            i_trigEnable    : in std_logic;                         --enable/disable ultrasonic
            i_recvPulse     : in std_logic;                         --recvieved pulse from ultrasonic
            o_trigPulse     : out std_logic;                        --trigger pulse sent to ultrasonic
            o_recvReady     : out std_logic;                        --strobe indicates when recvTime value is ready
            o_recvTime      : out std_logic_vector(7 downto 0);     --proportional to pulse width recieved from ultrasonic                           --test
    );
    end component;

    --test stimulus
    signal tb_clk : std_logic := '0';
    signal tb_rst : std_logic := '0';
    signal tb_trigEnable : std_logic := '0';
    signal tb_recvPulse : std_logic := '0';

    --test results
    signal tb_trigPulse : std_logic := '0';
    signal tb_recvReady : std_logic := '0';
    signal tb_recvTime : std_logic_vector(7 downto 0) := (others=>'0');
    signal tb_waitCounter : integer;

    --test constants
    constant offset : time := 2 ms;

begin

    --instantiate PulseController
    UUT: PulseController Port Map (
        i_clk           => tb_clk,
        i_rst           => tb_rst,
        i_trigEnable    => tb_trigEnable,
        i_recvPulse     => tb_recvPulse,
        o_trigPulse     => tb_trigPulse,
        o_recvReady     => tb_recvReady,
        o_recvTime      => tb_recvTime
    );

    --set clock
    tb_clk <= not tb_clk after 4 ns;

    --test reset
    tb_rst <= '1', '0' after 100 ns;

    --test trigger
    tb_trigEnable <= '1' after offset, '0' after 10*offset;

    --test simple trigger and recv
    --tb_trigEnable <= '1' after 100 ns, '0' after 300 ns, '1' after 1.5 ms;
    --tb_recvPulse <= '1' after 50 us, '0' after 1.25 ms, '1' after 2 ms, '0' after 3 ms;

end Behavioral;
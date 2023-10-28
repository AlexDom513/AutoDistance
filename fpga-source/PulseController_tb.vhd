library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PulseController_tb is
end PulseController_tb;

architecture Behavioral of PulseController_tb is

  --PulseController Inputs
  signal tb_clk         : std_logic := '0';
  signal tb_rst         : std_logic := '0';
  signal tb_trigEnable  : std_logic := '0';
  signal tb_recvPulse   : std_logic := '0';

  --PulseCntroller Outputs
  signal tb_trigPulse   : std_logic := '0';
  signal tb_recvReady   : std_logic := '0';
  signal tb_recvTime    : std_logic_vector(7 downto 0) := (others=>'0');
  signal tb_led0        : std_logic;
  signal tb_led1        : std_logic;
  signal tb_led2        : std_logic;
  signal tb_led3        : std_logic;

begin
    
  --set clock
  tb_clk <= not tb_clk after 4 ns;

  tbStim: process is
  begin

    --system reset
    tb_rst <= '1';
    wait for 100 ns;
    tb_rst <= '0';
    wait for 100 ns;

    --begin stimulus
    tb_trigEnable <= '1';
    for i in 0 to 10 loop
      wait until tb_trigPulse = '1';    --pulse sent out
      wait for 0.1 ms;                  --pulse traveling
      tb_recvPulse <= '1';              --pulse return
      wait for 1 ms;                    --wait for new pulse duration
      tb_recvPulse <= '0';              --terminate pulse
    end loop;
    wait;
  end process;

  --instantiate PulseController
  UUT: entity work.PulseController
  port map (
      i_clk           => tb_clk,
      i_rst           => tb_rst,
      i_trigEnable    => tb_trigEnable,
      i_recvPulse     => tb_recvPulse,
      o_trigPulse     => tb_trigPulse,
      --o_recvReady     => tb_recvReady
      --o_recvTime      => tb_recvTime
      o_led0          => tb_led0,
      o_led1          => tb_led1,
      o_led2          => tb_led2,
      o_led3          => tb_led3
  );
end Behavioral;
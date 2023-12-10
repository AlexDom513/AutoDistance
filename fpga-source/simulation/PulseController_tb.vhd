library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PulseController_tb is
end PulseController_tb;

architecture Behavioral of PulseController_tb is

  --system
  signal sClk           : std_logic := '0';
  signal sRst           : std_logic := '1';

  --selects
  signal sTrig_Enable   : std_logic := '0';

  --pulses
  signal sTrig_Pulse    : std_logic := '0';
  signal sRecv_Pulse    : std_logic := '0';

  --data
  signal sCurr_Dist     : signed(18 downto 0);

begin
    
  ----------------------------------------
  -- Clock
  ----------------------------------------
  sClk <= not sClk after 4 ns;

  ----------------------------------------
  -- Stimulus
  ----------------------------------------
  tbStim: process is
  begin

    --system reset
    sRst <= '1';
    wait for 100 ns;
    sRst <= '0';
    wait for 100 ns;

    --begin stim
    sTrig_Enable <= '1';

    --wait for trigger pulse, control duration of Recv_Pulse to affect simulation
    wait until sTrig_Pulse = '1';
    wait until sTrig_Pulse = '0';
    sRecv_Pulse <= '1';               --pulse return
    wait for 116.6 us;                --wait for pulse duration
    sRecv_Pulse <= '0';               --terminate pulse

    --end stim
    sTrig_Enable <= '0';
    wait;
  end process;

  ----------------------------------------
  -- DUT
  ----------------------------------------
  DUT: entity work.PulseController
  port map (
    Clk             => sClk,
    Rst             => sRst,
    Trig_Enable     => sTrig_Enable,
    Recv_Pulse      => sRecv_Pulse,
    Trig_Pulse      => sTrig_Pulse,
    Curr_Dist       => sCurr_Dist,
    Curr_Dist_Valid => open,
    Led0            => open,
    Led1            => open,
    Led2            => open,
    Led3            => open
  );
end Behavioral;
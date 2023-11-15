library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity StepperController_tb is
end StepperController_tb;

architecture Behavioral of StepperController_tb is

  -- system
  signal sClk           : std_logic := '0';
  signal sRst           : std_logic := '1';

  --control
  signal sInit_Pos_Sel  : std_logic := '1';
  signal sDir_Sel       : std_logic;
  signal sStep_Pulse    : std_logic;

begin
    
  --clock
  sClk <= not sClk after 4 ns;

  --stimulus
  tbStim: process is
  begin

    --system reset
    sRst <= '1';
    wait for 5 us;
    sRst <= '0';
    wait for 100 ns;

    --begin stim
    wait for 10 us;
    sInit_Pos_Sel <= '0';
    wait;
  end process;

  --instantiate StepperController
  UUT: entity work.StepperController
  port map (
    Clk             => sClk,
    Rst             => sRst,
    Init_Pos_Sel    => sInit_Pos_Sel,
    Dir_Sel         => sDir_Sel,
    Step_Pulse      => sStep_Pulse
  );
end Behavioral;
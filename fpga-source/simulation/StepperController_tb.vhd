library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
  signal sPID_Position  : signed(11 downto 0);

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
    wait for 5 us;
    sRst <= '0';
    wait for 100 ns;

    --begin stim
    wait for 10 us;
    sInit_Pos_Sel <= '0';
    sPID_Position <= to_signed(-50, 12);
    wait for 10 us;

    --target different positions
    for i in 0 to 100 loop
      sPID_Position <= sPID_Position + 1;
      wait for 10 us;
    end loop;
    wait;
  end process;

  ----------------------------------------
  -- DUT
  ----------------------------------------
  DUT: entity work.StepperController
  port map (
    Clk             => sClk,
    Rst             => sRst,
    Init_Pos_Sel    => sInit_Pos_Sel,
    Dir_Sel         => sDir_Sel,
    Step_Pulse      => sStep_Pulse,
    PID_Position    => sPID_Position
  );
end Behavioral;
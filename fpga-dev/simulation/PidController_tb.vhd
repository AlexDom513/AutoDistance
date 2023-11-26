library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PidController_tb is
end PidController_tb;

architecture Behavioral of PidController_tb is

  --addition constant
  constant cIncr          : signed(18 downto 0) := "0000000010000000000"; --0.25 cm increment

  --system
  signal sClk             : std_logic := '0';
  signal sRst             : std_logic := '1';

  --data
  signal sCurr_Dist       : signed(18 downto 0) := "0000000000000000000"; --0 cm start
  signal sCurr_Dist_Valid : std_logic;

begin
    
  ----------------------------------------
  -- Clocks
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

    for i in 1 to 400 loop
      wait for 10 us;
      wait until rising_edge(sClk);
      if (i < 200) then
        sCurr_Dist        <= sCurr_Dist + cIncr;
      else
        sCurr_Dist        <= sCurr_Dist - cIncr;
      end if;
      sCurr_Dist_Valid  <= '1';
      wait until rising_edge(sClk);
      sCurr_Dist_Valid  <= '0';
    end loop;

    wait;
  end process;

  ----------------------------------------
  -- DUT
  ----------------------------------------
  DUT: entity work.PidController
  port map (
    Clk             => sClk,
    Rst             => sRst,
    Curr_Dist       => sCurr_Dist,
    Curr_Dist_Valid => sCurr_Dist_Valid,
    PID_Postion     => open
  );
end Behavioral;
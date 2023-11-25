library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity PidController_tb is
end PidController_tb;

architecture Behavioral of PidController_tb is

  --system
  signal sClk             : std_logic := '0';
  signal sRst             : std_logic := '1';

  --data
  signal sCurr_Dist       : signed(18 downto 0);
  signal sCurr_Dist_Valid : std_logic;

  --data update procedure
  procedure get_data (
    signal pClk             : in    std_logic;
    signal pCurr_Dist       : inout signed(18 downto 0);
    signal pCurr_Dist_Valid : out   std_logic
    ) is
  begin
    wait until rising_edge(pClk);
    pCurr_Dist        <= pCurr_Dist + "0000001" & x"000"; --1 cm
    pCurr_Dist_Valid  <= '1';
    wait until rising_edge(pClk);
    pCurr_Dist_Valid  <= '0';
  end get_data;

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

    get_data(sClk, sCurr_Dist, sCurr_Dist_Valid);

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
    Curr_Dist_Valid => sCurr_Dist_Valid
  );
end Behavioral;
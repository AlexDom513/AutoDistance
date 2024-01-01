library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PidController_tb is
end PidController_tb;

architecture Behavioral of PidController_tb is

  -- system
  signal sClk             : std_logic := '0';
  signal sRst             : std_logic := '1';

  -- data
  signal sCurr_Dist       : signed(18 downto 0) := "0000000000000000000"; --0 cm start
  signal sCurr_Dist_Valid : std_logic;
  signal sPID_Position    : signed(11 downto 0);

begin
    
  ----------------------------------------
  -- Clocks
  ----------------------------------------
  sClk <= not sClk after 4 ns;

  ----------------------------------------
  -- Stimulus
  ----------------------------------------
  tbStim: process is
    variable vCurr_Acc  : signed(18 downto 0);
    variable vCurr_Vel  : signed(18 downto 0);
    variable vCurr_Dist : signed(18 downto 0);
  begin

    -- system reset
    sRst <= '1';
    wait for 5 us;
    sRst <= '0';
    wait for 100 ns;

    -- set variables
    vCurr_Acc := (others => '0');
    vCurr_Vel := (others => '0');

    -- dynamic model
    for i in 0 to 1000 loop
      wait for 10 us;
      wait until rising_edge(sClk);

      -- determine acceleration from ramp angle
      -- see fixedPoint.Py for generation
      if (sPID_Position < -50) then
        vCurr_Acc         := "1111111000000000000";
      elsif (sPID_Position < -45) then
        vCurr_Acc         := "1111111000000110010";
      elsif (sPID_Position < -40) then
        vCurr_Acc         := "1111111000011001000";
      elsif (sPID_Position < -35) then
        vCurr_Acc         := "1111111000110111110";
      elsif (sPID_Position < -30) then
        vCurr_Acc         := "1111111001100001110";
      elsif (sPID_Position < -25) then
        vCurr_Acc         := "1111111010010110000";
      elsif (sPID_Position < -20) then
        vCurr_Acc         := "1111111011010011000";
      elsif (sPID_Position < -15) then
        vCurr_Acc         := "1111111100010111100";
      elsif (sPID_Position < -10) then
        vCurr_Acc         := "1111111101100001110";
      elsif (sPID_Position < -5) then
        vCurr_Acc         := "1111111110101111111";
      elsif (sPID_Position < 0) then
        vCurr_Acc         := "0000000000000000000";
      elsif (sPID_Position < 5) then
        vCurr_Acc         := "0000000000000000000";
      elsif (sPID_Position < 10) then
        vCurr_Acc         := "0000000010011110010";
      elsif (sPID_Position < 15) then
        vCurr_Acc         := "0000000011101000100";
      elsif (sPID_Position < 20) then
        vCurr_Acc         := "0000000100101101000";
      elsif (sPID_Position < 25) then
        vCurr_Acc         := "0000000101101010000";
      elsif (sPID_Position < 30) then
        vCurr_Acc         := "0000000110011110010";
      elsif (sPID_Position < 35) then
        vCurr_Acc         := "0000000111001000010";
      elsif (sPID_Position < 40) then
        vCurr_Acc         := "0000000111100111000";
      elsif (sPID_Position < 45) then
        vCurr_Acc         := "0000000111111001110";
      else
        vCurr_Acc         := "0000001000000000000";
      end if;

      -- update the current velocity
      vCurr_Vel := vCurr_Vel + vCurr_Acc;

      -- update the current distance
      -- constrain sCurr_Dist between 0 and 50
      vCurr_Dist := sCurr_Dist + vCurr_Vel;
      if (vCurr_Dist(vCurr_Dist'high) = '1') then
        sCurr_Dist <= (others => '0');
      elsif (vCurr_Dist > "0110010000000000000") then
        sCurr_Dist <= "0110010000000000000"; -- 50 in (Q7.12)
      else
        sCurr_Dist <= vCurr_Dist;
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
    PID_Position    => sPID_Position
  );
end Behavioral;
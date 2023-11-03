library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;

entity PulseController_tb is
end PulseController_tb;

architecture Behavioral of PulseController_tb is

  -- simulation
  signal sTime          : time := 0.1 ms;

  -- system
  signal sClk           : std_logic := '0';
  signal sRst           : std_logic := '1';

  -- selects
  signal sTrig_Enable   : std_logic := '0';

  -- pulse
  signal sTrig_Pulse    : std_logic := '0';
  signal sRecv_Pulse    : std_logic := '0';

  -- outputs
  signal sRecv_Time     : std_logic_vector(7 downto 0) := (others=>'0');
  signal sLed0          : std_logic;
  signal sLed1          : std_logic;
  signal sLed2          : std_logic;
  signal sLed3          : std_logic;

begin
    
  -------------------------------------------------------
  -- Clock
  -------------------------------------------------------
  sClk <= not sClk after 4 ns;

  -------------------------------------------------------
  -- Stimulus
  -------------------------------------------------------
  tbStim: process is
  begin

    --system reset
    sRst <= '1';
    wait for 5 us;
    sRst <= '0';
    wait for 100 ns;

    --begin stim
    sTrig_Enable <= '1';
    for i in 0 to 100 loop

      --wait for trigger pulse to be sent by state maching, allow for pulse travel time
      wait until sTrig_Pulse = '1';
      wait for 100 us;

      --control the duration of Recv_Pulse in simulation to affect Recv_Time
      sTime <= sTime + 0.1 ms;          --increase next pulse duration
      sRecv_Pulse <= '1';               --pulse return
      wait for sTime;                   --wait for new pulse duration
      sRecv_Pulse <= '0';               --terminate pulse

    end loop;
      sTrig_Enable <= '0';
    wait;
  end process;

  --instantiate PulseController
  UUT: entity work.PulseController
  port map (
      Clk             => sClk,
      Rst             => sRst,
      Trig_Enable     => sTrig_Enable,
      Recv_Pulse      => sRecv_Pulse,
      Trig_Pulse      => sTrig_Pulse,
      Recv_Time       => sRecv_Time,
      Led0            => sLed0,
      Led1            => sLed1,
      Led2            => sLed2,
      Led3            => sLed3
  );
end Behavioral;
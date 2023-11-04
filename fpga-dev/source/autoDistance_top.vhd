library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity autoDistance_top is
  port (
    Clk               : in  std_logic;
    Rst               : in  std_logic;
    Trig_Enable       : in  std_logic;
    Recv_Pulse        : in  std_logic;
    Trig_Pulse        : out std_logic;
    Led0              : out std_logic;
    Led1              : out std_logic;
    Led2              : out std_logic;
    Led3              : out std_logic
    );
end autoDistance_top;

architecture Behavioral of autoDistance_top is

  --data values
  signal sRecv_Time   : unsigned(7 downto 0);

begin

  pulseController: entity work.PulseController
  port map (
      Clk             => Clk,
      Rst             => Rst,
      Trig_Enable     => Trig_Enable,
      Recv_Pulse      => Recv_Pulse,
      Trig_Pulse      => Trig_Pulse,
      Recv_Time       => sRecv_Time,
      Led0            => Led0,
      Led1            => Led1,
      Led2            => Led2,
      Led3            => Led3
  );

end Behavioral;
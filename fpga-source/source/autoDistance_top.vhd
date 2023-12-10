-----------------------------------------------------------------------------------------------
--    Alexander Domagala --- 11/23/23
-----------------------------------------------------------------------------------------------
--    The goal of this project is to use a FPGA in order to control the position of a cart
--    on a ramp. The ramp has an ultrasonic sensor at one end so that we can measure the cart's
--    distance from the sensor. We then process this distance in order to generate control
--    commands for the stepper motor. Finally, the stepper motor adjusts the angle of
--    the ramp so that the cart reaches a target position along the ramp.
--
--    pulseController
--        - handles triggering/processing of data from HC-SR04 (ultrasonic) sensor
--
--    pidController
--        - handles processing of distance data from pulseController module
--        - generates ramp adjustments that will be executed by stepperController module
--
--    stepperController
--        - handles physical control of the stepper motor
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity autoDistance_top is
  port (
    Clk                     : in  std_logic;
    Rst                     : in  std_logic;
    Init_Pos_Sel            : in  std_logic;
    Trig_Enable             : in  std_logic;
    Recv_Pulse              : in  std_logic;
    Dir_Sel                 : out std_logic;
    Step_Pulse              : out std_logic;
    Trig_Pulse              : out std_logic;
    Led0                    : out std_logic;
    Led1                    : out std_logic;
    Led2                    : out std_logic;
    Led3                    : out std_logic
  );
end autoDistance_top;

architecture Behavioral of autoDistance_top is

  --data
  signal sCurr_Dist_Valid   : std_logic;
  signal sCurr_Dist         : signed(18 downto 0);
  signal sPID_Position      : signed(11 downto 0);

begin

  pulseController: entity work.PulseController
  port map (
    Clk                     => Clk,
    Rst                     => Rst,
    Trig_Enable             => Trig_Enable,
    Recv_Pulse              => Recv_Pulse,
    Trig_Pulse              => Trig_Pulse,
    Curr_Dist               => sCurr_Dist,
    Curr_Dist_Valid         => sCurr_Dist_Valid,
    Led0                    => Led0,
    Led1                    => Led1,
    Led2                    => Led2,
    Led3                    => Led3
  );

  pidController: entity work.PidController
  port map (
    Clk                     => Clk,
    Rst                     => Rst,
    Curr_Dist               => sCurr_Dist,
    Curr_Dist_Valid         => sCurr_Dist_Valid,
    PID_Position            => sPID_Position
  );

  stepperController: entity work.StepperController
  port map (
    Clk                     => Clk,
    Rst                     => Rst,
    Init_Pos_Sel            => Init_Pos_Sel,
    Dir_Sel                 => Dir_Sel,
    Step_Pulse              => Step_Pulse,
    PID_Position            => sPID_Position
  );
end Behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StepperController is
  generic (
    TEST_EN       : boolean := true
  );
  port (
    Clk           : in  std_logic;
    Rst           : in  std_logic;
    Init_Pos_Sel  : in  std_logic;
    Dir_Sel       : out std_logic;
    Step_Pulse    : out std_logic;
  );
end StepperController;

architecture Behavioral of StepperController is

  --constants
  constant cTest_Count : integer := 7500000; --60 ms wait time        --UPDATE TO UNSIGNED!!!!

  --counters
  signal sPostion_Counter : unsigned(7 downto 0);

  --state machines
  type tStepper_State   is  (SETUP, INCR, DECR, PAUSE);
  type tSPulse_State    is  (IDLE, TRIG);
  signal sStepper_State   : tStepper_State := SETUP;
  signal sPulse_State     : tPulse_State := IDLE;

begin

  --might need to add some IO that enables/disables the motor
  --this will involve updating the breadboard circuit



  ----------------------------------------------------------------------
  -- Stepper State Machine
  -- Used to monitor/update the position counter of the stepper
  ----------------------------------------------------------------------
  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sStepper_State    <= IDLE;
        sPostion_Counter  <= (others => '0');
      else

        --Stepper Test
        if (TEST_EN = true) then
          case sStepper_State is

            --SETUP state, set the position counter (set ramp to lowered position)
            when SETUP =>
              if (Init_Pos_Sel = '1') then
                sPostion_Counter <= (others => '0');
              else
                sStepper_State <= INCR;
              end if;

            --INCR state, raise the stepper motor until the threshold is reached
            when INCR =>
              if (sPosition_Counter = 255) then
                sStepper_State <= DECR;
              elsif (sPulse_State = IDLE) then
                sPostion_Counter <= sPostion_Counter + 1;
                --begin sending pulse
                --assert the direction to be sent
              end if;
              

            when DECR =>
              if (sPosition_Counter = 0) then
                sStepper_State <= PAUSE;
              elsif (sPulse_State = IDLE) then
                --begin sending pulse
                --assert direction to be sent

            when PAUSE =>

          end case;

        --Normal Operation
        else
          case sStepper_State is
            when SETUP =>
            --sPostion_Counter <= '0' & (others => '1');
            when INCR =>
            when DECR =>
            when PAUSE =>
          end case;
        end if;
      end if;
    end if;
  end process;



  ----------------------------------------------------------------------
  -- Pulse State Machine
  -- Used to send out pulses that increment/decrement stepper position
  ----------------------------------------------------------------------
  process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        Step_Pulse <= '0';
      else
        case sPulse_State is
          when IDLE =>

          when TRIG =>


        end case;
      end if;
    end if;
  end process;

end Behavioral;
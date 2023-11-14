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
    Step_Pulse    : out std_logic
  );
end StepperController;

architecture Behavioral of StepperController is

  --types
  type tStepper_State is (SETUP, INCR, DECR, PAUSE);
  type tPulse_State is (IDLE, TRIG);

  --constants
  constant cTest_Count                : integer := 7500000; --60 ms wait time        --UPDATE TO UNSIGNED!!!!

  --control
  signal sPulse_Trig                  : std_logic;

  --counters
  signal sPosition_Counter            : unsigned(7 downto 0);
  signal sPulse_Duration_Counter      : unsigned(23 downto 0);

  --state machines
  signal sStepper_State               : tStepper_State := SETUP;
  signal sPulse_State                 : tPulse_State := IDLE;

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
        sStepper_State    <= SETUP;
        sPosition_Counter  <= (others => '0');
      else

        --Stepper Test
        if (TEST_EN = true) then
          case sStepper_State is

            --SETUP state, calibrate the position counter (bring ramp to lowered position)
            when SETUP =>
              if (Init_Pos_Sel = '1') then
                sPosition_Counter <= (others => '0');
              else
                sStepper_State <= INCR;
              end if;

            --INCR state, raise stepper motor until the threshold is reached
            when INCR =>
              if (sPosition_Counter = 255) then
                sStepper_State <= DECR;
              elsif (sPulse_State = IDLE) then
                sPosition_Counter <= sPosition_Counter + 1;
                Dir_Sel <= '0';
                sPulse_Trig <= '1';
              elsif (sPulse_State = TRIG) then
                sPulse_Trig <= '0';
              end if;
              
            --DECR state, lower the stepper until the threshold is reached
            when DECR =>
              if (sPosition_Counter = 0) then
                sStepper_State <= PAUSE;
              elsif (sPulse_State = IDLE) then
                sPosition_Counter <= sPosition_Counter - 1;
                Dir_Sel <= '0';
                sPulse_Trig <= '1';
              elsif (sPulse_State = TRIG) then
                sPulse_Trig <= '0';
              end if;

            --PAUSE state, suspend movement once reached
            when PAUSE =>
              sStepper_State <= PAUSE;
          end case;

        --Normal Operation
        else
          -- case sStepper_State is
          --   when SETUP =>
          --   --sPosition_Counter <= '0' & (others => '1');
          --   when INCR =>
          --   when DECR =>
          --   when PAUSE =>
          -- end case;
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

          --IDLE state, begin sending pulse when sPulse_Trig is asserted
          when IDLE =>
            sPulse_Duration_Counter <= (others => '0');
            if (sPulse_Trig = '1') then
              sPulse_State <= TRIG;
            end if;

          --TRIG state, assert the stepper pulse for a certain amount of time (max length)
          when TRIG =>
            Step_Pulse <= '1';
            if (sPulse_Duration_Counter = 2**sPulse_Duration_Counter'length-1) then
              Step_Pulse <= '0';
              sPulse_State <= IDLE;
            else
              sPulse_Duration_Counter <= sPulse_Duration_Counter + 1;
            end if;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
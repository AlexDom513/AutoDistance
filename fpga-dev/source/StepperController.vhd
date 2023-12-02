-----------------------------------------------------------------------------------------------
--    AlexDom513 --- 11/23/23
-----------------------------------------------------------------------------------------------
--    Module interacts with the A4988 Stepper Motor Drive board. The stepper state machine
--    is used to monitor the current position of the stepper motor relative to a set 
--    initial position. This is done so that the stepper motor never exceeds a defined
--    range. The pulse state machine is used to interact with the A4988 board. The
--    state machine sends pulses to increment the stepper motor and set its direction.
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StepperController is
  generic (
    TEST_EN       : boolean := FALSE
  );
  port (
    Clk           : in  std_logic;
    Rst           : in  std_logic;
    Init_Pos_Sel  : in  std_logic;
    Dir_Sel       : out std_logic;
    Step_Pulse    : out std_logic;
    --LED           : out std_logic;
    PID_Postion   : in signed(35 downto 0)
  );
end StepperController;

architecture Behavioral of StepperController is

  --types
  type tStepper_State_TEST is (SETUP, INCR, DECR, RET, PAUSE);
  type tStepper_State      is (SETUP, INCR, DECR, PAUSE);
  type tPulse_State        is (IDLE, TRIG_H, TRIG_L, DONE);

  --constants
  constant cPosition_Center           : signed(11 downto 0)   := x"032";
  --constant cMax_Pulse_HIGH            : unsigned(20 downto 0) := to_unsigned(781250, 21);    
  --constant cMax_Pulse_LOW             : unsigned(20 downto 0) := to_unsigned(1562500, 21); --together, constants yield period of 12.5 ms -> 80 Hz
  constant cMax_Pulse_HIGH            : unsigned(29 downto 0) := to_unsigned(1250000, 30);    
  constant cMax_Pulse_LOW             : unsigned(29 downto 0) := to_unsigned(2500000, 30);

  --control
  signal sPulse_Trig                  : std_logic;

  --counters
  signal sPosition_Counter            : signed(11 downto 0);
  signal sPID_Postion                 : signed(11 downto 0);
  signal sPulse_Duration_Counter      : unsigned(29 downto 0);

  --state machines
  signal sStepper_State               : tStepper_State      := SETUP;
  signal sStepper_State_TEST          : tStepper_State_TEST := SETUP;
  signal sPulse_State                 : tPulse_State        := IDLE;

begin

  --add IO that enables/disables the motor
  --this will involve updating the breadboard circuit
  sPID_Postion <= PID_Postion(35 downto 24);

  ----------------------------------------------------------------------
  -- Stepper State Machine
  ----------------------------------------------------------------------
  -- Used to monitor/update the position counter of the stepper

  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sStepper_State        <= SETUP;
        sStepper_State_TEST   <= SETUP;
        sPosition_Counter     <= cPosition_Center;   --initial position of 50
      else

        --Stepper Test
        if (TEST_EN = TRUE) then
          case sStepper_State_TEST is

            --SETUP state, calibrate the position counter (bring ramp to flat position)
            when SETUP =>
              if (Init_Pos_Sel = '1') then
                --LED <= '1';
                sPosition_Counter <= cPosition_Center;
              else
                --LED <= '0';
                sStepper_State_TEST <= INCR;
              end if;

            --INCR state, raise stepper motor until the threshold is reached
            when INCR =>
              if (sPosition_Counter = 100) then
                sStepper_State_TEST <= DECR;
              elsif (sPulse_State = IDLE) then
                Dir_Sel <= '0';
                sPulse_Trig <= '1';
              elsif (sPulse_State = DONE) then
                sPosition_Counter <= sPosition_Counter + 1;
                sPulse_Trig <= '0';
              end if;
              
            --DECR state, lower the stepper until the threshold is reached
            when DECR =>
              if (sPosition_Counter = 0) then
                sStepper_State_TEST <= RET;
              elsif (sPulse_State = IDLE) then
                Dir_Sel <= '1';
                sPulse_Trig <= '1';
              elsif (sPulse_State = DONE) then
                sPosition_Counter <= sPosition_Counter - 1;
                sPulse_Trig <= '0';
              end if;

            --RET state, return to the starting position by raising the stepper
            when RET =>
              if (sPosition_Counter = cPosition_Center) then
                sStepper_State_TEST <= PAUSE;
              elsif (sPulse_State = IDLE) then
                Dir_Sel <= '0';
                sPulse_Trig <= '1';
              elsif (sPulse_State = DONE) then
                sPosition_Counter <= sPosition_Counter + 1;
                sPulse_Trig <= '0';
              end if;

            --PAUSE state, suspend movement once reached
            when PAUSE =>
              sStepper_State_TEST <= PAUSE;
          end case;

        --Normal Operation
        else
          case sStepper_State is

            --SETUP state, calibrate the position counter (bring ramp to flat position)
            when SETUP =>
              if (Init_Pos_Sel = '1') then
                --LED <= '1';
                sPosition_Counter <= (others => '0');
              else
                --LED <= '0';
                sStepper_State <= PAUSE;
              end if;

            --PAUSE state, decide whether to raise or lower ramp
            when PAUSE =>
              if (sPosition_Counter > sPID_Postion) then
                sStepper_State <= DECR;
              elsif (sPosition_Counter < sPID_Postion) then
                sStepper_State <= INCR;
              end if;

            --INCR state, raise ramp
            when INCR =>
              if (sPosition_Counter = sPID_Postion or sPosition_Counter > 30) then --set hard limit of 30 steps
                sStepper_State <= PAUSE;
              elsif (sPulse_State = IDLE) then
                Dir_Sel <= '1';
                sPulse_Trig <= '1';
              elsif (sPulse_State = DONE) then
                sPosition_Counter <= sPosition_Counter + 1;                                                                   --IDEA: MAKE A RANGE FOR THE CONDITION, allow certain offset away from sPID_Position
                sPulse_Trig <= '0';
              end if;

            --DECR state, lower ramp
            when DECR =>
              if (sPosition_Counter = sPID_Postion or sPosition_Counter < -30) then --set hard limit of 30 steps
                sStepper_State <= PAUSE;
              elsif (sPulse_State = IDLE) then
                Dir_Sel <= '0';
                sPulse_Trig <= '1';
              elsif (sPulse_State = DONE) then
                sPosition_Counter <= sPosition_Counter - 1;
                sPulse_Trig <= '0';
              end if;
          end case;
        end if;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------
  -- Pulse State Machine
  ----------------------------------------------------------------------
  -- Used to send out pulses that increment/decrement stepper position
  -- Only increments/decrements by 1 step

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
              sPulse_State <= TRIG_H;
            end if;

          --TRIG_H state, assert the stepper pulse for a certain amount of time
          when TRIG_H =>
            Step_Pulse <= '1';
            if (sPulse_Duration_Counter = cMax_Pulse_HIGH-1) then
              Step_Pulse <= '0';
              sPulse_State <= TRIG_L;
            else
              sPulse_Duration_Counter <= sPulse_Duration_Counter + 1;
            end if;
          
          --TRIG_L state, hold the pulse low for a certain amount of time
          when TRIG_L =>
            if (sPulse_Duration_Counter = cMax_Pulse_LOW-1) then
              sPulse_State <= DONE;
            else
              sPulse_Duration_Counter <= sPulse_Duration_Counter + 1;
            end if;

          --DONE state
          when DONE =>
            sPulse_State <= IDLE;
        end case;
      end if;
    end if;
  end process;
end Behavioral;
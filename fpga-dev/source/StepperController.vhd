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
  port (
    Clk           : in  std_logic;
    Rst           : in  std_logic;
    Init_Pos_Sel  : in  std_logic;
    PID_Position  : in  signed(11 downto 0);
    Dir_Sel       : out std_logic;
    Step_Pulse    : out std_logic
  );
end StepperController;

architecture Behavioral of StepperController is

  --types
  type tStepper_State      is (SETUP, INCR, DECR, PAUSE);
  type tPulse_State        is (IDLE, TRIG_H, TRIG_L, DONE);

  --constants
  constant cPosition_Center           : signed(11 downto 0)   := x"032";
  --constant cMax_Pulse_HIGH            : unsigned(20 downto 0) := to_unsigned(100, 21);    --TEST ONLY
  --constant cMax_Pulse_LOW             : unsigned(20 downto 0) := to_unsigned(200, 21);    --TEST ONLY
  constant cMax_Pulse_HIGH            : unsigned(29 downto 0) := to_unsigned(1250000, 30);    
  constant cMax_Pulse_LOW             : unsigned(29 downto 0) := to_unsigned(2500000, 30);

  --control
  signal sPulse_Trig                  : std_logic;

  --counters
  signal sPosition_Counter            : signed(11 downto 0);
  signal sPID_Position                : signed(11 downto 0);
  signal sPulse_Duration_Counter      : unsigned(29 downto 0);

  --state machines
  signal sStepper_State               : tStepper_State      := SETUP;
  signal sPulse_State                 : tPulse_State        := IDLE;

begin

  ----------------------------------------------------------------------
  -- PID Output
  ----------------------------------------------------------------------
  -- Only use the upper 12 bits
  sPID_Position <= PID_Position;

  ----------------------------------------------------------------------
  -- Stepper State Machine
  ----------------------------------------------------------------------
  -- Used to monitor/update the position counter of the stepper

  stateMachine: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sStepper_State        <= SETUP;
        sPosition_Counter     <= cPosition_Center;   --initial position of 50
      else
        case sStepper_State is

          --SETUP state, calibrate the position counter (bring ramp to flat position)
          when SETUP =>
            if (Init_Pos_Sel = '1') then
              sPosition_Counter <= (others => '0');
            else
              sStepper_State <= PAUSE;
            end if;

          --PAUSE state, decide whether to raise or lower ramp
          when PAUSE =>
            if (sPosition_Counter < sPID_Position) then
              sStepper_State <= INCR;
            elsif (sPosition_Counter > sPID_Position) then
              sStepper_State <= DECR;
            else
              sStepper_State <= PAUSE;
            end if;

          --INCR state, raise ramp
          when INCR =>
            if (sPulse_State = IDLE) then
              Dir_Sel <= '1';
              sPulse_Trig <= '1';
              sStepper_State <= INCR;
            elsif (sPulse_State = DONE) then
              sPosition_Counter <= sPosition_Counter + 1;
              sPulse_Trig <= '0';
              sStepper_State <= PAUSE;
            end if;

          --DECR state, lower ramp
          when DECR =>
            if (sPulse_State = IDLE) then
              Dir_Sel <= '0';
              sPulse_Trig <= '1';
              sStepper_State <= DECR;
            elsif (sPulse_State = DONE) then
              sPosition_Counter <= sPosition_Counter - 1;
              sPulse_Trig <= '0';
              sStepper_State <= PAUSE;
            end if;
        end case;
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
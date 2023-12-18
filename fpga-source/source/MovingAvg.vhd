-----------------------------------------------------------------------------------------------
--    Alexander Domagala --- 12/17/23
-----------------------------------------------------------------------------------------------
--  20-tap simple moving average filter, operates on the receieved pulse distance data
-----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MovingAvg is 
  port (
    Clk                   : in  std_logic;
    Rst                   : in  std_logic;
    Data_In_Valid         : in  std_logic;
    Data_In               : in  signed(18 downto 0);  -- (Q7.12) current distance (cm)
    Data_Out_Valid        : out std_logic;
    Data_Out              : out signed(18 downto 0)   -- (Q7.12) filtered distance (cm)
  );
end MovingAvg;


architecture Behavioral of MovingAvg is

  -- 1-d array pipes
  type t_Pipe       is array (0 to 19) of signed(18 downto 0);
  type t_Proc_Pipe  is array (0 to 19) of signed(31 downto 0);

  -- mult constant
  constant cMult          : signed(12 downto 0) := "0000011001101";  -- (Q1.12) ~0.05

  -- counter/control
  signal sData_Counter    : unsigned(4 downto 0);
  signal sData_Buffered   : std_logic;

  -- data pipeline
  signal sData_Pipe       : t_Pipe;
  signal sMult_Pipe       : t_Proc_Pipe;
  signal sAdd_Pipe        : t_Proc_Pipe;

begin

  ----------------------------------------------------------------------
  -- Data_Out_Valid Assertion
  ----------------------------------------------------------------------
  Data_Out_Valid <= Data_In_Valid and sData_Buffered;

  ----------------------------------------------------------------------
  -- Buffer Control
  ----------------------------------------------------------------------

  -- data counter (so we can properly assert Data_Out_Valid)
  DATA_COUNTER: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        sData_Counter   <= (others => '0');
        sData_Buffered  <= '0';
      else

        -- only increment the counter if (< 20) units of data buffered
        if (Data_In_Valid = '1' and sData_Counter < 21) then
          sData_Counter <= sData_Counter + 1;
        
          -- set sData_Buffered to the active state
        elsif (Data_In_Valid = '1') then
          sData_Buffered <= '1';
        end if;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------
  -- Filter Implementation
  ----------------------------------------------------------------------

  -- pipe data input
  DATA_PIPE: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Rst = '1') then
        for i in 0 to 19 loop
          sData_Pipe(i) <= (others => '0');
        end loop;
      else

        -- only add input data to pipe if data is valid
        if (Data_In_Valid = '1') then
          sData_Pipe(0) <= Data_In;
          for i in 1 to 19 loop
            sData_Pipe(i) <= sData_Pipe(i-1);
          end loop;
        end if;
      end if;
    end if;
  end process;

  -- scale input data, (Q7.12) * (Q1.12) = (Q8.24)
  DATA_MULT: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Data_In_Valid = '1') then
        for i in 0 to 19 loop
          sMult_Pipe(i) <= cMult * sData_Pipe(i);
        end loop;
      end if;
    end if;
  end process;

  -- add scaled data
  DATA_ADD: process(Clk) is
  begin
    if (rising_edge(Clk)) then
      if (Data_In_Valid = '1') then
        sAdd_Pipe(0) <= sMult_Pipe(0);
        for i in 1 to 19 loop
          sAdd_Pipe(i) <= sAdd_Pipe(i-1) + sMult_Pipe(0);
        end loop;
      
        -- set the module output data
        Data_Out <= sAdd_Pipe(19)(30 downto 12);
      end if;
    end if;
  end process;
end Behavioral;
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Wed Sep 13 23:12:25 2023
-- Host        : Alex-Laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Alex/Desktop/Engineering/FPGA/Projects/ballControl/ballControl.gen/sources_1/bd/design_1/ip/design_1_PulseController_0_0_2/design_1_PulseController_0_0_sim_netlist.vhdl
-- Design      : design_1_PulseController_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_PulseController_0_0_PulseController is
  port (
    o_recvTime : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_trigPulse : out STD_LOGIC;
    o_recvReady : out STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_recvPulse : in STD_LOGIC;
    i_clk : in STD_LOGIC;
    i_trigEnable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_PulseController_0_0_PulseController : entity is "PulseController";
end design_1_PulseController_0_0_PulseController;

architecture STRUCTURE of design_1_PulseController_0_0_PulseController is
  signal \FSM_sequential_w_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state[1]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_w_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \^o_recvready\ : STD_LOGIC;
  signal o_recvReady_i_1_n_0 : STD_LOGIC;
  signal o_recvTime0 : STD_LOGIC;
  signal \^o_trigpulse\ : STD_LOGIC;
  signal o_trigPulse_i_1_n_0 : STD_LOGIC;
  signal o_trigPulse_i_2_n_0 : STD_LOGIC;
  signal o_trigPulse_i_3_n_0 : STD_LOGIC;
  signal o_trigPulse_i_4_n_0 : STD_LOGIC;
  signal o_trigPulse_i_5_n_0 : STD_LOGIC;
  signal w_recvCounter0 : STD_LOGIC_VECTOR ( 13 downto 1 );
  signal w_recvCounter0_0 : STD_LOGIC;
  signal \w_recvCounter0_carry__0_n_0\ : STD_LOGIC;
  signal \w_recvCounter0_carry__0_n_1\ : STD_LOGIC;
  signal \w_recvCounter0_carry__0_n_2\ : STD_LOGIC;
  signal \w_recvCounter0_carry__0_n_3\ : STD_LOGIC;
  signal \w_recvCounter0_carry__1_n_0\ : STD_LOGIC;
  signal \w_recvCounter0_carry__1_n_1\ : STD_LOGIC;
  signal \w_recvCounter0_carry__1_n_2\ : STD_LOGIC;
  signal \w_recvCounter0_carry__1_n_3\ : STD_LOGIC;
  signal w_recvCounter0_carry_n_0 : STD_LOGIC;
  signal w_recvCounter0_carry_n_1 : STD_LOGIC;
  signal w_recvCounter0_carry_n_2 : STD_LOGIC;
  signal w_recvCounter0_carry_n_3 : STD_LOGIC;
  signal \w_recvCounter[0]_i_1_n_0\ : STD_LOGIC;
  signal \w_recvCounter[13]_i_1_n_0\ : STD_LOGIC;
  signal \w_recvCounter[13]_i_3_n_0\ : STD_LOGIC;
  signal \w_recvCounter[13]_i_4_n_0\ : STD_LOGIC;
  signal \w_recvCounter[13]_i_5_n_0\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[0]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[10]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[11]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[12]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[13]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[1]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[2]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[3]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[4]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[5]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[6]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[7]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[8]\ : STD_LOGIC;
  signal \w_recvCounter_reg_n_0_[9]\ : STD_LOGIC;
  signal w_recvTime : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal w_recvTime0 : STD_LOGIC;
  signal \w_recvTime[5]_i_2_n_0\ : STD_LOGIC;
  signal \w_recvTime[7]_i_3_n_0\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[0]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[1]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[2]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[3]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[4]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[5]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[6]\ : STD_LOGIC;
  signal \w_recvTime_reg_n_0_[7]\ : STD_LOGIC;
  signal w_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \w_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal w_trigCounter : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal w_trigCounter0 : STD_LOGIC;
  signal \w_trigCounter[10]_i_3_n_0\ : STD_LOGIC;
  signal \w_trigCounter[5]_i_2_n_0\ : STD_LOGIC;
  signal \w_trigCounter[9]_i_2_n_0\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[0]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[10]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[1]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[2]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[3]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[4]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[5]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[6]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[7]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[8]\ : STD_LOGIC;
  signal \w_trigCounter_reg_n_0_[9]\ : STD_LOGIC;
  signal w_waitCounter0 : STD_LOGIC_VECTOR ( 19 downto 1 );
  signal w_waitCounter0_1 : STD_LOGIC;
  signal \w_waitCounter0_carry__0_n_0\ : STD_LOGIC;
  signal \w_waitCounter0_carry__0_n_1\ : STD_LOGIC;
  signal \w_waitCounter0_carry__0_n_2\ : STD_LOGIC;
  signal \w_waitCounter0_carry__0_n_3\ : STD_LOGIC;
  signal \w_waitCounter0_carry__1_n_0\ : STD_LOGIC;
  signal \w_waitCounter0_carry__1_n_1\ : STD_LOGIC;
  signal \w_waitCounter0_carry__1_n_2\ : STD_LOGIC;
  signal \w_waitCounter0_carry__1_n_3\ : STD_LOGIC;
  signal \w_waitCounter0_carry__2_n_0\ : STD_LOGIC;
  signal \w_waitCounter0_carry__2_n_1\ : STD_LOGIC;
  signal \w_waitCounter0_carry__2_n_2\ : STD_LOGIC;
  signal \w_waitCounter0_carry__2_n_3\ : STD_LOGIC;
  signal \w_waitCounter0_carry__3_n_2\ : STD_LOGIC;
  signal \w_waitCounter0_carry__3_n_3\ : STD_LOGIC;
  signal w_waitCounter0_carry_n_0 : STD_LOGIC;
  signal w_waitCounter0_carry_n_1 : STD_LOGIC;
  signal w_waitCounter0_carry_n_2 : STD_LOGIC;
  signal w_waitCounter0_carry_n_3 : STD_LOGIC;
  signal \w_waitCounter[0]_i_1_n_0\ : STD_LOGIC;
  signal \w_waitCounter[19]_i_1_n_0\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[0]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[10]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[11]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[12]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[13]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[14]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[15]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[16]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[17]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[18]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[19]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[1]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[2]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[3]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[4]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[5]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[6]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[7]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[8]\ : STD_LOGIC;
  signal \w_waitCounter_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_w_recvCounter0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_w_recvCounter0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_w_waitCounter0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_w_waitCounter0_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_w_state[0]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_w_state[1]_i_7\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_sequential_w_state[1]_i_8\ : label is "soft_lutpair8";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_w_state_reg[0]\ : label is "idle:00,recv:11,antcp:10,trig:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_w_state_reg[1]\ : label is "idle:00,recv:11,antcp:10,trig:01";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of w_recvCounter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \w_recvCounter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \w_recvCounter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \w_recvCounter0_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of \w_recvTime[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \w_recvTime[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \w_recvTime[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \w_recvTime[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \w_recvTime[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \w_recvTime[7]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \w_trigCounter[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \w_trigCounter[10]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \w_trigCounter[10]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \w_trigCounter[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \w_trigCounter[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \w_trigCounter[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \w_trigCounter[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \w_trigCounter[5]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \w_trigCounter[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \w_trigCounter[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \w_trigCounter[8]_i_1\ : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD of w_waitCounter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \w_waitCounter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \w_waitCounter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \w_waitCounter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \w_waitCounter0_carry__3\ : label is 35;
begin
  o_recvReady <= \^o_recvready\;
  o_trigPulse <= \^o_trigpulse\;
\FSM_sequential_w_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000CCCCFFF0EEEE"
    )
        port map (
      I0 => i_trigEnable,
      I1 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I2 => \FSM_sequential_w_state[1]_i_3_n_0\,
      I3 => i_recvPulse,
      I4 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I5 => w_state(0),
      O => \w_state__0\(0)
    );
\FSM_sequential_w_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEE0000"
    )
        port map (
      I0 => o_trigPulse_i_5_n_0,
      I1 => o_trigPulse_i_4_n_0,
      I2 => \FSM_sequential_w_state[0]_i_3_n_0\,
      I3 => o_trigPulse_i_3_n_0,
      I4 => w_state(0),
      O => \FSM_sequential_w_state[0]_i_2_n_0\
    );
\FSM_sequential_w_state[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[2]\,
      I1 => \w_trigCounter_reg_n_0_[1]\,
      I2 => \w_trigCounter_reg_n_0_[0]\,
      O => \FSM_sequential_w_state[0]_i_3_n_0\
    );
\FSM_sequential_w_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I1 => w_state(0),
      I2 => i_recvPulse,
      O => \FSM_sequential_w_state[1]_i_1_n_0\
    );
\FSM_sequential_w_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00BB0F00"
    )
        port map (
      I0 => i_recvPulse,
      I1 => \FSM_sequential_w_state[1]_i_3_n_0\,
      I2 => o_trigPulse_i_2_n_0,
      I3 => w_state(0),
      I4 => \FSM_sequential_w_state_reg_n_0_[1]\,
      O => \w_state__0\(1)
    );
\FSM_sequential_w_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFE00000"
    )
        port map (
      I0 => \FSM_sequential_w_state[1]_i_4_n_0\,
      I1 => \FSM_sequential_w_state[1]_i_5_n_0\,
      I2 => \FSM_sequential_w_state[1]_i_6_n_0\,
      I3 => \w_waitCounter_reg_n_0_[15]\,
      I4 => \FSM_sequential_w_state[1]_i_7_n_0\,
      I5 => \FSM_sequential_w_state[1]_i_8_n_0\,
      O => \FSM_sequential_w_state[1]_i_3_n_0\
    );
\FSM_sequential_w_state[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[10]\,
      I1 => \w_waitCounter_reg_n_0_[9]\,
      I2 => \w_waitCounter_reg_n_0_[11]\,
      O => \FSM_sequential_w_state[1]_i_4_n_0\
    );
\FSM_sequential_w_state[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88808080"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[8]\,
      I1 => \w_waitCounter_reg_n_0_[7]\,
      I2 => \w_waitCounter_reg_n_0_[6]\,
      I3 => \w_waitCounter_reg_n_0_[5]\,
      I4 => \w_waitCounter_reg_n_0_[4]\,
      O => \FSM_sequential_w_state[1]_i_5_n_0\
    );
\FSM_sequential_w_state[1]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[14]\,
      I1 => \w_waitCounter_reg_n_0_[13]\,
      I2 => \w_waitCounter_reg_n_0_[12]\,
      O => \FSM_sequential_w_state[1]_i_6_n_0\
    );
\FSM_sequential_w_state[1]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[17]\,
      I1 => \w_waitCounter_reg_n_0_[16]\,
      I2 => \w_waitCounter_reg_n_0_[19]\,
      O => \FSM_sequential_w_state[1]_i_7_n_0\
    );
\FSM_sequential_w_state[1]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[19]\,
      I1 => \w_waitCounter_reg_n_0_[18]\,
      O => \FSM_sequential_w_state[1]_i_8_n_0\
    );
\FSM_sequential_w_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \FSM_sequential_w_state[1]_i_1_n_0\,
      CLR => i_rst,
      D => \w_state__0\(0),
      Q => w_state(0)
    );
\FSM_sequential_w_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \FSM_sequential_w_state[1]_i_1_n_0\,
      CLR => i_rst,
      D => \w_state__0\(1),
      Q => \FSM_sequential_w_state_reg_n_0_[1]\
    );
o_recvReady_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFC0040"
    )
        port map (
      I0 => i_recvPulse,
      I1 => w_state(0),
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => i_rst,
      I4 => \^o_recvready\,
      O => o_recvReady_i_1_n_0
    );
o_recvReady_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => o_recvReady_i_1_n_0,
      Q => \^o_recvready\,
      R => '0'
    );
\o_recvTime[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => i_rst,
      I1 => w_state(0),
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => i_recvPulse,
      O => o_recvTime0
    );
\o_recvTime_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[0]\,
      Q => o_recvTime(0),
      R => '0'
    );
\o_recvTime_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[1]\,
      Q => o_recvTime(1),
      R => '0'
    );
\o_recvTime_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[2]\,
      Q => o_recvTime(2),
      R => '0'
    );
\o_recvTime_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[3]\,
      Q => o_recvTime(3),
      R => '0'
    );
\o_recvTime_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[4]\,
      Q => o_recvTime(4),
      R => '0'
    );
\o_recvTime_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[5]\,
      Q => o_recvTime(5),
      R => '0'
    );
\o_recvTime_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[6]\,
      Q => o_recvTime(6),
      R => '0'
    );
\o_recvTime_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => o_recvTime0,
      D => \w_recvTime_reg_n_0_[7]\,
      Q => o_recvTime(7),
      R => '0'
    );
o_trigPulse_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => o_trigPulse_i_2_n_0,
      I1 => i_rst,
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => w_state(0),
      I4 => \^o_trigpulse\,
      O => o_trigPulse_i_1_n_0
    );
o_trigPulse_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0002"
    )
        port map (
      I0 => o_trigPulse_i_3_n_0,
      I1 => \w_trigCounter_reg_n_0_[0]\,
      I2 => \w_trigCounter_reg_n_0_[1]\,
      I3 => \w_trigCounter_reg_n_0_[2]\,
      I4 => o_trigPulse_i_4_n_0,
      I5 => o_trigPulse_i_5_n_0,
      O => o_trigPulse_i_2_n_0
    );
o_trigPulse_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[9]\,
      I1 => \w_trigCounter_reg_n_0_[8]\,
      I2 => \w_trigCounter_reg_n_0_[4]\,
      I3 => \w_trigCounter_reg_n_0_[3]\,
      O => o_trigPulse_i_3_n_0
    );
o_trigPulse_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[7]\,
      I1 => \w_trigCounter_reg_n_0_[8]\,
      I2 => \w_trigCounter_reg_n_0_[9]\,
      I3 => \w_trigCounter_reg_n_0_[10]\,
      O => o_trigPulse_i_4_n_0
    );
o_trigPulse_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[5]\,
      I1 => \w_trigCounter_reg_n_0_[6]\,
      I2 => \w_trigCounter_reg_n_0_[8]\,
      I3 => \w_trigCounter_reg_n_0_[9]\,
      O => o_trigPulse_i_5_n_0
    );
o_trigPulse_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => o_trigPulse_i_1_n_0,
      Q => \^o_trigpulse\,
      R => '0'
    );
w_recvCounter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => w_recvCounter0_carry_n_0,
      CO(2) => w_recvCounter0_carry_n_1,
      CO(1) => w_recvCounter0_carry_n_2,
      CO(0) => w_recvCounter0_carry_n_3,
      CYINIT => \w_recvCounter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_recvCounter0(4 downto 1),
      S(3) => \w_recvCounter_reg_n_0_[4]\,
      S(2) => \w_recvCounter_reg_n_0_[3]\,
      S(1) => \w_recvCounter_reg_n_0_[2]\,
      S(0) => \w_recvCounter_reg_n_0_[1]\
    );
\w_recvCounter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => w_recvCounter0_carry_n_0,
      CO(3) => \w_recvCounter0_carry__0_n_0\,
      CO(2) => \w_recvCounter0_carry__0_n_1\,
      CO(1) => \w_recvCounter0_carry__0_n_2\,
      CO(0) => \w_recvCounter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_recvCounter0(8 downto 5),
      S(3) => \w_recvCounter_reg_n_0_[8]\,
      S(2) => \w_recvCounter_reg_n_0_[7]\,
      S(1) => \w_recvCounter_reg_n_0_[6]\,
      S(0) => \w_recvCounter_reg_n_0_[5]\
    );
\w_recvCounter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \w_recvCounter0_carry__0_n_0\,
      CO(3) => \w_recvCounter0_carry__1_n_0\,
      CO(2) => \w_recvCounter0_carry__1_n_1\,
      CO(1) => \w_recvCounter0_carry__1_n_2\,
      CO(0) => \w_recvCounter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_recvCounter0(12 downto 9),
      S(3) => \w_recvCounter_reg_n_0_[12]\,
      S(2) => \w_recvCounter_reg_n_0_[11]\,
      S(1) => \w_recvCounter_reg_n_0_[10]\,
      S(0) => \w_recvCounter_reg_n_0_[9]\
    );
\w_recvCounter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \w_recvCounter0_carry__1_n_0\,
      CO(3 downto 0) => \NLW_w_recvCounter0_carry__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_w_recvCounter0_carry__2_O_UNCONNECTED\(3 downto 1),
      O(0) => w_recvCounter0(13),
      S(3 downto 1) => B"000",
      S(0) => \w_recvCounter_reg_n_0_[13]\
    );
\w_recvCounter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \w_recvCounter_reg_n_0_[0]\,
      O => \w_recvCounter[0]_i_1_n_0\
    );
\w_recvCounter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40001111"
    )
        port map (
      I0 => i_rst,
      I1 => w_state(0),
      I2 => i_recvPulse,
      I3 => \w_recvCounter[13]_i_3_n_0\,
      I4 => \FSM_sequential_w_state_reg_n_0_[1]\,
      O => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0083"
    )
        port map (
      I0 => i_recvPulse,
      I1 => w_state(0),
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => i_rst,
      O => w_recvCounter0_0
    );
\w_recvCounter[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888888880"
    )
        port map (
      I0 => \w_recvCounter_reg_n_0_[13]\,
      I1 => \w_recvCounter_reg_n_0_[12]\,
      I2 => \w_recvCounter[13]_i_4_n_0\,
      I3 => \w_recvCounter_reg_n_0_[10]\,
      I4 => \w_recvCounter_reg_n_0_[9]\,
      I5 => \w_recvCounter[13]_i_5_n_0\,
      O => \w_recvCounter[13]_i_3_n_0\
    );
\w_recvCounter[13]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \w_recvCounter_reg_n_0_[8]\,
      I1 => \w_recvCounter_reg_n_0_[11]\,
      O => \w_recvCounter[13]_i_4_n_0\
    );
\w_recvCounter[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888080808080"
    )
        port map (
      I0 => \w_recvCounter_reg_n_0_[7]\,
      I1 => \w_recvCounter_reg_n_0_[6]\,
      I2 => \w_recvCounter_reg_n_0_[5]\,
      I3 => \w_recvCounter_reg_n_0_[3]\,
      I4 => \w_recvCounter_reg_n_0_[2]\,
      I5 => \w_recvCounter_reg_n_0_[4]\,
      O => \w_recvCounter[13]_i_5_n_0\
    );
\w_recvCounter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => \w_recvCounter[0]_i_1_n_0\,
      Q => \w_recvCounter_reg_n_0_[0]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(10),
      Q => \w_recvCounter_reg_n_0_[10]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(11),
      Q => \w_recvCounter_reg_n_0_[11]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(12),
      Q => \w_recvCounter_reg_n_0_[12]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(13),
      Q => \w_recvCounter_reg_n_0_[13]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(1),
      Q => \w_recvCounter_reg_n_0_[1]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(2),
      Q => \w_recvCounter_reg_n_0_[2]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(3),
      Q => \w_recvCounter_reg_n_0_[3]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(4),
      Q => \w_recvCounter_reg_n_0_[4]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(5),
      Q => \w_recvCounter_reg_n_0_[5]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(6),
      Q => \w_recvCounter_reg_n_0_[6]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(7),
      Q => \w_recvCounter_reg_n_0_[7]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(8),
      Q => \w_recvCounter_reg_n_0_[8]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvCounter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_recvCounter0_0,
      D => w_recvCounter0(9),
      Q => \w_recvCounter_reg_n_0_[9]\,
      R => \w_recvCounter[13]_i_1_n_0\
    );
\w_recvTime[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I1 => \w_recvTime_reg_n_0_[0]\,
      O => w_recvTime(0)
    );
\w_recvTime[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[0]\,
      I1 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I2 => \w_recvTime_reg_n_0_[1]\,
      O => w_recvTime(1)
    );
\w_recvTime[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[1]\,
      I1 => \w_recvTime_reg_n_0_[0]\,
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => \w_recvTime_reg_n_0_[2]\,
      O => w_recvTime(2)
    );
\w_recvTime[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[2]\,
      I1 => \w_recvTime_reg_n_0_[0]\,
      I2 => \w_recvTime_reg_n_0_[1]\,
      I3 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I4 => \w_recvTime_reg_n_0_[3]\,
      O => w_recvTime(3)
    );
\w_recvTime[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[3]\,
      I1 => \w_recvTime_reg_n_0_[1]\,
      I2 => \w_recvTime_reg_n_0_[0]\,
      I3 => \w_recvTime_reg_n_0_[2]\,
      I4 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I5 => \w_recvTime_reg_n_0_[4]\,
      O => w_recvTime(4)
    );
\w_recvTime[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \w_recvTime[5]_i_2_n_0\,
      I1 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I2 => \w_recvTime_reg_n_0_[5]\,
      O => w_recvTime(5)
    );
\w_recvTime[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[4]\,
      I1 => \w_recvTime_reg_n_0_[2]\,
      I2 => \w_recvTime_reg_n_0_[0]\,
      I3 => \w_recvTime_reg_n_0_[1]\,
      I4 => \w_recvTime_reg_n_0_[3]\,
      O => \w_recvTime[5]_i_2_n_0\
    );
\w_recvTime[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \w_recvTime[7]_i_3_n_0\,
      I1 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I2 => \w_recvTime_reg_n_0_[6]\,
      O => w_recvTime(6)
    );
\w_recvTime[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000800F"
    )
        port map (
      I0 => \w_recvCounter[13]_i_3_n_0\,
      I1 => i_recvPulse,
      I2 => w_state(0),
      I3 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I4 => i_rst,
      O => w_recvTime0
    );
\w_recvTime[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \w_recvTime[7]_i_3_n_0\,
      I1 => \w_recvTime_reg_n_0_[6]\,
      I2 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I3 => \w_recvTime_reg_n_0_[7]\,
      O => w_recvTime(7)
    );
\w_recvTime[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \w_recvTime_reg_n_0_[5]\,
      I1 => \w_recvTime_reg_n_0_[3]\,
      I2 => \w_recvTime_reg_n_0_[1]\,
      I3 => \w_recvTime_reg_n_0_[0]\,
      I4 => \w_recvTime_reg_n_0_[2]\,
      I5 => \w_recvTime_reg_n_0_[4]\,
      O => \w_recvTime[7]_i_3_n_0\
    );
\w_recvTime_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(0),
      Q => \w_recvTime_reg_n_0_[0]\,
      R => '0'
    );
\w_recvTime_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(1),
      Q => \w_recvTime_reg_n_0_[1]\,
      R => '0'
    );
\w_recvTime_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(2),
      Q => \w_recvTime_reg_n_0_[2]\,
      R => '0'
    );
\w_recvTime_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(3),
      Q => \w_recvTime_reg_n_0_[3]\,
      R => '0'
    );
\w_recvTime_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(4),
      Q => \w_recvTime_reg_n_0_[4]\,
      R => '0'
    );
\w_recvTime_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(5),
      Q => \w_recvTime_reg_n_0_[5]\,
      R => '0'
    );
\w_recvTime_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(6),
      Q => \w_recvTime_reg_n_0_[6]\,
      R => '0'
    );
\w_recvTime_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => w_recvTime0,
      D => w_recvTime(7),
      Q => \w_recvTime_reg_n_0_[7]\,
      R => '0'
    );
\w_trigCounter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I1 => \w_trigCounter_reg_n_0_[0]\,
      O => w_trigCounter(0)
    );
\w_trigCounter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_sequential_w_state_reg_n_0_[1]\,
      I1 => i_rst,
      O => w_trigCounter0
    );
\w_trigCounter[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \w_trigCounter[10]_i_3_n_0\,
      I1 => \w_trigCounter_reg_n_0_[9]\,
      I2 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I3 => \w_trigCounter_reg_n_0_[10]\,
      O => w_trigCounter(10)
    );
\w_trigCounter[10]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[8]\,
      I1 => \w_trigCounter_reg_n_0_[7]\,
      I2 => \w_trigCounter_reg_n_0_[6]\,
      I3 => \w_trigCounter[9]_i_2_n_0\,
      O => \w_trigCounter[10]_i_3_n_0\
    );
\w_trigCounter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I1 => \w_trigCounter_reg_n_0_[0]\,
      I2 => \w_trigCounter_reg_n_0_[1]\,
      O => w_trigCounter(1)
    );
\w_trigCounter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I1 => \w_trigCounter_reg_n_0_[1]\,
      I2 => \w_trigCounter_reg_n_0_[0]\,
      I3 => \w_trigCounter_reg_n_0_[2]\,
      O => w_trigCounter(2)
    );
\w_trigCounter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I1 => \w_trigCounter_reg_n_0_[0]\,
      I2 => \w_trigCounter_reg_n_0_[1]\,
      I3 => \w_trigCounter_reg_n_0_[2]\,
      I4 => \w_trigCounter_reg_n_0_[3]\,
      O => w_trigCounter(3)
    );
\w_trigCounter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[0]\,
      I1 => \w_trigCounter_reg_n_0_[1]\,
      I2 => \w_trigCounter_reg_n_0_[2]\,
      I3 => \w_trigCounter_reg_n_0_[3]\,
      I4 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I5 => \w_trigCounter_reg_n_0_[4]\,
      O => w_trigCounter(4)
    );
\w_trigCounter[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \w_trigCounter[5]_i_2_n_0\,
      I1 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I2 => \w_trigCounter_reg_n_0_[5]\,
      O => w_trigCounter(5)
    );
\w_trigCounter[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[4]\,
      I1 => \w_trigCounter_reg_n_0_[3]\,
      I2 => \w_trigCounter_reg_n_0_[2]\,
      I3 => \w_trigCounter_reg_n_0_[1]\,
      I4 => \w_trigCounter_reg_n_0_[0]\,
      O => \w_trigCounter[5]_i_2_n_0\
    );
\w_trigCounter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \w_trigCounter[9]_i_2_n_0\,
      I1 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I2 => \w_trigCounter_reg_n_0_[6]\,
      O => w_trigCounter(6)
    );
\w_trigCounter[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D020"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[6]\,
      I1 => \w_trigCounter[9]_i_2_n_0\,
      I2 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I3 => \w_trigCounter_reg_n_0_[7]\,
      O => w_trigCounter(7)
    );
\w_trigCounter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BF004000"
    )
        port map (
      I0 => \w_trigCounter[9]_i_2_n_0\,
      I1 => \w_trigCounter_reg_n_0_[6]\,
      I2 => \w_trigCounter_reg_n_0_[7]\,
      I3 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I4 => \w_trigCounter_reg_n_0_[8]\,
      O => w_trigCounter(8)
    );
\w_trigCounter[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F000000800000"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[8]\,
      I1 => \w_trigCounter_reg_n_0_[7]\,
      I2 => \w_trigCounter_reg_n_0_[6]\,
      I3 => \w_trigCounter[9]_i_2_n_0\,
      I4 => \FSM_sequential_w_state[0]_i_2_n_0\,
      I5 => \w_trigCounter_reg_n_0_[9]\,
      O => w_trigCounter(9)
    );
\w_trigCounter[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \w_trigCounter_reg_n_0_[0]\,
      I1 => \w_trigCounter_reg_n_0_[1]\,
      I2 => \w_trigCounter_reg_n_0_[2]\,
      I3 => \w_trigCounter_reg_n_0_[3]\,
      I4 => \w_trigCounter_reg_n_0_[4]\,
      I5 => \w_trigCounter_reg_n_0_[5]\,
      O => \w_trigCounter[9]_i_2_n_0\
    );
\w_trigCounter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(0),
      Q => \w_trigCounter_reg_n_0_[0]\,
      R => '0'
    );
\w_trigCounter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(10),
      Q => \w_trigCounter_reg_n_0_[10]\,
      R => '0'
    );
\w_trigCounter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(1),
      Q => \w_trigCounter_reg_n_0_[1]\,
      R => '0'
    );
\w_trigCounter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(2),
      Q => \w_trigCounter_reg_n_0_[2]\,
      R => '0'
    );
\w_trigCounter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(3),
      Q => \w_trigCounter_reg_n_0_[3]\,
      R => '0'
    );
\w_trigCounter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(4),
      Q => \w_trigCounter_reg_n_0_[4]\,
      R => '0'
    );
\w_trigCounter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(5),
      Q => \w_trigCounter_reg_n_0_[5]\,
      R => '0'
    );
\w_trigCounter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(6),
      Q => \w_trigCounter_reg_n_0_[6]\,
      R => '0'
    );
\w_trigCounter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(7),
      Q => \w_trigCounter_reg_n_0_[7]\,
      R => '0'
    );
\w_trigCounter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(8),
      Q => \w_trigCounter_reg_n_0_[8]\,
      R => '0'
    );
\w_trigCounter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_trigCounter0,
      D => w_trigCounter(9),
      Q => \w_trigCounter_reg_n_0_[9]\,
      R => '0'
    );
w_waitCounter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => w_waitCounter0_carry_n_0,
      CO(2) => w_waitCounter0_carry_n_1,
      CO(1) => w_waitCounter0_carry_n_2,
      CO(0) => w_waitCounter0_carry_n_3,
      CYINIT => \w_waitCounter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_waitCounter0(4 downto 1),
      S(3) => \w_waitCounter_reg_n_0_[4]\,
      S(2) => \w_waitCounter_reg_n_0_[3]\,
      S(1) => \w_waitCounter_reg_n_0_[2]\,
      S(0) => \w_waitCounter_reg_n_0_[1]\
    );
\w_waitCounter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => w_waitCounter0_carry_n_0,
      CO(3) => \w_waitCounter0_carry__0_n_0\,
      CO(2) => \w_waitCounter0_carry__0_n_1\,
      CO(1) => \w_waitCounter0_carry__0_n_2\,
      CO(0) => \w_waitCounter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_waitCounter0(8 downto 5),
      S(3) => \w_waitCounter_reg_n_0_[8]\,
      S(2) => \w_waitCounter_reg_n_0_[7]\,
      S(1) => \w_waitCounter_reg_n_0_[6]\,
      S(0) => \w_waitCounter_reg_n_0_[5]\
    );
\w_waitCounter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \w_waitCounter0_carry__0_n_0\,
      CO(3) => \w_waitCounter0_carry__1_n_0\,
      CO(2) => \w_waitCounter0_carry__1_n_1\,
      CO(1) => \w_waitCounter0_carry__1_n_2\,
      CO(0) => \w_waitCounter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_waitCounter0(12 downto 9),
      S(3) => \w_waitCounter_reg_n_0_[12]\,
      S(2) => \w_waitCounter_reg_n_0_[11]\,
      S(1) => \w_waitCounter_reg_n_0_[10]\,
      S(0) => \w_waitCounter_reg_n_0_[9]\
    );
\w_waitCounter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \w_waitCounter0_carry__1_n_0\,
      CO(3) => \w_waitCounter0_carry__2_n_0\,
      CO(2) => \w_waitCounter0_carry__2_n_1\,
      CO(1) => \w_waitCounter0_carry__2_n_2\,
      CO(0) => \w_waitCounter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => w_waitCounter0(16 downto 13),
      S(3) => \w_waitCounter_reg_n_0_[16]\,
      S(2) => \w_waitCounter_reg_n_0_[15]\,
      S(1) => \w_waitCounter_reg_n_0_[14]\,
      S(0) => \w_waitCounter_reg_n_0_[13]\
    );
\w_waitCounter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \w_waitCounter0_carry__2_n_0\,
      CO(3 downto 2) => \NLW_w_waitCounter0_carry__3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \w_waitCounter0_carry__3_n_2\,
      CO(0) => \w_waitCounter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_w_waitCounter0_carry__3_O_UNCONNECTED\(3),
      O(2 downto 0) => w_waitCounter0(19 downto 17),
      S(3) => '0',
      S(2) => \w_waitCounter_reg_n_0_[19]\,
      S(1) => \w_waitCounter_reg_n_0_[18]\,
      S(0) => \w_waitCounter_reg_n_0_[17]\
    );
\w_waitCounter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \w_waitCounter_reg_n_0_[0]\,
      O => \w_waitCounter[0]_i_1_n_0\
    );
\w_waitCounter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11101111"
    )
        port map (
      I0 => w_state(0),
      I1 => i_rst,
      I2 => \FSM_sequential_w_state[1]_i_3_n_0\,
      I3 => i_recvPulse,
      I4 => \FSM_sequential_w_state_reg_n_0_[1]\,
      O => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_rst,
      I1 => w_state(0),
      O => w_waitCounter0_1
    );
\w_waitCounter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => \w_waitCounter[0]_i_1_n_0\,
      Q => \w_waitCounter_reg_n_0_[0]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(10),
      Q => \w_waitCounter_reg_n_0_[10]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(11),
      Q => \w_waitCounter_reg_n_0_[11]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(12),
      Q => \w_waitCounter_reg_n_0_[12]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(13),
      Q => \w_waitCounter_reg_n_0_[13]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(14),
      Q => \w_waitCounter_reg_n_0_[14]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(15),
      Q => \w_waitCounter_reg_n_0_[15]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(16),
      Q => \w_waitCounter_reg_n_0_[16]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(17),
      Q => \w_waitCounter_reg_n_0_[17]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(18),
      Q => \w_waitCounter_reg_n_0_[18]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(19),
      Q => \w_waitCounter_reg_n_0_[19]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(1),
      Q => \w_waitCounter_reg_n_0_[1]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(2),
      Q => \w_waitCounter_reg_n_0_[2]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(3),
      Q => \w_waitCounter_reg_n_0_[3]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(4),
      Q => \w_waitCounter_reg_n_0_[4]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(5),
      Q => \w_waitCounter_reg_n_0_[5]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(6),
      Q => \w_waitCounter_reg_n_0_[6]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(7),
      Q => \w_waitCounter_reg_n_0_[7]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(8),
      Q => \w_waitCounter_reg_n_0_[8]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
\w_waitCounter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => w_waitCounter0_1,
      D => w_waitCounter0(9),
      Q => \w_waitCounter_reg_n_0_[9]\,
      R => \w_waitCounter[19]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_PulseController_0_0 is
  port (
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_trigEnable : in STD_LOGIC;
    i_recvPulse : in STD_LOGIC;
    o_trigPulse : out STD_LOGIC;
    o_recvReady : out STD_LOGIC;
    o_recvTime : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_PulseController_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_PulseController_0_0 : entity is "design_1_PulseController_0_0,PulseController,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_PulseController_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_PulseController_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_PulseController_0_0 : entity is "PulseController,Vivado 2023.1";
end design_1_PulseController_0_0;

architecture STRUCTURE of design_1_PulseController_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of i_clk : signal is "xilinx.com:signal:clock:1.0 i_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of i_clk : signal is "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_sys_clk, INSERT_VIP 0";
  attribute x_interface_info of i_rst : signal is "xilinx.com:signal:reset:1.0 i_rst RST";
  attribute x_interface_parameter of i_rst : signal is "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.design_1_PulseController_0_0_PulseController
     port map (
      i_clk => i_clk,
      i_recvPulse => i_recvPulse,
      i_rst => i_rst,
      i_trigEnable => i_trigEnable,
      o_recvReady => o_recvReady,
      o_recvTime(7 downto 0) => o_recvTime(7 downto 0),
      o_trigPulse => o_trigPulse
    );
end STRUCTURE;

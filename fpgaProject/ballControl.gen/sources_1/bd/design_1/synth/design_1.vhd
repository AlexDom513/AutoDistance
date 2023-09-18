--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
--Date        : Wed Sep 13 23:11:03 2023
--Host        : Alex-Laptop running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    i_rst : in STD_LOGIC;
    i_trigEnable : in STD_LOGIC;
    o_recvReady_0 : out STD_LOGIC;
    recvPulse_io1 : in STD_LOGIC;
    sys_clk : in STD_LOGIC;
    trigPulse_io0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=5,da_clkrst_cnt=1,da_ps7_cnt=2,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_ila_0_0;
  component design_1_PulseController_0_0 is
  port (
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_trigEnable : in STD_LOGIC;
    i_recvPulse : in STD_LOGIC;
    o_trigPulse : out STD_LOGIC;
    o_recvReady : out STD_LOGIC;
    o_recvTime : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_PulseController_0_0;
  signal PulseController_0_o_recvReady : STD_LOGIC;
  signal PulseController_0_o_recvTime : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal PulseController_0_o_trigPulse : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal i_rst_0_1 : STD_LOGIC;
  signal i_trigEnable_0_1 : STD_LOGIC;
  signal recvPulse_io1_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of i_rst : signal is "xilinx.com:signal:reset:1.0 RST.I_RST RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of i_rst : signal is "XIL_INTERFACENAME RST.I_RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clk : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clk : signal is "XIL_INTERFACENAME CLK.SYS_CLK, ASSOCIATED_RESET i_rst, CLK_DOMAIN design_1_sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  clk_wiz_0_clk_out1 <= sys_clk;
  i_rst_0_1 <= i_rst;
  i_trigEnable_0_1 <= i_trigEnable;
  o_recvReady_0 <= PulseController_0_o_recvReady;
  recvPulse_io1_1 <= recvPulse_io1;
  trigPulse_io0 <= PulseController_0_o_trigPulse;
PulseController_0: component design_1_PulseController_0_0
     port map (
      i_clk => clk_wiz_0_clk_out1,
      i_recvPulse => recvPulse_io1_1,
      i_rst => i_rst_0_1,
      i_trigEnable => i_trigEnable_0_1,
      o_recvReady => PulseController_0_o_recvReady,
      o_recvTime(7 downto 0) => PulseController_0_o_recvTime(7 downto 0),
      o_trigPulse => PulseController_0_o_trigPulse
    );
ila_0: component design_1_ila_0_0
     port map (
      clk => clk_wiz_0_clk_out1,
      probe0(7 downto 0) => PulseController_0_o_recvTime(7 downto 0)
    );
end STRUCTURE;

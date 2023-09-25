// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Sep 13 23:12:25 2023
// Host        : Alex-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Alex/Desktop/Engineering/FPGA/Projects/ballControl/ballControl.gen/sources_1/bd/design_1/ip/design_1_PulseController_0_0_2/design_1_PulseController_0_0_sim_netlist.v
// Design      : design_1_PulseController_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_PulseController_0_0,PulseController,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "PulseController,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module design_1_PulseController_0_0
   (i_clk,
    i_rst,
    i_trigEnable,
    i_recvPulse,
    o_trigPulse,
    o_recvReady,
    o_recvTime);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_sys_clk, INSERT_VIP 0" *) input i_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
  input i_trigEnable;
  input i_recvPulse;
  output o_trigPulse;
  output o_recvReady;
  output [7:0]o_recvTime;

  wire i_clk;
  wire i_recvPulse;
  wire i_rst;
  wire i_trigEnable;
  wire o_recvReady;
  wire [7:0]o_recvTime;
  wire o_trigPulse;

  design_1_PulseController_0_0_PulseController U0
       (.i_clk(i_clk),
        .i_recvPulse(i_recvPulse),
        .i_rst(i_rst),
        .i_trigEnable(i_trigEnable),
        .o_recvReady(o_recvReady),
        .o_recvTime(o_recvTime),
        .o_trigPulse(o_trigPulse));
endmodule

(* ORIG_REF_NAME = "PulseController" *) 
module design_1_PulseController_0_0_PulseController
   (o_recvTime,
    o_trigPulse,
    o_recvReady,
    i_rst,
    i_recvPulse,
    i_clk,
    i_trigEnable);
  output [7:0]o_recvTime;
  output o_trigPulse;
  output o_recvReady;
  input i_rst;
  input i_recvPulse;
  input i_clk;
  input i_trigEnable;

  wire \FSM_sequential_w_state[0]_i_2_n_0 ;
  wire \FSM_sequential_w_state[0]_i_3_n_0 ;
  wire \FSM_sequential_w_state[1]_i_1_n_0 ;
  wire \FSM_sequential_w_state[1]_i_3_n_0 ;
  wire \FSM_sequential_w_state[1]_i_4_n_0 ;
  wire \FSM_sequential_w_state[1]_i_5_n_0 ;
  wire \FSM_sequential_w_state[1]_i_6_n_0 ;
  wire \FSM_sequential_w_state[1]_i_7_n_0 ;
  wire \FSM_sequential_w_state[1]_i_8_n_0 ;
  wire \FSM_sequential_w_state_reg_n_0_[1] ;
  wire i_clk;
  wire i_recvPulse;
  wire i_rst;
  wire i_trigEnable;
  wire o_recvReady;
  wire o_recvReady_i_1_n_0;
  wire [7:0]o_recvTime;
  wire o_recvTime0;
  wire o_trigPulse;
  wire o_trigPulse_i_1_n_0;
  wire o_trigPulse_i_2_n_0;
  wire o_trigPulse_i_3_n_0;
  wire o_trigPulse_i_4_n_0;
  wire o_trigPulse_i_5_n_0;
  wire [13:1]w_recvCounter0;
  wire w_recvCounter0_0;
  wire w_recvCounter0_carry__0_n_0;
  wire w_recvCounter0_carry__0_n_1;
  wire w_recvCounter0_carry__0_n_2;
  wire w_recvCounter0_carry__0_n_3;
  wire w_recvCounter0_carry__1_n_0;
  wire w_recvCounter0_carry__1_n_1;
  wire w_recvCounter0_carry__1_n_2;
  wire w_recvCounter0_carry__1_n_3;
  wire w_recvCounter0_carry_n_0;
  wire w_recvCounter0_carry_n_1;
  wire w_recvCounter0_carry_n_2;
  wire w_recvCounter0_carry_n_3;
  wire \w_recvCounter[0]_i_1_n_0 ;
  wire \w_recvCounter[13]_i_1_n_0 ;
  wire \w_recvCounter[13]_i_3_n_0 ;
  wire \w_recvCounter[13]_i_4_n_0 ;
  wire \w_recvCounter[13]_i_5_n_0 ;
  wire \w_recvCounter_reg_n_0_[0] ;
  wire \w_recvCounter_reg_n_0_[10] ;
  wire \w_recvCounter_reg_n_0_[11] ;
  wire \w_recvCounter_reg_n_0_[12] ;
  wire \w_recvCounter_reg_n_0_[13] ;
  wire \w_recvCounter_reg_n_0_[1] ;
  wire \w_recvCounter_reg_n_0_[2] ;
  wire \w_recvCounter_reg_n_0_[3] ;
  wire \w_recvCounter_reg_n_0_[4] ;
  wire \w_recvCounter_reg_n_0_[5] ;
  wire \w_recvCounter_reg_n_0_[6] ;
  wire \w_recvCounter_reg_n_0_[7] ;
  wire \w_recvCounter_reg_n_0_[8] ;
  wire \w_recvCounter_reg_n_0_[9] ;
  wire [7:0]w_recvTime;
  wire w_recvTime0;
  wire \w_recvTime[5]_i_2_n_0 ;
  wire \w_recvTime[7]_i_3_n_0 ;
  wire \w_recvTime_reg_n_0_[0] ;
  wire \w_recvTime_reg_n_0_[1] ;
  wire \w_recvTime_reg_n_0_[2] ;
  wire \w_recvTime_reg_n_0_[3] ;
  wire \w_recvTime_reg_n_0_[4] ;
  wire \w_recvTime_reg_n_0_[5] ;
  wire \w_recvTime_reg_n_0_[6] ;
  wire \w_recvTime_reg_n_0_[7] ;
  wire [0:0]w_state;
  wire [1:0]w_state__0;
  wire [10:0]w_trigCounter;
  wire w_trigCounter0;
  wire \w_trigCounter[10]_i_3_n_0 ;
  wire \w_trigCounter[5]_i_2_n_0 ;
  wire \w_trigCounter[9]_i_2_n_0 ;
  wire \w_trigCounter_reg_n_0_[0] ;
  wire \w_trigCounter_reg_n_0_[10] ;
  wire \w_trigCounter_reg_n_0_[1] ;
  wire \w_trigCounter_reg_n_0_[2] ;
  wire \w_trigCounter_reg_n_0_[3] ;
  wire \w_trigCounter_reg_n_0_[4] ;
  wire \w_trigCounter_reg_n_0_[5] ;
  wire \w_trigCounter_reg_n_0_[6] ;
  wire \w_trigCounter_reg_n_0_[7] ;
  wire \w_trigCounter_reg_n_0_[8] ;
  wire \w_trigCounter_reg_n_0_[9] ;
  wire [19:1]w_waitCounter0;
  wire w_waitCounter0_1;
  wire w_waitCounter0_carry__0_n_0;
  wire w_waitCounter0_carry__0_n_1;
  wire w_waitCounter0_carry__0_n_2;
  wire w_waitCounter0_carry__0_n_3;
  wire w_waitCounter0_carry__1_n_0;
  wire w_waitCounter0_carry__1_n_1;
  wire w_waitCounter0_carry__1_n_2;
  wire w_waitCounter0_carry__1_n_3;
  wire w_waitCounter0_carry__2_n_0;
  wire w_waitCounter0_carry__2_n_1;
  wire w_waitCounter0_carry__2_n_2;
  wire w_waitCounter0_carry__2_n_3;
  wire w_waitCounter0_carry__3_n_2;
  wire w_waitCounter0_carry__3_n_3;
  wire w_waitCounter0_carry_n_0;
  wire w_waitCounter0_carry_n_1;
  wire w_waitCounter0_carry_n_2;
  wire w_waitCounter0_carry_n_3;
  wire \w_waitCounter[0]_i_1_n_0 ;
  wire \w_waitCounter[19]_i_1_n_0 ;
  wire \w_waitCounter_reg_n_0_[0] ;
  wire \w_waitCounter_reg_n_0_[10] ;
  wire \w_waitCounter_reg_n_0_[11] ;
  wire \w_waitCounter_reg_n_0_[12] ;
  wire \w_waitCounter_reg_n_0_[13] ;
  wire \w_waitCounter_reg_n_0_[14] ;
  wire \w_waitCounter_reg_n_0_[15] ;
  wire \w_waitCounter_reg_n_0_[16] ;
  wire \w_waitCounter_reg_n_0_[17] ;
  wire \w_waitCounter_reg_n_0_[18] ;
  wire \w_waitCounter_reg_n_0_[19] ;
  wire \w_waitCounter_reg_n_0_[1] ;
  wire \w_waitCounter_reg_n_0_[2] ;
  wire \w_waitCounter_reg_n_0_[3] ;
  wire \w_waitCounter_reg_n_0_[4] ;
  wire \w_waitCounter_reg_n_0_[5] ;
  wire \w_waitCounter_reg_n_0_[6] ;
  wire \w_waitCounter_reg_n_0_[7] ;
  wire \w_waitCounter_reg_n_0_[8] ;
  wire \w_waitCounter_reg_n_0_[9] ;
  wire [3:0]NLW_w_recvCounter0_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_w_recvCounter0_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_w_waitCounter0_carry__3_CO_UNCONNECTED;
  wire [3:3]NLW_w_waitCounter0_carry__3_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000CCCCFFF0EEEE)) 
    \FSM_sequential_w_state[0]_i_1 
       (.I0(i_trigEnable),
        .I1(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I2(\FSM_sequential_w_state[1]_i_3_n_0 ),
        .I3(i_recvPulse),
        .I4(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I5(w_state),
        .O(w_state__0[0]));
  LUT5 #(
    .INIT(32'hFEEE0000)) 
    \FSM_sequential_w_state[0]_i_2 
       (.I0(o_trigPulse_i_5_n_0),
        .I1(o_trigPulse_i_4_n_0),
        .I2(\FSM_sequential_w_state[0]_i_3_n_0 ),
        .I3(o_trigPulse_i_3_n_0),
        .I4(w_state),
        .O(\FSM_sequential_w_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_sequential_w_state[0]_i_3 
       (.I0(\w_trigCounter_reg_n_0_[2] ),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .I2(\w_trigCounter_reg_n_0_[0] ),
        .O(\FSM_sequential_w_state[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_w_state[1]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(w_state),
        .I2(i_recvPulse),
        .O(\FSM_sequential_w_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00BB0F00)) 
    \FSM_sequential_w_state[1]_i_2 
       (.I0(i_recvPulse),
        .I1(\FSM_sequential_w_state[1]_i_3_n_0 ),
        .I2(o_trigPulse_i_2_n_0),
        .I3(w_state),
        .I4(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(w_state__0[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFE00000)) 
    \FSM_sequential_w_state[1]_i_3 
       (.I0(\FSM_sequential_w_state[1]_i_4_n_0 ),
        .I1(\FSM_sequential_w_state[1]_i_5_n_0 ),
        .I2(\FSM_sequential_w_state[1]_i_6_n_0 ),
        .I3(\w_waitCounter_reg_n_0_[15] ),
        .I4(\FSM_sequential_w_state[1]_i_7_n_0 ),
        .I5(\FSM_sequential_w_state[1]_i_8_n_0 ),
        .O(\FSM_sequential_w_state[1]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_sequential_w_state[1]_i_4 
       (.I0(\w_waitCounter_reg_n_0_[10] ),
        .I1(\w_waitCounter_reg_n_0_[9] ),
        .I2(\w_waitCounter_reg_n_0_[11] ),
        .O(\FSM_sequential_w_state[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h88808080)) 
    \FSM_sequential_w_state[1]_i_5 
       (.I0(\w_waitCounter_reg_n_0_[8] ),
        .I1(\w_waitCounter_reg_n_0_[7] ),
        .I2(\w_waitCounter_reg_n_0_[6] ),
        .I3(\w_waitCounter_reg_n_0_[5] ),
        .I4(\w_waitCounter_reg_n_0_[4] ),
        .O(\FSM_sequential_w_state[1]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_w_state[1]_i_6 
       (.I0(\w_waitCounter_reg_n_0_[14] ),
        .I1(\w_waitCounter_reg_n_0_[13] ),
        .I2(\w_waitCounter_reg_n_0_[12] ),
        .O(\FSM_sequential_w_state[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_w_state[1]_i_7 
       (.I0(\w_waitCounter_reg_n_0_[17] ),
        .I1(\w_waitCounter_reg_n_0_[16] ),
        .I2(\w_waitCounter_reg_n_0_[19] ),
        .O(\FSM_sequential_w_state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_sequential_w_state[1]_i_8 
       (.I0(\w_waitCounter_reg_n_0_[19] ),
        .I1(\w_waitCounter_reg_n_0_[18] ),
        .O(\FSM_sequential_w_state[1]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "idle:00,recv:11,antcp:10,trig:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[0] 
       (.C(i_clk),
        .CE(\FSM_sequential_w_state[1]_i_1_n_0 ),
        .CLR(i_rst),
        .D(w_state__0[0]),
        .Q(w_state));
  (* FSM_ENCODED_STATES = "idle:00,recv:11,antcp:10,trig:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[1] 
       (.C(i_clk),
        .CE(\FSM_sequential_w_state[1]_i_1_n_0 ),
        .CLR(i_rst),
        .D(w_state__0[1]),
        .Q(\FSM_sequential_w_state_reg_n_0_[1] ));
  LUT5 #(
    .INIT(32'hFFFC0040)) 
    o_recvReady_i_1
       (.I0(i_recvPulse),
        .I1(w_state),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(i_rst),
        .I4(o_recvReady),
        .O(o_recvReady_i_1_n_0));
  FDRE o_recvReady_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_recvReady_i_1_n_0),
        .Q(o_recvReady),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0040)) 
    \o_recvTime[7]_i_1 
       (.I0(i_rst),
        .I1(w_state),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(i_recvPulse),
        .O(o_recvTime0));
  FDRE \o_recvTime_reg[0] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[0] ),
        .Q(o_recvTime[0]),
        .R(1'b0));
  FDRE \o_recvTime_reg[1] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[1] ),
        .Q(o_recvTime[1]),
        .R(1'b0));
  FDRE \o_recvTime_reg[2] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[2] ),
        .Q(o_recvTime[2]),
        .R(1'b0));
  FDRE \o_recvTime_reg[3] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[3] ),
        .Q(o_recvTime[3]),
        .R(1'b0));
  FDRE \o_recvTime_reg[4] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[4] ),
        .Q(o_recvTime[4]),
        .R(1'b0));
  FDRE \o_recvTime_reg[5] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[5] ),
        .Q(o_recvTime[5]),
        .R(1'b0));
  FDRE \o_recvTime_reg[6] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[6] ),
        .Q(o_recvTime[6]),
        .R(1'b0));
  FDRE \o_recvTime_reg[7] 
       (.C(i_clk),
        .CE(o_recvTime0),
        .D(\w_recvTime_reg_n_0_[7] ),
        .Q(o_recvTime[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    o_trigPulse_i_1
       (.I0(o_trigPulse_i_2_n_0),
        .I1(i_rst),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(w_state),
        .I4(o_trigPulse),
        .O(o_trigPulse_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0002)) 
    o_trigPulse_i_2
       (.I0(o_trigPulse_i_3_n_0),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .I2(\w_trigCounter_reg_n_0_[1] ),
        .I3(\w_trigCounter_reg_n_0_[2] ),
        .I4(o_trigPulse_i_4_n_0),
        .I5(o_trigPulse_i_5_n_0),
        .O(o_trigPulse_i_2_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    o_trigPulse_i_3
       (.I0(\w_trigCounter_reg_n_0_[9] ),
        .I1(\w_trigCounter_reg_n_0_[8] ),
        .I2(\w_trigCounter_reg_n_0_[4] ),
        .I3(\w_trigCounter_reg_n_0_[3] ),
        .O(o_trigPulse_i_3_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    o_trigPulse_i_4
       (.I0(\w_trigCounter_reg_n_0_[7] ),
        .I1(\w_trigCounter_reg_n_0_[8] ),
        .I2(\w_trigCounter_reg_n_0_[9] ),
        .I3(\w_trigCounter_reg_n_0_[10] ),
        .O(o_trigPulse_i_4_n_0));
  LUT4 #(
    .INIT(16'h0007)) 
    o_trigPulse_i_5
       (.I0(\w_trigCounter_reg_n_0_[5] ),
        .I1(\w_trigCounter_reg_n_0_[6] ),
        .I2(\w_trigCounter_reg_n_0_[8] ),
        .I3(\w_trigCounter_reg_n_0_[9] ),
        .O(o_trigPulse_i_5_n_0));
  FDRE o_trigPulse_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_trigPulse_i_1_n_0),
        .Q(o_trigPulse),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_recvCounter0_carry
       (.CI(1'b0),
        .CO({w_recvCounter0_carry_n_0,w_recvCounter0_carry_n_1,w_recvCounter0_carry_n_2,w_recvCounter0_carry_n_3}),
        .CYINIT(\w_recvCounter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_recvCounter0[4:1]),
        .S({\w_recvCounter_reg_n_0_[4] ,\w_recvCounter_reg_n_0_[3] ,\w_recvCounter_reg_n_0_[2] ,\w_recvCounter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_recvCounter0_carry__0
       (.CI(w_recvCounter0_carry_n_0),
        .CO({w_recvCounter0_carry__0_n_0,w_recvCounter0_carry__0_n_1,w_recvCounter0_carry__0_n_2,w_recvCounter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_recvCounter0[8:5]),
        .S({\w_recvCounter_reg_n_0_[8] ,\w_recvCounter_reg_n_0_[7] ,\w_recvCounter_reg_n_0_[6] ,\w_recvCounter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_recvCounter0_carry__1
       (.CI(w_recvCounter0_carry__0_n_0),
        .CO({w_recvCounter0_carry__1_n_0,w_recvCounter0_carry__1_n_1,w_recvCounter0_carry__1_n_2,w_recvCounter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_recvCounter0[12:9]),
        .S({\w_recvCounter_reg_n_0_[12] ,\w_recvCounter_reg_n_0_[11] ,\w_recvCounter_reg_n_0_[10] ,\w_recvCounter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_recvCounter0_carry__2
       (.CI(w_recvCounter0_carry__1_n_0),
        .CO(NLW_w_recvCounter0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_w_recvCounter0_carry__2_O_UNCONNECTED[3:1],w_recvCounter0[13]}),
        .S({1'b0,1'b0,1'b0,\w_recvCounter_reg_n_0_[13] }));
  LUT1 #(
    .INIT(2'h1)) 
    \w_recvCounter[0]_i_1 
       (.I0(\w_recvCounter_reg_n_0_[0] ),
        .O(\w_recvCounter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40001111)) 
    \w_recvCounter[13]_i_1 
       (.I0(i_rst),
        .I1(w_state),
        .I2(i_recvPulse),
        .I3(\w_recvCounter[13]_i_3_n_0 ),
        .I4(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(\w_recvCounter[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0083)) 
    \w_recvCounter[13]_i_2 
       (.I0(i_recvPulse),
        .I1(w_state),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(i_rst),
        .O(w_recvCounter0_0));
  LUT6 #(
    .INIT(64'h8888888888888880)) 
    \w_recvCounter[13]_i_3 
       (.I0(\w_recvCounter_reg_n_0_[13] ),
        .I1(\w_recvCounter_reg_n_0_[12] ),
        .I2(\w_recvCounter[13]_i_4_n_0 ),
        .I3(\w_recvCounter_reg_n_0_[10] ),
        .I4(\w_recvCounter_reg_n_0_[9] ),
        .I5(\w_recvCounter[13]_i_5_n_0 ),
        .O(\w_recvCounter[13]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \w_recvCounter[13]_i_4 
       (.I0(\w_recvCounter_reg_n_0_[8] ),
        .I1(\w_recvCounter_reg_n_0_[11] ),
        .O(\w_recvCounter[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8888888080808080)) 
    \w_recvCounter[13]_i_5 
       (.I0(\w_recvCounter_reg_n_0_[7] ),
        .I1(\w_recvCounter_reg_n_0_[6] ),
        .I2(\w_recvCounter_reg_n_0_[5] ),
        .I3(\w_recvCounter_reg_n_0_[3] ),
        .I4(\w_recvCounter_reg_n_0_[2] ),
        .I5(\w_recvCounter_reg_n_0_[4] ),
        .O(\w_recvCounter[13]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[0] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(\w_recvCounter[0]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[0] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[10] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[10]),
        .Q(\w_recvCounter_reg_n_0_[10] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[11] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[11]),
        .Q(\w_recvCounter_reg_n_0_[11] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[12] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[12]),
        .Q(\w_recvCounter_reg_n_0_[12] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[13] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[13]),
        .Q(\w_recvCounter_reg_n_0_[13] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[1] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[1]),
        .Q(\w_recvCounter_reg_n_0_[1] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[2] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[2]),
        .Q(\w_recvCounter_reg_n_0_[2] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[3] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[3]),
        .Q(\w_recvCounter_reg_n_0_[3] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[4] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[4]),
        .Q(\w_recvCounter_reg_n_0_[4] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[5] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[5]),
        .Q(\w_recvCounter_reg_n_0_[5] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[6] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[6]),
        .Q(\w_recvCounter_reg_n_0_[6] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[7] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[7]),
        .Q(\w_recvCounter_reg_n_0_[7] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[8] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[8]),
        .Q(\w_recvCounter_reg_n_0_[8] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[9] 
       (.C(i_clk),
        .CE(w_recvCounter0_0),
        .D(w_recvCounter0[9]),
        .Q(\w_recvCounter_reg_n_0_[9] ),
        .R(\w_recvCounter[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \w_recvTime[0]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[0] ),
        .O(w_recvTime[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \w_recvTime[1]_i_1 
       (.I0(\w_recvTime_reg_n_0_[0] ),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(\w_recvTime_reg_n_0_[1] ),
        .O(w_recvTime[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \w_recvTime[2]_i_1 
       (.I0(\w_recvTime_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[0] ),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(\w_recvTime_reg_n_0_[2] ),
        .O(w_recvTime[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \w_recvTime[3]_i_1 
       (.I0(\w_recvTime_reg_n_0_[2] ),
        .I1(\w_recvTime_reg_n_0_[0] ),
        .I2(\w_recvTime_reg_n_0_[1] ),
        .I3(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I4(\w_recvTime_reg_n_0_[3] ),
        .O(w_recvTime[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \w_recvTime[4]_i_1 
       (.I0(\w_recvTime_reg_n_0_[3] ),
        .I1(\w_recvTime_reg_n_0_[1] ),
        .I2(\w_recvTime_reg_n_0_[0] ),
        .I3(\w_recvTime_reg_n_0_[2] ),
        .I4(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I5(\w_recvTime_reg_n_0_[4] ),
        .O(w_recvTime[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \w_recvTime[5]_i_1 
       (.I0(\w_recvTime[5]_i_2_n_0 ),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(\w_recvTime_reg_n_0_[5] ),
        .O(w_recvTime[5]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \w_recvTime[5]_i_2 
       (.I0(\w_recvTime_reg_n_0_[4] ),
        .I1(\w_recvTime_reg_n_0_[2] ),
        .I2(\w_recvTime_reg_n_0_[0] ),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .I4(\w_recvTime_reg_n_0_[3] ),
        .O(\w_recvTime[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \w_recvTime[6]_i_1 
       (.I0(\w_recvTime[7]_i_3_n_0 ),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(\w_recvTime_reg_n_0_[6] ),
        .O(w_recvTime[6]));
  LUT5 #(
    .INIT(32'h0000800F)) 
    \w_recvTime[7]_i_1 
       (.I0(\w_recvCounter[13]_i_3_n_0 ),
        .I1(i_recvPulse),
        .I2(w_state),
        .I3(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I4(i_rst),
        .O(w_recvTime0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB040)) 
    \w_recvTime[7]_i_2 
       (.I0(\w_recvTime[7]_i_3_n_0 ),
        .I1(\w_recvTime_reg_n_0_[6] ),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(\w_recvTime_reg_n_0_[7] ),
        .O(w_recvTime[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \w_recvTime[7]_i_3 
       (.I0(\w_recvTime_reg_n_0_[5] ),
        .I1(\w_recvTime_reg_n_0_[3] ),
        .I2(\w_recvTime_reg_n_0_[1] ),
        .I3(\w_recvTime_reg_n_0_[0] ),
        .I4(\w_recvTime_reg_n_0_[2] ),
        .I5(\w_recvTime_reg_n_0_[4] ),
        .O(\w_recvTime[7]_i_3_n_0 ));
  FDRE \w_recvTime_reg[0] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[0]),
        .Q(\w_recvTime_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[1] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[1]),
        .Q(\w_recvTime_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[2] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[2]),
        .Q(\w_recvTime_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[3] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[3]),
        .Q(\w_recvTime_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[4] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[4]),
        .Q(\w_recvTime_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[5] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[5]),
        .Q(\w_recvTime_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[6] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[6]),
        .Q(\w_recvTime_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[7] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(w_recvTime[7]),
        .Q(\w_recvTime_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \w_trigCounter[0]_i_1 
       (.I0(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .O(w_trigCounter[0]));
  LUT2 #(
    .INIT(4'h1)) 
    \w_trigCounter[10]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(i_rst),
        .O(w_trigCounter0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \w_trigCounter[10]_i_2 
       (.I0(\w_trigCounter[10]_i_3_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[9] ),
        .I2(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I3(\w_trigCounter_reg_n_0_[10] ),
        .O(w_trigCounter[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \w_trigCounter[10]_i_3 
       (.I0(\w_trigCounter_reg_n_0_[8] ),
        .I1(\w_trigCounter_reg_n_0_[7] ),
        .I2(\w_trigCounter_reg_n_0_[6] ),
        .I3(\w_trigCounter[9]_i_2_n_0 ),
        .O(\w_trigCounter[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \w_trigCounter[1]_i_1 
       (.I0(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .I2(\w_trigCounter_reg_n_0_[1] ),
        .O(w_trigCounter[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \w_trigCounter[2]_i_1 
       (.I0(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .I2(\w_trigCounter_reg_n_0_[0] ),
        .I3(\w_trigCounter_reg_n_0_[2] ),
        .O(w_trigCounter[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \w_trigCounter[3]_i_1 
       (.I0(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .I2(\w_trigCounter_reg_n_0_[1] ),
        .I3(\w_trigCounter_reg_n_0_[2] ),
        .I4(\w_trigCounter_reg_n_0_[3] ),
        .O(w_trigCounter[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \w_trigCounter[4]_i_1 
       (.I0(\w_trigCounter_reg_n_0_[0] ),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .I2(\w_trigCounter_reg_n_0_[2] ),
        .I3(\w_trigCounter_reg_n_0_[3] ),
        .I4(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I5(\w_trigCounter_reg_n_0_[4] ),
        .O(w_trigCounter[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \w_trigCounter[5]_i_1 
       (.I0(\w_trigCounter[5]_i_2_n_0 ),
        .I1(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I2(\w_trigCounter_reg_n_0_[5] ),
        .O(w_trigCounter[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \w_trigCounter[5]_i_2 
       (.I0(\w_trigCounter_reg_n_0_[4] ),
        .I1(\w_trigCounter_reg_n_0_[3] ),
        .I2(\w_trigCounter_reg_n_0_[2] ),
        .I3(\w_trigCounter_reg_n_0_[1] ),
        .I4(\w_trigCounter_reg_n_0_[0] ),
        .O(\w_trigCounter[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \w_trigCounter[6]_i_1 
       (.I0(\w_trigCounter[9]_i_2_n_0 ),
        .I1(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I2(\w_trigCounter_reg_n_0_[6] ),
        .O(w_trigCounter[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hD020)) 
    \w_trigCounter[7]_i_1 
       (.I0(\w_trigCounter_reg_n_0_[6] ),
        .I1(\w_trigCounter[9]_i_2_n_0 ),
        .I2(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I3(\w_trigCounter_reg_n_0_[7] ),
        .O(w_trigCounter[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBF004000)) 
    \w_trigCounter[8]_i_1 
       (.I0(\w_trigCounter[9]_i_2_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[6] ),
        .I2(\w_trigCounter_reg_n_0_[7] ),
        .I3(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I4(\w_trigCounter_reg_n_0_[8] ),
        .O(w_trigCounter[8]));
  LUT6 #(
    .INIT(64'hFF7F000000800000)) 
    \w_trigCounter[9]_i_1 
       (.I0(\w_trigCounter_reg_n_0_[8] ),
        .I1(\w_trigCounter_reg_n_0_[7] ),
        .I2(\w_trigCounter_reg_n_0_[6] ),
        .I3(\w_trigCounter[9]_i_2_n_0 ),
        .I4(\FSM_sequential_w_state[0]_i_2_n_0 ),
        .I5(\w_trigCounter_reg_n_0_[9] ),
        .O(w_trigCounter[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \w_trigCounter[9]_i_2 
       (.I0(\w_trigCounter_reg_n_0_[0] ),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .I2(\w_trigCounter_reg_n_0_[2] ),
        .I3(\w_trigCounter_reg_n_0_[3] ),
        .I4(\w_trigCounter_reg_n_0_[4] ),
        .I5(\w_trigCounter_reg_n_0_[5] ),
        .O(\w_trigCounter[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[0] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[0]),
        .Q(\w_trigCounter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[10] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[10]),
        .Q(\w_trigCounter_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[1] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[1]),
        .Q(\w_trigCounter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[2] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[2]),
        .Q(\w_trigCounter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[3] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[3]),
        .Q(\w_trigCounter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[4] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[4]),
        .Q(\w_trigCounter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[5] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[5]),
        .Q(\w_trigCounter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[6] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[6]),
        .Q(\w_trigCounter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[7] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[7]),
        .Q(\w_trigCounter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[8] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[8]),
        .Q(\w_trigCounter_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[9] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(w_trigCounter[9]),
        .Q(\w_trigCounter_reg_n_0_[9] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_waitCounter0_carry
       (.CI(1'b0),
        .CO({w_waitCounter0_carry_n_0,w_waitCounter0_carry_n_1,w_waitCounter0_carry_n_2,w_waitCounter0_carry_n_3}),
        .CYINIT(\w_waitCounter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_waitCounter0[4:1]),
        .S({\w_waitCounter_reg_n_0_[4] ,\w_waitCounter_reg_n_0_[3] ,\w_waitCounter_reg_n_0_[2] ,\w_waitCounter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_waitCounter0_carry__0
       (.CI(w_waitCounter0_carry_n_0),
        .CO({w_waitCounter0_carry__0_n_0,w_waitCounter0_carry__0_n_1,w_waitCounter0_carry__0_n_2,w_waitCounter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_waitCounter0[8:5]),
        .S({\w_waitCounter_reg_n_0_[8] ,\w_waitCounter_reg_n_0_[7] ,\w_waitCounter_reg_n_0_[6] ,\w_waitCounter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_waitCounter0_carry__1
       (.CI(w_waitCounter0_carry__0_n_0),
        .CO({w_waitCounter0_carry__1_n_0,w_waitCounter0_carry__1_n_1,w_waitCounter0_carry__1_n_2,w_waitCounter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_waitCounter0[12:9]),
        .S({\w_waitCounter_reg_n_0_[12] ,\w_waitCounter_reg_n_0_[11] ,\w_waitCounter_reg_n_0_[10] ,\w_waitCounter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_waitCounter0_carry__2
       (.CI(w_waitCounter0_carry__1_n_0),
        .CO({w_waitCounter0_carry__2_n_0,w_waitCounter0_carry__2_n_1,w_waitCounter0_carry__2_n_2,w_waitCounter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(w_waitCounter0[16:13]),
        .S({\w_waitCounter_reg_n_0_[16] ,\w_waitCounter_reg_n_0_[15] ,\w_waitCounter_reg_n_0_[14] ,\w_waitCounter_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 w_waitCounter0_carry__3
       (.CI(w_waitCounter0_carry__2_n_0),
        .CO({NLW_w_waitCounter0_carry__3_CO_UNCONNECTED[3:2],w_waitCounter0_carry__3_n_2,w_waitCounter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_w_waitCounter0_carry__3_O_UNCONNECTED[3],w_waitCounter0[19:17]}),
        .S({1'b0,\w_waitCounter_reg_n_0_[19] ,\w_waitCounter_reg_n_0_[18] ,\w_waitCounter_reg_n_0_[17] }));
  LUT1 #(
    .INIT(2'h1)) 
    \w_waitCounter[0]_i_1 
       (.I0(\w_waitCounter_reg_n_0_[0] ),
        .O(\w_waitCounter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h11101111)) 
    \w_waitCounter[19]_i_1 
       (.I0(w_state),
        .I1(i_rst),
        .I2(\FSM_sequential_w_state[1]_i_3_n_0 ),
        .I3(i_recvPulse),
        .I4(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(\w_waitCounter[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \w_waitCounter[19]_i_2 
       (.I0(i_rst),
        .I1(w_state),
        .O(w_waitCounter0_1));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[0] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(\w_waitCounter[0]_i_1_n_0 ),
        .Q(\w_waitCounter_reg_n_0_[0] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[10] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[10]),
        .Q(\w_waitCounter_reg_n_0_[10] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[11] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[11]),
        .Q(\w_waitCounter_reg_n_0_[11] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[12] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[12]),
        .Q(\w_waitCounter_reg_n_0_[12] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[13] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[13]),
        .Q(\w_waitCounter_reg_n_0_[13] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[14] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[14]),
        .Q(\w_waitCounter_reg_n_0_[14] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[15] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[15]),
        .Q(\w_waitCounter_reg_n_0_[15] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[16] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[16]),
        .Q(\w_waitCounter_reg_n_0_[16] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[17] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[17]),
        .Q(\w_waitCounter_reg_n_0_[17] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[18] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[18]),
        .Q(\w_waitCounter_reg_n_0_[18] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[19] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[19]),
        .Q(\w_waitCounter_reg_n_0_[19] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[1] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[1]),
        .Q(\w_waitCounter_reg_n_0_[1] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[2] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[2]),
        .Q(\w_waitCounter_reg_n_0_[2] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[3] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[3]),
        .Q(\w_waitCounter_reg_n_0_[3] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[4] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[4]),
        .Q(\w_waitCounter_reg_n_0_[4] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[5] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[5]),
        .Q(\w_waitCounter_reg_n_0_[5] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[6] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[6]),
        .Q(\w_waitCounter_reg_n_0_[6] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[7] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[7]),
        .Q(\w_waitCounter_reg_n_0_[7] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[8] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[8]),
        .Q(\w_waitCounter_reg_n_0_[8] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_waitCounter_reg[9] 
       (.C(i_clk),
        .CE(w_waitCounter0_1),
        .D(w_waitCounter0[9]),
        .Q(\w_waitCounter_reg_n_0_[9] ),
        .R(\w_waitCounter[19]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

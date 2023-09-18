// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Aug 20 20:40:31 2023
// Host        : Alex-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Alex/Desktop/Engineering/FPGA/Projects/ballControl/ballControl.gen/sources_1/bd/design_1/ip/design_1_PulseController_0_0_1/design_1_PulseController_0_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input i_clk;
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

  wire \FSM_sequential_w_state[1]_i_1_n_0 ;
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
  wire \w_recvCounter[0]_i_1_n_0 ;
  wire \w_recvCounter[1]_i_1_n_0 ;
  wire \w_recvCounter[2]_i_1_n_0 ;
  wire \w_recvCounter[3]_i_1_n_0 ;
  wire \w_recvCounter[4]_i_1_n_0 ;
  wire \w_recvCounter[5]_i_1_n_0 ;
  wire \w_recvCounter[5]_i_2_n_0 ;
  wire \w_recvCounter[5]_i_3_n_0 ;
  wire \w_recvCounter[6]_i_1_n_0 ;
  wire \w_recvCounter[6]_i_2_n_0 ;
  wire \w_recvCounter[6]_i_3_n_0 ;
  wire \w_recvCounter[6]_i_4_n_0 ;
  wire \w_recvCounter_reg_n_0_[0] ;
  wire \w_recvCounter_reg_n_0_[1] ;
  wire \w_recvCounter_reg_n_0_[2] ;
  wire \w_recvCounter_reg_n_0_[3] ;
  wire \w_recvCounter_reg_n_0_[4] ;
  wire \w_recvCounter_reg_n_0_[5] ;
  wire \w_recvCounter_reg_n_0_[6] ;
  wire w_recvTime0;
  wire \w_recvTime[0]_i_1_n_0 ;
  wire \w_recvTime[1]_i_1_n_0 ;
  wire \w_recvTime[2]_i_1_n_0 ;
  wire \w_recvTime[3]_i_1_n_0 ;
  wire \w_recvTime[4]_i_1_n_0 ;
  wire \w_recvTime[5]_i_1_n_0 ;
  wire \w_recvTime[5]_i_2_n_0 ;
  wire \w_recvTime[6]_i_2_n_0 ;
  wire \w_recvTime[6]_i_3_n_0 ;
  wire \w_recvTime[6]_i_4_n_0 ;
  wire \w_recvTime[7]_i_1_n_0 ;
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
  wire w_trigCounter0;
  wire \w_trigCounter[0]_i_1_n_0 ;
  wire \w_trigCounter[1]_i_1_n_0 ;
  wire \w_trigCounter[2]_i_1_n_0 ;
  wire \w_trigCounter[2]_i_2_n_0 ;
  wire \w_trigCounter[3]_i_1_n_0 ;
  wire \w_trigCounter[4]_i_1_n_0 ;
  wire \w_trigCounter[5]_i_1_n_0 ;
  wire \w_trigCounter[5]_i_2_n_0 ;
  wire \w_trigCounter[6]_i_2_n_0 ;
  wire \w_trigCounter[6]_i_3_n_0 ;
  wire \w_trigCounter_reg_n_0_[0] ;
  wire \w_trigCounter_reg_n_0_[1] ;
  wire \w_trigCounter_reg_n_0_[2] ;
  wire \w_trigCounter_reg_n_0_[3] ;
  wire \w_trigCounter_reg_n_0_[4] ;
  wire \w_trigCounter_reg_n_0_[5] ;
  wire \w_trigCounter_reg_n_0_[6] ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h30773044)) 
    \FSM_sequential_w_state[0]_i_1 
       (.I0(o_trigPulse_i_2_n_0),
        .I1(w_state),
        .I2(i_recvPulse),
        .I3(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I4(i_trigEnable),
        .O(w_state__0[0]));
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_w_state[1]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(i_recvPulse),
        .I2(w_state),
        .O(\FSM_sequential_w_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h58)) 
    \FSM_sequential_w_state[1]_i_2 
       (.I0(w_state),
        .I1(o_trigPulse_i_2_n_0),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(w_state__0[1]));
  (* FSM_ENCODED_STATES = "idle:00,trig:01,antcp:10,recv:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[0] 
       (.C(i_clk),
        .CE(\FSM_sequential_w_state[1]_i_1_n_0 ),
        .CLR(i_rst),
        .D(w_state__0[0]),
        .Q(w_state));
  (* FSM_ENCODED_STATES = "idle:00,trig:01,antcp:10,recv:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_w_state_reg[1] 
       (.C(i_clk),
        .CE(\FSM_sequential_w_state[1]_i_1_n_0 ),
        .CLR(i_rst),
        .D(w_state__0[1]),
        .Q(\FSM_sequential_w_state_reg_n_0_[1] ));
  LUT5 #(
    .INIT(32'hFEFE0040)) 
    o_recvReady_i_1
       (.I0(i_rst),
        .I1(w_state),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(i_recvPulse),
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
       (.I0(i_recvPulse),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(w_state),
        .I3(i_rst),
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
    .INIT(32'hFDFF0100)) 
    o_trigPulse_i_1
       (.I0(o_trigPulse_i_2_n_0),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(i_rst),
        .I3(w_state),
        .I4(o_trigPulse),
        .O(o_trigPulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    o_trigPulse_i_2
       (.I0(o_trigPulse_i_3_n_0),
        .I1(\w_trigCounter_reg_n_0_[5] ),
        .I2(\w_trigCounter_reg_n_0_[3] ),
        .I3(\w_trigCounter_reg_n_0_[6] ),
        .I4(\w_trigCounter_reg_n_0_[4] ),
        .I5(\w_trigCounter_reg_n_0_[2] ),
        .O(o_trigPulse_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    o_trigPulse_i_3
       (.I0(\w_trigCounter_reg_n_0_[0] ),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .O(o_trigPulse_i_3_n_0));
  FDRE o_trigPulse_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_trigPulse_i_1_n_0),
        .Q(o_trigPulse),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \w_recvCounter[0]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvCounter_reg_n_0_[0] ),
        .O(\w_recvCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \w_recvCounter[1]_i_1 
       (.I0(\w_recvCounter_reg_n_0_[1] ),
        .I1(\w_recvCounter_reg_n_0_[0] ),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(\w_recvCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \w_recvCounter[2]_i_1 
       (.I0(\w_recvCounter[6]_i_4_n_0 ),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(\w_recvCounter_reg_n_0_[2] ),
        .I3(\w_recvCounter_reg_n_0_[0] ),
        .I4(\w_recvCounter_reg_n_0_[1] ),
        .O(\w_recvCounter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \w_recvCounter[3]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvCounter_reg_n_0_[1] ),
        .I2(\w_recvCounter_reg_n_0_[0] ),
        .I3(\w_recvCounter_reg_n_0_[2] ),
        .I4(\w_recvCounter_reg_n_0_[3] ),
        .O(\w_recvCounter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \w_recvCounter[4]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvCounter_reg_n_0_[2] ),
        .I2(\w_recvCounter_reg_n_0_[0] ),
        .I3(\w_recvCounter_reg_n_0_[1] ),
        .I4(\w_recvCounter_reg_n_0_[3] ),
        .I5(\w_recvCounter_reg_n_0_[4] ),
        .O(\w_recvCounter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000DF2000000000)) 
    \w_recvCounter[5]_i_1 
       (.I0(\w_recvCounter_reg_n_0_[4] ),
        .I1(\w_recvCounter[5]_i_2_n_0 ),
        .I2(\w_recvCounter_reg_n_0_[3] ),
        .I3(\w_recvCounter_reg_n_0_[5] ),
        .I4(\w_recvCounter[5]_i_3_n_0 ),
        .I5(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(\w_recvCounter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \w_recvCounter[5]_i_2 
       (.I0(\w_recvCounter_reg_n_0_[1] ),
        .I1(\w_recvCounter_reg_n_0_[0] ),
        .I2(\w_recvCounter_reg_n_0_[2] ),
        .O(\w_recvCounter[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \w_recvCounter[5]_i_3 
       (.I0(\w_recvTime[6]_i_3_n_0 ),
        .I1(\w_recvCounter_reg_n_0_[6] ),
        .I2(\w_recvCounter_reg_n_0_[3] ),
        .I3(\w_recvCounter_reg_n_0_[5] ),
        .I4(\w_recvCounter_reg_n_0_[4] ),
        .I5(\w_recvCounter_reg_n_0_[2] ),
        .O(\w_recvCounter[5]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4011)) 
    \w_recvCounter[6]_i_1 
       (.I0(i_rst),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(i_recvPulse),
        .I3(w_state),
        .O(\w_recvCounter[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9090909000909090)) 
    \w_recvCounter[6]_i_2 
       (.I0(\w_recvCounter[6]_i_3_n_0 ),
        .I1(\w_recvCounter_reg_n_0_[6] ),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(\w_recvCounter_reg_n_0_[1] ),
        .I4(\w_recvCounter_reg_n_0_[0] ),
        .I5(\w_recvCounter[6]_i_4_n_0 ),
        .O(\w_recvCounter[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \w_recvCounter[6]_i_3 
       (.I0(\w_recvCounter_reg_n_0_[4] ),
        .I1(\w_recvCounter_reg_n_0_[2] ),
        .I2(\w_recvCounter_reg_n_0_[0] ),
        .I3(\w_recvCounter_reg_n_0_[1] ),
        .I4(\w_recvCounter_reg_n_0_[3] ),
        .I5(\w_recvCounter_reg_n_0_[5] ),
        .O(\w_recvCounter[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \w_recvCounter[6]_i_4 
       (.I0(\w_recvCounter_reg_n_0_[2] ),
        .I1(\w_recvCounter_reg_n_0_[4] ),
        .I2(\w_recvCounter_reg_n_0_[5] ),
        .I3(\w_recvCounter_reg_n_0_[3] ),
        .I4(\w_recvCounter_reg_n_0_[6] ),
        .O(\w_recvCounter[6]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[0] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[0]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[1] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[1]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[2] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[2]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[3] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[3]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[4] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[4]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[5] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[5]_i_1_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_recvCounter_reg[6] 
       (.C(i_clk),
        .CE(\w_recvCounter[6]_i_1_n_0 ),
        .D(\w_recvCounter[6]_i_2_n_0 ),
        .Q(\w_recvCounter_reg_n_0_[6] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \w_recvTime[0]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[0] ),
        .O(\w_recvTime[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4F80)) 
    \w_recvTime[1]_i_1 
       (.I0(\w_recvTime_reg_n_0_[0] ),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I2(w_recvTime0),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .O(\w_recvTime[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \w_recvTime[2]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[2] ),
        .I2(\w_recvTime_reg_n_0_[0] ),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .O(\w_recvTime[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \w_recvTime[3]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[3] ),
        .I2(\w_recvTime_reg_n_0_[2] ),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .I4(\w_recvTime_reg_n_0_[0] ),
        .O(\w_recvTime[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888888888888888)) 
    \w_recvTime[4]_i_1 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[4] ),
        .I2(\w_recvTime_reg_n_0_[3] ),
        .I3(\w_recvTime_reg_n_0_[0] ),
        .I4(\w_recvTime_reg_n_0_[1] ),
        .I5(\w_recvTime_reg_n_0_[2] ),
        .O(\w_recvTime[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \w_recvTime[5]_i_1 
       (.I0(w_recvTime0),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(\w_recvTime[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \w_recvTime[5]_i_2 
       (.I0(\w_recvTime_reg_n_0_[5] ),
        .I1(\w_recvTime_reg_n_0_[4] ),
        .I2(\w_recvTime_reg_n_0_[2] ),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .I4(\w_recvTime_reg_n_0_[0] ),
        .I5(\w_recvTime_reg_n_0_[3] ),
        .O(\w_recvTime[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00020000000000FF)) 
    \w_recvTime[6]_i_1 
       (.I0(i_recvPulse),
        .I1(\w_recvTime[6]_i_3_n_0 ),
        .I2(\w_recvCounter[6]_i_4_n_0 ),
        .I3(i_rst),
        .I4(w_state),
        .I5(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(w_recvTime0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \w_recvTime[6]_i_2 
       (.I0(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I1(\w_recvTime_reg_n_0_[6] ),
        .I2(\w_recvTime[6]_i_4_n_0 ),
        .O(\w_recvTime[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \w_recvTime[6]_i_3 
       (.I0(\w_recvCounter_reg_n_0_[0] ),
        .I1(\w_recvCounter_reg_n_0_[1] ),
        .O(\w_recvTime[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \w_recvTime[6]_i_4 
       (.I0(\w_recvTime_reg_n_0_[5] ),
        .I1(\w_recvTime_reg_n_0_[4] ),
        .I2(\w_recvTime_reg_n_0_[2] ),
        .I3(\w_recvTime_reg_n_0_[1] ),
        .I4(\w_recvTime_reg_n_0_[0] ),
        .I5(\w_recvTime_reg_n_0_[3] ),
        .O(\w_recvTime[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h70FF8000)) 
    \w_recvTime[7]_i_1 
       (.I0(\w_recvTime[6]_i_4_n_0 ),
        .I1(\w_recvTime_reg_n_0_[6] ),
        .I2(\FSM_sequential_w_state_reg_n_0_[1] ),
        .I3(w_recvTime0),
        .I4(\w_recvTime_reg_n_0_[7] ),
        .O(\w_recvTime[7]_i_1_n_0 ));
  FDRE \w_recvTime_reg[0] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[0]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\w_recvTime[1]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[2] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[2]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[3] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[3]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[4] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[4]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[5] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[5]_i_2_n_0 ),
        .Q(\w_recvTime_reg_n_0_[5] ),
        .R(\w_recvTime[5]_i_1_n_0 ));
  FDRE \w_recvTime_reg[6] 
       (.C(i_clk),
        .CE(w_recvTime0),
        .D(\w_recvTime[6]_i_2_n_0 ),
        .Q(\w_recvTime_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \w_recvTime_reg[7] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\w_recvTime[7]_i_1_n_0 ),
        .Q(\w_recvTime_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \w_trigCounter[0]_i_1 
       (.I0(w_state),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .O(\w_trigCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \w_trigCounter[1]_i_1 
       (.I0(\w_trigCounter_reg_n_0_[1] ),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .I2(w_state),
        .O(\w_trigCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \w_trigCounter[2]_i_1 
       (.I0(\w_trigCounter[2]_i_2_n_0 ),
        .I1(w_state),
        .I2(\w_trigCounter_reg_n_0_[2] ),
        .I3(\w_trigCounter_reg_n_0_[0] ),
        .I4(\w_trigCounter_reg_n_0_[1] ),
        .O(\w_trigCounter[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \w_trigCounter[2]_i_2 
       (.I0(\w_trigCounter_reg_n_0_[2] ),
        .I1(\w_trigCounter_reg_n_0_[4] ),
        .I2(\w_trigCounter_reg_n_0_[6] ),
        .I3(\w_trigCounter_reg_n_0_[3] ),
        .I4(\w_trigCounter_reg_n_0_[5] ),
        .O(\w_trigCounter[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \w_trigCounter[3]_i_1 
       (.I0(w_state),
        .I1(\w_trigCounter_reg_n_0_[1] ),
        .I2(\w_trigCounter_reg_n_0_[0] ),
        .I3(\w_trigCounter_reg_n_0_[2] ),
        .I4(\w_trigCounter_reg_n_0_[3] ),
        .O(\w_trigCounter[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \w_trigCounter[4]_i_1 
       (.I0(w_state),
        .I1(\w_trigCounter_reg_n_0_[2] ),
        .I2(\w_trigCounter_reg_n_0_[0] ),
        .I3(\w_trigCounter_reg_n_0_[1] ),
        .I4(\w_trigCounter_reg_n_0_[3] ),
        .I5(\w_trigCounter_reg_n_0_[4] ),
        .O(\w_trigCounter[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000DF2000000000)) 
    \w_trigCounter[5]_i_1 
       (.I0(\w_trigCounter_reg_n_0_[4] ),
        .I1(\w_trigCounter[5]_i_2_n_0 ),
        .I2(\w_trigCounter_reg_n_0_[3] ),
        .I3(\w_trigCounter_reg_n_0_[5] ),
        .I4(o_trigPulse_i_2_n_0),
        .I5(w_state),
        .O(\w_trigCounter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \w_trigCounter[5]_i_2 
       (.I0(\w_trigCounter_reg_n_0_[1] ),
        .I1(\w_trigCounter_reg_n_0_[0] ),
        .I2(\w_trigCounter_reg_n_0_[2] ),
        .O(\w_trigCounter[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \w_trigCounter[6]_i_1 
       (.I0(i_rst),
        .I1(\FSM_sequential_w_state_reg_n_0_[1] ),
        .O(w_trigCounter0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0090)) 
    \w_trigCounter[6]_i_2 
       (.I0(\w_trigCounter[6]_i_3_n_0 ),
        .I1(\w_trigCounter_reg_n_0_[6] ),
        .I2(w_state),
        .I3(o_trigPulse_i_2_n_0),
        .O(\w_trigCounter[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \w_trigCounter[6]_i_3 
       (.I0(\w_trigCounter_reg_n_0_[4] ),
        .I1(\w_trigCounter_reg_n_0_[2] ),
        .I2(\w_trigCounter_reg_n_0_[0] ),
        .I3(\w_trigCounter_reg_n_0_[1] ),
        .I4(\w_trigCounter_reg_n_0_[3] ),
        .I5(\w_trigCounter_reg_n_0_[5] ),
        .O(\w_trigCounter[6]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[0] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[0]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[1] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[1]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[2] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[2]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[3] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[3]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[4] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[4]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[5] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[5]_i_1_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trigCounter_reg[6] 
       (.C(i_clk),
        .CE(w_trigCounter0),
        .D(\w_trigCounter[6]_i_2_n_0 ),
        .Q(\w_trigCounter_reg_n_0_[6] ),
        .R(1'b0));
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

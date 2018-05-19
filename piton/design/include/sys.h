// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////
//
// Setting the time scale
// If the timescale changes, JP_TIMESCALE may also have to change.
`timescale	1ps/1ps
`default_nettype wire

//
// Number of threads in a core
// ===========================
//

//`define CONFIG_NUM_THREADS // This must be defined for any of below to work
//`define THREADS_1
//`define THREADS_2
//`define THREADS_3


//
// JBUS clock
// =========
//
// `define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link
`define AL_RB_CNT       16
`define AL_RB_IDX        4
`define AL_RB_WINDOW    `AL_RB_IDX'd8

// Afara Link Objects
`define AL_OBJ_SZ      112

// Afara Link Object Format - Reliable Link
`define AL_RL_HI       111
`define AL_RL_LO       103
`define AL_RL_SZ         9

`define AL_ESN_HI      111
`define AL_ESN_LO      108
`define AL_SSN_HI      107
`define AL_SSN_LO      104
`define AL_ED          103

// Afara Link Object Format - Congestion
`define AL_CNG_HI      102
`define AL_CNG_LO       94
`define AL_CNG_SZ        9
  
`define AL_REQ_CNG     102
`define AL_BSCT_HI     101
`define AL_BSCT_LO      96
`define AL_EGR_P_CNG    95
`define AL_MARK         94


// Afara Link Object Format - Acknowledge
`define AL_ACK_SZ       21
`define AL_A_COS        93
`define AL_A_TYP_HI     92
`define AL_A_TYP_LO     91
`define AL_A_NACK       90
`define AL_A_TAG_HI     89
`define AL_A_TAG_LO     80
`define AL_A_PORT_HI    79
`define AL_A_PORT_LO    73


// Afara Link Object Format - Request
`define AL_REQ_SZ       73
`define AL_R_COS        72
`define AL_R_TYP_HI     71
`define AL_R_TYP_LO     70
`define AL_R_SCR_HI     69
`define AL_R_SCR_LO     67
`define AL_R_TCR_HI     66
`define AL_R_TCR_LO     64
`define AL_R_TAG_HI     63
`define AL_R_TAG_LO     54
`define AL_R_PORT_HI    53
`define AL_R_PORT_LO    47
`define AL_R_LEN_HI     46
`define AL_R_LEN_LO     40
`define AL_R_ADD_HI     39
`define AL_R_ADD_LO      0

// Afara Link Object Format - Message
`define AL_M_MQID_HI     2
`define AL_M_MQID_LO     0

// Acknowledge Types
`define AL_ACK_NONE   2'b00
`define AL_ACK_NPAY   2'b01
`define AL_ACK_WPAY   2'b10

// Request Types
`define AL_REQ_NONE   2'b00
`define AL_REQ_NPAY   2'b01
`define AL_REQ_WPAY   2'b10
`define AL_REQ_MSG    2'b11

// Afara Link Frame
`define AL_FRAME_SZ    144


//
// UCB Packet Type
// ===============
//
`define UCB_READ_NACK        4'b0000    // ack/nack types
`define UCB_READ_ACK         4'b0001
`define UCB_WRITE_ACK        4'b0010
`define UCB_IFILL_ACK        4'b0011
`define UCB_IFILL_NACK       4'b0111

`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_REQ        4'b0101
`define UCB_IFILL_REQ        4'b0110

`define UCB_INT              4'b1000    // plain interrupt
`define UCB_INT_VEC          4'b1100    // interrupt with vector
`define UCB_RESET_VEC        4'b1101    // reset with vector
`define UCB_IDLE_VEC         4'b1110    // idle with vector
`define UCB_RESUME_VEC       4'b1111    // resume with vector


//
// UCB Data Packet Format
// ======================
//
`define UCB_NOPAY_PKT_WIDTH   64        // packet without payload
`define UCB_64PAY_PKT_WIDTH  128        // packet with 64 bit payload
`define UCB_128PAY_PKT_WIDTH 192        // packet with 128 bit payload

`define UCB_DATA_EXT_HI      191        // (64) extended data
`define UCB_DATA_EXT_LO      128
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_RSV_HI            63        // (9) reserved bits
`define UCB_RSV_LO            55
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0

`define UCB_DATA_EXT_WIDTH    64
`define UCB_DATA_WIDTH        64
`define UCB_RSV_WIDTH          9
`define UCB_ADDR_WIDTH        40 
`define UCB_SIZE_WIDTH         3
`define UCB_BUFID_WIDTH        2
`define UCB_THR_WIDTH          6
`define UCB_PKT_WIDTH          4

// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 111 - quad-word
`define UCB_SIZE_1B          3'b000
`define UCB_SIZE_2B          3'b001
`define UCB_SIZE_4B          3'b010
`define UCB_SIZE_8B          3'b011
`define UCB_SIZE_16B         3'b111


//
// UCB Interrupt Packet Format
// ===========================
//
`define UCB_INT_PKT_WIDTH     64

`define UCB_INT_RSV_HI        63        // (7) reserved bits
`define UCB_INT_RSV_LO        57
`define UCB_INT_VEC_HI        56        // (6) interrupt vector
`define UCB_INT_VEC_LO        51
`define UCB_INT_STAT_HI       50        // (32) interrupt status
`define UCB_INT_STAT_LO       19
`define UCB_INT_DEV_HI        18        // (9) device ID
`define UCB_INT_DEV_LO        10
//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format

`define UCB_INT_RSV_WIDTH      7
`define UCB_INT_VEC_WIDTH      6
`define UCB_INT_STAT_WIDTH    32
`define UCB_INT_DEV_WIDTH      9


//
// FCRAM Bus Widths
// ================
//
`define FCRAM_DQ_WIDTH                16
`define FCRAM_DQS_WIDTH                2
`define FCRAM_ADDR_WIDTH              15
`define FCRAM_BA_WIDTH                 2


//
// ENET clock periods
// ==================
//
// `define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
// `define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// JBus Bridge defines
// =================
//
// `define      SYS_UPA_CLK        `SYS.upa_clk
// `define      SYS_J_CLK          `SYS.j_clk
// `define      SYS_P_CLK          `SYS.p_clk
// `define      SYS_G_CLK          `SYS.g_clk
// `define      JP_TIMESCALE       `timescale 1 ps / 1 ps
// `define      PCI_CLK_PERIOD     15152                  //  66 MHz
// `define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
// `define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
// `define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//
`define PRIM_SLAVE1_MEM0_L      64'h0000000000000000
`define PRIM_SLAVE1_MEM0_H      64'h000000003fff0000
`define PRIM_SLAVE1_IO0_L       64'h0000000000000000
`define PRIM_SLAVE1_IO0_H       64'h00000000002f0000
`define PRIM_SLAVE1_JBUS_BASE   64'h000007ff00000000

`define PRIM_SLAVE2_MEM0_L      64'h0000000040000000
`define PRIM_SLAVE2_MEM0_H      64'h00000000Dfffffff
`define PRIM_SLAVE2_IO0_L       64'h0000000000300000
`define PRIM_SLAVE2_IO0_H       64'h00000000005fffff
`define PRIM_SLAVE2_JBUS_BASE   64'h000007ff40000000

`define PCIB_SLAVE1_MEM0_L      64'h0000000000000000
`define PCIB_SLAVE1_MEM0_H      64'h000000003fff0000
`define PCIB_SLAVE1_IO0_L       64'h0000000000000000
`define PCIB_SLAVE1_IO0_H       64'h00000000002fffff
`define PCIB_SLAVE1_JBUS_BASE   64'h000007f780000000

`define PCIB_SLAVE2_MEM0_L      64'h0000000040000000
`define PCIB_SLAVE2_MEM0_H      64'h000000007fffffff
`define PCIB_SLAVE2_IO0_L       64'h0000000000300000
`define PCIB_SLAVE2_IO0_H       64'h00000000007fffff
`define PCIB_SLAVE2_JBUS_BASE   64'h000007f7c0000000

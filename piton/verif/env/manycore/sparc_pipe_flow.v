// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sparc_pipe_flow.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////////////////////
//
//  Module Name:        sparc_pipe_flow
//      Description:
//		This module tracks the instructions that are in the pipe
//		and prints out the details on the stdout
//
//	Usage:  Compile time option to sims : +define+SPARC_PIPE_GRAPH
//              To turn the monitor on at run time use the plusarg
//              +spc_pipe=<core_nu> Eg: +spc_pipe=0
//
////////////////////////////////////////////////////////////////////////

`include "sys.h"

module sparc_pipe_flow (clk);


`ifdef RTL_SPARC0
`define SPC0_PATH `SPARC_CORE0.sparc0
`endif


`ifdef RTL_SPARC1
`define SPC1_PATH `SPARC_CORE1.sparc0
`endif


`ifdef RTL_SPARC2
`define SPC2_PATH `SPARC_CORE2.sparc0
`endif


`ifdef RTL_SPARC3
`define SPC3_PATH `SPARC_CORE3.sparc0
`endif


`ifdef RTL_SPARC4
`define SPC4_PATH `SPARC_CORE4.sparc0
`endif


`ifdef RTL_SPARC5
`define SPC5_PATH `SPARC_CORE5.sparc0
`endif


`ifdef RTL_SPARC6
`define SPC6_PATH `SPARC_CORE6.sparc0
`endif


`ifdef RTL_SPARC7
`define SPC7_PATH `SPARC_CORE7.sparc0
`endif


input clk;
integer i;

reg  [31:0] instr;
reg  [31:0] pc_f;
reg  [8*6:0] inst_f;
reg  [8*6:0] inst_s;
reg  [8*6:0] inst_d;
reg  [8*6:0] inst_e;
reg  [8*6:0] inst_m;
reg  [8*6:0] inst_w;
reg  [8*80:0] message;

reg  [47:0] inst_array [63:0];
reg  [31:0] pc_array [63:0];
reg  [63:0] pc_valid;
reg  [5:0] pc_index;
reg  [5:0] match_index;
reg  [7:0] short_pc_s;
reg  [7:0] short_pc_d;
reg  [7:0] short_pc_e;
reg  [7:0] short_pc_m;
reg  [7:0] short_pc_w;

integer spc_nu;
reg  spc_pipe_on;

`ifdef GATE_SIM
`else

initial
begin
     pc_f = "     ";
     inst_f = "   - ";
     inst_s = "   - ";
     inst_d = "   - ";
     inst_e = "   - ";
     inst_m = "   - ";
     inst_w = "   - ";
     pc_index = 5'b0;
     spc_pipe_on = 1'bx;

     // Check to see which core to monitor
if($value$plusargs("spc_pipe=%d",spc_nu))
begin
     spc_pipe_on = 1;
     $display("The pipe graph monitor is turned on");
     $display("parse_str is %d ", spc_nu);
end
else begin
  spc_pipe_on = 1;
  spc_nu = 0; //ttt
     $display("The pipe graph monitor is turned on");
     $display("parse_str is %d ", spc_nu);
end


`ifdef RTL_SPARC0
begin

`ifndef RTL_SPU
`define IFU0 `SPC0_PATH.ifu.ifu
`define DEC0 `SPC0_PATH.ifu.ifu.dtu.dec

`define PC0_f `SPC0_PATH.ifu.ifu.fdp.pc_f
`define PC0_s `SPC0_PATH.ifu.ifu.fdp.pc_s
`define PC0_d `SPC0_PATH.ifu.ifu.fdp.pc_d
`define PC0_e `SPC0_PATH.ifu.ifu.fdp.pc_e
`define PC0_m `SPC0_PATH.ifu.ifu.fdp.pc_m
`define PC0_w `SPC0_PATH.ifu.ifu.fdp.pc_w


`define THR0_f encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_f)
`define THR0_s encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_s1)
`define THR0_d encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_d)
`define THR0_e encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_e)
`define THR0_m encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_m)
`define THR0_w encode_thread(`SPC0_PATH.ifu.ifu.fcl.thr_w)


`define INST0_VLD_f `SPC0_PATH.ifu.ifu.fcl.inst_vld_f
`define INST0_VLD_s `SPC0_PATH.ifu.ifu.fcl.inst_vld_s
`define INST0_VLD_d `SPC0_PATH.ifu.ifu.fcl.inst_vld_d
`define INST0_VLD_e `SPC0_PATH.ifu.ifu.fcl.inst_vld_e
`define INST0_VLD_m `SPC0_PATH.ifu.ifu.fcl.inst_vld_m
`define INST0_VLD_w `SPC0_PATH.ifu.ifu.fcl.inst_vld_w

`define INST0_s `SPC0_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU0 `SPC0_PATH.ifu
`define DEC0 `SPC0_PATH.ifu.dtu.dec

`define PC0_f `SPC0_PATH.ifu.fdp.pc_f
`define PC0_s `SPC0_PATH.ifu.fdp.pc_s
`define PC0_d `SPC0_PATH.ifu.fdp.pc_d
`define PC0_e `SPC0_PATH.ifu.fdp.pc_e
`define PC0_m `SPC0_PATH.ifu.fdp.pc_m
`define PC0_w `SPC0_PATH.ifu.fdp.pc_w


`define THR0_f encode_thread(`SPC0_PATH.ifu.fcl.thr_f)
`define THR0_s encode_thread(`SPC0_PATH.ifu.fcl.thr_s1)
`define THR0_d encode_thread(`SPC0_PATH.ifu.fcl.thr_d)
`define THR0_e encode_thread(`SPC0_PATH.ifu.fcl.thr_e)
`define THR0_m encode_thread(`SPC0_PATH.ifu.fcl.thr_m)
`define THR0_w encode_thread(`SPC0_PATH.ifu.fcl.thr_w)


`define INST0_VLD_f `SPC0_PATH.ifu.fcl.inst_vld_f
`define INST0_VLD_s `SPC0_PATH.ifu.fcl.inst_vld_s
`define INST0_VLD_d `SPC0_PATH.ifu.fcl.inst_vld_d
`define INST0_VLD_e `SPC0_PATH.ifu.fcl.inst_vld_e
`define INST0_VLD_m `SPC0_PATH.ifu.fcl.inst_vld_m
`define INST0_VLD_w `SPC0_PATH.ifu.fcl.inst_vld_w

`define INST0_s `SPC0_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC1
begin

`ifndef RTL_SPU
`define IFU1 `SPC1_PATH.ifu.ifu
`define DEC1 `SPC1_PATH.ifu.ifu.dtu.dec

`define PC1_f `SPC1_PATH.ifu.ifu.fdp.pc_f
`define PC1_s `SPC1_PATH.ifu.ifu.fdp.pc_s
`define PC1_d `SPC1_PATH.ifu.ifu.fdp.pc_d
`define PC1_e `SPC1_PATH.ifu.ifu.fdp.pc_e
`define PC1_m `SPC1_PATH.ifu.ifu.fdp.pc_m
`define PC1_w `SPC1_PATH.ifu.ifu.fdp.pc_w


`define THR1_f encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_f)
`define THR1_s encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_s1)
`define THR1_d encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_d)
`define THR1_e encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_e)
`define THR1_m encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_m)
`define THR1_w encode_thread(`SPC1_PATH.ifu.ifu.fcl.thr_w)


`define INST1_VLD_f `SPC1_PATH.ifu.ifu.fcl.inst_vld_f
`define INST1_VLD_s `SPC1_PATH.ifu.ifu.fcl.inst_vld_s
`define INST1_VLD_d `SPC1_PATH.ifu.ifu.fcl.inst_vld_d
`define INST1_VLD_e `SPC1_PATH.ifu.ifu.fcl.inst_vld_e
`define INST1_VLD_m `SPC1_PATH.ifu.ifu.fcl.inst_vld_m
`define INST1_VLD_w `SPC1_PATH.ifu.ifu.fcl.inst_vld_w

`define INST1_s `SPC1_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU1 `SPC1_PATH.ifu
`define DEC1 `SPC1_PATH.ifu.dtu.dec

`define PC1_f `SPC1_PATH.ifu.fdp.pc_f
`define PC1_s `SPC1_PATH.ifu.fdp.pc_s
`define PC1_d `SPC1_PATH.ifu.fdp.pc_d
`define PC1_e `SPC1_PATH.ifu.fdp.pc_e
`define PC1_m `SPC1_PATH.ifu.fdp.pc_m
`define PC1_w `SPC1_PATH.ifu.fdp.pc_w


`define THR1_f encode_thread(`SPC1_PATH.ifu.fcl.thr_f)
`define THR1_s encode_thread(`SPC1_PATH.ifu.fcl.thr_s1)
`define THR1_d encode_thread(`SPC1_PATH.ifu.fcl.thr_d)
`define THR1_e encode_thread(`SPC1_PATH.ifu.fcl.thr_e)
`define THR1_m encode_thread(`SPC1_PATH.ifu.fcl.thr_m)
`define THR1_w encode_thread(`SPC1_PATH.ifu.fcl.thr_w)


`define INST1_VLD_f `SPC1_PATH.ifu.fcl.inst_vld_f
`define INST1_VLD_s `SPC1_PATH.ifu.fcl.inst_vld_s
`define INST1_VLD_d `SPC1_PATH.ifu.fcl.inst_vld_d
`define INST1_VLD_e `SPC1_PATH.ifu.fcl.inst_vld_e
`define INST1_VLD_m `SPC1_PATH.ifu.fcl.inst_vld_m
`define INST1_VLD_w `SPC1_PATH.ifu.fcl.inst_vld_w

`define INST1_s `SPC1_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC2
begin

`ifndef RTL_SPU
`define IFU2 `SPC2_PATH.ifu.ifu
`define DEC2 `SPC2_PATH.ifu.ifu.dtu.dec

`define PC2_f `SPC2_PATH.ifu.ifu.fdp.pc_f
`define PC2_s `SPC2_PATH.ifu.ifu.fdp.pc_s
`define PC2_d `SPC2_PATH.ifu.ifu.fdp.pc_d
`define PC2_e `SPC2_PATH.ifu.ifu.fdp.pc_e
`define PC2_m `SPC2_PATH.ifu.ifu.fdp.pc_m
`define PC2_w `SPC2_PATH.ifu.ifu.fdp.pc_w


`define THR2_f encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_f)
`define THR2_s encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_s1)
`define THR2_d encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_d)
`define THR2_e encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_e)
`define THR2_m encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_m)
`define THR2_w encode_thread(`SPC2_PATH.ifu.ifu.fcl.thr_w)


`define INST2_VLD_f `SPC2_PATH.ifu.ifu.fcl.inst_vld_f
`define INST2_VLD_s `SPC2_PATH.ifu.ifu.fcl.inst_vld_s
`define INST2_VLD_d `SPC2_PATH.ifu.ifu.fcl.inst_vld_d
`define INST2_VLD_e `SPC2_PATH.ifu.ifu.fcl.inst_vld_e
`define INST2_VLD_m `SPC2_PATH.ifu.ifu.fcl.inst_vld_m
`define INST2_VLD_w `SPC2_PATH.ifu.ifu.fcl.inst_vld_w

`define INST2_s `SPC2_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU2 `SPC2_PATH.ifu
`define DEC2 `SPC2_PATH.ifu.dtu.dec

`define PC2_f `SPC2_PATH.ifu.fdp.pc_f
`define PC2_s `SPC2_PATH.ifu.fdp.pc_s
`define PC2_d `SPC2_PATH.ifu.fdp.pc_d
`define PC2_e `SPC2_PATH.ifu.fdp.pc_e
`define PC2_m `SPC2_PATH.ifu.fdp.pc_m
`define PC2_w `SPC2_PATH.ifu.fdp.pc_w


`define THR2_f encode_thread(`SPC2_PATH.ifu.fcl.thr_f)
`define THR2_s encode_thread(`SPC2_PATH.ifu.fcl.thr_s1)
`define THR2_d encode_thread(`SPC2_PATH.ifu.fcl.thr_d)
`define THR2_e encode_thread(`SPC2_PATH.ifu.fcl.thr_e)
`define THR2_m encode_thread(`SPC2_PATH.ifu.fcl.thr_m)
`define THR2_w encode_thread(`SPC2_PATH.ifu.fcl.thr_w)


`define INST2_VLD_f `SPC2_PATH.ifu.fcl.inst_vld_f
`define INST2_VLD_s `SPC2_PATH.ifu.fcl.inst_vld_s
`define INST2_VLD_d `SPC2_PATH.ifu.fcl.inst_vld_d
`define INST2_VLD_e `SPC2_PATH.ifu.fcl.inst_vld_e
`define INST2_VLD_m `SPC2_PATH.ifu.fcl.inst_vld_m
`define INST2_VLD_w `SPC2_PATH.ifu.fcl.inst_vld_w

`define INST2_s `SPC2_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC3
begin

`ifndef RTL_SPU
`define IFU3 `SPC3_PATH.ifu.ifu
`define DEC3 `SPC3_PATH.ifu.ifu.dtu.dec

`define PC3_f `SPC3_PATH.ifu.ifu.fdp.pc_f
`define PC3_s `SPC3_PATH.ifu.ifu.fdp.pc_s
`define PC3_d `SPC3_PATH.ifu.ifu.fdp.pc_d
`define PC3_e `SPC3_PATH.ifu.ifu.fdp.pc_e
`define PC3_m `SPC3_PATH.ifu.ifu.fdp.pc_m
`define PC3_w `SPC3_PATH.ifu.ifu.fdp.pc_w


`define THR3_f encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_f)
`define THR3_s encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_s1)
`define THR3_d encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_d)
`define THR3_e encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_e)
`define THR3_m encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_m)
`define THR3_w encode_thread(`SPC3_PATH.ifu.ifu.fcl.thr_w)


`define INST3_VLD_f `SPC3_PATH.ifu.ifu.fcl.inst_vld_f
`define INST3_VLD_s `SPC3_PATH.ifu.ifu.fcl.inst_vld_s
`define INST3_VLD_d `SPC3_PATH.ifu.ifu.fcl.inst_vld_d
`define INST3_VLD_e `SPC3_PATH.ifu.ifu.fcl.inst_vld_e
`define INST3_VLD_m `SPC3_PATH.ifu.ifu.fcl.inst_vld_m
`define INST3_VLD_w `SPC3_PATH.ifu.ifu.fcl.inst_vld_w

`define INST3_s `SPC3_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU3 `SPC3_PATH.ifu
`define DEC3 `SPC3_PATH.ifu.dtu.dec

`define PC3_f `SPC3_PATH.ifu.fdp.pc_f
`define PC3_s `SPC3_PATH.ifu.fdp.pc_s
`define PC3_d `SPC3_PATH.ifu.fdp.pc_d
`define PC3_e `SPC3_PATH.ifu.fdp.pc_e
`define PC3_m `SPC3_PATH.ifu.fdp.pc_m
`define PC3_w `SPC3_PATH.ifu.fdp.pc_w


`define THR3_f encode_thread(`SPC3_PATH.ifu.fcl.thr_f)
`define THR3_s encode_thread(`SPC3_PATH.ifu.fcl.thr_s1)
`define THR3_d encode_thread(`SPC3_PATH.ifu.fcl.thr_d)
`define THR3_e encode_thread(`SPC3_PATH.ifu.fcl.thr_e)
`define THR3_m encode_thread(`SPC3_PATH.ifu.fcl.thr_m)
`define THR3_w encode_thread(`SPC3_PATH.ifu.fcl.thr_w)


`define INST3_VLD_f `SPC3_PATH.ifu.fcl.inst_vld_f
`define INST3_VLD_s `SPC3_PATH.ifu.fcl.inst_vld_s
`define INST3_VLD_d `SPC3_PATH.ifu.fcl.inst_vld_d
`define INST3_VLD_e `SPC3_PATH.ifu.fcl.inst_vld_e
`define INST3_VLD_m `SPC3_PATH.ifu.fcl.inst_vld_m
`define INST3_VLD_w `SPC3_PATH.ifu.fcl.inst_vld_w

`define INST3_s `SPC3_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC4
begin

`ifndef RTL_SPU
`define IFU4 `SPC4_PATH.ifu.ifu
`define DEC4 `SPC4_PATH.ifu.ifu.dtu.dec

`define PC4_f `SPC4_PATH.ifu.ifu.fdp.pc_f
`define PC4_s `SPC4_PATH.ifu.ifu.fdp.pc_s
`define PC4_d `SPC4_PATH.ifu.ifu.fdp.pc_d
`define PC4_e `SPC4_PATH.ifu.ifu.fdp.pc_e
`define PC4_m `SPC4_PATH.ifu.ifu.fdp.pc_m
`define PC4_w `SPC4_PATH.ifu.ifu.fdp.pc_w


`define THR4_f encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_f)
`define THR4_s encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_s1)
`define THR4_d encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_d)
`define THR4_e encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_e)
`define THR4_m encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_m)
`define THR4_w encode_thread(`SPC4_PATH.ifu.ifu.fcl.thr_w)


`define INST4_VLD_f `SPC4_PATH.ifu.ifu.fcl.inst_vld_f
`define INST4_VLD_s `SPC4_PATH.ifu.ifu.fcl.inst_vld_s
`define INST4_VLD_d `SPC4_PATH.ifu.ifu.fcl.inst_vld_d
`define INST4_VLD_e `SPC4_PATH.ifu.ifu.fcl.inst_vld_e
`define INST4_VLD_m `SPC4_PATH.ifu.ifu.fcl.inst_vld_m
`define INST4_VLD_w `SPC4_PATH.ifu.ifu.fcl.inst_vld_w

`define INST4_s `SPC4_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU4 `SPC4_PATH.ifu
`define DEC4 `SPC4_PATH.ifu.dtu.dec

`define PC4_f `SPC4_PATH.ifu.fdp.pc_f
`define PC4_s `SPC4_PATH.ifu.fdp.pc_s
`define PC4_d `SPC4_PATH.ifu.fdp.pc_d
`define PC4_e `SPC4_PATH.ifu.fdp.pc_e
`define PC4_m `SPC4_PATH.ifu.fdp.pc_m
`define PC4_w `SPC4_PATH.ifu.fdp.pc_w


`define THR4_f encode_thread(`SPC4_PATH.ifu.fcl.thr_f)
`define THR4_s encode_thread(`SPC4_PATH.ifu.fcl.thr_s1)
`define THR4_d encode_thread(`SPC4_PATH.ifu.fcl.thr_d)
`define THR4_e encode_thread(`SPC4_PATH.ifu.fcl.thr_e)
`define THR4_m encode_thread(`SPC4_PATH.ifu.fcl.thr_m)
`define THR4_w encode_thread(`SPC4_PATH.ifu.fcl.thr_w)


`define INST4_VLD_f `SPC4_PATH.ifu.fcl.inst_vld_f
`define INST4_VLD_s `SPC4_PATH.ifu.fcl.inst_vld_s
`define INST4_VLD_d `SPC4_PATH.ifu.fcl.inst_vld_d
`define INST4_VLD_e `SPC4_PATH.ifu.fcl.inst_vld_e
`define INST4_VLD_m `SPC4_PATH.ifu.fcl.inst_vld_m
`define INST4_VLD_w `SPC4_PATH.ifu.fcl.inst_vld_w

`define INST4_s `SPC4_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC5
begin

`ifndef RTL_SPU
`define IFU5 `SPC5_PATH.ifu.ifu
`define DEC5 `SPC5_PATH.ifu.ifu.dtu.dec

`define PC5_f `SPC5_PATH.ifu.ifu.fdp.pc_f
`define PC5_s `SPC5_PATH.ifu.ifu.fdp.pc_s
`define PC5_d `SPC5_PATH.ifu.ifu.fdp.pc_d
`define PC5_e `SPC5_PATH.ifu.ifu.fdp.pc_e
`define PC5_m `SPC5_PATH.ifu.ifu.fdp.pc_m
`define PC5_w `SPC5_PATH.ifu.ifu.fdp.pc_w


`define THR5_f encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_f)
`define THR5_s encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_s1)
`define THR5_d encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_d)
`define THR5_e encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_e)
`define THR5_m encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_m)
`define THR5_w encode_thread(`SPC5_PATH.ifu.ifu.fcl.thr_w)


`define INST5_VLD_f `SPC5_PATH.ifu.ifu.fcl.inst_vld_f
`define INST5_VLD_s `SPC5_PATH.ifu.ifu.fcl.inst_vld_s
`define INST5_VLD_d `SPC5_PATH.ifu.ifu.fcl.inst_vld_d
`define INST5_VLD_e `SPC5_PATH.ifu.ifu.fcl.inst_vld_e
`define INST5_VLD_m `SPC5_PATH.ifu.ifu.fcl.inst_vld_m
`define INST5_VLD_w `SPC5_PATH.ifu.ifu.fcl.inst_vld_w

`define INST5_s `SPC5_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU5 `SPC5_PATH.ifu
`define DEC5 `SPC5_PATH.ifu.dtu.dec

`define PC5_f `SPC5_PATH.ifu.fdp.pc_f
`define PC5_s `SPC5_PATH.ifu.fdp.pc_s
`define PC5_d `SPC5_PATH.ifu.fdp.pc_d
`define PC5_e `SPC5_PATH.ifu.fdp.pc_e
`define PC5_m `SPC5_PATH.ifu.fdp.pc_m
`define PC5_w `SPC5_PATH.ifu.fdp.pc_w


`define THR5_f encode_thread(`SPC5_PATH.ifu.fcl.thr_f)
`define THR5_s encode_thread(`SPC5_PATH.ifu.fcl.thr_s1)
`define THR5_d encode_thread(`SPC5_PATH.ifu.fcl.thr_d)
`define THR5_e encode_thread(`SPC5_PATH.ifu.fcl.thr_e)
`define THR5_m encode_thread(`SPC5_PATH.ifu.fcl.thr_m)
`define THR5_w encode_thread(`SPC5_PATH.ifu.fcl.thr_w)


`define INST5_VLD_f `SPC5_PATH.ifu.fcl.inst_vld_f
`define INST5_VLD_s `SPC5_PATH.ifu.fcl.inst_vld_s
`define INST5_VLD_d `SPC5_PATH.ifu.fcl.inst_vld_d
`define INST5_VLD_e `SPC5_PATH.ifu.fcl.inst_vld_e
`define INST5_VLD_m `SPC5_PATH.ifu.fcl.inst_vld_m
`define INST5_VLD_w `SPC5_PATH.ifu.fcl.inst_vld_w

`define INST5_s `SPC5_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC6
begin

`ifndef RTL_SPU
`define IFU6 `SPC6_PATH.ifu.ifu
`define DEC6 `SPC6_PATH.ifu.ifu.dtu.dec

`define PC6_f `SPC6_PATH.ifu.ifu.fdp.pc_f
`define PC6_s `SPC6_PATH.ifu.ifu.fdp.pc_s
`define PC6_d `SPC6_PATH.ifu.ifu.fdp.pc_d
`define PC6_e `SPC6_PATH.ifu.ifu.fdp.pc_e
`define PC6_m `SPC6_PATH.ifu.ifu.fdp.pc_m
`define PC6_w `SPC6_PATH.ifu.ifu.fdp.pc_w


`define THR6_f encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_f)
`define THR6_s encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_s1)
`define THR6_d encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_d)
`define THR6_e encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_e)
`define THR6_m encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_m)
`define THR6_w encode_thread(`SPC6_PATH.ifu.ifu.fcl.thr_w)


`define INST6_VLD_f `SPC6_PATH.ifu.ifu.fcl.inst_vld_f
`define INST6_VLD_s `SPC6_PATH.ifu.ifu.fcl.inst_vld_s
`define INST6_VLD_d `SPC6_PATH.ifu.ifu.fcl.inst_vld_d
`define INST6_VLD_e `SPC6_PATH.ifu.ifu.fcl.inst_vld_e
`define INST6_VLD_m `SPC6_PATH.ifu.ifu.fcl.inst_vld_m
`define INST6_VLD_w `SPC6_PATH.ifu.ifu.fcl.inst_vld_w

`define INST6_s `SPC6_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU6 `SPC6_PATH.ifu
`define DEC6 `SPC6_PATH.ifu.dtu.dec

`define PC6_f `SPC6_PATH.ifu.fdp.pc_f
`define PC6_s `SPC6_PATH.ifu.fdp.pc_s
`define PC6_d `SPC6_PATH.ifu.fdp.pc_d
`define PC6_e `SPC6_PATH.ifu.fdp.pc_e
`define PC6_m `SPC6_PATH.ifu.fdp.pc_m
`define PC6_w `SPC6_PATH.ifu.fdp.pc_w


`define THR6_f encode_thread(`SPC6_PATH.ifu.fcl.thr_f)
`define THR6_s encode_thread(`SPC6_PATH.ifu.fcl.thr_s1)
`define THR6_d encode_thread(`SPC6_PATH.ifu.fcl.thr_d)
`define THR6_e encode_thread(`SPC6_PATH.ifu.fcl.thr_e)
`define THR6_m encode_thread(`SPC6_PATH.ifu.fcl.thr_m)
`define THR6_w encode_thread(`SPC6_PATH.ifu.fcl.thr_w)


`define INST6_VLD_f `SPC6_PATH.ifu.fcl.inst_vld_f
`define INST6_VLD_s `SPC6_PATH.ifu.fcl.inst_vld_s
`define INST6_VLD_d `SPC6_PATH.ifu.fcl.inst_vld_d
`define INST6_VLD_e `SPC6_PATH.ifu.fcl.inst_vld_e
`define INST6_VLD_m `SPC6_PATH.ifu.fcl.inst_vld_m
`define INST6_VLD_w `SPC6_PATH.ifu.fcl.inst_vld_w

`define INST6_s `SPC6_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


`ifdef RTL_SPARC7
begin

`ifndef RTL_SPU
`define IFU7 `SPC7_PATH.ifu.ifu
`define DEC7 `SPC7_PATH.ifu.ifu.dtu.dec

`define PC7_f `SPC7_PATH.ifu.ifu.fdp.pc_f
`define PC7_s `SPC7_PATH.ifu.ifu.fdp.pc_s
`define PC7_d `SPC7_PATH.ifu.ifu.fdp.pc_d
`define PC7_e `SPC7_PATH.ifu.ifu.fdp.pc_e
`define PC7_m `SPC7_PATH.ifu.ifu.fdp.pc_m
`define PC7_w `SPC7_PATH.ifu.ifu.fdp.pc_w


`define THR7_f encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_f)
`define THR7_s encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_s1)
`define THR7_d encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_d)
`define THR7_e encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_e)
`define THR7_m encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_m)
`define THR7_w encode_thread(`SPC7_PATH.ifu.ifu.fcl.thr_w)


`define INST7_VLD_f `SPC7_PATH.ifu.ifu.fcl.inst_vld_f
`define INST7_VLD_s `SPC7_PATH.ifu.ifu.fcl.inst_vld_s
`define INST7_VLD_d `SPC7_PATH.ifu.ifu.fcl.inst_vld_d
`define INST7_VLD_e `SPC7_PATH.ifu.ifu.fcl.inst_vld_e
`define INST7_VLD_m `SPC7_PATH.ifu.ifu.fcl.inst_vld_m
`define INST7_VLD_w `SPC7_PATH.ifu.ifu.fcl.inst_vld_w

`define INST7_s `SPC7_PATH.ifu.ifu.fdp_dtu_inst_s[31:0]
`else
`define IFU7 `SPC7_PATH.ifu
`define DEC7 `SPC7_PATH.ifu.dtu.dec

`define PC7_f `SPC7_PATH.ifu.fdp.pc_f
`define PC7_s `SPC7_PATH.ifu.fdp.pc_s
`define PC7_d `SPC7_PATH.ifu.fdp.pc_d
`define PC7_e `SPC7_PATH.ifu.fdp.pc_e
`define PC7_m `SPC7_PATH.ifu.fdp.pc_m
`define PC7_w `SPC7_PATH.ifu.fdp.pc_w


`define THR7_f encode_thread(`SPC7_PATH.ifu.fcl.thr_f)
`define THR7_s encode_thread(`SPC7_PATH.ifu.fcl.thr_s1)
`define THR7_d encode_thread(`SPC7_PATH.ifu.fcl.thr_d)
`define THR7_e encode_thread(`SPC7_PATH.ifu.fcl.thr_e)
`define THR7_m encode_thread(`SPC7_PATH.ifu.fcl.thr_m)
`define THR7_w encode_thread(`SPC7_PATH.ifu.fcl.thr_w)


`define INST7_VLD_f `SPC7_PATH.ifu.fcl.inst_vld_f
`define INST7_VLD_s `SPC7_PATH.ifu.fcl.inst_vld_s
`define INST7_VLD_d `SPC7_PATH.ifu.fcl.inst_vld_d
`define INST7_VLD_e `SPC7_PATH.ifu.fcl.inst_vld_e
`define INST7_VLD_m `SPC7_PATH.ifu.fcl.inst_vld_m
`define INST7_VLD_w `SPC7_PATH.ifu.fcl.inst_vld_w

`define INST7_s `SPC7_PATH.ifu.fdp_dtu_inst_s[31:0]
`endif
end

`endif


     if(spc_pipe_on)
     begin
         $display("spc%0d: Time      F PC_f     S   S st     D   D st     E   E st     M   M st     W   W st",
               spc_nu);
         $display("spc%0d:           t          t   inst     t   inst     t   inst     t   inst     t   inst",
               spc_nu);
         $display("spc%0d:           h          h            h            h            h            h",
               spc_nu);
         $display("spc%0d:--------------------------------------------------------------------------------------",
               spc_nu);
     end

end

always @( posedge clk)
begin
    if(spc_pipe_on)
    begin
`ifdef RTL_SPARC0

        if(`INST0_VLD_f)
        begin
           pc_f = `PC0_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST0_VLD_s)
        begin
           match_index = get_match_index(`PC0_s);
           inst_s = decode_inst(`INST0_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC0_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST0_VLD_d)
        begin
           match_index = get_match_index(`PC0_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC0_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST0_VLD_e)
        begin
           match_index = get_match_index(`PC0_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC0_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST0_VLD_m)
        begin
           match_index = get_match_index(`PC0_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC0_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST0_VLD_w)
        begin
           match_index = get_match_index(`PC0_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC0_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end
        if(`INST0_VLD_f )
           begin
               $display("spc0: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR0_f, pc_f, `THR0_s, inst_s, short_pc_s, `THR0_d, inst_d,short_pc_d,
                         `THR0_e, inst_e,short_pc_e, `THR0_m, inst_m,short_pc_m, `THR0_w, inst_w,short_pc_w );
           end
        else
            if(`INST0_VLD_s || `INST0_VLD_d || `INST0_VLD_e || `INST0_VLD_m || `INST0_VLD_w )
               begin
                   $display("spc0: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR0_s, inst_s, short_pc_s, `THR0_d, inst_d,short_pc_d,
                             `THR0_e, inst_e, short_pc_e, `THR0_m, inst_m,short_pc_m, `THR0_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC1

        if(`INST1_VLD_f)
        begin
           pc_f = `PC1_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST1_VLD_s)
        begin
           match_index = get_match_index(`PC1_s);
           inst_s = decode_inst(`INST1_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC1_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST1_VLD_d)
        begin
           match_index = get_match_index(`PC1_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC1_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST1_VLD_e)
        begin
           match_index = get_match_index(`PC1_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC1_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST1_VLD_m)
        begin
           match_index = get_match_index(`PC1_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC1_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST1_VLD_w)
        begin
           match_index = get_match_index(`PC1_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC1_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST1_VLD_f )
           begin
               $display("spc1: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR1_f, pc_f, `THR1_s, inst_s, short_pc_s, `THR1_d, inst_d,short_pc_d,
                         `THR1_e, inst_e,short_pc_e, `THR1_m, inst_m,short_pc_m, `THR1_w, inst_w,short_pc_w );
           end
        else
            if(`INST1_VLD_s || `INST1_VLD_d || `INST1_VLD_e || `INST1_VLD_m || `INST1_VLD_w )
               begin
                   $display("spc1: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR1_s, inst_s, short_pc_s, `THR1_d, inst_d,short_pc_d,
                             `THR1_e, inst_e, short_pc_e, `THR1_m, inst_m,short_pc_m, `THR1_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC2

        if(`INST2_VLD_f)
        begin
           pc_f = `PC2_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST2_VLD_s)
        begin
           match_index = get_match_index(`PC2_s);
           inst_s = decode_inst(`INST2_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC2_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST2_VLD_d)
        begin
           match_index = get_match_index(`PC2_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC2_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST2_VLD_e)
        begin
           match_index = get_match_index(`PC2_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC2_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST2_VLD_m)
        begin
           match_index = get_match_index(`PC2_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC2_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST2_VLD_w)
        begin
           match_index = get_match_index(`PC2_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC2_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST2_VLD_f )
           begin
               $display("spc2: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR2_f, pc_f, `THR2_s, inst_s, short_pc_s, `THR2_d, inst_d,short_pc_d,
                         `THR2_e, inst_e,short_pc_e, `THR2_m, inst_m,short_pc_m, `THR2_w, inst_w,short_pc_w );
           end
        else
            if(`INST2_VLD_s || `INST2_VLD_d || `INST2_VLD_e || `INST2_VLD_m || `INST2_VLD_w )
               begin
                   $display("spc2: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR2_s, inst_s, short_pc_s, `THR2_d, inst_d,short_pc_d,
                             `THR2_e, inst_e, short_pc_e, `THR2_m, inst_m,short_pc_m, `THR2_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC3

        if(`INST3_VLD_f)
        begin
           pc_f = `PC3_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST3_VLD_s)
        begin
           match_index = get_match_index(`PC3_s);
           inst_s = decode_inst(`INST3_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC3_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST3_VLD_d)
        begin
           match_index = get_match_index(`PC3_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC3_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST3_VLD_e)
        begin
           match_index = get_match_index(`PC3_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC3_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST3_VLD_m)
        begin
           match_index = get_match_index(`PC3_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC3_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST3_VLD_w)
        begin
           match_index = get_match_index(`PC3_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC3_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST3_VLD_f )
           begin
               $display("spc3: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR3_f, pc_f, `THR3_s, inst_s, short_pc_s, `THR3_d, inst_d,short_pc_d,
                         `THR3_e, inst_e,short_pc_e, `THR3_m, inst_m,short_pc_m, `THR3_w, inst_w,short_pc_w );
           end
        else
            if(`INST3_VLD_s || `INST3_VLD_d || `INST3_VLD_e || `INST3_VLD_m || `INST3_VLD_w )
               begin
                   $display("spc3: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR3_s, inst_s, short_pc_s, `THR3_d, inst_d,short_pc_d,
                             `THR3_e, inst_e, short_pc_e, `THR3_m, inst_m,short_pc_m, `THR3_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC4

        if(`INST4_VLD_f)
        begin
           pc_f = `PC4_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST4_VLD_s)
        begin
           match_index = get_match_index(`PC4_s);
           inst_s = decode_inst(`INST4_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC4_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST4_VLD_d)
        begin
           match_index = get_match_index(`PC4_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC4_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST4_VLD_e)
        begin
           match_index = get_match_index(`PC4_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC4_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST4_VLD_m)
        begin
           match_index = get_match_index(`PC4_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC4_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST4_VLD_w)
        begin
           match_index = get_match_index(`PC4_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC4_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST4_VLD_f )
           begin
               $display("spc4: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR4_f, pc_f, `THR4_s, inst_s, short_pc_s, `THR4_d, inst_d,short_pc_d,
                         `THR4_e, inst_e,short_pc_e, `THR4_m, inst_m,short_pc_m, `THR4_w, inst_w,short_pc_w );
           end
        else
            if(`INST4_VLD_s || `INST4_VLD_d || `INST4_VLD_e || `INST4_VLD_m || `INST4_VLD_w )
               begin
                   $display("spc4: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR4_s, inst_s, short_pc_s, `THR4_d, inst_d,short_pc_d,
                             `THR4_e, inst_e, short_pc_e, `THR4_m, inst_m,short_pc_m, `THR4_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC5

        if(`INST5_VLD_f)
        begin
           pc_f = `PC5_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST5_VLD_s)
        begin
           match_index = get_match_index(`PC5_s);
           inst_s = decode_inst(`INST5_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC5_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST5_VLD_d)
        begin
           match_index = get_match_index(`PC5_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC5_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST5_VLD_e)
        begin
           match_index = get_match_index(`PC5_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC5_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST5_VLD_m)
        begin
           match_index = get_match_index(`PC5_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC5_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST5_VLD_w)
        begin
           match_index = get_match_index(`PC5_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC5_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST5_VLD_f )
           begin
               $display("spc5: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR5_f, pc_f, `THR5_s, inst_s, short_pc_s, `THR5_d, inst_d,short_pc_d,
                         `THR5_e, inst_e,short_pc_e, `THR5_m, inst_m,short_pc_m, `THR5_w, inst_w,short_pc_w );
           end
        else
            if(`INST5_VLD_s || `INST5_VLD_d || `INST5_VLD_e || `INST5_VLD_m || `INST5_VLD_w )
               begin
                   $display("spc5: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR5_s, inst_s, short_pc_s, `THR5_d, inst_d,short_pc_d,
                             `THR5_e, inst_e, short_pc_e, `THR5_m, inst_m,short_pc_m, `THR5_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC6

        if(`INST6_VLD_f)
        begin
           pc_f = `PC6_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST6_VLD_s)
        begin
           match_index = get_match_index(`PC6_s);
           inst_s = decode_inst(`INST6_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC6_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST6_VLD_d)
        begin
           match_index = get_match_index(`PC6_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC6_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST6_VLD_e)
        begin
           match_index = get_match_index(`PC6_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC6_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST6_VLD_m)
        begin
           match_index = get_match_index(`PC6_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC6_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST6_VLD_w)
        begin
           match_index = get_match_index(`PC6_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC6_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST6_VLD_f )
           begin
               $display("spc6: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR6_f, pc_f, `THR6_s, inst_s, short_pc_s, `THR6_d, inst_d,short_pc_d,
                         `THR6_e, inst_e,short_pc_e, `THR6_m, inst_m,short_pc_m, `THR6_w, inst_w,short_pc_w );
           end
        else
            if(`INST6_VLD_s || `INST6_VLD_d || `INST6_VLD_e || `INST6_VLD_m || `INST6_VLD_w )
               begin
                   $display("spc6: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR6_s, inst_s, short_pc_s, `THR6_d, inst_d,short_pc_d,
                             `THR6_e, inst_e, short_pc_e, `THR6_m, inst_m,short_pc_m, `THR6_w, inst_w,short_pc_w );
               end


`endif

`ifdef RTL_SPARC7

        if(`INST7_VLD_f)
        begin
           pc_f = `PC7_f;
           pc_array[pc_index] = pc_f[31:0];
           pc_index = pc_index + 1;
        end
        if(`INST7_VLD_s)
        begin
           match_index = get_match_index(`PC7_s);
           inst_s = decode_inst(`INST7_s);
           inst_array[match_index] = inst_s;
	   short_pc_s = `PC7_s;
        end
	else
	begin
	   inst_s = "-";
	   short_pc_s = 8'hxx;
	end
        if(`INST7_VLD_d)
        begin
           match_index = get_match_index(`PC7_d);
           inst_d = inst_array[match_index];
	   short_pc_d = `PC7_d;
        end
	else
	begin
	   inst_d = "-";
	   short_pc_d = 8'hxx;
	end

        if(`INST7_VLD_e)
        begin
           match_index = get_match_index(`PC7_e);
           inst_e = inst_array[match_index];
	   short_pc_e = `PC7_e;
        end
	else
	begin
	   inst_e = "-";
	   short_pc_e = 8'hxx;
	end

        if(`INST7_VLD_m)
        begin
           match_index = get_match_index(`PC7_m);
           inst_m = inst_array[match_index];
	   short_pc_m = `PC7_m;
        end
	else
	begin
	   inst_m = "-";
	   short_pc_m = 8'hxx;
	end

        if(`INST7_VLD_w)
        begin
           match_index = get_match_index(`PC7_w);
           inst_w = inst_array[match_index];
	   short_pc_w = `PC7_w;
        end
	else
	begin
	   inst_w = "-";
	   short_pc_w = 8'hxx;
	end

        if(`INST7_VLD_f )
           begin
               $display("spc7: %0t\t%d %x %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	             $time, `THR7_f, pc_f, `THR7_s, inst_s, short_pc_s, `THR7_d, inst_d,short_pc_d,
                         `THR7_e, inst_e,short_pc_e, `THR7_m, inst_m,short_pc_m, `THR7_w, inst_w,short_pc_w );
           end
        else
            if(`INST7_VLD_s || `INST7_VLD_d || `INST7_VLD_e || `INST7_VLD_m || `INST7_VLD_w )
               begin
                   $display("spc7: %0t\t           %d %s:%h %d %s:%h %d %s:%h %d %s:%h %d %s:%h",
    	                 $time, `THR7_s, inst_s, short_pc_s, `THR7_d, inst_d,short_pc_d,
                             `THR7_e, inst_e, short_pc_e, `THR7_m, inst_m,short_pc_m, `THR7_w, inst_w,short_pc_w );
               end


`endif


// defunct code
//
//                 $display("spc8: %0t\t           %d %s %d %s %d %s %d %s %d %s",
//    	             $time, `THR_s, inst_s, `THR_d, inst_d, `THR_e, inst_e,
//                         `THR_m, inst_m, `THR_w, inst_w, );

    end //if(spc_pipe_on)
end // always @( posedge clk )


function [8*6:0] decode_inst;
    input [31:0] instr;
begin
    case(instr[31:30])
       2'b00 : decode_inst = br_decode(instr[24:22]);
       2'b01 : decode_inst = "call";
       2'b10 : decode_inst = alu_decode(instr[24:19]);
       2'b11 : decode_inst = lsu_decode(instr[24:19]);
    endcase
end
endfunction

function [8*6:0] br_decode;
    input [2:0] op2;
begin
    case(op2)
       3'b000 : br_decode = "iltrp";
       3'b001 : br_decode = "BPcc";
       3'b010 : br_decode = "Bicc";
       3'b011 : br_decode = "BPr";
       3'b100 : br_decode = "sethi";
       3'b101 : br_decode = "FBPfcc";
       3'b110 : br_decode = "FBfcc";
       3'b111 : br_decode = "unkn";
    endcase
end
endfunction

function [8*6:0] alu_decode;
    input [5:0] op3;
begin
    case(op3)
       6'b000000 : alu_decode = "add";
       6'b000001 : alu_decode = "and";
       6'b000010 : alu_decode = "or";
       6'b000011 : alu_decode = "xor";
       6'b000100 : alu_decode = "sub";
       6'b000101 : alu_decode = "andn";
       6'b000110 : alu_decode = "orn";
       6'b000111 : alu_decode = "xnor";
       6'b001000 : alu_decode = "addc";
       6'b001001 : alu_decode = "mulx";
       6'b001010 : alu_decode = "umul";
       6'b001011 : alu_decode = "smul";
       6'b001100 : alu_decode = "subc";
       6'b001101 : alu_decode = "udivx";
       6'b001110 : alu_decode = "udiv";
       6'b001111 : alu_decode = "sdiv";
       6'b010000 : alu_decode = "addcc";
       6'b010001 : alu_decode = "andcc";
       6'b010010 : alu_decode = "orcc";
       6'b010011 : alu_decode = "xorcc";
       6'b010100 : alu_decode = "subcc";
       6'b010101 : alu_decode = "andncc";
       6'b010110 : alu_decode = "orncc";
       6'b010111 : alu_decode = "xnorcc";
       6'b011000 : alu_decode = "addccc";
       6'b011001 : alu_decode = "unkn";
       6'b011010 : alu_decode = "umulcc";
       6'b011011 : alu_decode = "smulcc";
       6'b011100 : alu_decode = "subccc";
       6'b011101 : alu_decode = "unkn";
       6'b011110 : alu_decode = "udivcc";
       6'b011111 : alu_decode = "sdivcc";
       6'b100000 : alu_decode = "taddcc";
       6'b100001 : alu_decode = "tsubcc";
       6'b100010 : alu_decode = "tadctv";
       6'b100011 : alu_decode = "tsbctv";
       6'b100100 : alu_decode = "mulscc";
       6'b100101 : alu_decode = "sll";
       6'b100110 : alu_decode = "srl";
       6'b100111 : alu_decode = "sra";
       6'b101000 : alu_decode = "spl";
       6'b101001 : alu_decode = "unkn";
       6'b101010 : alu_decode = "rdpr";
       6'b101011 : alu_decode = "flushw";
       6'b101100 : alu_decode = "movcc";
       6'b101101 : alu_decode = "sdivx";
       6'b101110 : alu_decode = "popc";
       6'b101111 : alu_decode = "movr";
       6'b110000 : alu_decode = "wryspl";
       6'b110001 : alu_decode = "savspl";
       6'b110010 : alu_decode = "wrpr";
       6'b110011 : alu_decode = "unkn";
       6'b110100 : alu_decode = "fpop1";
       6'b110101 : alu_decode = "fpop2";
       6'b110110 : alu_decode = "impdep";
       6'b110111 : alu_decode = "impdep";
       6'b111000 : alu_decode = "jmpl";
       6'b111001 : alu_decode = "return";
       6'b111010 : alu_decode = "spl";
       6'b111011 : alu_decode = "flush";
       6'b111100 : alu_decode = "save";
       6'b111101 : alu_decode = "restor";
       6'b111110 : alu_decode = "done";
       6'b111111 : alu_decode = "unkn";
    endcase
end
endfunction

function [8*6:0] lsu_decode;
    input [5:0] op3;
begin
    case(op3[3:0])
       4'b0000 : lsu_decode = "lduw";
       4'b0001 : lsu_decode = "ldub";
       4'b0010 : lsu_decode = "lduh";
       4'b0011 : lsu_decode = "ldd";
       4'b0100 : lsu_decode = "stw";
       4'b0101 : lsu_decode = "stb";
       4'b0110 : lsu_decode = "sth";
       4'b0111 : lsu_decode = "std";
       4'b1000 : lsu_decode = "ldsw";
       4'b1001 : lsu_decode = "ldsb";
       4'b1010 : lsu_decode = "ldsh";
       4'b1011 : lsu_decode = "ldx";
       4'b1100 : lsu_decode = "err";
       4'b1101 : lsu_decode = "ldstub";
       4'b1110 : lsu_decode = "stx";
       4'b1111 : lsu_decode = "swap";
    endcase
end
endfunction

function [1:0] encode_thread;
    input [3:0] decoded_thread;
begin
    case(decoded_thread)
        4'b0001 :  encode_thread = 2'b00;
        4'b0010 :  encode_thread = 2'b01;
        4'b0100 :  encode_thread = 2'b10;
        4'b1000 :  encode_thread = 2'b11;
    endcase
end
endfunction

function [5:0] get_match_index;
    input [31:0] pc;
    integer i ;
begin
    for(i=0; i<=63; i=i+1)
    begin
        if(pc_array[i] === pc) get_match_index = i;
    end
end
endfunction

`endif // ifdef GATE_SIM

endmodule

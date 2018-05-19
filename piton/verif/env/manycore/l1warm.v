// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: l1warm.v
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
// ***************************************************************************
//
// File:        l1warm.v
// Description: warm l1 cache.
// 
// ***************************************************************************

`ifdef FPGA_SYN
`define FPGA_SYN_ICD
`define FPGA_SYN_IDCT
`endif

module l1warm();
   reg [7:0] cpu_status;
   reg 	     warm;
   integer   idx;

   integer i;
`ifdef FPGA_SYN_IDCT
   reg [32:0]	lsu_ictag_ary0  [511:0];
   reg [32:0]	ifu_ictag_ary0  [511:0];
   reg [32:0]	lsu_ictag_ary1  [511:0];
   reg [32:0]	ifu_ictag_ary1  [511:0];
   reg [32:0]	lsu_ictag_ary2  [511:0];
   reg [32:0]	ifu_ictag_ary2  [511:0];
   reg [32:0]	lsu_ictag_ary3  [511:0];
   reg [32:0]	ifu_ictag_ary3  [511:0];
   reg [32:0]	lsu_ictag_ary4  [511:0];
   reg [32:0]	ifu_ictag_ary4  [511:0];
   reg [32:0]	lsu_ictag_ary5  [511:0];
   reg [32:0]	ifu_ictag_ary5  [511:0];
   reg [32:0]	lsu_ictag_ary6  [511:0];
   reg [32:0]	ifu_ictag_ary6  [511:0];
   reg [32:0]	lsu_ictag_ary7  [511:0];
   reg [32:0]	ifu_ictag_ary7  [511:0];
`endif

`ifdef FPGA_SYN_ICD
   reg [33:0]	icdata_ary0     [4095:0];
   reg [33:0]	icdata_ary1     [4095:0];
   reg [33:0]	icdata_ary2     [4095:0];
   reg [33:0]	icdata_ary3     [4095:0];
   reg [33:0]	icdata_ary4     [4095:0];
   reg [33:0]	icdata_ary5     [4095:0];
   reg [33:0]	icdata_ary6     [4095:0];
   reg [33:0]	icdata_ary7     [4095:0];
`endif
 
//slam valid bit after rst_l is deasserted.
   initial begin
      #200 //wait for memory read.
      if(warm)begin
	 repeat(1)@(posedge `SPARC_CORE0.cmp_grst_l);
	 repeat(1)@(posedge `TOP_MOD.rclk);//wait for posedge
	 $l1_warm(2,
		  //bank00
		  `SCPATH0.dc_row0.panel_pair0.panel0.valid,
		  `SCPATH0.dc_row0.panel_pair0.panel1.valid,
		  `SCPATH0.dc_row0.panel_pair1.panel0.valid,
		  `SCPATH0.dc_row0.panel_pair1.panel1.valid,
		  
		  `SCPATH0.dc_row1.panel_pair0.panel0.valid,
		  `SCPATH0.dc_row1.panel_pair0.panel1.valid,
		  `SCPATH0.dc_row1.panel_pair1.panel0.valid,
		  `SCPATH0.dc_row1.panel_pair1.panel1.valid,
		  
		  `SCPATH0.dc_row2.panel_pair0.panel0.valid,
		  `SCPATH0.dc_row2.panel_pair0.panel1.valid,
		  `SCPATH0.dc_row2.panel_pair1.panel0.valid,
		  `SCPATH0.dc_row2.panel_pair1.panel1.valid,
		  
		  `SCPATH0.dc_row3.panel_pair0.panel0.valid,
		  `SCPATH0.dc_row3.panel_pair0.panel1.valid,
		  `SCPATH0.dc_row3.panel_pair1.panel0.valid,
		  `SCPATH0.dc_row3.panel_pair1.panel1.valid,
		  
		  //bank01
		  `SCPATH1.dc_row0.panel_pair0.panel0.valid,
		  `SCPATH1.dc_row0.panel_pair0.panel1.valid,
		  `SCPATH1.dc_row0.panel_pair1.panel0.valid,
		  `SCPATH1.dc_row0.panel_pair1.panel1.valid,
		  
		  `SCPATH1.dc_row1.panel_pair0.panel0.valid,
		  `SCPATH1.dc_row1.panel_pair0.panel1.valid,
		  `SCPATH1.dc_row1.panel_pair1.panel0.valid,
		  `SCPATH1.dc_row1.panel_pair1.panel1.valid,
		  
		  `SCPATH1.dc_row2.panel_pair0.panel0.valid,
		  `SCPATH1.dc_row2.panel_pair0.panel1.valid,
		  `SCPATH1.dc_row2.panel_pair1.panel0.valid,
		  `SCPATH1.dc_row2.panel_pair1.panel1.valid,
		  
		  `SCPATH1.dc_row3.panel_pair0.panel0.valid,
		  `SCPATH1.dc_row3.panel_pair0.panel1.valid,
		  `SCPATH1.dc_row3.panel_pair1.panel0.valid,
		  `SCPATH1.dc_row3.panel_pair1.panel1.valid,
		  //bank10
		  `SCPATH2.dc_row0.panel_pair0.panel0.valid,
		  `SCPATH2.dc_row0.panel_pair0.panel1.valid,
		  `SCPATH2.dc_row0.panel_pair1.panel0.valid,
		  `SCPATH2.dc_row0.panel_pair1.panel1.valid,
		  
		  `SCPATH2.dc_row1.panel_pair0.panel0.valid,
		  `SCPATH2.dc_row1.panel_pair0.panel1.valid,
		  `SCPATH2.dc_row1.panel_pair1.panel0.valid,
		  `SCPATH2.dc_row1.panel_pair1.panel1.valid,
		  
		  `SCPATH2.dc_row2.panel_pair0.panel0.valid,
		  `SCPATH2.dc_row2.panel_pair0.panel1.valid,
		  `SCPATH2.dc_row2.panel_pair1.panel0.valid,
		  `SCPATH2.dc_row2.panel_pair1.panel1.valid,
		  
		  `SCPATH2.dc_row3.panel_pair0.panel0.valid,
		  `SCPATH2.dc_row3.panel_pair0.panel1.valid,
		  `SCPATH2.dc_row3.panel_pair1.panel0.valid,
		  `SCPATH2.dc_row3.panel_pair1.panel1.valid,
		  
		  //bank11
		  `SCPATH3.dc_row0.panel_pair0.panel0.valid,
		  `SCPATH3.dc_row0.panel_pair0.panel1.valid,
		  `SCPATH3.dc_row0.panel_pair1.panel0.valid,
		  `SCPATH3.dc_row0.panel_pair1.panel1.valid,
		  `SCPATH3.dc_row1.panel_pair0.panel0.valid,
		  `SCPATH3.dc_row1.panel_pair0.panel1.valid,
		  `SCPATH3.dc_row1.panel_pair1.panel0.valid,
		  `SCPATH3.dc_row1.panel_pair1.panel1.valid,
		  `SCPATH3.dc_row2.panel_pair0.panel0.valid,
		  `SCPATH3.dc_row2.panel_pair0.panel1.valid,
		  `SCPATH3.dc_row2.panel_pair1.panel0.valid,
		  `SCPATH3.dc_row2.panel_pair1.panel1.valid,
		  `SCPATH3.dc_row3.panel_pair0.panel0.valid,
		  `SCPATH3.dc_row3.panel_pair0.panel1.valid,
		  `SCPATH3.dc_row3.panel_pair1.panel0.valid,
		  `SCPATH3.dc_row3.panel_pair1.panel1.valid,
		  //icache
		  //bank00
		  `SCPATH0.ic_row0.panel_pair0.panel0.valid,
		  `SCPATH0.ic_row0.panel_pair0.panel1.valid,
		  `SCPATH0.ic_row0.panel_pair1.panel0.valid,
		  `SCPATH0.ic_row0.panel_pair1.panel1.valid,
		  `SCPATH0.ic_row1.panel_pair0.panel0.valid,
		  `SCPATH0.ic_row1.panel_pair0.panel1.valid,
		  `SCPATH0.ic_row1.panel_pair1.panel0.valid,
		  `SCPATH0.ic_row1.panel_pair1.panel1.valid,
		  `SCPATH0.ic_row2.panel_pair0.panel0.valid,
		  `SCPATH0.ic_row2.panel_pair0.panel1.valid,
		  `SCPATH0.ic_row2.panel_pair1.panel0.valid,
		  `SCPATH0.ic_row2.panel_pair1.panel1.valid,
		  `SCPATH0.ic_row3.panel_pair0.panel0.valid,
		  `SCPATH0.ic_row3.panel_pair0.panel1.valid,
		  `SCPATH0.ic_row3.panel_pair1.panel0.valid,
		  `SCPATH0.ic_row3.panel_pair1.panel1.valid,
		  //bank01
		  `SCPATH1.ic_row0.panel_pair0.panel0.valid,
		  `SCPATH1.ic_row0.panel_pair0.panel1.valid,
		  `SCPATH1.ic_row0.panel_pair1.panel0.valid,
		  `SCPATH1.ic_row0.panel_pair1.panel1.valid,
		  `SCPATH1.ic_row1.panel_pair0.panel0.valid,
		  `SCPATH1.ic_row1.panel_pair0.panel1.valid,
		  `SCPATH1.ic_row1.panel_pair1.panel0.valid,
		  `SCPATH1.ic_row1.panel_pair1.panel1.valid,
		  `SCPATH1.ic_row2.panel_pair0.panel0.valid,
		  `SCPATH1.ic_row2.panel_pair0.panel1.valid,
		  `SCPATH1.ic_row2.panel_pair1.panel0.valid,
		  `SCPATH1.ic_row2.panel_pair1.panel1.valid,
		  `SCPATH1.ic_row3.panel_pair0.panel0.valid,
		  `SCPATH1.ic_row3.panel_pair0.panel1.valid,
		  `SCPATH1.ic_row3.panel_pair1.panel0.valid,
		  `SCPATH1.ic_row3.panel_pair1.panel1.valid,
		  //bank10
		  `SCPATH2.ic_row0.panel_pair0.panel0.valid,
		  `SCPATH2.ic_row0.panel_pair0.panel1.valid,
		  `SCPATH2.ic_row0.panel_pair1.panel0.valid,
		  `SCPATH2.ic_row0.panel_pair1.panel1.valid,
		  `SCPATH2.ic_row1.panel_pair0.panel0.valid,
		  `SCPATH2.ic_row1.panel_pair0.panel1.valid,
		  `SCPATH2.ic_row1.panel_pair1.panel0.valid,
		  `SCPATH2.ic_row1.panel_pair1.panel1.valid,
		  `SCPATH2.ic_row2.panel_pair0.panel0.valid,
		  `SCPATH2.ic_row2.panel_pair0.panel1.valid,
		  `SCPATH2.ic_row2.panel_pair1.panel0.valid,
		  `SCPATH2.ic_row2.panel_pair1.panel1.valid,
		  `SCPATH2.ic_row3.panel_pair0.panel0.valid,
		  `SCPATH2.ic_row3.panel_pair0.panel1.valid,
		  `SCPATH2.ic_row3.panel_pair1.panel0.valid,
		  `SCPATH2.ic_row3.panel_pair1.panel1.valid,
		  
		  //bank11
		  `SCPATH3.ic_row0.panel_pair0.panel0.valid,
		  `SCPATH3.ic_row0.panel_pair0.panel1.valid,
		  `SCPATH3.ic_row0.panel_pair1.panel0.valid,
		  `SCPATH3.ic_row0.panel_pair1.panel1.valid,
		  `SCPATH3.ic_row1.panel_pair0.panel0.valid,
		  `SCPATH3.ic_row1.panel_pair0.panel1.valid,
		  `SCPATH3.ic_row1.panel_pair1.panel0.valid,
		  `SCPATH3.ic_row1.panel_pair1.panel1.valid,
		  `SCPATH3.ic_row2.panel_pair0.panel0.valid,
		  `SCPATH3.ic_row2.panel_pair0.panel1.valid,
		  `SCPATH3.ic_row2.panel_pair1.panel0.valid,
		  `SCPATH3.ic_row2.panel_pair1.panel1.valid,
		  `SCPATH3.ic_row3.panel_pair0.panel0.valid,
		  `SCPATH3.ic_row3.panel_pair0.panel1.valid,
		  `SCPATH3.ic_row3.panel_pair1.panel0.valid,
		  `SCPATH3.ic_row3.panel_pair1.panel1.valid,
		  );
      end
   end
//
   initial 
     begin
	cpu_status = 0;
	warm       = 0;
	
`ifdef RTL_SPARC0
	cpu_status[0] = 1'b1;
`endif	
`ifdef RTL_SPARC1
	cpu_status[1] = 1'b1;
`endif	
`ifdef RTL_SPARC2
	cpu_status[2] = 1'b1;
`endif	
`ifdef RTL_SPARC3
	cpu_status[3] = 1'b1;
`endif	
`ifdef RTL_SPARC4
	cpu_status[4] = 1'b1;
`endif	
`ifdef RTL_SPARC5
	cpu_status[5] = 1'b1;
`endif	
`ifdef RTL_SPARC6
	cpu_status[6] = 1'b1;
`endif	
`ifdef RTL_SPARC7
	cpu_status[7] = 1'b1;
`endif
`ifdef FPGA_SYN_IDCT
	for (i = 0; i < 128; i = i+1)
        begin
`ifdef RTL_SPARC0
	  lsu_ictag_ary0[{i,2'b11}] = `SPCPATH0.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary0[{i,2'b10}] = `SPCPATH0.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary0[{i,2'b10}] = `SPCPATH0.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary0[{i,2'b00}] = `SPCPATH0.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary0[{i,2'b11}] = `SPCPATH0.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary0[{i,2'b10}] = `SPCPATH0.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary0[{i,2'b01}] = `SPCPATH0.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary0[{i,2'b00}] = `SPCPATH0.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC1
	  lsu_ictag_ary1[{i,2'b11}] = `SPCPATH1.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary1[{i,2'b10}] = `SPCPATH1.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary1[{i,2'b10}] = `SPCPATH1.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary1[{i,2'b00}] = `SPCPATH1.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary1[{i,2'b11}] = `SPCPATH1.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary1[{i,2'b10}] = `SPCPATH1.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary1[{i,2'b01}] = `SPCPATH1.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary1[{i,2'b00}] = `SPCPATH1.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC2
	  lsu_ictag_ary2[{i,2'b11}] = `SPCPATH2.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary2[{i,2'b10}] = `SPCPATH2.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary2[{i,2'b10}] = `SPCPATH2.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary2[{i,2'b00}] = `SPCPATH2.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary2[{i,2'b11}] = `SPCPATH2.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary2[{i,2'b10}] = `SPCPATH2.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary2[{i,2'b01}] = `SPCPATH2.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary2[{i,2'b00}] = `SPCPATH2.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC3
	  lsu_ictag_ary3[{i,2'b11}] = `SPCPATH3.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary3[{i,2'b10}] = `SPCPATH3.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary3[{i,2'b10}] = `SPCPATH3.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary3[{i,2'b00}] = `SPCPATH3.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary3[{i,2'b11}] = `SPCPATH3.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary3[{i,2'b10}] = `SPCPATH3.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary3[{i,2'b01}] = `SPCPATH3.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary3[{i,2'b00}] = `SPCPATH3.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC4
	  lsu_ictag_ary4[{i,2'b11}] = `SPCPATH4.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary4[{i,2'b10}] = `SPCPATH4.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary4[{i,2'b10}] = `SPCPATH4.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary4[{i,2'b00}] = `SPCPATH4.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary4[{i,2'b11}] = `SPCPATH4.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary4[{i,2'b10}] = `SPCPATH4.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary4[{i,2'b01}] = `SPCPATH4.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary4[{i,2'b00}] = `SPCPATH4.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC5
	  lsu_ictag_ary5[{i,2'b11}] = `SPCPATH5.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary5[{i,2'b10}] = `SPCPATH5.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary5[{i,2'b10}] = `SPCPATH5.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary5[{i,2'b00}] = `SPCPATH5.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary5[{i,2'b11}] = `SPCPATH5.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary5[{i,2'b10}] = `SPCPATH5.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary5[{i,2'b01}] = `SPCPATH5.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary5[{i,2'b00}] = `SPCPATH5.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC6
	  lsu_ictag_ary6[{i,2'b11}] = `SPCPATH6.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary6[{i,2'b10}] = `SPCPATH6.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary6[{i,2'b10}] = `SPCPATH6.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary6[{i,2'b00}] = `SPCPATH6.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary6[{i,2'b11}] = `SPCPATH6.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary6[{i,2'b10}] = `SPCPATH6.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary6[{i,2'b01}] = `SPCPATH6.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary6[{i,2'b00}] = `SPCPATH6.ifu.ict.ictag_ary_00.array[i];
`endif

`ifdef RTL_SPARC7
	  lsu_ictag_ary7[{i,2'b11}] = `SPCPATH7.lsu.dtag.ictag_ary_11.array[i];
	  lsu_ictag_ary7[{i,2'b10}] = `SPCPATH7.lsu.dtag.ictag_ary_10.array[i];
	  lsu_ictag_ary7[{i,2'b10}] = `SPCPATH7.lsu.dtag.ictag_ary_01.array[i];
	  lsu_ictag_ary7[{i,2'b00}] = `SPCPATH7.lsu.dtag.ictag_ary_00.array[i];
	  ifu_ictag_ary7[{i,2'b11}] = `SPCPATH7.ifu.ict.ictag_ary_11.array[i];
	  ifu_ictag_ary7[{i,2'b10}] = `SPCPATH7.ifu.ict.ictag_ary_10.array[i];
	  ifu_ictag_ary7[{i,2'b01}] = `SPCPATH7.ifu.ict.ictag_ary_01.array[i];
	  ifu_ictag_ary7[{i,2'b00}] = `SPCPATH7.ifu.ict.ictag_ary_00.array[i];
`endif
        end
`endif

`ifdef FPGA_SYN_ICD
	for (i = 0; i < 256; i = i+1)
        begin
`ifdef RTL_SPARC0
	  icdata_ary0[i+256*15] = `SPCPATH0.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary0[i+256*14] = `SPCPATH0.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary0[i+256*13] = `SPCPATH0.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary0[i+256*12] = `SPCPATH0.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary0[i+256*11] = `SPCPATH0.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary0[i+256*10] = `SPCPATH0.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary0[i+256*9] = `SPCPATH0.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary0[i+256*8] = `SPCPATH0.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary0[i+256*7] = `SPCPATH0.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary0[i+256*6] = `SPCPATH0.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary0[i+256*5] = `SPCPATH0.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary0[i+256*4] = `SPCPATH0.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary0[i+256*3] = `SPCPATH0.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary0[i+256*2] = `SPCPATH0.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary0[i+256*1] = `SPCPATH0.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary0[i] = `SPCPATH0.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC1
	  icdata_ary1[i+256*15] = `SPCPATH1.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary1[i+256*14] = `SPCPATH1.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary1[i+256*13] = `SPCPATH1.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary1[i+256*12] = `SPCPATH1.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary1[i+256*11] = `SPCPATH1.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary1[i+256*10] = `SPCPATH1.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary1[i+256*9] = `SPCPATH1.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary1[i+256*8] = `SPCPATH1.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary1[i+256*7] = `SPCPATH1.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary1[i+256*6] = `SPCPATH1.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary1[i+256*5] = `SPCPATH1.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary1[i+256*4] = `SPCPATH1.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary1[i+256*3] = `SPCPATH1.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary1[i+256*2] = `SPCPATH1.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary1[i+256*1] = `SPCPATH1.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary1[i] = `SPCPATH1.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC2
	  icdata_ary2[i+256*15] = `SPCPATH2.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary2[i+256*14] = `SPCPATH2.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary2[i+256*13] = `SPCPATH2.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary2[i+256*12] = `SPCPATH2.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary2[i+256*11] = `SPCPATH2.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary2[i+256*10] = `SPCPATH2.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary2[i+256*9] = `SPCPATH2.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary2[i+256*8] = `SPCPATH2.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary2[i+256*7] = `SPCPATH2.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary2[i+256*6] = `SPCPATH2.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary2[i+256*5] = `SPCPATH2.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary2[i+256*4] = `SPCPATH2.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary2[i+256*3] = `SPCPATH2.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary2[i+256*2] = `SPCPATH2.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary2[i+256*1] = `SPCPATH2.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary2[i] = `SPCPATH2.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC3
	  icdata_ary3[i+256*15] = `SPCPATH3.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary3[i+256*14] = `SPCPATH3.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary3[i+256*13] = `SPCPATH3.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary3[i+256*12] = `SPCPATH3.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary3[i+256*11] = `SPCPATH3.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary3[i+256*10] = `SPCPATH3.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary3[i+256*9] = `SPCPATH3.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary3[i+256*8] = `SPCPATH3.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary3[i+256*7] = `SPCPATH3.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary3[i+256*6] = `SPCPATH3.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary3[i+256*5] = `SPCPATH3.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary3[i+256*4] = `SPCPATH3.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary3[i+256*3] = `SPCPATH3.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary3[i+256*2] = `SPCPATH3.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary3[i+256*1] = `SPCPATH3.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary3[i] = `SPCPATH3.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC4
	  icdata_ary4[i+256*15] = `SPCPATH4.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary4[i+256*14] = `SPCPATH4.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary4[i+256*13] = `SPCPATH4.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary4[i+256*12] = `SPCPATH4.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary4[i+256*11] = `SPCPATH4.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary4[i+256*10] = `SPCPATH4.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary4[i+256*9] = `SPCPATH4.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary4[i+256*8] = `SPCPATH4.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary4[i+256*7] = `SPCPATH4.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary4[i+256*6] = `SPCPATH4.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary4[i+256*5] = `SPCPATH4.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary4[i+256*4] = `SPCPATH4.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary4[i+256*3] = `SPCPATH4.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary4[i+256*2] = `SPCPATH4.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary4[i+256*1] = `SPCPATH4.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary4[i] = `SPCPATH4.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC5
	  icdata_ary5[i+256*15] = `SPCPATH5.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary5[i+256*14] = `SPCPATH5.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary5[i+256*13] = `SPCPATH5.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary5[i+256*12] = `SPCPATH5.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary5[i+256*11] = `SPCPATH5.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary5[i+256*10] = `SPCPATH5.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary5[i+256*9] = `SPCPATH5.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary5[i+256*8] = `SPCPATH5.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary5[i+256*7] = `SPCPATH5.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary5[i+256*6] = `SPCPATH5.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary5[i+256*5] = `SPCPATH5.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary5[i+256*4] = `SPCPATH5.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary5[i+256*3] = `SPCPATH5.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary5[i+256*2] = `SPCPATH5.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary5[i+256*1] = `SPCPATH5.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary5[i] = `SPCPATH5.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC6
	  icdata_ary6[i+256*15] = `SPCPATH6.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary6[i+256*14] = `SPCPATH6.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary6[i+256*13] = `SPCPATH6.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary6[i+256*12] = `SPCPATH6.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary6[i+256*11] = `SPCPATH6.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary6[i+256*10] = `SPCPATH6.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary6[i+256*9] = `SPCPATH6.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary6[i+256*8] = `SPCPATH6.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary6[i+256*7] = `SPCPATH6.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary6[i+256*6] = `SPCPATH6.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary6[i+256*5] = `SPCPATH6.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary6[i+256*4] = `SPCPATH6.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary6[i+256*3] = `SPCPATH6.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary6[i+256*2] = `SPCPATH6.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary6[i+256*1] = `SPCPATH6.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary6[i] = `SPCPATH6.ifu.icd.icdata_ary_00_00[i];
`endif

`ifdef RTL_SPARC7
	  icdata_ary7[i+256*15] = `SPCPATH7.ifu.icd.icdata_ary_11_11[i];
	  icdata_ary7[i+256*14] = `SPCPATH7.ifu.icd.icdata_ary_11_10[i];
	  icdata_ary7[i+256*13] = `SPCPATH7.ifu.icd.icdata_ary_11_01[i];
	  icdata_ary7[i+256*12] = `SPCPATH7.ifu.icd.icdata_ary_11_00[i];
	  icdata_ary7[i+256*11] = `SPCPATH7.ifu.icd.icdata_ary_10_11[i];
	  icdata_ary7[i+256*10] = `SPCPATH7.ifu.icd.icdata_ary_10_10[i];
	  icdata_ary7[i+256*9] = `SPCPATH7.ifu.icd.icdata_ary_10_01[i];
	  icdata_ary7[i+256*8] = `SPCPATH7.ifu.icd.icdata_ary_10_00[i];
	  icdata_ary7[i+256*7] = `SPCPATH7.ifu.icd.icdata_ary_01_11[i];
	  icdata_ary7[i+256*6] = `SPCPATH7.ifu.icd.icdata_ary_01_10[i];
	  icdata_ary7[i+256*5] = `SPCPATH7.ifu.icd.icdata_ary_01_01[i];
	  icdata_ary7[i+256*4] = `SPCPATH7.ifu.icd.icdata_ary_01_00[i];
	  icdata_ary7[i+256*3] = `SPCPATH7.ifu.icd.icdata_ary_00_11[i];
	  icdata_ary7[i+256*2] = `SPCPATH7.ifu.icd.icdata_ary_00_10[i];
	  icdata_ary7[i+256*1] = `SPCPATH7.ifu.icd.icdata_ary_00_01[i];
  	  icdata_ary7[i] = `SPCPATH7.ifu.icd.icdata_ary_00_00[i];
`endif
        end
`endif
	#110 //wait for memory read.
	$l1_warm(1, cpu_status, warm); 
	$l1_warm(
		 //bank00 //bw_r_dcm.v
		 //dcache site
		 3,
		 `SCPATH0.dc_row0.panel_pair0.panel0.addr_array,
		 `SCPATH0.dc_row0.panel_pair0.panel0.valid,
		 `SCPATH0.dc_row0.panel_pair0.panel0.parity,
		 `SCPATH0.dc_row0.panel_pair0.panel1.addr_array,
		 `SCPATH0.dc_row0.panel_pair0.panel1.valid,
		 `SCPATH0.dc_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH0.dc_row0.panel_pair1.panel0.addr_array,
		 `SCPATH0.dc_row0.panel_pair1.panel0.valid,
		 `SCPATH0.dc_row0.panel_pair1.panel0.parity,
		 `SCPATH0.dc_row0.panel_pair1.panel1.addr_array,
		 `SCPATH0.dc_row0.panel_pair1.panel1.valid,
		 `SCPATH0.dc_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH0.dc_row1.panel_pair0.panel0.addr_array,
		 `SCPATH0.dc_row1.panel_pair0.panel0.valid,
		 `SCPATH0.dc_row1.panel_pair0.panel0.parity,	 
		 `SCPATH0.dc_row1.panel_pair0.panel1.addr_array,
		 `SCPATH0.dc_row1.panel_pair0.panel1.valid,
		 `SCPATH0.dc_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH0.dc_row1.panel_pair1.panel0.addr_array,
		 `SCPATH0.dc_row1.panel_pair1.panel0.valid,
		 `SCPATH0.dc_row1.panel_pair1.panel0.parity,	 
		 `SCPATH0.dc_row1.panel_pair1.panel1.addr_array,
		 `SCPATH0.dc_row1.panel_pair1.panel1.valid,
		 `SCPATH0.dc_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH0.dc_row2.panel_pair0.panel0.addr_array,
		 `SCPATH0.dc_row2.panel_pair0.panel0.valid,
		 `SCPATH0.dc_row2.panel_pair0.panel0.parity,	 
		 `SCPATH0.dc_row2.panel_pair0.panel1.addr_array,
		 `SCPATH0.dc_row2.panel_pair0.panel1.valid,
		 `SCPATH0.dc_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH0.dc_row2.panel_pair1.panel0.addr_array,
		 `SCPATH0.dc_row2.panel_pair1.panel0.valid,
		 `SCPATH0.dc_row2.panel_pair1.panel0.parity,	 
		 `SCPATH0.dc_row2.panel_pair1.panel1.addr_array,
		 `SCPATH0.dc_row2.panel_pair1.panel1.valid,
		 `SCPATH0.dc_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH0.dc_row3.panel_pair0.panel0.addr_array,
		 `SCPATH0.dc_row3.panel_pair0.panel0.valid,
		 `SCPATH0.dc_row3.panel_pair0.panel0.parity,	 
		 `SCPATH0.dc_row3.panel_pair0.panel1.addr_array,
		 `SCPATH0.dc_row3.panel_pair0.panel1.valid,
		 `SCPATH0.dc_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH0.dc_row3.panel_pair1.panel0.addr_array,
		 `SCPATH0.dc_row3.panel_pair1.panel0.valid,
		 `SCPATH0.dc_row3.panel_pair1.panel0.parity,	 
		 `SCPATH0.dc_row3.panel_pair1.panel1.addr_array,
		 `SCPATH0.dc_row3.panel_pair1.panel1.valid,
		 `SCPATH0.dc_row3.panel_pair1.panel1.parity,
		 
		 //bank 01
		 //dcache site
		 `SCPATH1.dc_row0.panel_pair0.panel0.addr_array,
		 `SCPATH1.dc_row0.panel_pair0.panel0.valid,
		 `SCPATH1.dc_row0.panel_pair0.panel0.parity,	 
		 `SCPATH1.dc_row0.panel_pair0.panel1.addr_array,
		 `SCPATH1.dc_row0.panel_pair0.panel1.valid,
		 `SCPATH1.dc_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH1.dc_row0.panel_pair1.panel0.addr_array,
		 `SCPATH1.dc_row0.panel_pair1.panel0.valid,
		 `SCPATH1.dc_row0.panel_pair1.panel0.parity,	 
		 `SCPATH1.dc_row0.panel_pair1.panel1.addr_array,
		 `SCPATH1.dc_row0.panel_pair1.panel1.valid,
		 `SCPATH1.dc_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH1.dc_row1.panel_pair0.panel0.addr_array,
		 `SCPATH1.dc_row1.panel_pair0.panel0.valid,
		 `SCPATH1.dc_row1.panel_pair0.panel0.parity,	 
		 `SCPATH1.dc_row1.panel_pair0.panel1.addr_array,
		 `SCPATH1.dc_row1.panel_pair0.panel1.valid,
		 `SCPATH1.dc_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH1.dc_row1.panel_pair1.panel0.addr_array,
		 `SCPATH1.dc_row1.panel_pair1.panel0.valid,
		 `SCPATH1.dc_row1.panel_pair1.panel0.parity,	 
		 `SCPATH1.dc_row1.panel_pair1.panel1.addr_array,
		 `SCPATH1.dc_row1.panel_pair1.panel1.valid,
		 `SCPATH1.dc_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH1.dc_row2.panel_pair0.panel0.addr_array,
		 `SCPATH1.dc_row2.panel_pair0.panel0.valid,
		 `SCPATH1.dc_row2.panel_pair0.panel0.parity,	 
		 `SCPATH1.dc_row2.panel_pair0.panel1.addr_array,
		 `SCPATH1.dc_row2.panel_pair0.panel1.valid,
		 `SCPATH1.dc_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH1.dc_row2.panel_pair1.panel0.addr_array,
		 `SCPATH1.dc_row2.panel_pair1.panel0.valid,
		 `SCPATH1.dc_row2.panel_pair1.panel0.parity,	 
		 `SCPATH1.dc_row2.panel_pair1.panel1.addr_array,
		 `SCPATH1.dc_row2.panel_pair1.panel1.valid,
		 `SCPATH1.dc_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH1.dc_row3.panel_pair0.panel0.addr_array,
		 `SCPATH1.dc_row3.panel_pair0.panel0.valid,
		 `SCPATH1.dc_row3.panel_pair0.panel0.parity,	 
		 `SCPATH1.dc_row3.panel_pair0.panel1.addr_array,
		 `SCPATH1.dc_row3.panel_pair0.panel1.valid,
		 `SCPATH1.dc_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH1.dc_row3.panel_pair1.panel0.addr_array,
		 `SCPATH1.dc_row3.panel_pair1.panel0.valid,
		 `SCPATH1.dc_row3.panel_pair1.panel0.parity,	 
		 `SCPATH1.dc_row3.panel_pair1.panel1.addr_array,
		 `SCPATH1.dc_row3.panel_pair1.panel1.valid,
		 `SCPATH1.dc_row3.panel_pair1.panel1.parity,
		 //bank 10
		 //dcache site
		 `SCPATH2.dc_row0.panel_pair0.panel0.addr_array,
		 `SCPATH2.dc_row0.panel_pair0.panel0.valid,
		 `SCPATH2.dc_row0.panel_pair0.panel0.parity,	 
		 `SCPATH2.dc_row0.panel_pair0.panel1.addr_array,
		 `SCPATH2.dc_row0.panel_pair0.panel1.valid,
		 `SCPATH2.dc_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH2.dc_row0.panel_pair1.panel0.addr_array,
		 `SCPATH2.dc_row0.panel_pair1.panel0.valid,
		 `SCPATH2.dc_row0.panel_pair1.panel0.parity,	 
		 `SCPATH2.dc_row0.panel_pair1.panel1.addr_array,
		 `SCPATH2.dc_row0.panel_pair1.panel1.valid,
		 `SCPATH2.dc_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH2.dc_row1.panel_pair0.panel0.addr_array,
		 `SCPATH2.dc_row1.panel_pair0.panel0.valid,
		 `SCPATH2.dc_row1.panel_pair0.panel0.parity,	 
		 `SCPATH2.dc_row1.panel_pair0.panel1.addr_array,
		 `SCPATH2.dc_row1.panel_pair0.panel1.valid,
		 `SCPATH2.dc_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH2.dc_row1.panel_pair1.panel0.addr_array,
		 `SCPATH2.dc_row1.panel_pair1.panel0.valid,
		 `SCPATH2.dc_row1.panel_pair1.panel0.parity,	 
		 `SCPATH2.dc_row1.panel_pair1.panel1.addr_array,
		 `SCPATH2.dc_row1.panel_pair1.panel1.valid,
		 `SCPATH2.dc_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH2.dc_row2.panel_pair0.panel0.addr_array,
		 `SCPATH2.dc_row2.panel_pair0.panel0.valid,
		 `SCPATH2.dc_row2.panel_pair0.panel0.parity,	 
		 `SCPATH2.dc_row2.panel_pair0.panel1.addr_array,
		 `SCPATH2.dc_row2.panel_pair0.panel1.valid,
		 `SCPATH2.dc_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH2.dc_row2.panel_pair1.panel0.addr_array,
		 `SCPATH2.dc_row2.panel_pair1.panel0.valid,
		 `SCPATH2.dc_row2.panel_pair1.panel0.parity,	 
		 `SCPATH2.dc_row2.panel_pair1.panel1.addr_array,
		 `SCPATH2.dc_row2.panel_pair1.panel1.valid,
		 `SCPATH2.dc_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH2.dc_row3.panel_pair0.panel0.addr_array,
		 `SCPATH2.dc_row3.panel_pair0.panel0.valid,
		 `SCPATH2.dc_row3.panel_pair0.panel0.parity,	 
		 `SCPATH2.dc_row3.panel_pair0.panel1.addr_array,
		 `SCPATH2.dc_row3.panel_pair0.panel1.valid,
		 `SCPATH2.dc_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH2.dc_row3.panel_pair1.panel0.addr_array,
		 `SCPATH2.dc_row3.panel_pair1.panel0.valid,
		 `SCPATH2.dc_row3.panel_pair1.panel0.parity,	 
		 `SCPATH2.dc_row3.panel_pair1.panel1.addr_array,
		 `SCPATH2.dc_row3.panel_pair1.panel1.valid,
		 `SCPATH2.dc_row3.panel_pair1.panel1.parity,
		 //bank11
		 //dcache site
		 `SCPATH3.dc_row0.panel_pair0.panel0.addr_array,
		 `SCPATH3.dc_row0.panel_pair0.panel0.valid,
		 `SCPATH3.dc_row0.panel_pair0.panel0.parity,	 
		 `SCPATH3.dc_row0.panel_pair0.panel1.addr_array,
		 `SCPATH3.dc_row0.panel_pair0.panel1.valid,
		 `SCPATH3.dc_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH3.dc_row0.panel_pair1.panel0.addr_array,
		 `SCPATH3.dc_row0.panel_pair1.panel0.valid,
		 `SCPATH3.dc_row0.panel_pair1.panel0.parity,	 
		 `SCPATH3.dc_row0.panel_pair1.panel1.addr_array,
		 `SCPATH3.dc_row0.panel_pair1.panel1.valid,
		 `SCPATH3.dc_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH3.dc_row1.panel_pair0.panel0.addr_array,
		 `SCPATH3.dc_row1.panel_pair0.panel0.valid,
		 `SCPATH3.dc_row1.panel_pair0.panel0.parity,	 
		 `SCPATH3.dc_row1.panel_pair0.panel1.addr_array,
		 `SCPATH3.dc_row1.panel_pair0.panel1.valid,
		 `SCPATH3.dc_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH3.dc_row1.panel_pair1.panel0.addr_array,
		 `SCPATH3.dc_row1.panel_pair1.panel0.valid,
		 `SCPATH3.dc_row1.panel_pair1.panel0.parity,	 
		 `SCPATH3.dc_row1.panel_pair1.panel1.addr_array,
		 `SCPATH3.dc_row1.panel_pair1.panel1.valid,
		 `SCPATH3.dc_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH3.dc_row2.panel_pair0.panel0.addr_array,
		 `SCPATH3.dc_row2.panel_pair0.panel0.valid,
		 `SCPATH3.dc_row2.panel_pair0.panel0.parity,	 
		 `SCPATH3.dc_row2.panel_pair0.panel1.addr_array,
		 `SCPATH3.dc_row2.panel_pair0.panel1.valid,
		 `SCPATH3.dc_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH3.dc_row2.panel_pair1.panel0.addr_array,
		 `SCPATH3.dc_row2.panel_pair1.panel0.valid,
		 `SCPATH3.dc_row2.panel_pair1.panel0.parity,	 
		 `SCPATH3.dc_row2.panel_pair1.panel1.addr_array,
		 `SCPATH3.dc_row2.panel_pair1.panel1.valid,
		 `SCPATH3.dc_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH3.dc_row3.panel_pair0.panel0.addr_array,
		 `SCPATH3.dc_row3.panel_pair0.panel0.valid,
		 `SCPATH3.dc_row3.panel_pair0.panel0.parity,	 
		 `SCPATH3.dc_row3.panel_pair0.panel1.addr_array,
		 `SCPATH3.dc_row3.panel_pair0.panel1.valid,
		 `SCPATH3.dc_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH3.dc_row3.panel_pair1.panel0.addr_array,
		 `SCPATH3.dc_row3.panel_pair1.panel0.valid,
		 `SCPATH3.dc_row3.panel_pair1.panel0.parity,	 
		 `SCPATH3.dc_row3.panel_pair1.panel1.addr_array,
		 `SCPATH3.dc_row3.panel_pair1.panel1.valid,
		 `SCPATH3.dc_row3.panel_pair1.panel1.parity,
		 
		 //bank 00
		 //icache site. location 193
		 `SCPATH0.ic_row0.panel_pair0.panel0.addr_array,
		 `SCPATH0.ic_row0.panel_pair0.panel0.valid,
		 `SCPATH0.ic_row0.panel_pair0.panel0.parity,
		 `SCPATH0.ic_row0.panel_pair0.panel1.addr_array,
		 `SCPATH0.ic_row0.panel_pair0.panel1.valid,
		 `SCPATH0.ic_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH0.ic_row0.panel_pair1.panel0.addr_array,
		 `SCPATH0.ic_row0.panel_pair1.panel0.valid,
		 `SCPATH0.ic_row0.panel_pair1.panel0.parity,	 
		 `SCPATH0.ic_row0.panel_pair1.panel1.addr_array,
		 `SCPATH0.ic_row0.panel_pair1.panel1.valid,
		 `SCPATH0.ic_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH0.ic_row1.panel_pair0.panel0.addr_array,
		 `SCPATH0.ic_row1.panel_pair0.panel0.valid,
		 `SCPATH0.ic_row1.panel_pair0.panel0.parity,	 
		 `SCPATH0.ic_row1.panel_pair0.panel1.addr_array,
		 `SCPATH0.ic_row1.panel_pair0.panel1.valid,
		 `SCPATH0.ic_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH0.ic_row1.panel_pair1.panel0.addr_array,
		 `SCPATH0.ic_row1.panel_pair1.panel0.valid,
		 `SCPATH0.ic_row1.panel_pair1.panel0.parity,	 
		 `SCPATH0.ic_row1.panel_pair1.panel1.addr_array,
		 `SCPATH0.ic_row1.panel_pair1.panel1.valid,
		 `SCPATH0.ic_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH0.ic_row2.panel_pair0.panel0.addr_array,
		 `SCPATH0.ic_row2.panel_pair0.panel0.valid,
		 `SCPATH0.ic_row2.panel_pair0.panel0.parity,	 
		 `SCPATH0.ic_row2.panel_pair0.panel1.addr_array,
		 `SCPATH0.ic_row2.panel_pair0.panel1.valid,
		 `SCPATH0.ic_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH0.ic_row2.panel_pair1.panel0.addr_array,
		 `SCPATH0.ic_row2.panel_pair1.panel0.valid,
		 `SCPATH0.ic_row2.panel_pair1.panel0.parity,	 
		 `SCPATH0.ic_row2.panel_pair1.panel1.addr_array,
		 `SCPATH0.ic_row2.panel_pair1.panel1.valid,
		 `SCPATH0.ic_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH0.ic_row3.panel_pair0.panel0.addr_array,
		 `SCPATH0.ic_row3.panel_pair0.panel0.valid,
		 `SCPATH0.ic_row3.panel_pair0.panel0.parity,	 
		 `SCPATH0.ic_row3.panel_pair0.panel1.addr_array,
		 `SCPATH0.ic_row3.panel_pair0.panel1.valid,
		 `SCPATH0.ic_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH0.ic_row3.panel_pair1.panel0.addr_array,
		 `SCPATH0.ic_row3.panel_pair1.panel0.valid,
		 `SCPATH0.ic_row3.panel_pair1.panel0.parity,	 
		 `SCPATH0.ic_row3.panel_pair1.panel1.addr_array,
		 `SCPATH0.ic_row3.panel_pair1.panel1.valid,
		 `SCPATH0.ic_row3.panel_pair1.panel1.parity,
		 
		 //bank 01
		 //icache site.
		 `SCPATH1.ic_row0.panel_pair0.panel0.addr_array,
		 `SCPATH1.ic_row0.panel_pair0.panel0.valid,
		 `SCPATH1.ic_row0.panel_pair0.panel0.parity,	 
		 `SCPATH1.ic_row0.panel_pair0.panel1.addr_array,
		 `SCPATH1.ic_row0.panel_pair0.panel1.valid,
		 `SCPATH1.ic_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH1.ic_row0.panel_pair1.panel0.addr_array,
		 `SCPATH1.ic_row0.panel_pair1.panel0.valid,
		 `SCPATH1.ic_row0.panel_pair1.panel0.parity,	 
		 `SCPATH1.ic_row0.panel_pair1.panel1.addr_array,
		 `SCPATH1.ic_row0.panel_pair1.panel1.valid,
		 `SCPATH1.ic_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH1.ic_row1.panel_pair0.panel0.addr_array,
		 `SCPATH1.ic_row1.panel_pair0.panel0.valid,
		 `SCPATH1.ic_row1.panel_pair0.panel0.parity,	 
		 `SCPATH1.ic_row1.panel_pair0.panel1.addr_array,
		 `SCPATH1.ic_row1.panel_pair0.panel1.valid,
		 `SCPATH1.ic_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH1.ic_row1.panel_pair1.panel0.addr_array,
		 `SCPATH1.ic_row1.panel_pair1.panel0.valid,
		 `SCPATH1.ic_row1.panel_pair1.panel0.parity,	 
		 `SCPATH1.ic_row1.panel_pair1.panel1.addr_array,
		 `SCPATH1.ic_row1.panel_pair1.panel1.valid,
		 `SCPATH1.ic_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH1.ic_row2.panel_pair0.panel0.addr_array,
		 `SCPATH1.ic_row2.panel_pair0.panel0.valid,
		 `SCPATH1.ic_row2.panel_pair0.panel0.parity,	 
		 `SCPATH1.ic_row2.panel_pair0.panel1.addr_array,
		 `SCPATH1.ic_row2.panel_pair0.panel1.valid,
		 `SCPATH1.ic_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH1.ic_row2.panel_pair1.panel0.addr_array,
		 `SCPATH1.ic_row2.panel_pair1.panel0.valid,
		 `SCPATH1.ic_row2.panel_pair1.panel0.parity,	 
		 `SCPATH1.ic_row2.panel_pair1.panel1.addr_array,
		 `SCPATH1.ic_row2.panel_pair1.panel1.valid,
		 `SCPATH1.ic_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH1.ic_row3.panel_pair0.panel0.addr_array,
		 `SCPATH1.ic_row3.panel_pair0.panel0.valid,
		 `SCPATH1.ic_row3.panel_pair0.panel0.parity,	 
		 `SCPATH1.ic_row3.panel_pair0.panel1.addr_array,
		 `SCPATH1.ic_row3.panel_pair0.panel1.valid,
		 `SCPATH1.ic_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH1.ic_row3.panel_pair1.panel0.addr_array,
		 `SCPATH1.ic_row3.panel_pair1.panel0.valid,
		 `SCPATH1.ic_row3.panel_pair1.panel0.parity,	 
		 `SCPATH1.ic_row3.panel_pair1.panel1.addr_array,
		 `SCPATH1.ic_row3.panel_pair1.panel1.valid,
		 `SCPATH1.ic_row3.panel_pair1.panel1.parity,
		 
		 //bank 10
		 //icache site.
		 `SCPATH2.ic_row0.panel_pair0.panel0.addr_array,
		 `SCPATH2.ic_row0.panel_pair0.panel0.valid,
		 `SCPATH2.ic_row0.panel_pair0.panel0.parity,	 
		 `SCPATH2.ic_row0.panel_pair0.panel1.addr_array,
		 `SCPATH2.ic_row0.panel_pair0.panel1.valid,
		 `SCPATH2.ic_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH2.ic_row0.panel_pair1.panel0.addr_array,
		 `SCPATH2.ic_row0.panel_pair1.panel0.valid,
		 `SCPATH2.ic_row0.panel_pair1.panel0.parity,	 
		 `SCPATH2.ic_row0.panel_pair1.panel1.addr_array,
		 `SCPATH2.ic_row0.panel_pair1.panel1.valid,
		 `SCPATH2.ic_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH2.ic_row1.panel_pair0.panel0.addr_array,
		 `SCPATH2.ic_row1.panel_pair0.panel0.valid,
		 `SCPATH2.ic_row1.panel_pair0.panel0.parity,	 
		 `SCPATH2.ic_row1.panel_pair0.panel1.addr_array,
		 `SCPATH2.ic_row1.panel_pair0.panel1.valid,
		 `SCPATH2.ic_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH2.ic_row1.panel_pair1.panel0.addr_array,
		 `SCPATH2.ic_row1.panel_pair1.panel0.valid,
		 `SCPATH2.ic_row1.panel_pair1.panel0.parity,	 
		 `SCPATH2.ic_row1.panel_pair1.panel1.addr_array,
		 `SCPATH2.ic_row1.panel_pair1.panel1.valid,
		 `SCPATH2.ic_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH2.ic_row2.panel_pair0.panel0.addr_array,
		 `SCPATH2.ic_row2.panel_pair0.panel0.valid,
		 `SCPATH2.ic_row2.panel_pair0.panel0.parity,	 
		 `SCPATH2.ic_row2.panel_pair0.panel1.addr_array,
		 `SCPATH2.ic_row2.panel_pair0.panel1.valid,
		 `SCPATH2.ic_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH2.ic_row2.panel_pair1.panel0.addr_array,
		 `SCPATH2.ic_row2.panel_pair1.panel0.valid,
		 `SCPATH2.ic_row2.panel_pair1.panel0.parity,	 
		 `SCPATH2.ic_row2.panel_pair1.panel1.addr_array,
		 `SCPATH2.ic_row2.panel_pair1.panel1.valid,
		 `SCPATH2.ic_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH2.ic_row3.panel_pair0.panel0.addr_array,
		 `SCPATH2.ic_row3.panel_pair0.panel0.valid,
		 `SCPATH2.ic_row3.panel_pair0.panel0.parity,	 
		 `SCPATH2.ic_row3.panel_pair0.panel1.addr_array,
		 `SCPATH2.ic_row3.panel_pair0.panel1.valid,
		 `SCPATH2.ic_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH2.ic_row3.panel_pair1.panel0.addr_array,
		 `SCPATH2.ic_row3.panel_pair1.panel0.valid,
		 `SCPATH2.ic_row3.panel_pair1.panel0.parity,	 
		 `SCPATH2.ic_row3.panel_pair1.panel1.addr_array,
		 `SCPATH2.ic_row3.panel_pair1.panel1.valid,
		 `SCPATH2.ic_row3.panel_pair1.panel1.parity,
		 
		 //bank11
		 //icache site.
		 `SCPATH3.ic_row0.panel_pair0.panel0.addr_array,
		 `SCPATH3.ic_row0.panel_pair0.panel0.valid,
		 `SCPATH3.ic_row0.panel_pair0.panel0.parity,	 
		 `SCPATH3.ic_row0.panel_pair0.panel1.addr_array,
		 `SCPATH3.ic_row0.panel_pair0.panel1.valid,
		 `SCPATH3.ic_row0.panel_pair0.panel1.parity,
		 
		 `SCPATH3.ic_row0.panel_pair1.panel0.addr_array,
		 `SCPATH3.ic_row0.panel_pair1.panel0.valid,
		 `SCPATH3.ic_row0.panel_pair1.panel0.parity,	 
		 `SCPATH3.ic_row0.panel_pair1.panel1.addr_array,
		 `SCPATH3.ic_row0.panel_pair1.panel1.valid,
		 `SCPATH3.ic_row0.panel_pair1.panel1.parity,
		 
		 `SCPATH3.ic_row1.panel_pair0.panel0.addr_array,
		 `SCPATH3.ic_row1.panel_pair0.panel0.valid,
		 `SCPATH3.ic_row1.panel_pair0.panel0.parity,	 
		 `SCPATH3.ic_row1.panel_pair0.panel1.addr_array,
		 `SCPATH3.ic_row1.panel_pair0.panel1.valid,
		 `SCPATH3.ic_row1.panel_pair0.panel1.parity,
		 
		 `SCPATH3.ic_row1.panel_pair1.panel0.addr_array,
		 `SCPATH3.ic_row1.panel_pair1.panel0.valid,
		 `SCPATH3.ic_row1.panel_pair1.panel0.parity,	 
		 `SCPATH3.ic_row1.panel_pair1.panel1.addr_array,
		 `SCPATH3.ic_row1.panel_pair1.panel1.valid,
		 `SCPATH3.ic_row1.panel_pair1.panel1.parity,
		 
		 `SCPATH3.ic_row2.panel_pair0.panel0.addr_array,
		 `SCPATH3.ic_row2.panel_pair0.panel0.valid,
		 `SCPATH3.ic_row2.panel_pair0.panel0.parity,	 
		 `SCPATH3.ic_row2.panel_pair0.panel1.addr_array,
		 `SCPATH3.ic_row2.panel_pair0.panel1.valid,
		 `SCPATH3.ic_row2.panel_pair0.panel1.parity,
		 
		 `SCPATH3.ic_row2.panel_pair1.panel0.addr_array,
		 `SCPATH3.ic_row2.panel_pair1.panel0.valid,
		 `SCPATH3.ic_row2.panel_pair1.panel0.parity,	 
		 `SCPATH3.ic_row2.panel_pair1.panel1.addr_array,
		 `SCPATH3.ic_row2.panel_pair1.panel1.valid,
		 `SCPATH3.ic_row2.panel_pair1.panel1.parity,
		 
		 `SCPATH3.ic_row3.panel_pair0.panel0.addr_array,
		 `SCPATH3.ic_row3.panel_pair0.panel0.valid,
		 `SCPATH3.ic_row3.panel_pair0.panel0.parity,	 
		 `SCPATH3.ic_row3.panel_pair0.panel1.addr_array,
		 `SCPATH3.ic_row3.panel_pair0.panel1.valid,
		 `SCPATH3.ic_row3.panel_pair0.panel1.parity,
		 
		 `SCPATH3.ic_row3.panel_pair1.panel0.addr_array,
		 `SCPATH3.ic_row3.panel_pair1.panel0.valid,
		 `SCPATH3.ic_row3.panel_pair1.panel0.parity,	 
		 `SCPATH3.ic_row3.panel_pair1.panel1.addr_array,
		 `SCPATH3.ic_row3.panel_pair1.panel1.valid,
		 `SCPATH3.ic_row3.panel_pair1.panel1.parity,
		 
		 //dcache signals, arg location. 193
		 `ifdef RTL_SPARC0
		 //dcache
		 `SPCPATH0.lsu.dcache.w0,
		 `SPCPATH0.lsu.dcache.w1,
		 `SPCPATH0.lsu.dcache.w2,
		 `SPCPATH0.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary0,
	   	{`SPCPATH0.lsu.dva.idcv_ary_1111,
	   	`SPCPATH0.lsu.dva.idcv_ary_1110,
	   	`SPCPATH0.lsu.dva.idcv_ary_1101,
	   	`SPCPATH0.lsu.dva.idcv_ary_1100,
	   	`SPCPATH0.lsu.dva.idcv_ary_1011,
	   	`SPCPATH0.lsu.dva.idcv_ary_1010,
	   	`SPCPATH0.lsu.dva.idcv_ary_1001,
	   	`SPCPATH0.lsu.dva.idcv_ary_1000,
	   	`SPCPATH0.lsu.dva.idcv_ary_0111,
	   	`SPCPATH0.lsu.dva.idcv_ary_0110,
	   	`SPCPATH0.lsu.dva.idcv_ary_0101,
	   	`SPCPATH0.lsu.dva.idcv_ary_0100,
	   	`SPCPATH0.lsu.dva.idcv_ary_0011,
	   	`SPCPATH0.lsu.dva.idcv_ary_0010,
	   	`SPCPATH0.lsu.dva.idcv_ary_0001,
           	`SPCPATH0.lsu.dva.idcv_ary_0000},
`else
		 `SPCPATH0.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH0.lsu.dva.idcv_ary,//bw_r_rf16x32.v
`endif
`ifdef FPGA_SYN_ICD
		 icdata_ary0,
`else
		 //icache
		 `SPCPATH0.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
`endif
`ifdef FPGA_SYN_IDCT
		 ifu_ictag_ary0,
	   	{`SPCPATH0.ifu.icv.idcv_ary_1111,
	   	`SPCPATH0.ifu.icv.idcv_ary_1110,
	   	`SPCPATH0.ifu.icv.idcv_ary_1101,
	   	`SPCPATH0.ifu.icv.idcv_ary_1100,
	   	`SPCPATH0.ifu.icv.idcv_ary_1011,
	   	`SPCPATH0.ifu.icv.idcv_ary_1010,
	   	`SPCPATH0.ifu.icv.idcv_ary_1001,
	   	`SPCPATH0.ifu.icv.idcv_ary_1000,
	   	`SPCPATH0.ifu.icv.idcv_ary_0111,
	   	`SPCPATH0.ifu.icv.idcv_ary_0110,
	   	`SPCPATH0.ifu.icv.idcv_ary_0101,
	   	`SPCPATH0.ifu.icv.idcv_ary_0100,
	   	`SPCPATH0.ifu.icv.idcv_ary_0011,
	   	`SPCPATH0.ifu.icv.idcv_ary_0010,
	   	`SPCPATH0.ifu.icv.idcv_ary_0001,
           	`SPCPATH0.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH0.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH0.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC0
		 
		 `ifdef RTL_SPARC1
		 //dcache
		 `SPCPATH1.lsu.dcache.w0,
		 `SPCPATH1.lsu.dcache.w1,
		 `SPCPATH1.lsu.dcache.w2,
		 `SPCPATH1.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary1,
	   	{`SPCPATH1.lsu.dva.idcv_ary_1111,
	   	`SPCPATH1.lsu.dva.idcv_ary_1110,
	   	`SPCPATH1.lsu.dva.idcv_ary_1101,
	   	`SPCPATH1.lsu.dva.idcv_ary_1100,
	   	`SPCPATH1.lsu.dva.idcv_ary_1011,
	   	`SPCPATH1.lsu.dva.idcv_ary_1010,
	   	`SPCPATH1.lsu.dva.idcv_ary_1001,
	   	`SPCPATH1.lsu.dva.idcv_ary_1000,
	   	`SPCPATH1.lsu.dva.idcv_ary_0111,
	   	`SPCPATH1.lsu.dva.idcv_ary_0110,
	   	`SPCPATH1.lsu.dva.idcv_ary_0101,
	   	`SPCPATH1.lsu.dva.idcv_ary_0100,
	   	`SPCPATH1.lsu.dva.idcv_ary_0011,
	   	`SPCPATH1.lsu.dva.idcv_ary_0010,
	   	`SPCPATH1.lsu.dva.idcv_ary_0001,
           	`SPCPATH1.lsu.dva.idcv_ary_0000},
		 icdata_ary1,
		 ifu_ictag_ary1,
	   	{`SPCPATH1.ifu.icv.idcv_ary_1111,
	   	`SPCPATH1.ifu.icv.idcv_ary_1110,
	   	`SPCPATH1.ifu.icv.idcv_ary_1101,
	   	`SPCPATH1.ifu.icv.idcv_ary_1100,
	   	`SPCPATH1.ifu.icv.idcv_ary_1011,
	   	`SPCPATH1.ifu.icv.idcv_ary_1010,
	   	`SPCPATH1.ifu.icv.idcv_ary_1001,
	   	`SPCPATH1.ifu.icv.idcv_ary_1000,
	   	`SPCPATH1.ifu.icv.idcv_ary_0111,
	   	`SPCPATH1.ifu.icv.idcv_ary_0110,
	   	`SPCPATH1.ifu.icv.idcv_ary_0101,
	   	`SPCPATH1.ifu.icv.idcv_ary_0100,
	   	`SPCPATH1.ifu.icv.idcv_ary_0011,
	   	`SPCPATH1.ifu.icv.idcv_ary_0010,
	   	`SPCPATH1.ifu.icv.idcv_ary_0001,
           	`SPCPATH1.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH1.lsu.dtag.ictag_ary,//bw_r_idct.v

		 `SPCPATH1.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH1.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH1.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH1.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC1

		 `ifdef RTL_SPARC2
		 //dcache
		 `SPCPATH2.lsu.dcache.w0,
		 `SPCPATH2.lsu.dcache.w1,
		 `SPCPATH2.lsu.dcache.w2,
		 `SPCPATH2.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary2,
	   	{`SPCPATH2.lsu.dva.idcv_ary_1111,
	   	`SPCPATH2.lsu.dva.idcv_ary_1110,
	   	`SPCPATH2.lsu.dva.idcv_ary_1101,
	   	`SPCPATH2.lsu.dva.idcv_ary_1100,
	   	`SPCPATH2.lsu.dva.idcv_ary_1011,
	   	`SPCPATH2.lsu.dva.idcv_ary_1010,
	   	`SPCPATH2.lsu.dva.idcv_ary_1001,
	   	`SPCPATH2.lsu.dva.idcv_ary_1000,
	   	`SPCPATH2.lsu.dva.idcv_ary_0111,
	   	`SPCPATH2.lsu.dva.idcv_ary_0110,
	   	`SPCPATH2.lsu.dva.idcv_ary_0101,
	   	`SPCPATH2.lsu.dva.idcv_ary_0100,
	   	`SPCPATH2.lsu.dva.idcv_ary_0011,
	   	`SPCPATH2.lsu.dva.idcv_ary_0010,
	   	`SPCPATH2.lsu.dva.idcv_ary_0001,
           	`SPCPATH2.lsu.dva.idcv_ary_0000},
		 icdata_ary2,
		 ifu_ictag_ary2,
	   	{`SPCPATH2.ifu.icv.idcv_ary_1111,
	   	`SPCPATH2.ifu.icv.idcv_ary_1110,
	   	`SPCPATH2.ifu.icv.idcv_ary_1101,
	   	`SPCPATH2.ifu.icv.idcv_ary_1100,
	   	`SPCPATH2.ifu.icv.idcv_ary_1011,
	   	`SPCPATH2.ifu.icv.idcv_ary_1010,
	   	`SPCPATH2.ifu.icv.idcv_ary_1001,
	   	`SPCPATH2.ifu.icv.idcv_ary_1000,
	   	`SPCPATH2.ifu.icv.idcv_ary_0111,
	   	`SPCPATH2.ifu.icv.idcv_ary_0110,
	   	`SPCPATH2.ifu.icv.idcv_ary_0101,
	   	`SPCPATH2.ifu.icv.idcv_ary_0100,
	   	`SPCPATH2.ifu.icv.idcv_ary_0011,
	   	`SPCPATH2.ifu.icv.idcv_ary_0010,
	   	`SPCPATH2.ifu.icv.idcv_ary_0001,
           	`SPCPATH2.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH2.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH2.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH2.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH2.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH2.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC2
		 
		 `ifdef RTL_SPARC3
		 //dcache
		 `SPCPATH3.lsu.dcache.w0,
		 `SPCPATH3.lsu.dcache.w1,
		 `SPCPATH3.lsu.dcache.w2,
		 `SPCPATH3.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary3,
	   	{`SPCPATH3.lsu.dva.idcv_ary_1111,
	   	`SPCPATH3.lsu.dva.idcv_ary_1110,
	   	`SPCPATH3.lsu.dva.idcv_ary_1101,
	   	`SPCPATH3.lsu.dva.idcv_ary_1100,
	   	`SPCPATH3.lsu.dva.idcv_ary_1011,
	   	`SPCPATH3.lsu.dva.idcv_ary_1010,
	   	`SPCPATH3.lsu.dva.idcv_ary_1001,
	   	`SPCPATH3.lsu.dva.idcv_ary_1000,
	   	`SPCPATH3.lsu.dva.idcv_ary_0111,
	   	`SPCPATH3.lsu.dva.idcv_ary_0110,
	   	`SPCPATH3.lsu.dva.idcv_ary_0101,
	   	`SPCPATH3.lsu.dva.idcv_ary_0100,
	   	`SPCPATH3.lsu.dva.idcv_ary_0011,
	   	`SPCPATH3.lsu.dva.idcv_ary_0010,
	   	`SPCPATH3.lsu.dva.idcv_ary_0001,
           	`SPCPATH3.lsu.dva.idcv_ary_0000},
		 icdata_ary3,
		 ifu_ictag_ary3,
	   	{`SPCPATH3.ifu.icv.idcv_ary_1111,
	   	`SPCPATH3.ifu.icv.idcv_ary_1110,
	   	`SPCPATH3.ifu.icv.idcv_ary_1101,
	   	`SPCPATH3.ifu.icv.idcv_ary_1100,
	   	`SPCPATH3.ifu.icv.idcv_ary_1011,
	   	`SPCPATH3.ifu.icv.idcv_ary_1010,
	   	`SPCPATH3.ifu.icv.idcv_ary_1001,
	   	`SPCPATH3.ifu.icv.idcv_ary_1000,
	   	`SPCPATH3.ifu.icv.idcv_ary_0111,
	   	`SPCPATH3.ifu.icv.idcv_ary_0110,
	   	`SPCPATH3.ifu.icv.idcv_ary_0101,
	   	`SPCPATH3.ifu.icv.idcv_ary_0100,
	   	`SPCPATH3.ifu.icv.idcv_ary_0011,
	   	`SPCPATH3.ifu.icv.idcv_ary_0010,
	   	`SPCPATH3.ifu.icv.idcv_ary_0001,
           	`SPCPATH3.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH3.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH3.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH3.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH3.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH3.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC3

		 `ifdef RTL_SPARC4
		 //dcache
		 `SPCPATH4.lsu.dcache.w0,
		 `SPCPATH4.lsu.dcache.w1,
		 `SPCPATH4.lsu.dcache.w2,
		 `SPCPATH4.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary4,
	   	{`SPCPATH4.lsu.dva.idcv_ary_1111,
	   	`SPCPATH4.lsu.dva.idcv_ary_1110,
	   	`SPCPATH4.lsu.dva.idcv_ary_1101,
	   	`SPCPATH4.lsu.dva.idcv_ary_1100,
	   	`SPCPATH4.lsu.dva.idcv_ary_1011,
	   	`SPCPATH4.lsu.dva.idcv_ary_1010,
	   	`SPCPATH4.lsu.dva.idcv_ary_1001,
	   	`SPCPATH4.lsu.dva.idcv_ary_1000,
	   	`SPCPATH4.lsu.dva.idcv_ary_0111,
	   	`SPCPATH4.lsu.dva.idcv_ary_0110,
	   	`SPCPATH4.lsu.dva.idcv_ary_0101,
	   	`SPCPATH4.lsu.dva.idcv_ary_0100,
	   	`SPCPATH4.lsu.dva.idcv_ary_0011,
	   	`SPCPATH4.lsu.dva.idcv_ary_0010,
	   	`SPCPATH4.lsu.dva.idcv_ary_0001,
           	`SPCPATH4.lsu.dva.idcv_ary_0000},
		 icdata_ary4,
		 ifu_ictag_ary4,
	   	{`SPCPATH4.ifu.icv.idcv_ary_1111,
	   	`SPCPATH4.ifu.icv.idcv_ary_1110,
	   	`SPCPATH4.ifu.icv.idcv_ary_1101,
	   	`SPCPATH4.ifu.icv.idcv_ary_1100,
	   	`SPCPATH4.ifu.icv.idcv_ary_1011,
	   	`SPCPATH4.ifu.icv.idcv_ary_1010,
	   	`SPCPATH4.ifu.icv.idcv_ary_1001,
	   	`SPCPATH4.ifu.icv.idcv_ary_1000,
	   	`SPCPATH4.ifu.icv.idcv_ary_0111,
	   	`SPCPATH4.ifu.icv.idcv_ary_0110,
	   	`SPCPATH4.ifu.icv.idcv_ary_0101,
	   	`SPCPATH4.ifu.icv.idcv_ary_0100,
	   	`SPCPATH4.ifu.icv.idcv_ary_0011,
	   	`SPCPATH4.ifu.icv.idcv_ary_0010,
	   	`SPCPATH4.ifu.icv.idcv_ary_0001,
           	`SPCPATH4.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH4.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH4.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH4.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH4.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH4.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC4
		 
		 `ifdef RTL_SPARC5
		 //dcache
		 `SPCPATH5.lsu.dcache.w0,
		 `SPCPATH5.lsu.dcache.w1,
		 `SPCPATH5.lsu.dcache.w2,
		 `SPCPATH5.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary5,
	   	{`SPCPATH5.lsu.dva.idcv_ary_1111,
	   	`SPCPATH5.lsu.dva.idcv_ary_1110,
	   	`SPCPATH5.lsu.dva.idcv_ary_1101,
	   	`SPCPATH5.lsu.dva.idcv_ary_1100,
	   	`SPCPATH5.lsu.dva.idcv_ary_1011,
	   	`SPCPATH5.lsu.dva.idcv_ary_1010,
	   	`SPCPATH5.lsu.dva.idcv_ary_1001,
	   	`SPCPATH5.lsu.dva.idcv_ary_1000,
	   	`SPCPATH5.lsu.dva.idcv_ary_0111,
	   	`SPCPATH5.lsu.dva.idcv_ary_0110,
	   	`SPCPATH5.lsu.dva.idcv_ary_0101,
	   	`SPCPATH5.lsu.dva.idcv_ary_0100,
	   	`SPCPATH5.lsu.dva.idcv_ary_0011,
	   	`SPCPATH5.lsu.dva.idcv_ary_0010,
	   	`SPCPATH5.lsu.dva.idcv_ary_0001,
           	`SPCPATH5.lsu.dva.idcv_ary_0000},
		 icdata_ary5,
		 ifu_ictag_ary5,
	   	{`SPCPATH5.ifu.icv.idcv_ary_1111,
	   	`SPCPATH5.ifu.icv.idcv_ary_1110,
	   	`SPCPATH5.ifu.icv.idcv_ary_1101,
	   	`SPCPATH5.ifu.icv.idcv_ary_1100,
	   	`SPCPATH5.ifu.icv.idcv_ary_1011,
	   	`SPCPATH5.ifu.icv.idcv_ary_1010,
	   	`SPCPATH5.ifu.icv.idcv_ary_1001,
	   	`SPCPATH5.ifu.icv.idcv_ary_1000,
	   	`SPCPATH5.ifu.icv.idcv_ary_0111,
	   	`SPCPATH5.ifu.icv.idcv_ary_0110,
	   	`SPCPATH5.ifu.icv.idcv_ary_0101,
	   	`SPCPATH5.ifu.icv.idcv_ary_0100,
	   	`SPCPATH5.ifu.icv.idcv_ary_0011,
	   	`SPCPATH5.ifu.icv.idcv_ary_0010,
	   	`SPCPATH5.ifu.icv.idcv_ary_0001,
           	`SPCPATH5.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH5.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH5.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH5.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH5.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH5.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC5

		 `ifdef RTL_SPARC6
		 //dcache
		 `SPCPATH6.lsu.dcache.w0,
		 `SPCPATH6.lsu.dcache.w1,
		 `SPCPATH6.lsu.dcache.w2,
		 `SPCPATH6.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary6,
	   	{`SPCPATH6.lsu.dva.idcv_ary_1111,
	   	`SPCPATH6.lsu.dva.idcv_ary_1110,
	   	`SPCPATH6.lsu.dva.idcv_ary_1101,
	   	`SPCPATH6.lsu.dva.idcv_ary_1100,
	   	`SPCPATH6.lsu.dva.idcv_ary_1011,
	   	`SPCPATH6.lsu.dva.idcv_ary_1010,
	   	`SPCPATH6.lsu.dva.idcv_ary_1001,
	   	`SPCPATH6.lsu.dva.idcv_ary_1000,
	   	`SPCPATH6.lsu.dva.idcv_ary_0111,
	   	`SPCPATH6.lsu.dva.idcv_ary_0110,
	   	`SPCPATH6.lsu.dva.idcv_ary_0101,
	   	`SPCPATH6.lsu.dva.idcv_ary_0100,
	   	`SPCPATH6.lsu.dva.idcv_ary_0011,
	   	`SPCPATH6.lsu.dva.idcv_ary_0010,
	   	`SPCPATH6.lsu.dva.idcv_ary_0001,
           	`SPCPATH6.lsu.dva.idcv_ary_0000},
		 icdata_ary6,
		 ifu_ictag_ary6,
	   	{`SPCPATH6.ifu.icv.idcv_ary_1111,
	   	`SPCPATH6.ifu.icv.idcv_ary_1110,
	   	`SPCPATH6.ifu.icv.idcv_ary_1101,
	   	`SPCPATH6.ifu.icv.idcv_ary_1100,
	   	`SPCPATH6.ifu.icv.idcv_ary_1011,
	   	`SPCPATH6.ifu.icv.idcv_ary_1010,
	   	`SPCPATH6.ifu.icv.idcv_ary_1001,
	   	`SPCPATH6.ifu.icv.idcv_ary_1000,
	   	`SPCPATH6.ifu.icv.idcv_ary_0111,
	   	`SPCPATH6.ifu.icv.idcv_ary_0110,
	   	`SPCPATH6.ifu.icv.idcv_ary_0101,
	   	`SPCPATH6.ifu.icv.idcv_ary_0100,
	   	`SPCPATH6.ifu.icv.idcv_ary_0011,
	   	`SPCPATH6.ifu.icv.idcv_ary_0010,
	   	`SPCPATH6.ifu.icv.idcv_ary_0001,
           	`SPCPATH6.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH6.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH6.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH6.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH6.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH6.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC6

		 `ifdef RTL_SPARC7
		 //dcache
		 `SPCPATH7.lsu.dcache.w0,
		 `SPCPATH7.lsu.dcache.w1,
		 `SPCPATH7.lsu.dcache.w2,
		 `SPCPATH7.lsu.dcache.w3,
`ifdef FPGA_SYN
		 lsu_ictag_ary7,
	   	{`SPCPATH7.lsu.dva.idcv_ary_1111,
	   	`SPCPATH7.lsu.dva.idcv_ary_1110,
	   	`SPCPATH7.lsu.dva.idcv_ary_1101,
	   	`SPCPATH7.lsu.dva.idcv_ary_1100,
	   	`SPCPATH7.lsu.dva.idcv_ary_1011,
	   	`SPCPATH7.lsu.dva.idcv_ary_1010,
	   	`SPCPATH7.lsu.dva.idcv_ary_1001,
	   	`SPCPATH7.lsu.dva.idcv_ary_1000,
	   	`SPCPATH7.lsu.dva.idcv_ary_0111,
	   	`SPCPATH7.lsu.dva.idcv_ary_0110,
	   	`SPCPATH7.lsu.dva.idcv_ary_0101,
	   	`SPCPATH7.lsu.dva.idcv_ary_0100,
	   	`SPCPATH7.lsu.dva.idcv_ary_0011,
	   	`SPCPATH7.lsu.dva.idcv_ary_0010,
	   	`SPCPATH7.lsu.dva.idcv_ary_0001,
           	`SPCPATH7.lsu.dva.idcv_ary_0000},
		 icdata_ary7,
		 ifu_ictag_ary7,
	   	{`SPCPATH7.ifu.icv.idcv_ary_1111,
	   	`SPCPATH7.ifu.icv.idcv_ary_1110,
	   	`SPCPATH7.ifu.icv.idcv_ary_1101,
	   	`SPCPATH7.ifu.icv.idcv_ary_1100,
	   	`SPCPATH7.ifu.icv.idcv_ary_1011,
	   	`SPCPATH7.ifu.icv.idcv_ary_1010,
	   	`SPCPATH7.ifu.icv.idcv_ary_1001,
	   	`SPCPATH7.ifu.icv.idcv_ary_1000,
	   	`SPCPATH7.ifu.icv.idcv_ary_0111,
	   	`SPCPATH7.ifu.icv.idcv_ary_0110,
	   	`SPCPATH7.ifu.icv.idcv_ary_0101,
	   	`SPCPATH7.ifu.icv.idcv_ary_0100,
	   	`SPCPATH7.ifu.icv.idcv_ary_0011,
	   	`SPCPATH7.ifu.icv.idcv_ary_0010,
	   	`SPCPATH7.ifu.icv.idcv_ary_0001,
           	`SPCPATH7.ifu.icv.idcv_ary_0000},
`else
		 `SPCPATH7.lsu.dtag.ictag_ary,//bw_r_idct.v
		 `SPCPATH7.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		 //icache
		 `SPCPATH7.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		 `SPCPATH7.ifu.ict.ictag_ary,//bw_r_idct.v
		 `SPCPATH7.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		 `endif //  `ifdef RTL_SPARC7
		 );
	//slam cache
	$slam_cache(
		    //bank00 //bw_r_dcm.v
		    //dcache site
		    1, 
		    cpu_status,
		    //dcache signals, arg location. 193
		    `ifdef RTL_SPARC0
		    //dcache
		    `SPCPATH0.lsu.dcache.w0,
		    `SPCPATH0.lsu.dcache.w1,
		    `SPCPATH0.lsu.dcache.w2,
		    `SPCPATH0.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		lsu_ictag_ary0,
	   	{`SPCPATH0.lsu.dva.idcv_ary_1111,
	   	`SPCPATH0.lsu.dva.idcv_ary_1110,
	   	`SPCPATH0.lsu.dva.idcv_ary_1101,
	   	`SPCPATH0.lsu.dva.idcv_ary_1100,
	   	`SPCPATH0.lsu.dva.idcv_ary_1011,
	   	`SPCPATH0.lsu.dva.idcv_ary_1010,
	   	`SPCPATH0.lsu.dva.idcv_ary_1001,
	   	`SPCPATH0.lsu.dva.idcv_ary_1000,
	   	`SPCPATH0.lsu.dva.idcv_ary_0111,
	   	`SPCPATH0.lsu.dva.idcv_ary_0110,
	   	`SPCPATH0.lsu.dva.idcv_ary_0101,
	   	`SPCPATH0.lsu.dva.idcv_ary_0100,
	   	`SPCPATH0.lsu.dva.idcv_ary_0011,
	   	`SPCPATH0.lsu.dva.idcv_ary_0010,
	   	`SPCPATH0.lsu.dva.idcv_ary_0001,
           	`SPCPATH0.lsu.dva.idcv_ary_0000},
`else
		    `SPCPATH0.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH0.lsu.dva.idcv_ary,//bw_r_rf16x32.v
`endif
`ifdef FPGA_SYN_ICD
		 icdata_ary0,
`else
		    //icache
		    `SPCPATH0.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
`endif
`ifdef FPGA_SYN_IDCT
		 ifu_ictag_ary0,
	   	{`SPCPATH0.ifu.icv.idcv_ary_1111,
	   	`SPCPATH0.ifu.icv.idcv_ary_1110,
	   	`SPCPATH0.ifu.icv.idcv_ary_1101,
	   	`SPCPATH0.ifu.icv.idcv_ary_1100,
	   	`SPCPATH0.ifu.icv.idcv_ary_1011,
	   	`SPCPATH0.ifu.icv.idcv_ary_1010,
	   	`SPCPATH0.ifu.icv.idcv_ary_1001,
	   	`SPCPATH0.ifu.icv.idcv_ary_1000,
	   	`SPCPATH0.ifu.icv.idcv_ary_0111,
	   	`SPCPATH0.ifu.icv.idcv_ary_0110,
	   	`SPCPATH0.ifu.icv.idcv_ary_0101,
	   	`SPCPATH0.ifu.icv.idcv_ary_0100,
	   	`SPCPATH0.ifu.icv.idcv_ary_0011,
	   	`SPCPATH0.ifu.icv.idcv_ary_0010,
	   	`SPCPATH0.ifu.icv.idcv_ary_0001,
           	`SPCPATH0.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH0.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH0.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC0
		    
		    `ifdef RTL_SPARC1
		    //dcache
		    `SPCPATH1.lsu.dcache.w0,
		    `SPCPATH1.lsu.dcache.w1,
		    `SPCPATH1.lsu.dcache.w2,
		    `SPCPATH1.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary1,
	   	{`SPCPATH1.lsu.dva.idcv_ary_1111,
	   	`SPCPATH1.lsu.dva.idcv_ary_1110,
	   	`SPCPATH1.lsu.dva.idcv_ary_1101,
	   	`SPCPATH1.lsu.dva.idcv_ary_1100,
	   	`SPCPATH1.lsu.dva.idcv_ary_1011,
	   	`SPCPATH1.lsu.dva.idcv_ary_1010,
	   	`SPCPATH1.lsu.dva.idcv_ary_1001,
	   	`SPCPATH1.lsu.dva.idcv_ary_1000,
	   	`SPCPATH1.lsu.dva.idcv_ary_0111,
	   	`SPCPATH1.lsu.dva.idcv_ary_0110,
	   	`SPCPATH1.lsu.dva.idcv_ary_0101,
	   	`SPCPATH1.lsu.dva.idcv_ary_0100,
	   	`SPCPATH1.lsu.dva.idcv_ary_0011,
	   	`SPCPATH1.lsu.dva.idcv_ary_0010,
	   	`SPCPATH1.lsu.dva.idcv_ary_0001,
           	`SPCPATH1.lsu.dva.idcv_ary_0000},
		 icdata_ary1,
		 ifu_ictag_ary1,
	   	{`SPCPATH1.ifu.icv.idcv_ary_1111,
	   	`SPCPATH1.ifu.icv.idcv_ary_1110,
	   	`SPCPATH1.ifu.icv.idcv_ary_1101,
	   	`SPCPATH1.ifu.icv.idcv_ary_1100,
	   	`SPCPATH1.ifu.icv.idcv_ary_1011,
	   	`SPCPATH1.ifu.icv.idcv_ary_1010,
	   	`SPCPATH1.ifu.icv.idcv_ary_1001,
	   	`SPCPATH1.ifu.icv.idcv_ary_1000,
	   	`SPCPATH1.ifu.icv.idcv_ary_0111,
	   	`SPCPATH1.ifu.icv.idcv_ary_0110,
	   	`SPCPATH1.ifu.icv.idcv_ary_0101,
	   	`SPCPATH1.ifu.icv.idcv_ary_0100,
	   	`SPCPATH1.ifu.icv.idcv_ary_0011,
	   	`SPCPATH1.ifu.icv.idcv_ary_0010,
	   	`SPCPATH1.ifu.icv.idcv_ary_0001,
           	`SPCPATH1.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH1.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH1.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH1.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH1.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH1.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC1
		    
		    `ifdef RTL_SPARC2
		    //dcache
		    `SPCPATH2.lsu.dcache.w0,
		    `SPCPATH2.lsu.dcache.w1,
		    `SPCPATH2.lsu.dcache.w2,
		    `SPCPATH2.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary2,
	   	{`SPCPATH2.lsu.dva.idcv_ary_1111,
	   	`SPCPATH2.lsu.dva.idcv_ary_1110,
	   	`SPCPATH2.lsu.dva.idcv_ary_1101,
	   	`SPCPATH2.lsu.dva.idcv_ary_1100,
	   	`SPCPATH2.lsu.dva.idcv_ary_1011,
	   	`SPCPATH2.lsu.dva.idcv_ary_1010,
	   	`SPCPATH2.lsu.dva.idcv_ary_1001,
	   	`SPCPATH2.lsu.dva.idcv_ary_1000,
	   	`SPCPATH2.lsu.dva.idcv_ary_0111,
	   	`SPCPATH2.lsu.dva.idcv_ary_0110,
	   	`SPCPATH2.lsu.dva.idcv_ary_0101,
	   	`SPCPATH2.lsu.dva.idcv_ary_0100,
	   	`SPCPATH2.lsu.dva.idcv_ary_0011,
	   	`SPCPATH2.lsu.dva.idcv_ary_0010,
	   	`SPCPATH2.lsu.dva.idcv_ary_0001,
           	`SPCPATH2.lsu.dva.idcv_ary_0000},
		 icdata_ary2,
		 ifu_ictag_ary2,
	   	{`SPCPATH2.ifu.icv.idcv_ary_1111,
	   	`SPCPATH2.ifu.icv.idcv_ary_1110,
	   	`SPCPATH2.ifu.icv.idcv_ary_1101,
	   	`SPCPATH2.ifu.icv.idcv_ary_1100,
	   	`SPCPATH2.ifu.icv.idcv_ary_1011,
	   	`SPCPATH2.ifu.icv.idcv_ary_1010,
	   	`SPCPATH2.ifu.icv.idcv_ary_1001,
	   	`SPCPATH2.ifu.icv.idcv_ary_1000,
	   	`SPCPATH2.ifu.icv.idcv_ary_0111,
	   	`SPCPATH2.ifu.icv.idcv_ary_0110,
	   	`SPCPATH2.ifu.icv.idcv_ary_0101,
	   	`SPCPATH2.ifu.icv.idcv_ary_0100,
	   	`SPCPATH2.ifu.icv.idcv_ary_0011,
	   	`SPCPATH2.ifu.icv.idcv_ary_0010,
	   	`SPCPATH2.ifu.icv.idcv_ary_0001,
           	`SPCPATH2.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH2.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH2.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH2.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH2.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH2.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC2
		    
		    `ifdef RTL_SPARC3
		    //dcache
		    `SPCPATH3.lsu.dcache.w0,
		    `SPCPATH3.lsu.dcache.w1,
		    `SPCPATH3.lsu.dcache.w2,
		    `SPCPATH3.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary3,
	   	{`SPCPATH3.lsu.dva.idcv_ary_1111,
	   	`SPCPATH3.lsu.dva.idcv_ary_1110,
	   	`SPCPATH3.lsu.dva.idcv_ary_1101,
	   	`SPCPATH3.lsu.dva.idcv_ary_1100,
	   	`SPCPATH3.lsu.dva.idcv_ary_1011,
	   	`SPCPATH3.lsu.dva.idcv_ary_1010,
	   	`SPCPATH3.lsu.dva.idcv_ary_1001,
	   	`SPCPATH3.lsu.dva.idcv_ary_1000,
	   	`SPCPATH3.lsu.dva.idcv_ary_0111,
	   	`SPCPATH3.lsu.dva.idcv_ary_0110,
	   	`SPCPATH3.lsu.dva.idcv_ary_0101,
	   	`SPCPATH3.lsu.dva.idcv_ary_0100,
	   	`SPCPATH3.lsu.dva.idcv_ary_0011,
	   	`SPCPATH3.lsu.dva.idcv_ary_0010,
	   	`SPCPATH3.lsu.dva.idcv_ary_0001,
           	`SPCPATH3.lsu.dva.idcv_ary_0000},
		 icdata_ary3,
		 ifu_ictag_ary3,
	   	{`SPCPATH3.ifu.icv.idcv_ary_1111,
	   	`SPCPATH3.ifu.icv.idcv_ary_1110,
	   	`SPCPATH3.ifu.icv.idcv_ary_1101,
	   	`SPCPATH3.ifu.icv.idcv_ary_1100,
	   	`SPCPATH3.ifu.icv.idcv_ary_1011,
	   	`SPCPATH3.ifu.icv.idcv_ary_1010,
	   	`SPCPATH3.ifu.icv.idcv_ary_1001,
	   	`SPCPATH3.ifu.icv.idcv_ary_1000,
	   	`SPCPATH3.ifu.icv.idcv_ary_0111,
	   	`SPCPATH3.ifu.icv.idcv_ary_0110,
	   	`SPCPATH3.ifu.icv.idcv_ary_0101,
	   	`SPCPATH3.ifu.icv.idcv_ary_0100,
	   	`SPCPATH3.ifu.icv.idcv_ary_0011,
	   	`SPCPATH3.ifu.icv.idcv_ary_0010,
	   	`SPCPATH3.ifu.icv.idcv_ary_0001,
           	`SPCPATH3.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH3.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH3.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH3.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH3.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH3.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC3
		    
		    `ifdef RTL_SPARC4
		    //dcache
		    `SPCPATH4.lsu.dcache.w0,
		    `SPCPATH4.lsu.dcache.w1,
		    `SPCPATH4.lsu.dcache.w2,
		    `SPCPATH4.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary4,
	   	{`SPCPATH4.lsu.dva.idcv_ary_1111,
	   	`SPCPATH4.lsu.dva.idcv_ary_1110,
	   	`SPCPATH4.lsu.dva.idcv_ary_1101,
	   	`SPCPATH4.lsu.dva.idcv_ary_1100,
	   	`SPCPATH4.lsu.dva.idcv_ary_1011,
	   	`SPCPATH4.lsu.dva.idcv_ary_1010,
	   	`SPCPATH4.lsu.dva.idcv_ary_1001,
	   	`SPCPATH4.lsu.dva.idcv_ary_1000,
	   	`SPCPATH4.lsu.dva.idcv_ary_0111,
	   	`SPCPATH4.lsu.dva.idcv_ary_0110,
	   	`SPCPATH4.lsu.dva.idcv_ary_0101,
	   	`SPCPATH4.lsu.dva.idcv_ary_0100,
	   	`SPCPATH4.lsu.dva.idcv_ary_0011,
	   	`SPCPATH4.lsu.dva.idcv_ary_0010,
	   	`SPCPATH4.lsu.dva.idcv_ary_0001,
           	`SPCPATH4.lsu.dva.idcv_ary_0000},
		 icdata_ary4,
		 ifu_ictag_ary4,
	   	{`SPCPATH4.ifu.icv.idcv_ary_1111,
	   	`SPCPATH4.ifu.icv.idcv_ary_1110,
	   	`SPCPATH4.ifu.icv.idcv_ary_1101,
	   	`SPCPATH4.ifu.icv.idcv_ary_1100,
	   	`SPCPATH4.ifu.icv.idcv_ary_1011,
	   	`SPCPATH4.ifu.icv.idcv_ary_1010,
	   	`SPCPATH4.ifu.icv.idcv_ary_1001,
	   	`SPCPATH4.ifu.icv.idcv_ary_1000,
	   	`SPCPATH4.ifu.icv.idcv_ary_0111,
	   	`SPCPATH4.ifu.icv.idcv_ary_0110,
	   	`SPCPATH4.ifu.icv.idcv_ary_0101,
	   	`SPCPATH4.ifu.icv.idcv_ary_0100,
	   	`SPCPATH4.ifu.icv.idcv_ary_0011,
	   	`SPCPATH4.ifu.icv.idcv_ary_0010,
	   	`SPCPATH4.ifu.icv.idcv_ary_0001,
           	`SPCPATH4.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH4.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH4.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH4.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH4.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH4.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC4
		    
		    `ifdef RTL_SPARC5
		    //dcache
		    `SPCPATH5.lsu.dcache.w0,
		    `SPCPATH5.lsu.dcache.w1,
		    `SPCPATH5.lsu.dcache.w2,
		    `SPCPATH5.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary5,
	   	{`SPCPATH5.lsu.dva.idcv_ary_1111,
	   	`SPCPATH5.lsu.dva.idcv_ary_1110,
	   	`SPCPATH5.lsu.dva.idcv_ary_1101,
	   	`SPCPATH5.lsu.dva.idcv_ary_1100,
	   	`SPCPATH5.lsu.dva.idcv_ary_1011,
	   	`SPCPATH5.lsu.dva.idcv_ary_1010,
	   	`SPCPATH5.lsu.dva.idcv_ary_1001,
	   	`SPCPATH5.lsu.dva.idcv_ary_1000,
	   	`SPCPATH5.lsu.dva.idcv_ary_0111,
	   	`SPCPATH5.lsu.dva.idcv_ary_0110,
	   	`SPCPATH5.lsu.dva.idcv_ary_0101,
	   	`SPCPATH5.lsu.dva.idcv_ary_0100,
	   	`SPCPATH5.lsu.dva.idcv_ary_0011,
	   	`SPCPATH5.lsu.dva.idcv_ary_0010,
	   	`SPCPATH5.lsu.dva.idcv_ary_0001,
           	`SPCPATH5.lsu.dva.idcv_ary_0000},
		 icdata_ary5,
		 ifu_ictag_ary5,
	   	{`SPCPATH5.ifu.icv.idcv_ary_1111,
	   	`SPCPATH5.ifu.icv.idcv_ary_1110,
	   	`SPCPATH5.ifu.icv.idcv_ary_1101,
	   	`SPCPATH5.ifu.icv.idcv_ary_1100,
	   	`SPCPATH5.ifu.icv.idcv_ary_1011,
	   	`SPCPATH5.ifu.icv.idcv_ary_1010,
	   	`SPCPATH5.ifu.icv.idcv_ary_1001,
	   	`SPCPATH5.ifu.icv.idcv_ary_1000,
	   	`SPCPATH5.ifu.icv.idcv_ary_0111,
	   	`SPCPATH5.ifu.icv.idcv_ary_0110,
	   	`SPCPATH5.ifu.icv.idcv_ary_0101,
	   	`SPCPATH5.ifu.icv.idcv_ary_0100,
	   	`SPCPATH5.ifu.icv.idcv_ary_0011,
	   	`SPCPATH5.ifu.icv.idcv_ary_0010,
	   	`SPCPATH5.ifu.icv.idcv_ary_0001,
           	`SPCPATH5.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH5.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH5.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH5.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH5.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH5.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC5
		    
		    `ifdef RTL_SPARC6
		    //dcache
		    `SPCPATH6.lsu.dcache.w0,
		    `SPCPATH6.lsu.dcache.w1,
		    `SPCPATH6.lsu.dcache.w2,
		    `SPCPATH6.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary6,
	   	{`SPCPATH6.lsu.dva.idcv_ary_1111,
	   	`SPCPATH6.lsu.dva.idcv_ary_1110,
	   	`SPCPATH6.lsu.dva.idcv_ary_1101,
	   	`SPCPATH6.lsu.dva.idcv_ary_1100,
	   	`SPCPATH6.lsu.dva.idcv_ary_1011,
	   	`SPCPATH6.lsu.dva.idcv_ary_1010,
	   	`SPCPATH6.lsu.dva.idcv_ary_1001,
	   	`SPCPATH6.lsu.dva.idcv_ary_1000,
	   	`SPCPATH6.lsu.dva.idcv_ary_0111,
	   	`SPCPATH6.lsu.dva.idcv_ary_0110,
	   	`SPCPATH6.lsu.dva.idcv_ary_0101,
	   	`SPCPATH6.lsu.dva.idcv_ary_0100,
	   	`SPCPATH6.lsu.dva.idcv_ary_0011,
	   	`SPCPATH6.lsu.dva.idcv_ary_0010,
	   	`SPCPATH6.lsu.dva.idcv_ary_0001,
           	`SPCPATH6.lsu.dva.idcv_ary_0000},
		 icdata_ary6,
		 ifu_ictag_ary6,
	   	{`SPCPATH6.ifu.icv.idcv_ary_1111,
	   	`SPCPATH6.ifu.icv.idcv_ary_1110,
	   	`SPCPATH6.ifu.icv.idcv_ary_1101,
	   	`SPCPATH6.ifu.icv.idcv_ary_1100,
	   	`SPCPATH6.ifu.icv.idcv_ary_1011,
	   	`SPCPATH6.ifu.icv.idcv_ary_1010,
	   	`SPCPATH6.ifu.icv.idcv_ary_1001,
	   	`SPCPATH6.ifu.icv.idcv_ary_1000,
	   	`SPCPATH6.ifu.icv.idcv_ary_0111,
	   	`SPCPATH6.ifu.icv.idcv_ary_0110,
	   	`SPCPATH6.ifu.icv.idcv_ary_0101,
	   	`SPCPATH6.ifu.icv.idcv_ary_0100,
	   	`SPCPATH6.ifu.icv.idcv_ary_0011,
	   	`SPCPATH6.ifu.icv.idcv_ary_0010,
	   	`SPCPATH6.ifu.icv.idcv_ary_0001,
           	`SPCPATH6.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH6.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH6.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH6.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH6.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH6.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC6
		    
		    `ifdef RTL_SPARC7
		    //dcache
		    `SPCPATH7.lsu.dcache.w0,
		    `SPCPATH7.lsu.dcache.w1,
		    `SPCPATH7.lsu.dcache.w2,
		    `SPCPATH7.lsu.dcache.w3,
`ifdef FPGA_SYN_IDCT
		 lsu_ictag_ary7,
	   	{`SPCPATH7.lsu.dva.idcv_ary_1111,
	   	`SPCPATH7.lsu.dva.idcv_ary_1110,
	   	`SPCPATH7.lsu.dva.idcv_ary_1101,
	   	`SPCPATH7.lsu.dva.idcv_ary_1100,
	   	`SPCPATH7.lsu.dva.idcv_ary_1011,
	   	`SPCPATH7.lsu.dva.idcv_ary_1010,
	   	`SPCPATH7.lsu.dva.idcv_ary_1001,
	   	`SPCPATH7.lsu.dva.idcv_ary_1000,
	   	`SPCPATH7.lsu.dva.idcv_ary_0111,
	   	`SPCPATH7.lsu.dva.idcv_ary_0110,
	   	`SPCPATH7.lsu.dva.idcv_ary_0101,
	   	`SPCPATH7.lsu.dva.idcv_ary_0100,
	   	`SPCPATH7.lsu.dva.idcv_ary_0011,
	   	`SPCPATH7.lsu.dva.idcv_ary_0010,
	   	`SPCPATH7.lsu.dva.idcv_ary_0001,
           	`SPCPATH7.lsu.dva.idcv_ary_0000},
		 icdata_ary7,
		 ifu_ictag_ary7,
	   	{`SPCPATH7.ifu.icv.idcv_ary_1111,
	   	`SPCPATH7.ifu.icv.idcv_ary_1110,
	   	`SPCPATH7.ifu.icv.idcv_ary_1101,
	   	`SPCPATH7.ifu.icv.idcv_ary_1100,
	   	`SPCPATH7.ifu.icv.idcv_ary_1011,
	   	`SPCPATH7.ifu.icv.idcv_ary_1010,
	   	`SPCPATH7.ifu.icv.idcv_ary_1001,
	   	`SPCPATH7.ifu.icv.idcv_ary_1000,
	   	`SPCPATH7.ifu.icv.idcv_ary_0111,
	   	`SPCPATH7.ifu.icv.idcv_ary_0110,
	   	`SPCPATH7.ifu.icv.idcv_ary_0101,
	   	`SPCPATH7.ifu.icv.idcv_ary_0100,
	   	`SPCPATH7.ifu.icv.idcv_ary_0011,
	   	`SPCPATH7.ifu.icv.idcv_ary_0010,
	   	`SPCPATH7.ifu.icv.idcv_ary_0001,
           	`SPCPATH7.ifu.icv.idcv_ary_0000},
`else
		    `SPCPATH7.lsu.dtag.ictag_ary,//bw_r_idct.v
		    `SPCPATH7.lsu.dva.idcv_ary,//bw_r_rf16x32.v
		    //icache
		    `SPCPATH7.ifu.icd.icdata_ary,//bw_r_icd.v sparc_ifu_swpla.v
		    `SPCPATH7.ifu.ict.ictag_ary,//bw_r_idct.v
		    `SPCPATH7.ifu.icv.idcv_ary, //bw_r_rf16x32.v
`endif // FPGA_SYN
		    `endif //  `ifdef RTL_SPARC7
		    );
`ifdef FPGA_SYN_IDCT
	for (i = 0; i < 128; i = i+1)
	begin
  `ifdef RTL_SPARC0
          `SPCPATH0.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary0[{i,2'b11}];
	  `SPCPATH0.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary0[{i,2'b10}];
	  `SPCPATH0.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary0[{i,2'b01}];
	  `SPCPATH0.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary0[{i,2'b00}];
	  `SPCPATH0.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary0[{i,2'b11}];
	  `SPCPATH0.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary0[{i,2'b10}];
	  `SPCPATH0.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary0[{i,2'b01}];
	  `SPCPATH0.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary0[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC1
          `SPCPATH1.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary1[{i,2'b11}];
	  `SPCPATH1.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary1[{i,2'b10}];
	  `SPCPATH1.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary1[{i,2'b01}];
	  `SPCPATH1.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary1[{i,2'b00}];
	  `SPCPATH1.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary1[{i,2'b11}];
	  `SPCPATH1.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary1[{i,2'b10}];
	  `SPCPATH1.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary1[{i,2'b01}];
	  `SPCPATH1.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary1[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC2
          `SPCPATH2.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary2[{i,2'b11}];
	  `SPCPATH2.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary2[{i,2'b10}];
	  `SPCPATH2.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary2[{i,2'b01}];
	  `SPCPATH2.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary2[{i,2'b00}];
	  `SPCPATH2.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary2[{i,2'b11}];
	  `SPCPATH2.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary2[{i,2'b10}];
	  `SPCPATH2.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary2[{i,2'b01}];
	  `SPCPATH2.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary2[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC3
          `SPCPATH3.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary3[{i,2'b11}];
	  `SPCPATH3.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary3[{i,2'b10}];
	  `SPCPATH3.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary3[{i,2'b01}];
	  `SPCPATH3.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary3[{i,2'b00}];
	  `SPCPATH3.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary3[{i,2'b11}];
	  `SPCPATH3.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary3[{i,2'b10}];
	  `SPCPATH3.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary3[{i,2'b01}];
	  `SPCPATH3.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary3[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC4
          `SPCPATH4.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary4[{i,2'b11}];
	  `SPCPATH4.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary4[{i,2'b10}];
	  `SPCPATH4.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary4[{i,2'b01}];
	  `SPCPATH4.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary4[{i,2'b00}];
	  `SPCPATH4.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary4[{i,2'b11}];
	  `SPCPATH4.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary4[{i,2'b10}];
	  `SPCPATH4.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary4[{i,2'b01}];
	  `SPCPATH4.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary4[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC5
          `SPCPATH5.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary5[{i,2'b11}];
	  `SPCPATH5.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary5[{i,2'b10}];
	  `SPCPATH5.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary5[{i,2'b01}];
	  `SPCPATH5.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary5[{i,2'b00}];
	  `SPCPATH5.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary5[{i,2'b11}];
	  `SPCPATH5.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary5[{i,2'b10}];
	  `SPCPATH5.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary5[{i,2'b01}];
	  `SPCPATH5.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary5[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC6
          `SPCPATH6.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary6[{i,2'b11}];
	  `SPCPATH6.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary6[{i,2'b10}];
	  `SPCPATH6.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary6[{i,2'b01}];
	  `SPCPATH6.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary6[{i,2'b00}];
	  `SPCPATH6.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary6[{i,2'b11}];
	  `SPCPATH6.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary6[{i,2'b10}];
	  `SPCPATH6.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary6[{i,2'b01}];
	  `SPCPATH6.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary6[{i,2'b00}];
  `endif
  `ifdef RTL_SPARC7
          `SPCPATH7.lsu.dtag.ictag_ary_11.array[i] = lsu_ictag_ary7[{i,2'b11}];
	  `SPCPATH7.lsu.dtag.ictag_ary_10.array[i] = lsu_ictag_ary7[{i,2'b10}];
	  `SPCPATH7.lsu.dtag.ictag_ary_01.array[i] = lsu_ictag_ary7[{i,2'b01}];
	  `SPCPATH7.lsu.dtag.ictag_ary_00.array[i] = lsu_ictag_ary7[{i,2'b00}];
	  `SPCPATH7.ifu.ict.ictag_ary_11.array[i] = ifu_ictag_ary7[{i,2'b11}];
	  `SPCPATH7.ifu.ict.ictag_ary_10.array[i] = ifu_ictag_ary7[{i,2'b10}];
	  `SPCPATH7.ifu.ict.ictag_ary_01.array[i] = ifu_ictag_ary7[{i,2'b01}];
	  `SPCPATH7.ifu.ict.ictag_ary_00.array[i] = ifu_ictag_ary7[{i,2'b00}];
  `endif
	end
`endif
`ifdef FPGA_SYN_ICD
	for (i = 0; i < 256; i = i+1)
	begin
  `ifdef RTL_SPARC0
          `SPCPATH0.ifu.icd.icdata_ary_11_11[i] = icdata_ary0[i+256*15];
	  `SPCPATH0.ifu.icd.icdata_ary_11_10[i] = icdata_ary0[i+256*14];
	  `SPCPATH0.ifu.icd.icdata_ary_11_01[i] = icdata_ary0[i+256*13];
	  `SPCPATH0.ifu.icd.icdata_ary_11_00[i] = icdata_ary0[i+256*12];
	  `SPCPATH0.ifu.icd.icdata_ary_10_11[i] = icdata_ary0[i+256*11];
	  `SPCPATH0.ifu.icd.icdata_ary_10_10[i] = icdata_ary0[i+256*10];
	  `SPCPATH0.ifu.icd.icdata_ary_10_01[i] = icdata_ary0[i+256*9];
	  `SPCPATH0.ifu.icd.icdata_ary_10_00[i] = icdata_ary0[i+256*8];
	  `SPCPATH0.ifu.icd.icdata_ary_01_11[i] = icdata_ary0[i+256*7];
	  `SPCPATH0.ifu.icd.icdata_ary_01_10[i] = icdata_ary0[i+256*6];
	  `SPCPATH0.ifu.icd.icdata_ary_01_01[i] = icdata_ary0[i+256*5];
	  `SPCPATH0.ifu.icd.icdata_ary_01_00[i] = icdata_ary0[i+256*4];
	  `SPCPATH0.ifu.icd.icdata_ary_00_11[i] = icdata_ary0[i+256*3];
	  `SPCPATH0.ifu.icd.icdata_ary_00_10[i] = icdata_ary0[i+256*2];
	  `SPCPATH0.ifu.icd.icdata_ary_00_01[i] = icdata_ary0[i+256*1];
	  `SPCPATH0.ifu.icd.icdata_ary_00_00[i] = icdata_ary0[i];
  `endif
  `ifdef RTL_SPARC1
          `SPCPATH1.ifu.icd.icdata_ary_11_11[i] = icdata_ary1[i+256*15];
	  `SPCPATH1.ifu.icd.icdata_ary_11_10[i] = icdata_ary1[i+256*14];
	  `SPCPATH1.ifu.icd.icdata_ary_11_01[i] = icdata_ary1[i+256*13];
	  `SPCPATH1.ifu.icd.icdata_ary_11_00[i] = icdata_ary1[i+256*12];
	  `SPCPATH1.ifu.icd.icdata_ary_10_11[i] = icdata_ary1[i+256*11];
	  `SPCPATH1.ifu.icd.icdata_ary_10_10[i] = icdata_ary1[i+256*10];
	  `SPCPATH1.ifu.icd.icdata_ary_10_01[i] = icdata_ary1[i+256*9];
	  `SPCPATH1.ifu.icd.icdata_ary_10_00[i] = icdata_ary1[i+256*8];
	  `SPCPATH1.ifu.icd.icdata_ary_01_11[i] = icdata_ary1[i+256*7];
	  `SPCPATH1.ifu.icd.icdata_ary_01_10[i] = icdata_ary1[i+256*6];
	  `SPCPATH1.ifu.icd.icdata_ary_01_01[i] = icdata_ary1[i+256*5];
	  `SPCPATH1.ifu.icd.icdata_ary_01_00[i] = icdata_ary1[i+256*4];
	  `SPCPATH1.ifu.icd.icdata_ary_00_11[i] = icdata_ary1[i+256*3];
	  `SPCPATH1.ifu.icd.icdata_ary_00_10[i] = icdata_ary1[i+256*2];
	  `SPCPATH1.ifu.icd.icdata_ary_00_01[i] = icdata_ary1[i+256*1];
	  `SPCPATH1.ifu.icd.icdata_ary_00_00[i] = icdata_ary1[i];
  `endif
  `ifdef RTL_SPARC2
          `SPCPATH2.ifu.icd.icdata_ary_11_11[i] = icdata_ary2[i+256*15];
	  `SPCPATH2.ifu.icd.icdata_ary_11_10[i] = icdata_ary2[i+256*14];
	  `SPCPATH2.ifu.icd.icdata_ary_11_01[i] = icdata_ary2[i+256*13];
	  `SPCPATH2.ifu.icd.icdata_ary_11_00[i] = icdata_ary2[i+256*12];
	  `SPCPATH2.ifu.icd.icdata_ary_10_11[i] = icdata_ary2[i+256*11];
	  `SPCPATH2.ifu.icd.icdata_ary_10_10[i] = icdata_ary2[i+256*10];
	  `SPCPATH2.ifu.icd.icdata_ary_10_01[i] = icdata_ary2[i+256*9];
	  `SPCPATH2.ifu.icd.icdata_ary_10_00[i] = icdata_ary2[i+256*8];
	  `SPCPATH2.ifu.icd.icdata_ary_01_11[i] = icdata_ary2[i+256*7];
	  `SPCPATH2.ifu.icd.icdata_ary_01_10[i] = icdata_ary2[i+256*6];
	  `SPCPATH2.ifu.icd.icdata_ary_01_01[i] = icdata_ary2[i+256*5];
	  `SPCPATH2.ifu.icd.icdata_ary_01_00[i] = icdata_ary2[i+256*4];
	  `SPCPATH2.ifu.icd.icdata_ary_00_11[i] = icdata_ary2[i+256*3];
	  `SPCPATH2.ifu.icd.icdata_ary_00_10[i] = icdata_ary2[i+256*2];
	  `SPCPATH2.ifu.icd.icdata_ary_00_01[i] = icdata_ary2[i+256*1];
	  `SPCPATH2.ifu.icd.icdata_ary_00_00[i] = icdata_ary2[i];
  `endif
  `ifdef RTL_SPARC3
          `SPCPATH3.ifu.icd.icdata_ary_11_11[i] = icdata_ary3[i+256*15];
	  `SPCPATH3.ifu.icd.icdata_ary_11_10[i] = icdata_ary3[i+256*14];
	  `SPCPATH3.ifu.icd.icdata_ary_11_01[i] = icdata_ary3[i+256*13];
	  `SPCPATH3.ifu.icd.icdata_ary_11_00[i] = icdata_ary3[i+256*12];
	  `SPCPATH3.ifu.icd.icdata_ary_10_11[i] = icdata_ary3[i+256*11];
	  `SPCPATH3.ifu.icd.icdata_ary_10_10[i] = icdata_ary3[i+256*10];
	  `SPCPATH3.ifu.icd.icdata_ary_10_01[i] = icdata_ary3[i+256*9];
	  `SPCPATH3.ifu.icd.icdata_ary_10_00[i] = icdata_ary3[i+256*8];
	  `SPCPATH3.ifu.icd.icdata_ary_01_11[i] = icdata_ary3[i+256*7];
	  `SPCPATH3.ifu.icd.icdata_ary_01_10[i] = icdata_ary3[i+256*6];
	  `SPCPATH3.ifu.icd.icdata_ary_01_01[i] = icdata_ary3[i+256*5];
	  `SPCPATH3.ifu.icd.icdata_ary_01_00[i] = icdata_ary3[i+256*4];
	  `SPCPATH3.ifu.icd.icdata_ary_00_11[i] = icdata_ary3[i+256*3];
	  `SPCPATH3.ifu.icd.icdata_ary_00_10[i] = icdata_ary3[i+256*2];
	  `SPCPATH3.ifu.icd.icdata_ary_00_01[i] = icdata_ary3[i+256*1];
	  `SPCPATH3.ifu.icd.icdata_ary_00_00[i] = icdata_ary3[i];
  `endif
  `ifdef RTL_SPARC4
          `SPCPATH4.ifu.icd.icdata_ary_11_11[i] = icdata_ary4[i+256*15];
	  `SPCPATH4.ifu.icd.icdata_ary_11_10[i] = icdata_ary4[i+256*14];
	  `SPCPATH4.ifu.icd.icdata_ary_11_01[i] = icdata_ary4[i+256*13];
	  `SPCPATH4.ifu.icd.icdata_ary_11_00[i] = icdata_ary4[i+256*12];
	  `SPCPATH4.ifu.icd.icdata_ary_10_11[i] = icdata_ary4[i+256*11];
	  `SPCPATH4.ifu.icd.icdata_ary_10_10[i] = icdata_ary4[i+256*10];
	  `SPCPATH4.ifu.icd.icdata_ary_10_01[i] = icdata_ary4[i+256*9];
	  `SPCPATH4.ifu.icd.icdata_ary_10_00[i] = icdata_ary4[i+256*8];
	  `SPCPATH4.ifu.icd.icdata_ary_01_11[i] = icdata_ary4[i+256*7];
	  `SPCPATH4.ifu.icd.icdata_ary_01_10[i] = icdata_ary4[i+256*6];
	  `SPCPATH4.ifu.icd.icdata_ary_01_01[i] = icdata_ary4[i+256*5];
	  `SPCPATH4.ifu.icd.icdata_ary_01_00[i] = icdata_ary4[i+256*4];
	  `SPCPATH4.ifu.icd.icdata_ary_00_11[i] = icdata_ary4[i+256*3];
	  `SPCPATH4.ifu.icd.icdata_ary_00_10[i] = icdata_ary4[i+256*2];
	  `SPCPATH4.ifu.icd.icdata_ary_00_01[i] = icdata_ary4[i+256*1];
	  `SPCPATH4.ifu.icd.icdata_ary_00_00[i] = icdata_ary4[i];
  `endif
  `ifdef RTL_SPARC5
          `SPCPATH5.ifu.icd.icdata_ary_11_11[i] = icdata_ary5[i+256*15];
	  `SPCPATH5.ifu.icd.icdata_ary_11_10[i] = icdata_ary5[i+256*14];
	  `SPCPATH5.ifu.icd.icdata_ary_11_01[i] = icdata_ary5[i+256*13];
	  `SPCPATH5.ifu.icd.icdata_ary_11_00[i] = icdata_ary5[i+256*12];
	  `SPCPATH5.ifu.icd.icdata_ary_10_11[i] = icdata_ary5[i+256*11];
	  `SPCPATH5.ifu.icd.icdata_ary_10_10[i] = icdata_ary5[i+256*10];
	  `SPCPATH5.ifu.icd.icdata_ary_10_01[i] = icdata_ary5[i+256*9];
	  `SPCPATH5.ifu.icd.icdata_ary_10_00[i] = icdata_ary5[i+256*8];
	  `SPCPATH5.ifu.icd.icdata_ary_01_11[i] = icdata_ary5[i+256*7];
	  `SPCPATH5.ifu.icd.icdata_ary_01_10[i] = icdata_ary5[i+256*6];
	  `SPCPATH5.ifu.icd.icdata_ary_01_01[i] = icdata_ary5[i+256*5];
	  `SPCPATH5.ifu.icd.icdata_ary_01_00[i] = icdata_ary5[i+256*4];
	  `SPCPATH5.ifu.icd.icdata_ary_00_11[i] = icdata_ary5[i+256*3];
	  `SPCPATH5.ifu.icd.icdata_ary_00_10[i] = icdata_ary5[i+256*2];
	  `SPCPATH5.ifu.icd.icdata_ary_00_01[i] = icdata_ary5[i+256*1];
	  `SPCPATH5.ifu.icd.icdata_ary_00_00[i] = icdata_ary5[i];
  `endif
  `ifdef RTL_SPARC6
          `SPCPATH6.ifu.icd.icdata_ary_11_11[i] = icdata_ary6[i+256*15];
	  `SPCPATH6.ifu.icd.icdata_ary_11_10[i] = icdata_ary6[i+256*14];
	  `SPCPATH6.ifu.icd.icdata_ary_11_01[i] = icdata_ary6[i+256*13];
	  `SPCPATH6.ifu.icd.icdata_ary_11_00[i] = icdata_ary6[i+256*12];
	  `SPCPATH6.ifu.icd.icdata_ary_10_11[i] = icdata_ary6[i+256*11];
	  `SPCPATH6.ifu.icd.icdata_ary_10_10[i] = icdata_ary6[i+256*10];
	  `SPCPATH6.ifu.icd.icdata_ary_10_01[i] = icdata_ary6[i+256*9];
	  `SPCPATH6.ifu.icd.icdata_ary_10_00[i] = icdata_ary6[i+256*8];
	  `SPCPATH6.ifu.icd.icdata_ary_01_11[i] = icdata_ary6[i+256*7];
	  `SPCPATH6.ifu.icd.icdata_ary_01_10[i] = icdata_ary6[i+256*6];
	  `SPCPATH6.ifu.icd.icdata_ary_01_01[i] = icdata_ary6[i+256*5];
	  `SPCPATH6.ifu.icd.icdata_ary_01_00[i] = icdata_ary6[i+256*4];
	  `SPCPATH6.ifu.icd.icdata_ary_00_11[i] = icdata_ary6[i+256*3];
	  `SPCPATH6.ifu.icd.icdata_ary_00_10[i] = icdata_ary6[i+256*2];
	  `SPCPATH6.ifu.icd.icdata_ary_00_01[i] = icdata_ary6[i+256*1];
	  `SPCPATH6.ifu.icd.icdata_ary_00_00[i] = icdata_ary6[i];
  `endif
  `ifdef RTL_SPARC7
          `SPCPATH7.ifu.icd.icdata_ary_11_11[i] = icdata_ary7[i+256*15];
	  `SPCPATH7.ifu.icd.icdata_ary_11_10[i] = icdata_ary7[i+256*14];
	  `SPCPATH7.ifu.icd.icdata_ary_11_01[i] = icdata_ary7[i+256*13];
	  `SPCPATH7.ifu.icd.icdata_ary_11_00[i] = icdata_ary7[i+256*12];
	  `SPCPATH7.ifu.icd.icdata_ary_10_11[i] = icdata_ary7[i+256*11];
	  `SPCPATH7.ifu.icd.icdata_ary_10_10[i] = icdata_ary7[i+256*10];
	  `SPCPATH7.ifu.icd.icdata_ary_10_01[i] = icdata_ary7[i+256*9];
	  `SPCPATH7.ifu.icd.icdata_ary_10_00[i] = icdata_ary7[i+256*8];
	  `SPCPATH7.ifu.icd.icdata_ary_01_11[i] = icdata_ary7[i+256*7];
	  `SPCPATH7.ifu.icd.icdata_ary_01_10[i] = icdata_ary7[i+256*6];
	  `SPCPATH7.ifu.icd.icdata_ary_01_01[i] = icdata_ary7[i+256*5];
	  `SPCPATH7.ifu.icd.icdata_ary_01_00[i] = icdata_ary7[i+256*4];
	  `SPCPATH7.ifu.icd.icdata_ary_00_11[i] = icdata_ary7[i+256*3];
	  `SPCPATH7.ifu.icd.icdata_ary_00_10[i] = icdata_ary7[i+256*2];
	  `SPCPATH7.ifu.icd.icdata_ary_00_01[i] = icdata_ary7[i+256*1];
	  `SPCPATH7.ifu.icd.icdata_ary_00_00[i] = icdata_ary7[i];
  `endif
	end
`endif // FPGA_SYN

     end
endmodule

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tap_stub.v
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
///////////////////////////////////////////////////////// 
// This tap_stub reads tap.cmd and injects stimulus to 
// tap controller.
///////////////////////////////////////////////////////// 

`define TAP_TLR  0
`define TAP_RTI  1
`define TAP_SDS  2
`define TAP_CDR  3
`define TAP_SDR  4
`define TAP_E1D  5
`define TAP_PDR  6
`define TAP_E2D  7
`define TAP_UDR  8
`define TAP_SIS  9
`define TAP_CIR 10
`define TAP_SIR 11
`define TAP_E1I 12
`define TAP_PIR 13
`define TAP_E2I 14
`define TAP_UIR 15

`define reset           0 
`define idle            1
`define select_dr       2
`define capture_dr      3
`define shift_dr        4
`define exit1_dr        5
`define pause_dr        6
`define exit2_dr        7
`define update_dr       8
`define select_ir       9
`define capture_ir      10
`define shift_ir        11
`define exit1_ir        12
`define pause_ir        13
`define exit2_ir        14
`define update_ir       15

`define TAP_CMD_WIDTH   18
`define ADDR_WIDTH      40
`define DATA_WIDTH      64
`define SPARC_SSCAN_LENGTH      94
`define IO_SSCAN_LENGTH         54

`define TAP_CREG_ADDR    `TAP_CMD_WIDTH'b000000000000001000
`define TAP_CREG_WDATA   `TAP_CMD_WIDTH'b000000000000001001
`define TAP_CREG_RDATA   `TAP_CMD_WIDTH'b000000000000001010
`define TAP_CREG_SCRATCH `TAP_CMD_WIDTH'b000000000000001011
`define TAP_IOB_WRITE    `TAP_CMD_WIDTH'b000000000000001100
`define TAP_IOB_READ     `TAP_CMD_WIDTH'b000000000000001101
`define TAP_IOB_WADDR    `TAP_CMD_WIDTH'b000000000000001110
`define TAP_IOB_WDATA    `TAP_CMD_WIDTH'b000000000000001111
`define TAP_IOB_RADDR    `TAP_CMD_WIDTH'b000000000000010000
`define TAP_MBIST_ABORT  `TAP_CMD_WIDTH'b000000000000010111  //17
`define TAP_PLL_BYP      `TAP_CMD_WIDTH'b000000000000011000  //18
`define TAP_CLK_STOP_ID  `TAP_CMD_WIDTH'b000000000000011010  //1a
`define TAP_CLK_SEL      `TAP_CMD_WIDTH'b000000000000011011  //1b
`define TAP_SSCAN_T0     `TAP_CMD_WIDTH'b000000000000011100  //1c
`define TAP_SSCAN_T1     `TAP_CMD_WIDTH'b000000000000011101  //1d
`define TAP_SSCAN_T2     `TAP_CMD_WIDTH'b000000000000011110  //1e
`define TAP_SSCAN_T3     `TAP_CMD_WIDTH'b000000000000011111  //1f
`define TAP_EFC_BYPASS_DATA     `TAP_CMD_WIDTH'b000000000000101001  //29
`define TAP_EFC_BYPASS          `TAP_CMD_WIDTH'b000000000000101010  //2a
`define TAP_SCAN_DUMP_PARALLEL`TAP_CMD_WIDTH'b000000000001100110  //66
`define TAP_SCAN_DUMP_SERIAL  `TAP_CMD_WIDTH'b000000000000100110  //26

///////////////////////////////////////////////////////// 
// TAP STUB MODULE
///////////////////////////////////////////////////////// 

module tap_stub(/*AUTOARG*/
   // Outputs
   trst_n, tms, tdi, trigin, stub_done, stub_pass, 
   // Inputs
   tdo, tck, diag_done, trig_tap_cmd
   );

// tap interface
output          trst_n;
output          tms;
output          tdi;
output          trigin;

input           tdo;
input           tck;

// verif interface
input           diag_done;
input        trig_tap_cmd;
output          stub_done;
output          stub_pass;

// wire declarations
reg [171:0]     current_cmd;
reg [39:0]      addr;
reg [63:0]      data;
reg [63:0]      mask;
reg [63:0]      data_rd_out;
reg             stub_done_reg;
reg             stub_pass;
reg [3:0]       current_state;
reg             error;
reg             timeout;
reg [5:0]       sequence_id;
reg             par_scan;
reg		sid_wait_cken_bit; //jh: "sid" cmd
reg		ssc_wait_cken_bit; //jh: "ssc" cmd
reg		ssc_trigin_trig;   //jh: "ssc" cmd
reg [31:0] 	shift_cycle;       //jh: "ssc" cmd 
reg [31:0]	wait_cycle; 	   //jh: "ssc" cmd
integer		ssc_time_diff;	   //jh: "ssc" cmd
integer		dtck;	   	   //jh: tck_time_diff
reg [2:0]       jbus_domain;
reg [2:0]       dram_domain;
reg [2:0]       cmp_domain;
reg             skip_stop_id;
reg [7:0]       spc_id;
reg [1:0]       thread_id;
reg             probe_spc;
reg             probe_io;
integer         flg_1st_access;
reg [752:0]     snap_data;
reg [752:0]     io_snap;
reg [7:0]       sp_snp_vld;
reg [53:0]      force_io_data;
reg [21:0]      efc_wr_data;
reg  [5:0]      efc_wr_addr;



reg             trst_n;
reg             tms;
reg             tdi;
reg             trigin;

integer         i;
integer         time_out_cnt;
integer         fd ;
integer         status ;
reg             debug ;

reg		clr_snap_done;

`ifdef RTL_SPARC0
reg         sp0_snap_f_f,sp0_snap_done;
`endif
`ifdef RTL_SPARC1
reg         sp1_snap_f_f,sp1_snap_done;
`endif
`ifdef RTL_SPARC2
reg         sp2_snap_f_f,sp2_snap_done;
`endif
`ifdef RTL_SPARC3
reg         sp3_snap_f_f,sp3_snap_done;
`endif
`ifdef RTL_SPARC4
reg         sp4_snap_f_f,sp4_snap_done;
`endif
`ifdef RTL_SPARC5
reg         sp5_snap_f_f,sp5_snap_done;
`endif
`ifdef RTL_SPARC6
reg         sp6_snap_f_f,sp6_snap_done;
`endif
`ifdef RTL_SPARC7
reg         sp7_snap_f_f,sp7_snap_done;
`endif
reg         ios_snap_f_f,ios_snap_done;

reg   [`SPARC_SSCAN_LENGTH-1:0]  SPARC_CHAIN_TABLE[`SPARC_SSCAN_LENGTH-1:0];
reg   [`IO_SSCAN_LENGTH-1:0]     IO_CHAIN_TABLE[`IO_SSCAN_LENGTH-1:0];

assign stub_done = stub_done_reg ;

///////////////////////////////////////////////////////// 
// Read cmds from tap.cmd file
///////////////////////////////////////////////////////// 

// measure TCK cycle
initial begin
        #1;
	dtck = 0;
	@(posedge tck);
	dtck = $time;
	@(posedge tck);
	dtck = $time - dtck;
	$display("%d: TAP_STUB:: MEASURE TCK CYCLE = %0dps", $time, dtck);
end

initial begin
        trigin = 1'b0;  // dont drive it

        debug = 0 ;
        skip_stop_id = 0 ;
	sid_wait_cken_bit = 0;
	ssc_wait_cken_bit = 0;
	ssc_trigin_trig   = 0;
        if ($test$plusargs("tap_stub_debug_on")) debug = 1 ;
        $display("TAP_STUB:: (%1d TCK): TAP_RESET...", $time);
        //TapReset;
        trst_n = 1'b0;
        tms = 1'b1;
        tdi = 1'bx;
        @(negedge tck);
        @(negedge tck);
        trst_n = 1;
        @(negedge tck);
        @(negedge tck);

        $display("TAP_STUB:: (%1d TCK): TAP_RESET (DONE)", $time/dtck);
        fd = 0 ;
        fd = $fopen ("tap.cmd", "r") ;
	$display("TAP_STUB:: (%1d TCK, %0d ps): OPEN tap.cmd fd=%0d", $time/dtck, $time, fd);
        // $readmemh("tap.cmd", cmd_data_array);
	if (fd == 0) begin
          if ($test$plusargs("tap_read_err_disb")) 
             $display("TAP_STUB:: (%1d TCK, %0d ps) WARNING: COULD NOT READ tap.cmd file ", $time/dtck, $time);
          else 

    	     $display("TAP_STUB:: (%1d TCK, %0d ps): FAIL TO READ tap.cmd file ERROR", $time/dtck, $time);
           
          if ($test$plusargs("tap_on"))  begin 
            $display("TAP_STUB:: KILL SIMULATION from TAP_STUB, since +tap_on is used.");
	    $finish;
            end
	end
        stub_done_reg = 1'b0;
        stub_pass = 1'b1;
        error = 1'b0;
        time_out_cnt = 0;
  
`ifdef RTL_SPARC0
        sp0_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC1
        sp1_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC2
        sp2_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC3
        sp3_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC4
        sp4_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC5
        sp5_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC6
        sp6_snap_done = 1'b0;
`endif
`ifdef RTL_SPARC7
        sp7_snap_done = 1'b0;
`endif
        ios_snap_done = 1'b0;

        clr_snap_done = 1'b0;
        sp_snp_vld    = 8'b0;

   for (i=0;i<`SPARC_SSCAN_LENGTH;i=i+1) 
    SPARC_CHAIN_TABLE[i]= i;

   for (i=0;i<`IO_SSCAN_LENGTH;i=i+1) 
    IO_CHAIN_TABLE[i]= i;

end

always @(posedge tck)
begin
        if(debug) $display("TAP_STUB:: The state machine of TAP is = %x", current_state);
        if(trst_n === 1'b0) current_state = `TAP_TLR;
end

// sparc shadow scan golden data ( snap data )

`ifdef GATE_SIM_TAP
`ifdef RTL_SPARC0
wire        sp0_rclk      = cmp_top.iop.sparc0.ifu_sscan.rclk;
wire        sp0_snap_f    = cmp_top.iop.sparc0.ifu_sscan.snap_f;
wire [93:0] sp0_snap_data = { cmp_top.iop.sparc0.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc0.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc0.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc0.ifu_sscan.swl_sscan_thrstate };
`endif

`ifdef RTL_SPARC1
wire        sp1_rclk      = cmp_top.iop.sparc1.ifu_sscan.rclk;
wire        sp1_snap_f    = cmp_top.iop.sparc1.ifu_sscan.snap_f;
wire [93:0] sp1_snap_data = { cmp_top.iop.sparc1.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc1.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc1.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc1.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC2
wire        sp2_rclk      = cmp_top.iop.sparc2.ifu_sscan.rclk;
wire        sp2_snap_f    = cmp_top.iop.sparc2.ifu_sscan.snap_f;
wire [93:0] sp2_snap_data = { cmp_top.iop.sparc2.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc2.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc2.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc2.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC3
wire        sp3_rclk      = cmp_top.iop.sparc3.ifu_sscan.rclk;
wire        sp3_snap_f    = cmp_top.iop.sparc3.ifu_sscan.snap_f;
wire [93:0] sp3_snap_data = { cmp_top.iop.sparc3.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc3.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc3.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc3.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC4
wire        sp4_rclk      = cmp_top.iop.sparc4.ifu_sscan.rclk;
wire        sp4_snap_f    = cmp_top.iop.sparc4.ifu_sscan.snap_f;
wire [93:0] sp4_snap_data = { cmp_top.iop.sparc4.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc4.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc4.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc4.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC5
wire        sp5_rclk      = cmp_top.iop.sparc5.ifu_sscan.rclk;
wire        sp5_snap_f    = cmp_top.iop.sparc5.ifu_sscan.snap_f;
wire [93:0] sp5_snap_data = { cmp_top.iop.sparc5.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc5.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc5.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc5.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC6
wire        sp6_rclk      = cmp_top.iop.sparc6.ifu_sscan.rclk;
wire        sp6_snap_f    = cmp_top.iop.sparc6.ifu_sscan.snap_f;
wire [93:0] sp6_snap_data = { cmp_top.iop.sparc6.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc6.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc6.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc6.ifu_sscan.swl_sscan_thrstate };
`endif
`ifdef RTL_SPARC7
wire        sp7_rclk      = cmp_top.iop.sparc7.ifu_sscan.rclk;
wire        sp7_snap_f    = cmp_top.iop.sparc7.ifu_sscan.snap_f;
wire [93:0] sp7_snap_data = { cmp_top.iop.sparc7.ifu_sscan.ifq_sscan_test_data,
                              cmp_top.iop.sparc7.ifu_sscan.tlu_sscan_test_data,
                              cmp_top.iop.sparc7.ifu_sscan.lsu_sscan_test_data,
                              cmp_top.iop.sparc7.ifu_sscan.swl_sscan_thrstate };
`endif
`else
`ifdef RTL_SPARC0
wire        sp0_rclk      = cmp_top.iop.sparc0.ifu.sscan.rclk;
wire        sp0_snap_f    = cmp_top.iop.sparc0.ifu.sscan.snap_f;
wire [93:0] sp0_snap_data = cmp_top.iop.sparc0.ifu.sscan.snap_data;
`endif

`ifdef RTL_SPARC1
wire        sp1_rclk      = cmp_top.iop.sparc1.ifu.sscan.rclk;
wire        sp1_snap_f    = cmp_top.iop.sparc1.ifu.sscan.snap_f;
wire [93:0] sp1_snap_data = cmp_top.iop.sparc1.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC2
wire        sp2_rclk      = cmp_top.iop.sparc2.ifu.sscan.rclk;
wire        sp2_snap_f    = cmp_top.iop.sparc2.ifu.sscan.snap_f;
wire [93:0] sp2_snap_data = cmp_top.iop.sparc2.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC3
wire        sp3_rclk      = cmp_top.iop.sparc3.ifu.sscan.rclk;
wire        sp3_snap_f    = cmp_top.iop.sparc3.ifu.sscan.snap_f;
wire [93:0] sp3_snap_data = cmp_top.iop.sparc3.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC4
wire        sp4_rclk      = cmp_top.iop.sparc4.ifu.sscan.rclk;
wire        sp4_snap_f    = cmp_top.iop.sparc4.ifu.sscan.snap_f;
wire [93:0] sp4_snap_data = cmp_top.iop.sparc4.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC5
wire        sp5_rclk      = cmp_top.iop.sparc5.ifu.sscan.rclk;
wire        sp5_snap_f    = cmp_top.iop.sparc5.ifu.sscan.snap_f;
wire [93:0] sp5_snap_data = cmp_top.iop.sparc5.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC6
wire        sp6_rclk      = cmp_top.iop.sparc6.ifu.sscan.rclk;
wire        sp6_snap_f    = cmp_top.iop.sparc6.ifu.sscan.snap_f;
wire [93:0] sp6_snap_data = cmp_top.iop.sparc6.ifu.sscan.snap_data;
`endif
`ifdef RTL_SPARC7
wire        sp7_rclk      = cmp_top.iop.sparc7.ifu.sscan.rclk;
wire        sp7_snap_f    = cmp_top.iop.sparc7.ifu.sscan.snap_f;
wire [93:0] sp7_snap_data = cmp_top.iop.sparc7.ifu.sscan.snap_data;
`endif
`endif // GATE_SIM_TAP


`ifdef RTL_SPARC0
always @(posedge sp0_rclk)
begin
      sp0_snap_f_f <= sp0_snap_f;
      if (!sp0_snap_f & sp0_snap_f_f & !sp0_snap_done) begin 
         sp0_snap_done <= 1'b1;
         sp_snp_vld[0] = 1'b1;
      end 

      if (clr_snap_done) sp0_snap_done <= 1'b0;

        if ((sp0_snap_f == 1'b1) & !sp0_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc0");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[0] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc0 which was not asked to snap by TAP");
         end
         snap_data[(94*1)-1 :0] = sp0_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC1
always @(posedge sp1_rclk)
begin
      sp1_snap_f_f <= sp1_snap_f;
      if (!sp1_snap_f & sp1_snap_f_f & !sp1_snap_done) begin 
         sp1_snap_done <= 1'b1;
         sp_snp_vld[1] = 1'b1;
      end 

      if (clr_snap_done) sp1_snap_done <= 1'b0;

        if ((sp1_snap_f == 1'b1) & !sp1_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc1");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[1] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc1 which was not asked to snap by TAP");
         end
         snap_data[(94*2)-1 :(94*1)] = sp1_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC2
always @(posedge sp2_rclk)
begin
      sp2_snap_f_f <= sp2_snap_f;
      if (!sp2_snap_f & sp2_snap_f_f & !sp2_snap_done) begin 
         sp2_snap_done <= 1'b1;
         sp_snp_vld[2] = 1'b1;
      end 

      if (clr_snap_done) sp2_snap_done <= 1'b0;

        if ((sp2_snap_f == 1'b1) & !sp2_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc2");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[2] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc2 which was not asked to snap by TAP");
         end
         snap_data[(94*3)-1 :(94*2)] = sp2_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC3
always @(posedge sp3_rclk)
begin
      sp3_snap_f_f <= sp3_snap_f;
      if (!sp3_snap_f & sp3_snap_f_f & !sp3_snap_done) begin 
         sp3_snap_done <= 1'b1;
         sp_snp_vld[3] = 1'b1;
      end 

      if (clr_snap_done) sp3_snap_done <= 1'b0;

        if ((sp3_snap_f == 1'b1) & !sp3_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc3");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[3] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc3 which was not asked to snap by TAP");
         end
         snap_data[(94*4)-1 :(94*3)] = sp3_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC4
always @(posedge sp4_rclk)
begin
      sp4_snap_f_f <= sp4_snap_f;
      if (!sp4_snap_f & sp4_snap_f_f & !sp4_snap_done) begin 
         sp4_snap_done <= 1'b1;
         sp_snp_vld[4] = 1'b1;
      end 

      if (clr_snap_done) sp4_snap_done <= 1'b0;

        if ((sp4_snap_f == 1'b1) & !sp4_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc4");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[4] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc4 which was not asked to snap by TAP");
         end
         snap_data[(94*5)-1 :(94*4)] = sp4_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC5
always @(posedge sp5_rclk)
begin
      sp5_snap_f_f <= sp5_snap_f;
      if (!sp5_snap_f & sp5_snap_f_f & !sp5_snap_done) begin 
         sp5_snap_done <= 1'b1;
         sp_snp_vld[5] = 1'b1;
      end 

      if (clr_snap_done) sp5_snap_done <= 1'b0;

        if ((sp5_snap_f == 1'b1) & !sp5_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc5");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[5] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc5 which was not asked to snap by TAP");
         end
         snap_data[(94*6)-1 :(94*5)] = sp5_snap_data[93:0];
        end
end
`endif

`ifdef RTL_SPARC6
always @(posedge sp6_rclk)
begin
      sp6_snap_f_f <= sp6_snap_f;
      if (!sp6_snap_f & sp6_snap_f_f & !sp6_snap_done) begin 
         sp6_snap_done <= 1'b1;
         sp_snp_vld[6] = 1'b1;
      end 

      if (clr_snap_done) sp6_snap_done <= 1'b0;

        if ((sp6_snap_f == 1'b1) & !sp6_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc6");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[6] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc6 which was not asked to snap by TAP");
         end
         snap_data[(94*7)-1 :(94*6)] = sp6_snap_data[93:0];
        end
end
`endif


`ifdef RTL_SPARC7
always @(posedge sp7_rclk)
begin
      sp7_snap_f_f <= sp7_snap_f;
      if (!sp7_snap_f & sp7_snap_f_f & !sp7_snap_done) begin 
         sp7_snap_done <= 1'b1;
         sp_snp_vld[7] = 1'b1;
      end 

      if (clr_snap_done) sp7_snap_done <= 1'b0;

        if ((sp7_snap_f == 1'b1) & !sp7_snap_done)   begin 
         if(debug) $display("TAP_STUB:: Snap for sparc7");
         // use spc_id for the check that a sparc with id not programmed is snapped
         if (spc_id[7] == 1'b0) begin 
           $display("TAP_STUB:: ERROR Snap for sparc7 which was not asked to snap by TAP");
         end
         snap_data[(94*8)-1 :(94*7)] = sp7_snap_data[93:0];
        end
end
`endif


// This needs to be updated for the cases of ciop8 and ciop
always @( sp_snp_vld[7] or sp_snp_vld[6] or sp_snp_vld[5] or sp_snp_vld[4] 
        or sp_snp_vld[3] or sp_snp_vld[2] or sp_snp_vld[1] or sp_snp_vld[0])
`ifdef CMP_MODEL8  // ciop8
  snap_data[752] = (sp_snp_vld[7] & sp_snp_vld[6] & sp_snp_vld[5] &
                       sp_snp_vld[4] & sp_snp_vld[3] & sp_snp_vld[2] &
                                       sp_snp_vld[1] & sp_snp_vld[0]);
`else
  snap_data[752] = sp_snp_vld[0];
`endif


// similar for io
// For io we keep an option of forcing the input of io shadow scan
//  input registers.

// These may need to be further updated for fine granularity at gate level?
// each snap and clk like sparc above

`ifdef RTL_IOBDG // only ciop/ciop8

`ifdef GATE_SIM_TAP
wire io_snp      = cmp_top.iop.pad_ddr0.ctu_global_snap;
wire io_snp_clk  = cmp_top.iop.pad_ddr0.rclk;

always @(posedge io_snp_clk) 
begin 
      ios_snap_f_f <= io_snp;
      if (!io_snp & ios_snap_f_f & !ios_snap_done) begin
         ios_snap_done <= 1'b1;
         io_snap[752] = 1'b1;
      end

      if (clr_snap_done) ios_snap_done <= 1'b0;

if ((io_snp == 1'b1) & !ios_snap_done)   begin

  if ($test$plusargs("tap_force_io"))  begin 
    io_snap[53:0] = { 1'b0, force_io_data[52:45],
                      1'b0, force_io_data[43:36],
                      1'b0, force_io_data[34:27],
                      1'b0, force_io_data[25:18],
                      1'b0, force_io_data[16:9],
                      1'b0, force_io_data[7:0]
		     };

    if (io_snp == 1'b1) begin 
      //force  cmp_top.iop.pad_jbusr.I145_I23_I208_net0237[7:0]                = force_io_data[52:45];
      //force  cmp_top.iop.pad_jbusr.I162_I23_I208_net0228[7:0]                = force_io_data[43:36];
      //force  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup_I23_I208_net0228[7:0]   = force_io_data[34:27];
      //force  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown_I33_I208_net0237[7:0] = force_io_data[25:18];
      //force  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup_I23_I208_net0228[7:0]   = force_io_data[16:9];
      //force  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown_I33_I208_net0237[7:0] = force_io_data[7:0];

      force  cmp_top.iop.pad_jbusr.I145_I23_I208_z[7:0]                = force_io_data[52:45];
      force  cmp_top.iop.pad_jbusr.I162_I23_I208_z[7:0]                = force_io_data[43:36];
      force  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup_I23_I208_z[7:0]   = force_io_data[34:27];
      force  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown_I33_I208_z[7:0] = force_io_data[25:18];
      force  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup_I23_I208_z[7:0]   = force_io_data[16:9];
      force  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown_I33_I208_z[7:0] = force_io_data[7:0];
    end else begin 
      release  cmp_top.iop.pad_jbusr.I145_I23_I208_z[7:0];
      release  cmp_top.iop.pad_jbusr.I162_I23_I208_z[7:0];
      release  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup_I23_I208_z[7:0];
      release  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown_I33_I208_z[7:0];
      release  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup_I23_I208_z[7:0];
      release  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown_I33_I208_z[7:0];
    end
  end else begin 
    if (io_snp == 1'b1) begin 
      io_snap[53:0] =  { 1'b0,  cmp_top.iop.pad_jbusr.I145_I23_I208_z[7:0],
                         1'b0,  cmp_top.iop.pad_jbusr.I162_I23_I208_z[7:0],
                         1'b0,  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup_I23_I208_z[7:0],
                         1'b0,  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown_I33_I208_z[7:0],
                         1'b0,  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup_I23_I208_z[7:0],
                         1'b0,  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown_I33_I208_z[7:0]
			};
    end
  end

end

end

`else
wire io_snp      = cmp_top.iop.pad_jbusr.I145.ctu_global_snap;
wire io_snp_clk  = cmp_top.iop.pad_jbusr.I145.rclk;

always @(posedge io_snp_clk) 
begin 
      ios_snap_f_f <= io_snp;
      if (!io_snp & ios_snap_f_f & !ios_snap_done) begin
         ios_snap_done <= 1'b1;
         io_snap[752] = 1'b1;
      end

      if (clr_snap_done) ios_snap_done <= 1'b0;

if ((io_snp == 1'b1) & !ios_snap_done)   begin

  if ($test$plusargs("tap_force_io"))  begin 
    io_snap[53:0] = force_io_data[53:0];
    if (io_snp == 1'b1) begin 
      force  cmp_top.iop.pad_jbusr.I145.from_csr[7:0]                = force_io_data[52:45];
      force  cmp_top.iop.pad_jbusr.I162.from_csr[7:0]                = force_io_data[43:36];
      force  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup.from_csr[7:0]   = force_io_data[34:27];
      force  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown.from_csr[7:0] = force_io_data[25:18];
      force  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup.from_csr[7:0]   = force_io_data[16:9];
      force  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown.from_csr[7:0] = force_io_data[7:0];
    end else begin 
      release  cmp_top.iop.pad_jbusr.I145.from_csr[7:0];
      release  cmp_top.iop.pad_jbusr.I162.from_csr[7:0];
      release  cmp_top.iop.pad_ddr0.ddr0_impctl_pullup.from_csr[7:0];
      release  cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown.from_csr[7:0];
      release  cmp_top.iop.pad_ddr2.ddr2_impctl_pullup.from_csr[7:0];
      release  cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown.from_csr[7:0];
    end
  end else begin 
    if (io_snp == 1'b1) begin 
      io_snap[53:0] =  { 1'b0, cmp_top.iop.pad_jbusr.I145.from_csr[7:0], 
			 1'b0, cmp_top.iop.pad_jbusr.I162.from_csr[7:0],
			 1'b0, cmp_top.iop.pad_ddr0.ddr0_impctl_pullup.from_csr[7:0],
			 1'b0, cmp_top.iop.pad_ddr0.ddr0_impctl_pulldown.from_csr[7:0],
			 1'b0, cmp_top.iop.pad_ddr2.ddr2_impctl_pullup.from_csr[7:0],
			 1'b0, cmp_top.iop.pad_ddr2.ddr2_impctl_pulldown.from_csr[7:0]
			};
    end
  end
end 

end

`endif
`endif // ciop/ciop8

`ifdef RTL_SPARC0
always @(current_cmd)
begin
  // for multile shadow scan instructions
  if ((current_cmd[171:168] == 4'ha)) 
    clr_snap_done <= 1'b1;
  @(posedge sp0_rclk);
  @(posedge sp0_rclk);
    clr_snap_done <= 1'b0;
end
`endif

always @(posedge tck)
begin
  if (!stub_done) begin
    if (fd != 0) begin
      current_cmd = 172'h0 ;
      status = $fscanf (fd, "%x", current_cmd) ;

      if (status != 0) begin
        addr = current_cmd[167:128];
        data = current_cmd[127:64];
        mask = current_cmd[63:0];

        case (current_cmd[171:168])
          4'h1 : // READ ONCE  ("rdo")
          begin
            if(debug) $display("TAP_STUB:: %0d : Tap Stub Read once cmd = %x", $time, current_cmd);
            creg_read_data_from(current_state, addr, data_rd_out, 1'b0, timeout);
            $display("TAP_STUB:: %0d : Tap Stub Read Once : Address = %0x Data = %0x", $time, addr, data_rd_out);
            //JH: tms = 1'b0;
            TapGoto(current_state, `idle);
          end
                                    
          4'h2 : // READ & COMPARE ("rdc")
          begin 
            if(debug) $display("TAP_STUB:: %0d : Tap Stub Read and compare cmd = %x", $time, current_cmd);
            creg_read_data_from(current_state, addr, data_rd_out, 1'b0, timeout);
            $display("TAP_STUB:: %0d : Tap Stub Read & Compare : Address = %0x Data = %0x Exp Data = %0x Mask = %0x", $time, addr, data_rd_out, data, mask);
            $display("TAP_STUB:: %0d : Tap Stub Read & Compare : Data & Mask = %0x Exp Data & Mask = %0x", $time, data_rd_out & mask, data & mask);              
            if((data_rd_out & mask) !== (data & mask)) 
            begin 
              $display("TAP_STUB:: %0d : ERROR! Miscompare! Tap Stub Read & Compare : Data & Mask = %0x Exp Data & Mask = %0x", $time, data_rd_out & mask, data & mask);
              error = 1'b1;
              stub_done_reg = 1'b1;  
            end
            //JH: tms = 1'b0;
            TapGoto(current_state, `idle);
          end
            
          4'h3 : // READ UNTIL MATCH OR TIMEOUT ("rdm")
          begin
            if(debug) $display("TAP_STUB:: %0d : Tap Stub Read until match or timeout cmd = %x", $time, current_cmd);
            creg_read_data_from(current_state, addr, data_rd_out, 1'b0, timeout);
            $display("TAP_STUB:: %0d : Tap Stub Read until Match : Address = %0x Data = %0x Mask = %0x Timeout = %0d", $time, addr, data_rd_out, mask, time_out_cnt);
            time_out_cnt = 0;
            while(( ((data_rd_out & mask) !== (data & mask)) && (time_out_cnt < 20) ) ) 
            begin
              creg_read_data_from(current_state, addr, data_rd_out, 1'b1, timeout);
              $display("TAP_STUB:: %0d : Tap Stub Read until Match : Address = %0x Data = %0x Mask = %0x Timeout = %0d", $time, addr, data_rd_out, mask, time_out_cnt);
              time_out_cnt = time_out_cnt + 1;
            end
            if (time_out_cnt == 20)
            begin
              $display("TAP_STUB:: %0d : ERROR! Timeout! Tap Stub Read & Compare : Data & Mask = %0x Exp Data & Mask = %0x", $time, data_rd_out & mask, data & mask);
              error = 1'b1;
              stub_done_reg = 1'b1;  
            end
            //JH: tms = 1'b0;
            TapGoto(current_state, `idle);
          end
            
          4'h4 : // WRITE  ("wri")
          begin 
            if(debug) $display("TAP_STUB:: (%1d ps): CREG_WRITE (DEBUG) cmd = %x", $time, current_cmd);
            $display("TAP_STUB:: (%1d TCK): CREG_WRITE Addr=0x%0x Data=0x%0x", $time/dtck, addr, data);
            creg_write_data_to(current_state, addr, data);
            //JH: tms = 1'b0;
            TapGoto(current_state, `idle);
            $display("TAP_STUB:: (%1d TCK): CREG_WRITE Addr=0x%0x Data=0x%0x (DONE)\n", $time/dtck, addr, data);
          end
            
          4'h5 : // DONE 
          begin 
            if(debug) $display("TAP_STUB:: %0d : DONE (DEBUG) cmd = ", $time, current_cmd);
            $display("TAP_STUB:: (%1d TCK): DONE", $time/dtck);
            stub_done_reg = 1'b1;
          end

	  4'h6 : // clk_stretch  "stc addr"
	  begin
  	       $display("TAP_STUB:: (%1d TCK, %0d ps): CLK_STRETCH %0d TCK cycles",$time/dtck,$time,addr);
	       force cmp_top.CLK_STRETCH = 1'b1; // has to use force
	       repeat(addr) @(posedge tck);
	       force cmp_top.CLK_STRETCH = 1'b0;
	       release cmp_top.CLK_STRETCH;
          end
            
          4'h7 : // WAIT CNT ("del")
          begin 
            if(debug) $display("TAP_STUB:: (%1d ps): WAIT/DELAY(DEBUG) cmd = %x", $time, current_cmd);
            if ($test$plusargs("tester_tap_seq")) begin
	             $display("TAP_STUB:: %0d : Tap Stub Synching on trig_tap_command", $time);
	             @(posedge trig_tap_cmd);
	             $display("TAP_STUB:: %0d : Tap Stub got Trigger trig_tap_command", $time);
            end
            else begin
               $display("TAP_STUB:: (%1d TCK): WAIT/DELAY Count = %0d TCK cycles", $time/dtck, addr);
    	         ssc_time_diff = $time;
               repeat(addr) @(posedge tck);
               $display("TAP_STUB:: (%1d TCK): WAIT/DELAY DONE (%0d TCK cycles)\n", $time/dtck, ($time-ssc_time_diff)/dtck );
            end
          end
          
`ifdef DRAM_OR_MSS_SAT
`else
          4'h8 : // STOP with CLK_STOP_ID and SCAN (SER/PARALLEL) ("ssc")
          begin 
            if(debug) $display("TAP_STUB:: %0d : STOP & SCAN Cmd = %x", $time, current_cmd);
            sequence_id 	= mask[5:0];
	    ssc_wait_cken_bit 	= mask[8];
	    ssc_trigin_trig     = addr[39];
    	    wait_cycle  	= mask[63:32];
            par_scan    	= data[0];
	    shift_cycle 	= data[63:32];
            {jbus_domain,dram_domain,cmp_domain} = addr[8:0];
            
	    $display("TAP_STUB:: (%1d TCK): STOP_SCAN stop_id    =0x%x", $time/dtck,sequence_id,);
	    $display("TAP_STUB:: (%1d TCK): STOP_SCAN shift_cycle=0x%x", $time/dtck,shift_cycle,);
	    $display("TAP_STUB:: (%1d TCK): STOP_SCAN par_scan   =0x%0b (%s)", $time/dtck,par_scan,(par_scan==1'b0)? "serial": "parallel");
	    $display("TAP_STUB:: (%1d TCK): STOP_SCAN wait_cken_off=0x%0b", $time/dtck,ssc_wait_cken_bit);

	    // No need to issue tap clk_stop_id instruction
	    if (sequence_id == 6'h3f) begin
		$display("TAP_STUB:: (%1d TCK) WILL NOT issue CLK_STOP_ID tap inst", $time/dtck);
		skip_stop_id = 1'b1;
	    end

            // clk stop id is programmed already no need to do this 
            if(skip_stop_id == 1'b0) begin 
               if(debug) $display("TAP_STUB:: (%1d ps): STOP_SCAN (DEBUG): stop_id inst:", $time);
               invoke_clock_stop(current_state, sequence_id);
               $display("TAP_STUB:: (%1d TCK): STOP_SCAN TAP CLK_STOP_ID inst (DONE)\n", $time/dtck);
       	       
            end

            // Use this if the debug trigger needs to be externally generated
            if ($test$plusargs("tap_trigin_trig") || ssc_trigin_trig==1'b1)  begin 
  	       $display("TAP_STUB:: (%1d TCK, %0d ps): STOP_SCAN issue debug trigger (TRIGIN=1'b%0b)",$time/dtck,$time,trigin);
               issue_debug_trigger;  // The IOB reg 98_0000_2000 should be set by diag
	  	 		       // with data 0000_0000_0000_0020  TRIGIN_ENB = 1
  	       $display("TAP_STUB:: (%1d TCK, %0d ps): STOP_SCAN TRIGIN pin asserted (TRIGIN=1'b%0b) (DONE)\n",$time/dtck, $time, trigin);
            end 

	    // Wait for cken to be turned off
	    // cken_off_done in cmp_clk will chang from 0->1 if all clks 
	    // are stopped. Thus wait for posedge of cken_off_done to
	    // occur. (USE +tap_wait_cken_off, or mask[8] asserted)
	    if ($test$plusargs("tap_wait_cken_off") || ssc_wait_cken_bit==1'b1) begin
	       $display("TAP_STUB:: (%1d TCK): STOP_SCAN wait for clks to stop", $time/dtck);
	       $display("TAP_STUB:: (%1d TCK): STOP_SCAN wait for cken_off_done to rise)", $time/dtck);
       	       ssc_time_diff = $time;
	       @(posedge cmp_top.cken_off_done);
	       if (cmp_top.cken_off_done === 1'bx) begin
		      $display("TAP_STUB:: (%1d TCK, %0dps) ERROR cken_off_done is X", $time/dtck, $time);
		      repeat(100) @(posedge tck);
		      $display("TAP_STUB:: ABORT from ssc cmd");
		      $finish;
	       end
	       ssc_time_diff = $time - ssc_time_diff;
	       $display("TAP_STUB:: (%1d TCK): STOP_SCAN all clk stopped.(wait_cken_off DONE)", $time/dtck);
	       $display("TAP_STUB:: (%1d TCK): STOP_SCAN WAITED %0d TCK cycles, %0d ps\n", $time/dtck, ssc_time_diff/dtck, ssc_time_diff);
	    end
	    else begin  // ELSE, wait arbitrary tck cycles
	       if (wait_cycle == 32'h0000_0000)  // if not specified
		  wait_cycle = 32'h0200;         // default 512 cycles
  	       if(debug) $display("TAP_STUB:: (%1d TCK): STOP_SCAN wait user cycle (%0d TCK cycles)", $time/dtck, wait_cycle);
	       ssc_time_diff = $time;
               repeat(wait_cycle) @(posedge tck);
	       ssc_time_diff = $time - ssc_time_diff;
  	       if(debug) $display("TAP_STUB:: (%1d TCK): STOP_SCAN wait user cycle DONE (WAITED %0d TCK)\n", $time/dtck, ssc_time_diff);
            end
 
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP TAP_CLK_SEL TCK mode", $time/dtck);
	    jbus_domain = 3'b110; // jh: always select TCK, overwrite here
	    dram_domain = 3'b110;
	    cmp_domain  = 3'b110;
            tap_clk_sel_mode(current_state, jbus_domain,dram_domain,cmp_domain); 
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP TAP_CLK_SEL TCK mode (DONE)\n", $time/dtck);

            if (par_scan == 1'b1) begin 
   	      $display("TAP_STUB:: (%1d TCK): SCAN_STOP Tap_IR SCAN_DUMP_PARALLEL",$time/dtck);
              TapIRLoad(current_state, `TAP_SCAN_DUMP_PARALLEL);
   	      $display("TAP_STUB:: (%1d TCK): SCAN_STOP Tap_IR SCAN_DUMP_PARALLEL (DONE)\n", $time/dtck);
            end else begin 
   	      $display("TAP_STUB:: (%1d TCK): SCAN_STOP Tap_IR SCAN_DUMP_SERIAL", $time/dtck);
              TapIRLoad(current_state, `TAP_SCAN_DUMP_SERIAL);
   	      $display("TAP_STUB:: (%1d TCK): SCAN_STOP Tap_IR SCAN_DUMP_SERIAL (DONE)\n", $time/dtck);
            end

            TapGoto(current_state, `update_ir);
            TapGoto(current_state, `select_dr);
            TapGoto(current_state, `capture_dr); 
            TapGoto(current_state, `shift_dr); 

	    ssc_time_diff = $time;
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP shift_cycle=%0d cycles", $time/dtck,shift_cycle+1);
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP START SHIFTING NOW ...", $time/dtck);
	    repeat (shift_cycle+1) @(posedge tck);
            TapGoto(current_state, `shift_dr);
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP FINISH SHIFTING NOW ...", $time/dtck);
  	    $display("TAP_STUB:: (%1d TCK): SCAN_STOP SHIFTED %0d TCK cycles\n", $time/dtck,($time-ssc_time_diff)/dtck);
	    TapGoto(current_state, `exit1_dr);
	    TapGoto(current_state, `update_dr);
	    TapGoto(current_state, `idle);

	    $display("TAP_STUB:: (%1d TCK, or %0d ps): finish simulation from TAP\n", $time/dtck, $time);
	    $finish; // Kill simulation from tap

          end 	// End of "ssc" cmd

          4'h9 :// program CLK_STOP_ID ("sid")
          begin
            if(debug) $display("TAP_STUB:: %0d : CLK_STOP_ID (DEBUG) Cmd = %x", $time, current_cmd);
	    sid_wait_cken_bit = mask[8]; 
            sequence_id       = mask[5:0];
	    ssc_trigin_trig   = addr[39];

	    $display("TAP_STUB:: (%1d TCK): STOP_ID stop_id     =0x%x", $time/dtck,sequence_id,);
	    $display("TAP_STUB:: (%1d TCK): STOP_ID wait_cken_on=0x%0b", $time/dtck,sid_wait_cken_bit);

            // Wait for all_cken up, CLK_STOP_ID need be issued after
	    // cmp_clk is running; USE +tap_wait_cken_on, or assert mask[8] 
	    if ($test$plusargs("tap_wait_cken_on") || sid_wait_cken_bit == 1'b1) begin
	       $display("TAP_STUB:: (%1d TCK): STOP_ID wait for cken to rise", $time/dtck);
	       $display("TAP_STUB:: (%1d TCK): tap_stop_id inst has to be issued after cmp_clk up", $time/dtck);
               if (cmp_top.cmp_clk.all_cken == 1'b1) begin
	         $display("TAP_STUB:: (%1d TCK): STOP_ID dont need wait_cken (all_cken=1'b%0b", $time/dtck,cmp_top.cmp_clk.all_cken);
	         $display("TAP_STUB:: (%1d TCK): STOP_ID wait_cken_on DONE", $time/dtck);
	       end else begin
       	         ssc_time_diff = $time;
	         @(posedge cmp_top.cmp_clk.all_cken);
	         $display("TAP_STUB:: (%1d TCK): STOP_ID wait_cken_on DONE", $time/dtck);
	         $display("TAP_STUB:: (%1d TCK): STOP_ID WAITED %0d TCK cycles\n", $time/dtck, ($time-ssc_time_diff)/dtck);
               end
	    end

	    // No need to issue tap clk_stop_id instruction
	    if (sequence_id == 6'h3f) begin
		$display("TAP_STUB:: (%1d TCK): WILL NOT issue CLK_STOP_ID tap inst", $time/dtck);
		skip_stop_id = 1'b1;
	    end
	    if (skip_stop_id == 1'b0) begin
               $display("TAP_STUB:: (%1d TCK): CLK_STOP_ID seq_id = %x", $time/dtck, sequence_id);
               invoke_clock_stop(current_state, sequence_id);
               $display("TAP_STUB:: (%1d TCK): STOP_ID tap inst DONE\n", $time/dtck);
               skip_stop_id = 1;
            end

            // Use this if the debug trigger needs to be externally generated
            if ($test$plusargs("tap_trigin_trig") || ssc_trigin_trig == 1'b1)  begin 
  	     $display("TAP_STUB:: (%1d TCK, %0d ps): STOP_ID : issue debug trigger", $time/dtck, $time);
             issue_debug_trigger;  // The IOB reg 98_0000_2000 should be set by diag
				     // with data 0000_0000_0000_0020  TRIGIN_ENB = 1
  	     $display("TAP_STUB:: (%1d TCK, %0d ps): STOP_ID : TRIGIN asserted (TRIGN=1'b%0b)\n", $time/dtck, $time, trigin);
            end 

          end 	// End of 4'h9 ("sid")
`endif // DRAM_OR_MSS_SAT
 
          4'ha :// SHADOW SCAN ( TAP_SSCAN_T0,1,2,3 )
          begin 
            // cmd  addr[39:0] data[63:0] mask[63:0]  => format of tap.cmd
            if(debug) $display("TAP_STUB:: %0d : Tap Stub SHADOW SCAN Cmd = %x", $time, current_cmd);
            thread_id   = mask[1:0]; // 4 threads per core
            force_io_data = mask[57:4];
            spc_id      = data[7:0];
            probe_spc   = addr[0];
            probe_io    = addr[1];

            if(debug) $display("TAP_STUB:: %0d : Loading TAP COMMAND = TAP_SSCAN_T%d , Sparc to scan = %b", $time, thread_id,spc_id);
            load_sscan_instr(current_state, spc_id,thread_id);


           // read_sparc_sscan
             // There has to be a task to sample the golden data from the rtl, using th_id and sp_id
             // This task assumes that structure is available

           // ----------------------------
           // -- SPARC SSCAN (READ only)
           // ----------------------------
           //while(  snap_data[752] != 1) //wait till snap done
           // @(posedge tck);

           //read_sparc_sscan (snap_data, spc_id, probe_spc);
           read_sparc_sscan (spc_id, probe_spc);

           // --------------------------------------
           // -- IO Shadow Scan Chains: Write-Read
           // --------------------------------------
           flg_1st_access = 1;
           if (spc_id == 8'b0000_0000) flg_1st_access = 0;
           access_io_sscan (io_snap, flg_1st_access,  probe_io);



           // see if these are needed ============CHECK============
           tms = 1'b0;
           TapGoto(current_state, `idle);
          end

          4'hb : // program for TAP_PLL_BYP
          begin
            if(debug) $display("TAP_STUB:: %0d: tap_pll_byp ", $time);
            TapIRLoad(current_state, `TAP_PLL_BYP);
            TapGoto(current_state, `update_ir);
            TapGoto(current_state, `idle);
            $display("TAP_STUB:: %0d: tap_pll_byp done ", $time);
          end

          4'hc : // Efuse BYPASS Data
          begin 
            efc_wr_data = data[21:0];
            efc_wr_addr = addr[5:0];
            if(debug) $display("TAP_STUB:: %0d : Tap Stub EFC Bypass data, wr addr = %x, wr_data = %x", $time, efc_wr_addr,efc_wr_data);
            efc_bypass_data_wr(current_state, efc_wr_addr, efc_wr_data);
            $display("TAP_STUB:: %0d : Tap Stub Write : Address = %0x Data = %0x", $time, addr, data);
            tms = 1'b0;
            TapGoto(current_state, `idle);
          end
           
          4'hd : // program for TAP_MBIST_ABORT
          begin
            if(debug) $display("TAP_STUB:: %0d: tap_mbist_abort ", $time);
            TapIRLoad(current_state, `TAP_MBIST_ABORT);
            TapGoto(current_state, `update_ir);
            TapGoto(current_state, `idle);
            $display("TAP_STUB:: %0d: tap_mbist_abort done ", $time);
          end

          default : 
          begin 
            $display("TAP_STUB:: The tap.cmd file seems to have an illegal commands.") ;
          end
            
        endcase // case(current_cmd[171:168])
          
      end // if (status != 0)
        
    end // if (fd != 0)

    stub_pass = stub_done_reg & ~error;      
  end // if (! stub_done)
    
end

///////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////

//=========================================================
// instr:     TAP_EFC_BYPASS_DATA, TAP_EFC_BYPASS
// Tap State: start with "TapIRLoad",
//            end with  "update ir"
//=========================================================
task efc_bypass_data_wr;
  inout [3:0]   current_state;
  input [5:0]  address;
  input [21:0]  data_to_write;
  
  reg [33:0]   	efc_data;
  reg [64:0]   	tdo_tmp;
begin

  efc_data[33:0] = {2'b0, 3'b111, (^address ^ ^data_to_write),address,data_to_write};
 
  TapIRLoad(current_state, `TAP_EFC_BYPASS_DATA);
  TapDRLoad(current_state, tdo_tmp, efc_data, 32);
  TapGoto(current_state, `idle);

  TapIRLoad(current_state, `TAP_EFC_BYPASS);
  TapGoto(current_state, `update_ir); 
end
endtask 




//=========================================================
// instr:     TAP_CREG_ADDR, TAP_CREG_WDATA, TAP_IOB_WRITE
// Tap State: start with "TapIRLoad",
//            end with  "update ir"
//=========================================================
task creg_write_data_to;
  inout [3:0]   current_state;
  input [39:0]  address;
  input [63:0]  data_to_write;
  
  reg [64:0]   	tdo_tmp;
begin
  TapIRLoad(current_state, `TAP_CREG_ADDR);
  TapDRLoad(current_state, tdo_tmp, address, `ADDR_WIDTH);
  TapGoto(current_state, `idle);

  TapIRLoad(current_state, `TAP_CREG_WDATA);
  TapGoto(current_state, `update_ir); 
  TapGoto(current_state, `select_dr);  
  TapDRLoad(current_state, tdo_tmp, data_to_write, `DATA_WIDTH);
  TapGoto(current_state, `idle);

  TapIRLoad(current_state, `TAP_IOB_WRITE);
  TapGoto(current_state, `update_ir);
end
endtask 

//======================================================
// instr:     TAP_CREG_ADDR, TAP_CREG_RDATA, TAP_IOB_READ
// Tap state: starts from  "TapIRLoad"
//            end with  "idle"
// Return string (65 bits) = time-out bit + read data
//                            0, 1-64
//======================================================
task creg_read_data_from;
  inout [3:0]   current_state;
  input [39:0]  address;
  inout [63:0]  data;
  input         same_address;     // not same address
  inout         time_out_bit;

  integer       i;
  integer       time_out_limit;
  reg [64:0]    tdi_tmp;
  reg [64:0]    tdo_tmp;
  
begin
  time_out_limit = 100;
  time_out_bit = 0;

  TapIRLoad(current_state, `TAP_CREG_ADDR);
  // No need to load address again, if address is same
  if (same_address == 1) 
  begin  
    TapGoto(current_state, `update_ir);  
    TapGoto(current_state, `select_dr); 
    TapGoto(current_state, `capture_dr); 
    TapGoto(current_state, `exit1_dr);
    TapGoto(current_state, `update_dr);  
    TapGoto(current_state, `select_dr);
  end
  else 
    TapDRLoad(current_state, tdo_tmp, address, `ADDR_WIDTH);

  // note: need do "tap_iob_read" first,
  //       then "tap_creg_rdata"
  TapIRLoad(current_state, `TAP_IOB_READ);
  TapGoto(current_state, `update_ir);
    
  TapGoto(current_state, `select_dr);     
  TapIRLoad(current_state, `TAP_CREG_RDATA);  
  TapGoto(current_state, `update_ir); 
  TapGoto(current_state, `idle);    
  
  // 65th bit: sentinel bit:
  //           remains 0 while read is outstanding
  //           sets to 1 while read is complete
  i = 0;
  while (!(tdo == 1'b1 || i == time_out_limit) ) begin
    @(posedge tck); // sync with TCK
    i = i + 1;
  end

  if (i == time_out_limit) 
  begin
    $display("TAP_STUB:: %0d : Timeout!", $time);  
    time_out_bit = 1;      
  end

  // Even time out, still shift ....
  // shift out 65 bits (without pause-dr)
  tdi_tmp = 66'b0;
  TapGoto(current_state, `shift_dr);
  TapDRLoad(current_state, tdo_tmp, tdi_tmp, 66);
  data = tdo_tmp[63:0];
  TapGoto(current_state, `idle);

end
endtask



//=====================================
// "STOP" aspect of "Scan Dump"
//   0. configure clk_stop CLK_CTL reg
//      (1) TAP_CLK_STOP_ID ??
//      (2) CREG write to configure CLK_CTL reg?
//   1. trigger clock stop
//      CLKDIS bit in CLK_CTL is 0
//      init a debug trigger: TRIGIN pin
// JBI (SSI) : protocl: deasserted 4 jbus cycle
//                      asserted 4 jbus cycle
//   2. verify clock has been stopped
//     (1) Stop Valid Reg
//     (2) Tick Reg
//   3. verify clock stops in the sequence specified
//=====================================

task invoke_clock_stop ;
  inout [3:0]   current_state;
  input [5:0] sequence_id;

  integer debug;
  reg [`TAP_CMD_WIDTH-1:0] instr;
  integer i;

begin
  debug = 1;
  instr = `TAP_CLK_STOP_ID;

  instr = instr | (sequence_id << 6);

  $display("TAP_STUB:: (%1d TCK, %0dps): Tap_IR CLK_STOP_ID (%x)", $time/dtck, $time, instr);

  TapIRLoad(current_state, instr);
  TapGoto(current_state, `update_ir);
  TapGoto(current_state, `idle);
  
  // No need to turn off cken in scan-dump
  //config_ctu_clk_ctl ;
  //printf ("%d: Turn off all cken...",get_time(0));
  //turn_off_cluster_cken("all");

end
endtask// -- End of invoke_clock_stop

task issue_debug_trigger;
begin 
  // Reg: DB_ENET_CONTROL
  // Bit: 6 (ARMIN_ENB)  :0
  // Bit: 5 (TRIGIN_ENB) : 1 --
  //                       route TRIGIN pin to clock blk, for stop and scan
  //bit [39:0] addr_bin = 40'h98_0000_2000;
  //bit [63:0] data_bin = 64'h0000_0000_0000_0020;


  trigin = 1'b1;

end
endtask // -- End of issue_debug_trigger

task tap_clk_sel_mode;
  inout [3:0]   current_state;
  input [2:0]   jbus_domain; 
  input [2:0]   dram_domain;
  input [2:0]   cmp_domain;

  integer debug;
  reg [`TAP_CMD_WIDTH-1:0] instr;
 

begin 

  debug = 1;
  instr = `TAP_CLK_SEL;

  instr = instr | ({jbus_domain,dram_domain,cmp_domain} << 6);

  $display("TAP_STUB:: (%1d TCK, %0d ps): Tap_IR TAP_CLK_SEL = %x", $time/dtck, $time, instr);

  TapIRLoad(current_state, instr);
  TapGoto(current_state, `update_ir);
 
  // No going to idle here
  //TapGoto(current_state, `idle);  

end
endtask // End of tap_clk_sel_mode



// --------------------------------
// -- Load shadow scan instruction
// --------------------------------
task   load_sscan_instr;

  inout [3:0]   current_state;
  input [7:0] spc_id;
  input [1:0] thread_id;

  integer debug;
  reg [`TAP_CMD_WIDTH-1:0] instr;
  integer i;

begin
  debug = 1;
  
   instr = `TAP_SSCAN_T0 ;

  case (thread_id) 
   2'h0 : instr = instr | (spc_id << 6) | `TAP_SSCAN_T0 ;
   2'h1 : instr = instr | (spc_id << 6) | `TAP_SSCAN_T1 ;
   2'h2 : instr = instr | (spc_id << 6) | `TAP_SSCAN_T2 ;
   2'h3 : instr = instr | (spc_id << 6) | `TAP_SSCAN_T3 ;
   default : instr = instr | (spc_id << 6) | `TAP_SSCAN_T0 ;
  endcase

  if (debug) $display("TAP_STUB:: %0d : TAP_SSCAN_T. instruction = %x", $time, instr);

  TapIRLoad(current_state, instr);
  TapGoto(current_state, `update_ir);

  //TapGoto(current_state, `idle);
  if (debug) $display("TAP_STUB:: %0d : Finished loading TAP_SSCAN_T. instruction = %x", $time, instr);
  

end
endtask// -- End of load_sscan_instr


// ----------------------------
// -- SPARC SSCAN (READ only)
// ----------------------------
task read_sparc_sscan ;

  //input [752:0] spc_snap;
  input [7:0] spc_id;
  input probe_spc;

  integer    i,j;
  integer    cnt;
  integer    err;
  integer    flg_1st_access;
  reg        core;
  reg[752:0] TDO_out;
  reg[`SPARC_SSCAN_LENGTH-1:0] tdo_tmp;
  reg[`SPARC_SSCAN_LENGTH-1:0] tdi_tmp;

begin 



    flg_1st_access = 0;
    cnt = 0;


    TapGoto(current_state, `select_dr);

    //-- SPARC Shadow Chain: Read-Only
    TDO_out = 752'b0;
    // NOTE: Access Order: spc0, ..., spc7, IO
    for ( i = 0; i < 8; i=i+1) begin 
      core = spc_id[i];

      if (core == 1'b0) begin  // do nothing
      end else begin 

      if(debug) $display("TAP_STUB:: %0d : Read spc_core %1d(%b)", $time, i,core);

      // first time: need go through capture-dr
      if (flg_1st_access == 0) TapGoto(current_state, `capture_dr);
      flg_1st_access = 1;  // turn off flag

      // Why do I have to do this? (WARN)
      TapGoto(current_state, `shift_dr); // shift out first bit

      tdi_tmp = {(`SPARC_SSCAN_LENGTH+1){1'b1}};
      TapDRLoad94(current_state, tdo_tmp, tdi_tmp, `SPARC_SSCAN_LENGTH+1);

      if(debug) $display("TAP_STUB:: %0d : sscan_spc%1d  %b", $time, i,tdo_tmp);

      TDO_out = (tdo_tmp << (cnt*`SPARC_SSCAN_LENGTH)) | TDO_out;

      TapGoto(current_state, `exit1_dr);
      TapGoto(current_state, `pause_dr);
      TapGoto(current_state, `exit2_dr);
   
      cnt = cnt+1;  // count the read number of enabled sparce core
      end // of else of core = 1'b0

    end  // end of for loop 


  //-- Check Results of Sparc Probing
  if (probe_spc == 1) begin 
    if ( snap_data[752] != 1'b1) begin  // this should be set by the probe, if timeout
      error = 1'b1;
      $display("TAP_STUB:: %0d : sscan: ERROR: time-out while wait for ctu_sscan_snap signal!", $time);
    end
    compare_spc_probe_w_TDO (TDO_out, snap_data[751:0], spc_id, 1);
    //err += compare_spc_probe_w_TDO (TDO_out, {snap_data[751:0]}, spc_id, 1);
  end // End of spc probe and checking


  //read_sparc_sscan = err;

end
endtask // -- End of read_sparc_sscan




// ----------------------------
// -- IO SSCAN
// ----------------------------
task access_io_sscan ;

  input [752:0] io_snap;
  input flag_1st_access;
  input probe_io;

  integer    i,j;
  integer    cnt;
  integer    err;
  reg        core;
  reg[752:0] TDO_out;
  reg[4371:0] tdo_tmp;
  reg[4371:0] tdi_tmp;
  reg[53:0]   tdo_out_tmp;

begin 



    //TapGoto(current_state, `update_dr);
    //TapGoto(current_state, `select_dr);
    //TapGoto(current_state, `captur_dr);

    //-- SPARC Shadow Chain: Read-Only
    TDO_out = 752'b0;

      if(debug) $display("TAP_STUB:: %0d : Read io_chain", $time);

      // first time: need go through capture-dr
      if (flg_1st_access == 0) TapGoto(current_state, `capture_dr);
      flg_1st_access = 1;  // turn off flag

      // Why do I have to do this? (WARN)
      TapGoto(current_state, `shift_dr); // shift out first bit

      //tdi_tmp = `SPARC_SSCAN_LENGTH'b0;
      //tdi_tmp = {(`SPARC_SSCAN_LENGTH+1){1'b1}};
      tdi_tmp =  {2994{1'b1}};

      //TapDRLoad94(current_state, tdo_tmp, tdi_tmp, 18+1);
      //if(debug) $display("TAP_STUB:: %0d : ddr01%1d  %b", $time, i,tdo_tmp);
      //TDO_out[17:0] = tdo_tmp[17:0];

      TapDRLoad4370(current_state, tdo_tmp, tdi_tmp, 4370+1);
      if(debug) $display("TAP_STUB:: %0d : bscan%1d  %b", $time, i,tdo_tmp);


      //TapDRLoad94(current_state, tdo_tmp, tdi_tmp, 18+1);
      //if(debug) $display("TAP_STUB:: %0d : ddr23%1d  %b", $time, i,tdo_tmp);
      //TDO_out[35:18] = tdo_tmp[17:0];
      
      //TapDRLoad1792(current_state, tdo_tmp, tdi_tmp, 1793+1);
      //if(debug) $display("TAP_STUB:: %0d : bscan%1d  %b", $time, i,tdo_tmp);

      //TapDRLoad94(current_state, tdo_tmp, tdi_tmp, 18+1);
      //if(debug) $display("TAP_STUB:: %0d : ddr23%1d  %b", $time, i,tdo_tmp);
      //TDO_out[53:36] = tdo_tmp[17:0];

      TDO_out[53:0] = {  
                       tdo_tmp[1393:1376],   // jbusr [0:17]
                       tdo_tmp[3203:3186],   // ddr2  [0:17]
                       tdo_tmp[4369:4352]    // ddr0  [0:17]
                      };

     
     for ( j=0; j<3; j=j+1) begin
      for ( i=0; i<18; i=i+1) begin
        tdo_out_tmp[i+j*18] = TDO_out[(17-i)+j*18];
      end
     end

     TDO_out[53:0] = tdo_out_tmp[53:0];
       
 

      TapGoto(current_state, `exit1_dr);
      TapGoto(current_state, `pause_dr);
      TapGoto(current_state, `exit2_dr);
   


  //-- Check Results of Sparc Probing
  if (probe_io  == 1) begin 
    if ( io_snap[752] != 1'b1) begin  // this should be set by the probe, if timeout
      error = 1'b1;
      $display("TAP_STUB:: %0d : sscan: ERROR: time-out while wait for ctu_sscan_snap signal!", $time);
    end
    compare_spc_probe_w_TDO (TDO_out, io_snap[751:0], 8'b0, 0);
  end // End of spc probe and checking


  //read_sparc_sscan = err;

end
endtask // -- End of read_sparc_sscan()



//======================================================
// compare_spc_probe_w_TDO
//  Self-checking part of Monitor #1
//======================================================
task compare_spc_probe_w_TDO;

  input [751:0] TDO_out;
  input [751:0] spc_snap;
  input [7:0] spc_id;
  input       sparc;

  integer i,j,k;
  integer err;
  integer debug;

  reg [`SPARC_SSCAN_LENGTH-1:0] tdo_real_str;
  reg [`SPARC_SSCAN_LENGTH-1:0] exp_snap_bit;
begin

  debug = 1;

 if(sparc == 1) begin 
  if (debug == 1) begin
    $display("TAP_STUB:: %0d : Sscan compare for spc_id = %0x", $time, spc_id);
    $display("TAP_STUB:: sscan:  spc_snap=%b", spc_snap);
    $display("TAP_STUB:: sscan:   TDO_out=%b", TDO_out);
  end

  for (j=7; j >= 0; j=j-1) begin

    if (spc_id[j] != 1'b1) begin 
     // skip if not this core , do nothing
    end else begin 

    tdo_real_str = TDO_out[`SPARC_SSCAN_LENGTH-1:0];
    exp_snap_bit = spc_snap[`SPARC_SSCAN_LENGTH-1:0];

    $display("TAP_STUB:: %0d : Sscan compare for sparc = %0d", $time, j);
    compare_programmable_loc (tdo_real_str,exp_snap_bit,`SPARC_SSCAN_LENGTH,sparc);
    TDO_out  = TDO_out  >> `SPARC_SSCAN_LENGTH; // only when there is comparision

    end // of else of if (spc_id[j] != 1'b1)
    spc_snap = spc_snap >> `SPARC_SSCAN_LENGTH;
    // @(posedge tck); // wait for debug information

  end // for j=..
 end else begin   // io

    tdo_real_str = TDO_out[`IO_SSCAN_LENGTH-1:0];
    exp_snap_bit = spc_snap[`IO_SSCAN_LENGTH-1:0];

    $display("TAP_STUB:: %0d : Sscan compare for io  ", $time);
    compare_programmable_loc (tdo_real_str,exp_snap_bit,`IO_SSCAN_LENGTH,sparc);

 end 


end
endtask // --End of compare_spc_probe_w_TDO

//======================================================
// compare_programmable_loc
// 
//======================================================
task compare_programmable_loc;

  input [`SPARC_SSCAN_LENGTH-1:0] tdo_real;
  input [`SPARC_SSCAN_LENGTH-1:0] exp_snap;
  input [31:0] len;
  input       sparc;

  integer i,j,k;
  integer err;
  integer debug;
  integer mismatch;

  reg     tdo_real_bit,exp_snap_bit;

begin

  //sparc = 1;
  debug = 1;
  mismatch = 0;


  k=len-1; // compare [0:93] of out  with [93:0] of snap
  for (i=0; i<len; i=i+1) begin
    tdo_real_bit = (sparc) ? tdo_real[k] : tdo_real[i];
    exp_snap_bit = (sparc) ? exp_snap[SPARC_CHAIN_TABLE[i]] : exp_snap[IO_CHAIN_TABLE[i]] ;

      if (exp_snap_bit !== tdo_real_bit )  
        mismatch = 1;
    
      if (mismatch === 1'b1) begin 
        $display("TAP_STUB:: Mismatch in bit %0d : Expected = %b, Got = %b",i,exp_snap_bit,tdo_real_bit);
        mismatch = 0;
      end else 
        $display("TAP_STUB:: Bit Match in bit %0d : Expected = %b, Got = %b",i,exp_snap_bit,tdo_real_bit);
   k = k-1;
  end // for i=..


end
endtask // --End of compare_programmable_loc



//////////////////////////////
// Same as DRLoad but 1792 bits
//////////////////////////////
task TapDRLoad4370; 
  inout [3:0]   current_state;
  inout [4371:0]  tdo_out;        
  input [4371:0]  tdi_in;
  input         len;

  integer       len;
  integer       i;
  reg [4371:0]    tdo_out;

begin
  TapGoto(current_state, `shift_dr);
  for( i = 0 ; i < len ; i=i+1 ) begin
    tdo_out = (tdo_out << 1) | tdo;
    @(negedge tck); 
    tdi <= tdi_in[len-1];
    tdi_in = tdi_in << 1;
    if((i == len-1))
    begin
      //tms = 1;
      //current_state = `exit1_dr;      
    end
    else
      tms <= 1'b0;
    @(posedge tck); 
  end // for ( i = 0 ; i < len ; i=i+1 )
end
endtask

//////////////////////////////
// Same as DRLoad but 94 bits
//////////////////////////////
task TapDRLoad94; 
  inout [3:0]   current_state;
  inout [95:0]  tdo_out;        
  input [95:0]  tdi_in;
  input         len;

  integer       len;
  integer       i;
  reg [95:0]    tdo_out;

begin
  TapGoto(current_state, `shift_dr);
  for( i = 0 ; i < len ; i=i+1 ) begin
    tdo_out = (tdo_out << 1) | tdo;
     @(negedge tck);
    tdi <= tdi_in[len-1];
    tdi_in = tdi_in << 1;
    if((i == len-1))
    begin
      //tms = 1;
      //current_state = `exit1_dr;      
    end
    else
      tms <= 1'b0;
    @(posedge tck); 
  end // for ( i = 0 ; i < len ; i=i+1 )
end
endtask


//////////////////////////////
task TapIRLoad;
  inout [3:0]                   current_state;
  input [`TAP_CMD_WIDTH-1:0]    tdi_in;

  integer 			i;

begin
  TapGoto(current_state, `shift_ir);
  for( i = 0 ; i < `TAP_CMD_WIDTH ; i=i+1 ) begin
     @(negedge tck);
    tdi <= tdi_in[0]; 
    tdi_in = tdi_in >> 1;
    if(i == `TAP_CMD_WIDTH-1)
    begin
      tms <= 1;
      current_state = `exit1_ir;      
    end
    else begin
      tms <= 0; 
    end
     @(posedge tck);
  end // for ( i = 0 ; i < `TAP_CMD_WIDTH ; i=i+1 )    
  //tdi <= 1'bx; //JH: comment out
end
endtask

//////////////////////////////
task TapDRLoad; 
  inout [3:0]   current_state;
  inout [65:0]  tdo_out;        
  input [65:0]  tdi_in;
  input         len;

  integer       len;
  integer       i;
  reg [65:0]    tdo_out;

begin
  TapGoto(current_state, `shift_dr);
  for( i = 0 ; i < len ; i=i+1 ) begin
    tdo_out = (tdo_out << 1) | tdo;
     @(negedge tck); 
    tdi <= tdi_in[len-1];
    tdi_in = tdi_in << 1;
    if((i == len-1))
    begin
      tms <= 1;
      current_state = `exit1_dr;      
    end
    else begin
      tms <= 1'b0;
    end
     @(posedge tck);
  end // for ( i = 0 ; i < len ; i=i+1 )
//   tdo_out = (tdo_out <<1) | tdo;
  // <= statement is required not to advanced the clock too far
  //tdi <= 1'bx;	// comment out
end
endtask

//////////////////////////////
task TapGoto;
  inout [3:0]   current_state;
  input [3:0]   next_state;

  integer 	statetran0[0:15];
  integer 	statetran1[0:15];

  reg [15:0] 	data[0:15];
  reg [15:0] 	data_tmp;
  reg        	tms_bit;

begin
  statetran0[ 0] = `TAP_RTI; statetran1[ 0] = `TAP_TLR;
  statetran0[ 1] = `TAP_RTI; statetran1[ 1] = `TAP_SDS;
  statetran0[ 2] = `TAP_CDR; statetran1[ 2] = `TAP_SIS;
  statetran0[ 3] = `TAP_SDR; statetran1[ 3] = `TAP_E1D;
  statetran0[ 4] = `TAP_SDR; statetran1[ 4] = `TAP_E1D;
  statetran0[ 5] = `TAP_PDR; statetran1[ 5] = `TAP_UDR;
  statetran0[ 6] = `TAP_PDR; statetran1[ 6] = `TAP_E2D;
  statetran0[ 7] = `TAP_SDR; statetran1[ 7] = `TAP_UDR;
  statetran0[ 8] = `TAP_RTI; statetran1[ 8] = `TAP_SDS;
  statetran0[ 9] = `TAP_CIR; statetran1[ 9] = `TAP_TLR;
  statetran0[10] = `TAP_SIR; statetran1[10] = `TAP_E1I;
  statetran0[11] = `TAP_SIR; statetran1[11] = `TAP_E1I;
  statetran0[12] = `TAP_PIR; statetran1[12] = `TAP_UIR;
  statetran0[13] = `TAP_PIR; statetran1[13] = `TAP_E2I;
  statetran0[14] = `TAP_SIR; statetran1[14] = `TAP_UIR;
  statetran0[15] = `TAP_RTI; statetran1[15] = `TAP_SDS;

               //uepescsuepescsir
  data[0 ] = 16'b0000000000000001; //reset
  data[1 ] = 16'b1111111111111101; //idle
  data[2 ] = 16'b1111111000000x01; //select dr
  data[3 ] = 16'b111111111110x111; //capture dr
  data[4 ] = 16'b1111111111101111; //shift dr
  data[5 ] = 16'b1111111100x01111; //exit1 dr
  data[6 ] = 16'b1111111110111111; //pause dr
  data[7 ] = 16'b11111111x0001111; //exit2 dr
  data[8 ] = 16'b1111111x11111101; //update dr
  data[9 ] = 16'b000000x000000001; //select ir
  data[10] = 16'b11110x1111101111; //capture ir
  data[11] = 16'b1111011111111111; //shift ir
  data[12] = 16'b100x011111111111; //exit1 ir
  data[13] = 16'b1101111111111111; //pause ir
  data[14] = 16'b1x00011111111111; //exit2 ir
  data[15] = 16'bx111111111111101; //update ir

  //@(posedge tck); 
  //if(tms) current_state = statetran1[current_state];
  //else current_state = statetran0[current_state];

  while(current_state !=  next_state) begin
    data_tmp = data[current_state];
    tms_bit = data_tmp[next_state];
    @(negedge tck); // JH:
    tms <= tms_bit;
    tdi <= 1'bx;    // JH: fix TDI negedge problem
    @(posedge tck);
    // current_state = statetran[current_state][tms_bit];
    if(tms_bit) current_state = statetran1[current_state];
    else current_state = statetran0[current_state]; 
  end

end
endtask

//////////////////////////////
task TapReset;
begin
  trst_n = 1'b0;
  tms    = 1'b1;
  tdi    = 1'bx;
  @(negedge tck);
  @(negedge tck);
  trst_n = 1;
  @(negedge tck);
  @(negedge tck);
end        
endtask

endmodule // module tap_stub

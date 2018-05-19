// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cmp_clk.v
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
// The system sequence is
// 1. pwron_rst_l is asserted
// 2. j_clk starts toggling
// 3. trst_l is deasserted (this is done through tap stub)
// 4. pwron_rst_l is deasserted
// 5. pll_rst_l is deasserted
// 6. j_rst_l is deasserted 2ms after pwron_rst_l

// The tester sequence is
// 1. pwron_rst_l is asserted, j_rst_l is deasserted
// 2. j_clk starts toggling
// 3. trst_l is deasserted (this is done through tap stub)
// 4. pwron_rst_l is deasserted
// 5. pll_arst_l is deasserted
// 6. j_rst_l is asserted (time will depend on pll_bypass mode or not)
// 7. j_rst_l is deasserted after all cluster clock enables

`include "sys.h"

module cmp_clk (warm_rst_l, in_pll_byp, test_mode, j_clk, tck, pwron_rst_l, j_rst_l, xir_l,
                pwrok, cken_off_done, pll_char_in, do_bist,  g_rd_clk, g_upa_refclk, p_clk, ichip_clk) ;

  input warm_rst_l ;
  input in_pll_byp ;
   
  output test_mode;
  output tck ;
  output j_clk ;
  output pwron_rst_l ;
  output j_rst_l ;
  output xir_l ;
  output pwrok ;
  output cken_off_done ;
  output pll_char_in ;
  output do_bist ;
  
  // I/O bridge clocks
  output g_rd_clk ;
  output g_upa_refclk ;
  output p_clk ;
  output ichip_clk ;
  
  reg test_mode_reg;
  reg tck_reg ;
  reg pwrok_reg ;
  reg xir_reg ;
  reg pwron_rst_reg ;
  reg j_rst_reg ;
  reg j_clk_reg;
  
  reg g_rd_clk_reg ;
  reg g_upa_refclk_reg ;
  reg p_clk_reg ;
  reg ichip_clk_reg ;
  
  wire all_cken ;
  wire all_cken_off ;

   reg [7:0] bisi_seq_gold;
   reg [7:0] bisi_seq;
  reg [7:0] bist_seq;
  reg [7:0] bist_seq_gold;
  integer   print_check_bist;
  reg 	    do_bist_reg;
  wire 	    spc_mbist_done;
  wire 	    sctag_mbist_done;
  wire 	    mbist_done;

  reg 	    pll_char_in_reg;
  
  integer   jbus_div ;
  integer   dram_div ;
  integer   cmp_div ;
  integer   jclk_freq ;

  wire [7:0] pll_byp_offset = 1 + (jbus_div-1)*in_pll_byp;
  integer    delay;
       integer reset_del;

  ///////////////////////////////////////////////////////////////////////////
  // test_mode
  ///////////////////////////////////////////////////////////////////////////

  task test_mode_pll_byp;
    begin
      if ($test$plusargs("pll_bypass")) begin
	///////////////////////////////////////////////////////////////////////////
	// PLL bypass mode
	///////////////////////////////////////////////////////////////////////////
	  
	@(posedge cmp_top.TRST_L);
	@(posedge j_clk);
	test_mode_reg = 1'b1;
	
	force cmp_top.DRAM1_DQ[9]  = 1'b0; // rt_ack
	force cmp_top.DRAM1_DQ[10] = 1'b0; // rt_valid
	force cmp_top.DRAM1_DQ[88] = 1'b0; // pll_char_mode
	force cmp_top.DRAM1_DQ[90] = 1'b0; // pscan_mode
	force cmp_top.DRAM1_DQ[32] = 1'b0; // shift_en
	force cmp_top.DRAM1_DQ[48] = 1'b0; // bist_mode
	force cmp_top.DRAM1_DQ[78] = 1'b0; // tsr_mode
	force cmp_top.DRAM1_DQ[94] = 1'b0; // pll_trst_l
	force cmp_top.DRAM1_DQ[34] = 1'b1; // pll_bypass
	
	@(posedge j_clk);
	test_mode_reg = 1'b0;
	@(posedge j_clk);
	test_mode_reg = 1'b1;
      end
    end
  endtask

  task test_mode_bist_mode;
    begin
      ///////////////////////////////////////////////////////////////////////////
      // bist_mode
      ///////////////////////////////////////////////////////////////////////////
      // here is where the test_mode pin can be asserted to view contents of MBIST_RESULT_REG
      // while testmode is asserted, assert bist_mode pin.  output on rt_data_out[23:0]
      if ($test$plusargs("bist_mode")) begin
	       @(posedge do_bist_reg);
	       // 8 cycles to shift in bist sequence
	       repeat (8) @(posedge j_clk_reg);

	       // wait some more for bist to start
	       repeat (10) @(posedge j_clk_reg);
	       $display("cmp_clk.v: %0d forcing DRAM DQ pins", $time);

	       force {cmp_top.DRAM2_DQ[2] , cmp_top.DRAM2_DQ[8] , cmp_top.DRAM2_DQ[16], cmp_top.DRAM2_DQ[18],
	              cmp_top.DRAM2_DQ[88], cmp_top.DRAM2_DQ[90], cmp_top.DRAM2_DQ[40], cmp_top.DRAM2_DQ[42],
	              cmp_top.DRAM3_DQ[16], cmp_top.DRAM3_DQ[18], cmp_top.DRAM3_DQ[24], cmp_top.DRAM3_DQ[26],
	              cmp_top.DRAM3_DQ[32], cmp_top.DRAM3_DQ[34], cmp_top.DRAM3_DQ[40], cmp_top.DRAM3_DQ[42],
	              cmp_top.DRAM3_DQ[48], cmp_top.DRAM3_DQ[50], cmp_top.DRAM3_DQ[56], cmp_top.DRAM1_DQ[42],
	              cmp_top.DRAM1_DQ[40], cmp_top.DRAM1_DQ[26], cmp_top.DRAM1_DQ[24], cmp_top.DRAM1_DQ[2] ,
	              cmp_top.DRAM1_DQ[0] , cmp_top.DRAM0_DQ[58], cmp_top.DRAM0_DQ[56], cmp_top.DRAM0_DQ[34],
	              cmp_top.DRAM0_DQ[32], cmp_top.DRAM0_DQ[18], cmp_top.DRAM0_DQ[16], cmp_top.DRAM0_DQ[2] }
		       = {32{1'b0}}; // rt_data_in
	       force cmp_top.DRAM1_DQ[10] = 1'b0; // rt_valid
	       force cmp_top.DRAM1_DQ[18] = 1'b0; // rt_read_write
	       force cmp_top.DRAM1_DQ[8]  = 1'b0; // rt_addr_data
	       force cmp_top.DRAM1_DQ[16] = 1'b0; // rt_high_low
	       force cmp_top.DRAM1_DQ[88] = 1'b0; // pll_char_mode
	       force cmp_top.DRAM1_DQ[94] = 1'b0; // pll_trst_l
	       force cmp_top.TRST_L       = 1'b1; // pscan_mode
	       force cmp_top.DRAM1_DQ[48] = 1'b0; // bist_mode
	       force cmp_top.DRAM1_DQ[34] = 1'b0; // pll_bypass_mode
         
	       @(posedge j_clk_reg);
	       $display("cmp_clk.v: %0d asserting test_mode and bist_mode pins", $time);
	       force cmp_top.DRAM1_DQ[48] = 1'b1; // bist_mode
	       test_mode_reg = 1'b1;
	       
	       @(posedge mbist_done);
	       // if letting bisi finish, then need to wait a couple of cycles to see rt_data_out
	       repeat (2) @(posedge j_clk_reg);
	       $display("cmp_clk.v: %0d deasserting test_mode and bist_mode pins", $time);
	       force cmp_top.DRAM1_DQ[48] = 1'b0; // bist_mode
	       test_mode_reg = 1'b0;
	       $display("cmp_clk.v: %0d releasing DRAM DQ pins", $time);
	       release {cmp_top.DRAM2_DQ[2] , cmp_top.DRAM2_DQ[8] , cmp_top.DRAM2_DQ[16], cmp_top.DRAM2_DQ[18],
		              cmp_top.DRAM2_DQ[88], cmp_top.DRAM2_DQ[90], cmp_top.DRAM2_DQ[40], cmp_top.DRAM2_DQ[42],
		              cmp_top.DRAM3_DQ[16], cmp_top.DRAM3_DQ[18], cmp_top.DRAM3_DQ[24], cmp_top.DRAM3_DQ[26],
		              cmp_top.DRAM3_DQ[32], cmp_top.DRAM3_DQ[34], cmp_top.DRAM3_DQ[40], cmp_top.DRAM3_DQ[42],
		              cmp_top.DRAM3_DQ[48], cmp_top.DRAM3_DQ[50], cmp_top.DRAM3_DQ[56], cmp_top.DRAM1_DQ[42],
		              cmp_top.DRAM1_DQ[40], cmp_top.DRAM1_DQ[26], cmp_top.DRAM1_DQ[24], cmp_top.DRAM1_DQ[2] ,
		              cmp_top.DRAM1_DQ[0] , cmp_top.DRAM0_DQ[58], cmp_top.DRAM0_DQ[56], cmp_top.DRAM0_DQ[34],
		              cmp_top.DRAM0_DQ[32], cmp_top.DRAM0_DQ[18], cmp_top.DRAM0_DQ[16], cmp_top.DRAM0_DQ[2] } ;
	       release cmp_top.DRAM1_DQ[10] ; // rt_valid
	       release cmp_top.DRAM1_DQ[18] ; // rt_read_write
	       release cmp_top.DRAM1_DQ[8]  ; // rt_addr_data
	       release cmp_top.DRAM1_DQ[16] ; // rt_hight_low
	       release cmp_top.DRAM1_DQ[88] ; // pll_char_mode
	       release cmp_top.DRAM1_DQ[94] ; // pll_trst_l
	       release cmp_top.DRAM1_DQ[90] ; // pscan_mode
	       release cmp_top.DRAM1_DQ[48] ; // bist_mode
	       release cmp_top.DRAM1_DQ[34] ; // pll_bypass_mode
	       $display("cmp_clk.v: %0d exiting test_mode bist_mode", $time);
      end
    end
  endtask

   initial begin
      test_mode_reg = 1'b0;
      if ($test$plusargs("test_mode")) begin
         fork
	          test_mode_pll_byp;
	          test_mode_bist_mode;
         join
      end
   end
   
   assign test_mode = test_mode_reg ;
   
   ///////////////////////////////////////////////////////////////////////////
   // apply bist sequece on do_bist pin
   // if tester warm reset, driving pll_char_in
   ///////////////////////////////////////////////////////////////////////////
   `ifdef GATE_SIM
      assign spc_mbist_done    =  cmp_top.iop.spc7_ctu_mbistdone
  			        & cmp_top.iop.spc6_ctu_mbistdone
			        & cmp_top.iop.spc5_ctu_mbistdone
			        & cmp_top.iop.spc4_ctu_mbistdone
			        & cmp_top.iop.spc3_ctu_mbistdone
			        & cmp_top.iop.spc2_ctu_mbistdone
			        & cmp_top.iop.spc1_ctu_mbistdone
			        & cmp_top.iop.spc0_ctu_mbistdone
			        | cmp_top.iop.ctu.ctu_dft_u_bist_abort_done_complete_j ;
      assign sctag_mbist_done  =  cmp_top.iop.sctag3_ctu_mbistdone
			        & cmp_top.iop.sctag2_ctu_mbistdone
			        & cmp_top.iop.sctag1_ctu_mbistdone
			        & cmp_top.iop.sctag0_ctu_mbistdone
			        | cmp_top.iop.ctu.ctu_dft_u_bist_abort_done_complete_j ;
   assign mbist_done = cmp_top.iop.ctu.dft_wake_thr | cmp_top.iop.ctu.ctu_dft_u_bist_abort_done_complete_j;
   `else 
      assign spc_mbist_done    =  cmp_top.iop.spc7_ctu_mbistdone
			        & cmp_top.iop.spc6_ctu_mbistdone
			        & cmp_top.iop.spc5_ctu_mbistdone
			        & cmp_top.iop.spc4_ctu_mbistdone
			        & cmp_top.iop.spc3_ctu_mbistdone
			        & cmp_top.iop.spc2_ctu_mbistdone
			        & cmp_top.iop.spc1_ctu_mbistdone
			        & cmp_top.iop.spc0_ctu_mbistdone
			        | cmp_top.iop.ctu.ctu_dft.u_bist.abort_done_complete_j ;
      assign sctag_mbist_done  =  cmp_top.iop.sctag3_ctu_mbistdone
			        & cmp_top.iop.sctag2_ctu_mbistdone
			        & cmp_top.iop.sctag1_ctu_mbistdone
			        & cmp_top.iop.sctag0_ctu_mbistdone
			        | cmp_top.iop.ctu.ctu_dft.u_bist.abort_done_complete_j ;

   assign mbist_done = cmp_top.iop.ctu.dft_wake_thr | cmp_top.iop.ctu.ctu_dft.u_bist.abort_done_complete_j;
   `endif

   initial begin
      pll_char_in_reg = 1'b0;
      do_bist_reg     = 1'b0;
      
      if ($test$plusargs("do_bist")) begin
         if (! $value$plusargs("bist_seq=%h", bist_seq)) begin
	          bist_seq = 'h83;   // 0,bist_start = 1;  6, bisi_mode = 1; 
         end
         bist_seq_gold = bist_seq;
         
         // PWRON SEQ
         @(posedge pwron_rst_reg);    // after pwron_rst, cold reset
         $display ("cmp_clk.v: %0d pwron_rtl_l deasserted", $time) ;
         @(posedge j_rst_reg);  // after j_rst, warm reset
         $display ("cmp_clk.v: %0d j_rst_l deasserted", $time) ;
         
         // assert bist seq on next deassertion of j_rst_l, second warm reset
         @(posedge j_rst_reg);
         $display ("cmp_clk.v: %0d BIST sequence started", $time) ;
         $display ("cmp_clk.v: %0d BIST sequence = %b", $time, bist_seq) ;
         do_bist_reg = bist_seq[0];
         repeat (7) begin
	          bist_seq = bist_seq >> 1;
	          repeat (pll_byp_offset) @(posedge j_clk_reg) ;
	          do_bist_reg = bist_seq[0];
         end
         $display ("cmp_clk.v: %0d BIST sequence finished", $time) ;
         repeat (pll_byp_offset) @(posedge j_clk_reg) ;
         do_bist_reg = 1'b0;
         
         $display("cmp_clk.v: %0d checking for mbist_done", $time);
         @(posedge mbist_done);
         $display("cmp_clk.v: %0d detected mbist_done", $time);

      end
      else if ($test$plusargs("bisi_on")) begin
         if (! $value$plusargs("bisi_seq=%h", bisi_seq_gold)) begin
            bisi_seq_gold = 'h83;   // 0,bist_start = 1;  6, bisi_mode = 1;
         end
         bisi_seq      = bisi_seq_gold;
         // PWRON SEQ
         @(posedge pwron_rst_reg);
         @(posedge j_rst_reg);    // after pwron_rst

         // FREQ CHANGE SEQ
         @(posedge j_rst_reg);    // after pwron_rst

         repeat(5) @(posedge j_clk_reg) ;
         pll_char_in_reg = 1'b1;  // Tester warm reset

         forever begin
            @(posedge j_rst_reg);    // new tester warm reset
            $display ("BISI sequence started at %0d", $time) ;
            do_bist_reg    = bisi_seq[0];
            repeat (7) begin
               bisi_seq = bisi_seq >> 1;
               @(posedge j_clk_reg) ;
               do_bist_reg    = bisi_seq[0];
            end
            @(posedge j_clk_reg) ;
            do_bist_reg    = 1'b0;
            bisi_seq       = bisi_seq_gold; // for the next seq

            $display ("BISI sequence finished at %0d", $time) ;
         end
      end
   end // initial begin
   
  assign do_bist    = do_bist_reg;
  assign pll_char_in = pll_char_in_reg;


  ///////////////////////////////////////////////////////////////////////////
  // figure out the pll clock freq and the dividers from command line
  ///////////////////////////////////////////////////////////////////////////

  initial begin
     if (! $value$plusargs("jmhz=%d", jclk_freq)) jclk_freq = `DEFAULT_JMHZ ;
      
     if ($test$plusargs("freq_change")) begin
        if ($test$plusargs("pll_bypass")) begin
	         dram_div = 4 ;
	         jbus_div = 4 ;
	         cmp_div = 1 ;
        end
        else begin
	         dram_div = 16 ;
	         jbus_div = 16 ;
	         cmp_div = 4 ;

	         if ($test$plusargs("tap_pll_byp")) begin
	            // sync on some bypass signal here
	            @(posedge cmp_top.iop.ctu.pll_bypass);
	            dram_div = 4 ;
	            jbus_div = 4 ;
	            cmp_div = 1 ;
	         end
        end

        // wait for first deassertion of j_rst_l
        while (all_cken_off !== 1'b1) @(posedge j_clk) ; 
        // wait for pll to reset after second assertion of j_rst_l
        while (cmp_top.iop.ctu.u_pll.pll_arst_l !== 1'b0) @(posedge j_clk); 

     end
    
     if (! $value$plusargs("dram_div=%d", dram_div)) begin
        if (!$test$plusargs("no_ctu_reg_slam")) begin
	         dram_div = 14 ;
        end
        else begin
	         dram_div = 16 ;
        end
     end

    if (! $value$plusargs("jbus_div=%d", jbus_div)) begin
      if (!$test$plusargs("no_ctu_reg_slam")) begin
      	jbus_div = 11 ;
        #1;
        jbus_div = 12 ;
      end
      else begin
        jbus_div = 16 ;
      end
    end

    if (! $value$plusargs("cmp_div=%d", cmp_div)) begin
      if (!$test$plusargs("no_ctu_reg_slam")) begin
        cmp_div = 2 ;
      end
      else begin
        cmp_div = 4 ;
      end
    end

    $display ("jbus_clk divider = %d", jbus_div) ;
    $display ("dram_clk divider = %d", dram_div) ;
    $display ("cmp_clk divider = %d", cmp_div) ;
    $display ("cmp_clk period = %d", (cmp_div * 1000000) / (jclk_freq * jbus_div)) ;
    $display ("pll_clk frequency = %d", jclk_freq * jbus_div) ;
    $display ("Info: Selected Core Clock Frequency %d MHz", (jclk_freq * jbus_div)/cmp_div) ;
  end

////////////////////////////////////////////////////////////////////////////////
// drive j_clk
////////////////////////////////////////////////////////////////////////////////

  wire [19:0] j_clk_pulse_width ;
  assign j_clk_pulse_width = 1000000/(2*jclk_freq) ;

  initial begin
    j_clk_reg = 1'bx ;
    #911 ;
    j_clk_reg = 1'b0 ;
    forever begin
        #(j_clk_pulse_width) j_clk_reg = ~j_clk_reg ;
    end
  end

  assign j_clk = j_clk_reg ;

////////////////////////////////////////////////////////////////////////////////
// drive tck
////////////////////////////////////////////////////////////////////////////////

  wire [19:0] tck_pulse_width ;
  assign tck_pulse_width = j_clk_pulse_width * 2 ;

  initial begin
    tck_reg = 0 ;
    forever begin  
//      #6250 tck_reg = ~tck_reg ;
      if ($test$plusargs("tap_pll_byp"))
	#(tck_pulse_width * 4) tck_reg = ~tck_reg;
      else
	#(tck_pulse_width) tck_reg = ~ tck_reg ;
    end
  end

  assign tck = tck_reg ;

////////////////////////////////////////////////////////////////////////////////
// drive pci, upa and ichip clocks
////////////////////////////////////////////////////////////////////////////////

  initial begin
    g_rd_clk_reg = 1'b0 ;

    forever begin
        #(`UPA_RD_CLK_PERIOD/2) g_rd_clk_reg = ~g_rd_clk_reg ;
    end
  end

  initial begin
    g_upa_refclk_reg = 1'b0 ;

    forever begin
        #(`UPA_REF_CLK_PERIOD/2) g_upa_refclk_reg = ~g_upa_refclk_reg ;
    end
  end

  initial begin
    p_clk_reg = 1'b0 ;

    // Delay p_clk so that it is aligned with the rising edge of
    // g_upa_refclk.
    #(`UPA_REF_CLK_PERIOD/2) ;

    forever begin
        #(`PCI_CLK_PERIOD/2) p_clk_reg = ~p_clk_reg ;
    end
  end

  initial begin
    ichip_clk_reg = 1'b0 ;

    // Delay ichip_clk so that it is aligned with the rising edges of
    // g_upa_refclk and p_clk.
    #(3*`UPA_REF_CLK_PERIOD/2) ;

    forever begin
        #(`ICHIP_CLK_PERIOD/2) ichip_clk_reg = ~ichip_clk_reg ;
    end
  end

  assign g_rd_clk = g_rd_clk_reg ;
  assign g_upa_refclk = g_upa_refclk_reg ;
  assign p_clk = p_clk_reg ;
  assign ichip_clk = ichip_clk_reg ;

////////////////////////////////////////////////////////////////////////////////
// drive pwron_rst_l
////////////////////////////////////////////////////////////////////////////////

  initial begin
    pwrok_reg = 1'b0;
    xir_reg = 1'b0;
    pwron_rst_reg = 1'bx ;
    #703 ;
    pwron_rst_reg = 1'b0 ;
    repeat (5) @(posedge j_clk) ;
    pwrok_reg = 1'b1;
    repeat (5) @(posedge j_clk) ;
    xir_reg = 1'b1;

    if ($test$plusargs("tester_rst_seq")) begin
      repeat (800 / pll_byp_offset) @(posedge j_clk) ;
    end
    else begin
      repeat (5) @(posedge j_clk) ;
    end
    pwron_rst_reg = 1'b1 ;
  end

  assign pwrok = pwrok_reg ;
  assign xir_l = xir_reg ;
  assign pwron_rst_l = pwron_rst_reg ;

////////////////////////////////////////////////////////////////////////////////
// drive j_rst_l
////////////////////////////////////////////////////////////////////////////////

  assign all_cken =   cmp_top.iop.ctu_ccx_cmp_cken
                    & cmp_top.iop.ctu_dbg_jbus_cken
                    & cmp_top.iop.ctu_ddr0_dram_cken
                    & cmp_top.iop.ctu_ddr1_dram_cken
                    & cmp_top.iop.ctu_ddr2_dram_cken
                    & cmp_top.iop.ctu_ddr3_dram_cken
                    & cmp_top.iop.ctu_dram02_cmp_cken
                    & cmp_top.iop.ctu_dram02_dram_cken
                    & cmp_top.iop.ctu_dram02_jbus_cken
                    & cmp_top.iop.ctu_dram13_cmp_cken
                    & cmp_top.iop.ctu_dram13_dram_cken
                    & cmp_top.iop.ctu_dram13_jbus_cken
                    & cmp_top.iop.ctu_efc_jbus_cken
                    & cmp_top.iop.ctu_fpu_cmp_cken
                    & cmp_top.iop.ctu_iob_cmp_cken
                    & cmp_top.iop.ctu_iob_jbus_cken
                    & cmp_top.iop.ctu_jbi_cmp_cken
                    & cmp_top.iop.ctu_jbi_jbus_cken
                    & cmp_top.iop.ctu_jbusl_jbus_cken
                    & cmp_top.iop.ctu_jbusr_jbus_cken
                    & cmp_top.iop.ctu_misc_jbus_cken
                    & cmp_top.iop.ctu_scdata0_cmp_cken
                    & cmp_top.iop.ctu_scdata1_cmp_cken
                    & cmp_top.iop.ctu_scdata2_cmp_cken
                    & cmp_top.iop.ctu_scdata3_cmp_cken
                    & cmp_top.iop.ctu_sctag0_cmp_cken
                    & cmp_top.iop.ctu_sctag1_cmp_cken
                    & cmp_top.iop.ctu_sctag2_cmp_cken
                    & cmp_top.iop.ctu_sctag3_cmp_cken
                    & cmp_top.iop.ctu_spc0_cmp_cken
                    & cmp_top.iop.ctu_spc1_cmp_cken
                    & cmp_top.iop.ctu_spc2_cmp_cken
                    & cmp_top.iop.ctu_spc3_cmp_cken
                    & cmp_top.iop.ctu_spc4_cmp_cken
                    & cmp_top.iop.ctu_spc5_cmp_cken
                    & cmp_top.iop.ctu_spc6_cmp_cken
                    & cmp_top.iop.ctu_spc7_cmp_cken ;

  assign all_cken_off =    cmp_top.iop.ctu_ccx_cmp_cken
                    | cmp_top.iop.ctu_ddr0_dram_cken
                    | cmp_top.iop.ctu_ddr1_dram_cken
                    | cmp_top.iop.ctu_ddr2_dram_cken
                    | cmp_top.iop.ctu_ddr3_dram_cken
                    | cmp_top.iop.ctu_dram02_cmp_cken
                    | cmp_top.iop.ctu_dram02_dram_cken
                    | cmp_top.iop.ctu_dram02_jbus_cken
                    | cmp_top.iop.ctu_dram13_cmp_cken
                    | cmp_top.iop.ctu_dram13_dram_cken
                    | cmp_top.iop.ctu_dram13_jbus_cken
                    | cmp_top.iop.ctu_efc_jbus_cken
                    | cmp_top.iop.ctu_fpu_cmp_cken
                    | cmp_top.iop.ctu_iob_cmp_cken
                    | cmp_top.iop.ctu_iob_jbus_cken
                    | cmp_top.iop.ctu_jbi_cmp_cken
                    | cmp_top.iop.ctu_jbi_jbus_cken
                    | cmp_top.iop.ctu_scdata0_cmp_cken
                    | cmp_top.iop.ctu_scdata1_cmp_cken
                    | cmp_top.iop.ctu_scdata2_cmp_cken
                    | cmp_top.iop.ctu_scdata3_cmp_cken
                    | cmp_top.iop.ctu_sctag0_cmp_cken
                    | cmp_top.iop.ctu_sctag1_cmp_cken
                    | cmp_top.iop.ctu_sctag2_cmp_cken
                    | cmp_top.iop.ctu_sctag3_cmp_cken
                    | cmp_top.iop.ctu_spc0_cmp_cken
                    | cmp_top.iop.ctu_spc1_cmp_cken
                    | cmp_top.iop.ctu_spc2_cmp_cken
                    | cmp_top.iop.ctu_spc3_cmp_cken
                    | cmp_top.iop.ctu_spc4_cmp_cken
                    | cmp_top.iop.ctu_spc5_cmp_cken
                    | cmp_top.iop.ctu_spc6_cmp_cken 
                    | cmp_top.iop.ctu_spc7_cmp_cken ;

  assign cken_off_done = ~all_cken_off ;

  initial begin
    if ($test$plusargs("tester_rst_seq")) begin
      // for the tester j_rst_l starts off deasserted
      j_rst_reg = 1'b1 ;
      // wait for pwron_rst_l to be deasserted
      @(posedge pwron_rst_l);

      // pll locking takes about 32K j_clk cycles, assert j_rst_l after pll locks
      // in pll bypass mode, it take roughly 128 + 16 j_clks
      if ($test$plusargs("tap_pll_byp")) begin
	delay = 200;
      end
      else begin
	delay = 32000;
      end
      $display("cmp_clk.v: %0d waiting %d j_clk cycles for pll lock, then assert J_RST_L", $time, delay);
      repeat (delay) @(posedge j_clk);
      j_rst_reg = 1'b0;
      
      // additional 2K j_clk cycles before deasserting j_rst_l, ctu spec
      // multiply by 4 in pll bypass mode
      delay = 2000 * pll_byp_offset;
      $display("cmp_clk.v: %0d waiting %d j_clk cycles before deasserting J_RST_L", $time, delay);
      repeat (delay) @(posedge j_clk);
      j_rst_reg = 1'b1;
      
      // check for any additional warm resets
      // this is repeated like system sequnce above,
      // just in case I need to change it to a special tester sequence
       if (! $value$plusargs("reset_del=%d", reset_del)) reset_del = 78 ;
      forever begin
	       @(posedge j_clk) ;
	       if (warm_rst_l === 1'b0) begin
	          j_rst_reg = 1'b0 ;
	          while (all_cken_off == 1'b1) @(posedge j_clk) ;
	          repeat (3) @(posedge j_clk) ;
	          while (all_cken != 1'b1) @(posedge j_clk) ;
	          repeat (reset_del) @(posedge j_clk) ;  // wait for everything plus some padding
	          j_rst_reg = 1'b1 ;
	       end
      end
    end
    else begin
       j_rst_reg = 1'bx ;
       repeat (5) @(posedge j_clk) ;
       j_rst_reg = 1'b0 ;
       while (all_cken != 1'b1) @(posedge j_clk) ;
       repeat (20) @(posedge j_clk) ;
       j_rst_reg = 1'b1 ;
       forever begin
	        @(posedge j_clk) ;
	        if (warm_rst_l === 1'b0) begin
	           j_rst_reg = 1'b0 ;
	           while (all_cken_off == 1'b1) @(posedge j_clk) ;
	           repeat (3) @(posedge j_clk) ;
	           while (all_cken != 1'b1) @(posedge j_clk) ;
	           repeat (3) @(posedge j_clk) ;
	           j_rst_reg = 1'b1 ;
	        end
       end
    end
  end
    
  assign j_rst_l = j_rst_reg ;
  
  ///////////////////////////////////////////////////////////////////////////
  // configure the pll model properly
  ///////////////////////////////////////////////////////////////////////////
  
  always @(jbus_div) begin
    force cmp_top.iop.ctu.u_pll.jdiv = jbus_div ;
  end

  // There is no reset on following ctu flops. We slam random values in these regs
  // to remove x's.
  integer seed;
  initial begin
    if($value$plusargs("tg_seed=%d", seed)) begin
    end
    else begin
      seed = 0;
    end
  end

   reg [19:0] u_jbc_clk_dup_ddiv;
   initial begin
      if (! $value$plusargs("ctu_rand_init_val=%d", u_jbc_clk_dup_ddiv)) begin
         if($test$plusargs("no_ctu_rand_init")) begin
	          u_jbc_clk_dup_ddiv = 20'h0;
	          $display("cmp_clk.v:no_ctu_rand_init: %0d using u_jbc_clk_dup_ddiv=%d, 20'h%h", $time, u_jbc_clk_dup_ddiv, u_jbc_clk_dup_ddiv);
         end
         else begin
	          if ($test$plusargs("tap_pll_byp")) begin
	             // for clock repeatability
	             u_jbc_clk_dup_ddiv = ((($random(seed) % 20'h80000) & 20'haffff) | 20'h0ffe2);
	             $display("cmp_clk.v:pll_byp: %0d using u_jbc_clk_dup_ddiv=%d, 20'h%h", $time, u_jbc_clk_dup_ddiv, u_jbc_clk_dup_ddiv);
	          end
	          else begin
	             u_jbc_clk_dup_ddiv = ($random(seed) % 20'h80000);
	             $display("cmp_clk.v:random: %0d using u_jbc_clk_dup_ddiv=%d, 20'h%h", $time, u_jbc_clk_dup_ddiv, u_jbc_clk_dup_ddiv);
	          end
         end
      end
      else begin
         $display("cmp_clk.v:ctu_rand_init_val: %0h using u_jbc_clk_dup_ddiv=%d, 20'h%h", $time, u_jbc_clk_dup_ddiv, u_jbc_clk_dup_ddiv);
      end

`ifdef GATE_SIM
      {cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_rst_slct_reg_u_dff_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_init_reg_u_dff_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_1_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_2_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_3_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_4_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_5_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_6_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_7_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_8_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_9_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_10_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_ff_u_dffmx_11_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_algn_ff_u_dffrl_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_joa_clk_ff_u_dffrl_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_strch_u_dffrl_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_init_strch_reg_u_dff_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp_u_ctu_clsp_clkgn_u_ctu_clsp_clkgn_fstlog_u_jbc_clk_dup_ddiv_u_align_edge_u_dffrl_0_.i0.q_r} 
        = ($random(seed) % 20'h80000);
`else
      {cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.rst_slct_reg_u_dff_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.init_reg_u_dff_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_1_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_2_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_3_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_4_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_5_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_6_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_7_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_8_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_9_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_10_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_ff_u_dffmx_11_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_algn_ff_u_dffrl_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.joa_clk_ff_u_dffrl_0_.i0.q_r,
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.strch_u_dffrl_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.init_strch_reg_u_dff_0_.i0.q_r, 
       cmp_top.iop.ctu.ctu_clsp.u_ctu_clsp_clkgn.u_ctu_clsp_clkgn_fstlog.u_jbc_clk_dup_ddiv.u_align_edge_u_dffrl_0_.i0.q_r} 
        = ($random(seed) % 20'h80000);
`endif // GATE_SIM
   end

   reg [2:0] jbi_config_reg_39_38;
   initial begin
      jbi_config_reg_39_38 = ($random(seed) % 3'h4);
      
      `ifdef GATE_SIM
         cmp_top.iop.jbi.u_csr_jbi_config_reg_39_38_u_dffrle_ns_0_.i0.q_r = jbi_config_reg_39_38[0] ; 
         cmp_top.iop.jbi.u_csr_jbi_config_reg_39_38_u_dffrle_ns_1_.i0.q_r = jbi_config_reg_39_38[1] ;
      `else 
         cmp_top.iop.jbi.u_csr.jbi_config_reg_39_38.q = jbi_config_reg_39_38;
      `endif
   end

endmodule

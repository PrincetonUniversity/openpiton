// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sjm.v
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
//------------------------------------------------------------------------------
//
//  Program File:  @(#)sjm.v
//  Version Date:  05/15/01
//  Date:               10/20/98
//  Description:        Verilog front end for SJM.
//
//------------------------------------------------------------------------------

module jp_sjm (j_id,
	       j_req_in_l,
	       j_req_out_l,
	       j_ad,
	       j_adp,
	       j_adtype,
	       j_pack0,
	       j_pack1,   
	       j_pack2,
	       j_pack3,
	       j_pack4,
	       j_pack5,
	       j_pack6,
	       j_change_l,
	       j_rst_l,
	       j_por_l,
	       j_clk,
	       pwr_ok
	       );

   // ID of this sjm.
   input [2:0] j_id;
   // Incoming arbitration requests.
   input [5:0] j_req_in_l;
   // Outgoing arbtration requests.
   output [5:0] j_req_out_l;
   // Address and data.
   inout [127:0] j_ad;
   // Parity for j_ad and j_adtype.
   inout [3:0]   j_adp;
   // Packet type.
   inout [7:0]   j_adtype;
   // Encoded snoop info/flow control and read data flow control.
   inout [2:0]   j_pack0; 
   inout [2:0]   j_pack1;
   inout [2:0]   j_pack2;
   inout [2:0]   j_pack3;
   inout [2:0]   j_pack4;
   inout [2:0]   j_pack5;
   inout [2:0]   j_pack6;
   // Change signal for going into estar mode.
   inout         j_change_l;     
   // System reset, active low.
   inout         j_rst_l;
   // Power-on reset, active low.
   inout         j_por_l;
   // Jbus clock.
   input         j_clk;
   // Power OK.
   input         pwr_ok;

   // For storing the values to put onto the bus.
   reg [5:0]     j_req_out_r;
   reg [127:0]   j_ad_r;
   reg [3:0]     j_adp_r;
   reg [7:0]     j_adtype_r;
   reg [2:0]     j_pack0_r; 
   reg [2:0]     j_pack1_r;
   reg [2:0]     j_pack2_r;
   reg [2:0]     j_pack3_r;
   reg [2:0]     j_pack4_r;
   reg [2:0]     j_pack5_r;
   reg [2:0]     j_pack6_r;
   reg           j_change_r;
   reg           j_rst_r;
   reg           j_por_r;
   reg           float_jpacks;
   wire [127:0] dummy128;


   assign  j_req_out_l = j_req_out_r;


   assign dummy128 = 128'bzzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz_zzzzzzzz;
   //If not in reset drive strong 0/1 (PLI will drive Z when necessary)
   assign j_ad = j_rst_l ? j_ad_r : dummy128;
   assign j_adp = j_rst_l ? j_adp_r : 4'bzzzz;
   assign j_adtype = j_rst_l ? j_adtype_r : 8'bzzzzzzzz;
   //If in reset pull bus to 1
   assign (weak0, pull1) j_ad = j_rst_l ? dummy128 : ~(128'b0);
   assign (weak0, pull1) j_adp = j_rst_l ? 4'bzzzz : ~(4'b0);
   assign (weak0, pull1) j_adtype = j_rst_l ? 8'bzzzzzzzz : ~(8'b0);
   assign j_pack0 = float_jpacks ? 3'bzzz : j_pack0_r;
   assign j_pack1 = float_jpacks ? 3'bzzz : j_pack1_r;
   assign j_pack2 = float_jpacks ? 3'bzzz : j_pack2_r;
   assign j_pack3 = float_jpacks ? 3'bzzz : j_pack3_r;
   assign j_pack4 = float_jpacks ? 3'bzzz : j_pack4_r;
   assign j_pack5 = float_jpacks ? 3'bzzz : j_pack5_r;
   assign j_pack6 = float_jpacks ? 3'bzzz : j_pack6_r;
   assign j_change_l = j_change_r;

   // Fix for bug 5090: prevent the SJMs from driving the reset signals.
   // In niagara, only jbus_top or I/O Bridge should be driving reset.
   //
   // assign j_rst_l = j_rst_r;
   // assign j_por_l = j_por_r;
   //
   assign j_rst_l = 1'bz;
   assign j_por_l = 1'bz;

   // Registers for data going to the subblocks.
   reg [5:0]     j_req_in_s;
   reg [127:0]   j_ad_s;
   reg [7:0]     j_adtype_s;
   reg [2:0]     j_pack0_s;
   reg [2:0]     j_pack1_s;
   reg [2:0]     j_pack2_s;
   reg [2:0]     j_pack3_s;
   reg [2:0]     j_pack4_s;
   reg [2:0]     j_pack5_s;
   reg [2:0]     j_pack6_s;

   // Wires driven by the input fsm.
   wire [42:0]   in_fsm_addr;
   wire [127:0]  in_fsm_data;
   wire [4:0]    in_fsm_ttype;
   wire [15:0]   in_fsm_mask;
   wire [3:0]    in_fsm_agent_id;
   wire [1:0]    in_fsm_readbuff_indx;
   wire [2:0]    in_fsm_cstate;
   // Wires driven by the snoop control.
   wire [2:0]    snp_result;

`ifdef SJM_RTL
   // For signalscan.
   jp_sjm_input_fsm input_fsm( .j_id (j_id),
			       .j_clk (j_clk),
			       .j_ad (j_ad_s),
			       .j_adtype (j_adtype_s),
			       .in_fsm_addr (in_fsm_addr),
			       .in_fsm_data (in_fsm_data),
			       .in_fsm_ttype (in_fsm_ttype),
			       .in_fsm_mask (in_fsm_mask),
			       .in_fsm_agent_id (in_fsm_agent_id),
			       .in_fsm_readbuff_indx (in_fsm_readbuff_indx),
			       .in_fsm_cstate (in_fsm_cstate)
			       );
   jp_sjm_arbiter arbiter( .j_id (j_id),
			   .j_clk (j_clk),
			   .j_req_in (j_req_in_s),
			   /* j_req_out: not wired */
			   .arb_grant (arb_grant)
			   );
   jp_sjm_snoop_ctrl snoop_ctrl ( .j_id (j_id),
				  .j_clk (j_clk),
				  .in_fsm_addr (in_fsm_addr),
				  .in_fsm_ttype (in_fsm_ttype),
				  .in_fsm_agent_id (in_fsm_agent_id),
				  .in_fsm_readbuff_indx (in_fsm_readbuff_indx),
				  .j_pack0 (j_pack0_s),
				  .j_pack1 (j_pack1_s),
				  .j_pack2 (j_pack2_s),
				  .j_pack3 (j_pack3_s),
				  .j_pack4 (j_pack4_s),
				  .j_pack5 (j_pack5_s),
				  .j_pack6 (j_pack6_s),
				  .snp_result (snp_result)/*,
				  .snp_jpack (snp_jpack),
				  .ch_cstate (ch_cstate),
				  .trn_ttype (trn_ttype),
				  .trn_readbuff_indx (trn_readbuff_indx),
				  .trn_agent_id (trn_agent_id),
				  .trn_cstate (trn_cstate),
				  .trn_mask (trn_mask),
				  .trn_atomic (trn_atomic),
				  .trn_data (trn_data),
				  .ch_addr (ch_addr),
				  .ch_new_cstate (ch_new_cstate),
				  .orb_clear (orb_clear)*/
				  // Not wired:
				  // .j_pack_out ()
				  );
   jp_sjm_memory_ctrl memory_ctrl ( .j_id (j_id),
				    .j_clk (j_clk),
				    .in_fsm_addr (in_fsm_addr),
				    .in_fsm_data (in_fsm_data),
				    .in_fsm_mask (in_fsm_mask),
				    .in_fsm_agent_id (in_fsm_agent_id),
				    .in_fsm_readbuff_indx (in_fsm_readbuff_indx),
				    .snp_result (snp_result)
				    );

   jp_readbuffer readbuffer( .j_id (j_id),
			     .j_clk (j_clk),
			     .in_fsm_data (in_fsm_data),
			     .in_fsm_cstate (in_fsm_cstate)
			     );

   //!!! still under construction.
   jp_sjm_outqueue outqueue( .j_id (j_id),
			     .j_clk (j_clk)
			     );
   jp_sjm_rdrqueue rdrqueue( .j_id (j_id),
			     .j_clk (j_clk)
			     );

`endif // ifdef SJM_RTL

   initial begin
      j_req_out_r = 6'bz;
      j_ad_r = 128'bz;
      j_adp_r = 4'bz;
      j_adtype_r = 8'bz;
      j_pack0_r = 3'bz;
      j_pack1_r = 3'bz;
      j_pack2_r = 3'bz;
      j_pack3_r = 3'bz;
      j_pack4_r = 3'bz;
      j_pack5_r = 3'bz;
      j_pack6_r = 3'bz;
      j_change_r = 1'bz;
      j_rst_r = 1'bz;
      j_por_r = 1'bz;

      float_jpacks = 1'b0;
      //The idea of this code is not to alter jpacks until the end of the second reset
      //It is required by the tester folks to allow the reset handler to be identical
      //for many diags. Without this, the number of sjms present alters the jpacks
      //seen by processor
      if ($test$plusargs("delay_sjm_jpack_signal")) float_jpacks = 1'b1;
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_rst_l);
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_rst_l);
      if (!$test$plusargs("delay_sjm_jpack_signal2")) float_jpacks = 1'b0;
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_clk);
      @(posedge j_rst_l);
      float_jpacks = 1'b0;

   end

   integer temp;

   // Behavior begins here.
/*
   // Detect pwr_ok assertion.
   always @(posedge pwr_ok)
     #1 temp = $sjm_assert_pwr(j_id);
*/
   // Detect the asynchronous reset.
   always @(negedge j_por_l) begin
      //        if (j_rst_l === 1'bx)
      //          $dispmon("sjm", 49, "Reset went to 'x'.");
      j_req_out_r = 6'bz;
      j_ad_r = 128'bz;
      j_adp_r = 4'bz;
      j_adtype_r = 8'bz;
      j_pack0_r = 3'bz;
      j_pack1_r = 3'bz;
      j_pack2_r = 3'bz;
      j_pack3_r = 3'bz;
      j_pack4_r = 3'bz;
      j_pack5_r = 3'bz;
      j_pack6_r = 3'bz;
      #1 temp = $sjm_assert_por(j_id);
   end // always @ (negedge j_por_l)

   always @(posedge j_por_l)
      #1 temp = $sjm_deassert_por(j_id);

   // Get the signals from the bus.
   always @(posedge j_clk) begin
      // Nothing is allowed to happen if reset is 'x' or 'z'.
      if ((j_rst_l !== 1'bx) && (j_rst_l !== 1'bz) &&
	  (j_por_l !== 1'bx) && (j_por_l !== 1'bz))
	#1 temp = $sjm_set_inputs(j_id,
				  j_req_in_l,
				  j_ad, 
				  j_adp, 
				  j_adtype, 
				  j_pack0,
				  j_pack1,
				  j_pack2,
				  j_pack3,
				  j_pack4,
				  j_pack5,
				  j_pack6,
				  j_change_l,
				  j_rst_l,
				  j_por_l
				  );
      // Register the inputs for the submodules.
      j_req_in_s = j_req_in_l;
      j_ad_s = j_ad;
      j_adtype_s = j_adtype;
      j_pack0_s = j_pack0;
      j_pack1_s = j_pack1;
      j_pack2_s = j_pack2;
      j_pack3_s = j_pack3;
      j_pack4_s = j_pack4;
      j_pack5_s = j_pack5;
      j_pack6_s = j_pack6;

      temp = $sjm_get_outputs(j_id,
			      j_req_out_r,
			      j_ad_r, 
			      j_adp_r, 
			      j_adtype_r, 
			      j_pack0_r,
			      j_pack1_r,
			      j_pack2_r,
			      j_pack3_r,
			      j_pack4_r,
			      j_pack5_r,
			      j_pack6_r,
			      j_change_r,
			      j_rst_r,
			      j_por_r
			      );
   end

   //---------------------------------------------------------------------------
   // Tell sjm to start executing commands.
   task sjm_start_executing;
      begin
	 temp = $sjm_start_exec(j_id);
      end
   endtask

   //---------------------------------------------------------------------------
   // Ask the sjm for its state.
   task sjm_status;
      output [1:0] st;
      begin
	 temp = $sjm_get_status(j_id, st);
      end
   endtask

endmodule

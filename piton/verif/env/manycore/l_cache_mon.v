// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: l_cache_mon.v
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

`include "ifu.tmp.h"

module l_cache_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, spc, index_f, wrreq_f, wrway_f, wrtag_f, wr_data,
   wren_f, wrreq_bf, wrindex_bf, cpx_spc_data_cx,
   cpx_spc_data_rdy_cx, spc_pcx_data_pa, spc_pcx_req_pq, w0, w1, w2,
   w3
   );

   input clk,    rst_l;
   input [31:0]  spc;
//ict signal
   input [`IC_IDX_HI:5]   index_f;
   input         wrreq_f;
   input [1:0] 	 wrway_f;
   input [`IC_TAG_SZ:0]  wrtag_f;
//icv
//   input [1:0] 	 wr_data;
   input  	 wr_data;
   input [15:0] 	 wren_f;
   input         wrreq_bf;
   input [`IC_IDX_HI:7]  wrindex_bf;

 // cpx packet
   input [`CPX_WIDTH-1:0] cpx_spc_data_cx;
   input 		  cpx_spc_data_rdy_cx;
   input [`PCX_WIDTH-1:0] spc_pcx_data_pa;
   input [4:0] 		  spc_pcx_req_pq;

   input [127:0] 	  w0;
   input [127:0] 	  w1;
   input [127:0] 	  w2;
   input [127:0] 	  w3;

   // define dummy tag
   reg [`IC_TAG_SZ:0] 	tag[512:0];
   reg [512:0] 	vld;


   reg [`IC_TAG_SZ:0] 	 t_tag[3:0];
   reg [3:0] 	 vbit;
   reg [7:0] 	 vbit_32b;

   wire [`IC_SET_IDX_HI:0] 	 index   = index_f[`IC_IDX_HI:5];
   wire [`IC_SET_IDX_HI-2:0] 	 w_index = wrindex_bf[`IC_IDX_HI:7];
   integer	 i;
   //array for pcx packet
   reg [`IC_SET_IDX_HI:0] 	 imiss_index[4:0];
   reg [1:0] 	 imiss_way[4:0];

   reg [`IC_SET_IDX_HI:0] 	 load_index[4:0];
   reg [1:0] 	 load_way[4:0];
   reg [3:0] 	 i_ptr, l_ptr, ia_ptr, la_ptr;
   reg [127:0] 	 wait_fill[3:0];
   reg [127:0] 	 one_way;
   integer       ictag_check_value;
   reg           ictag_check_off;

   initial begin
      i_ptr   = 0;
      l_ptr   = 0;
      ia_ptr  = 0;
      la_ptr  = 0;

      if($value$plusargs("ictag_check_off=%d", ictag_check_value))begin
	 ictag_check_off = 1;
      end else begin
         ictag_check_off = 0;
      end
      $display("Info:ictag check %s\n", ictag_check_off ? "off" : "on");

      for(i = 0; i <= 512 ; i = i + 1) begin
	 vld[i] = 1'b0;
	//  tag[i] = 29'b0;
	 tag[i] = {`IC_TAG_SZ{1'b0}};
      end
   end // initial begin
   //make delay version
   reg delay_bf;
   reg [4:0] delay_ix;

   always @(posedge clk)begin
      delay_bf <= wrreq_bf;
      delay_ix <= w_index;
   end

   // monitor tag
   always @(negedge clk) begin
      if(rst_l)begin
	 if(wrreq_f) begin
	    t_tag[0] = tag[{index, 2'b00}];
	    t_tag[1] = tag[{index, 2'b01}];
	    t_tag[2] = tag[{index, 2'b10}];
  	    t_tag[3] = tag[{index, 2'b11}];

	    vbit[0]   = vld[{index, 2'b00}];
	    vbit[1]   = vld[{index, 2'b01}];
	    vbit[2]   = vld[{index, 2'b10}];
	    vbit[3]   = vld[{index, 2'b11}];

	 // check: new tag is identical to valid tag but written to different way
	    for(i=0; i < 4; i=i+1) begin
	       if((vbit[i] == 1'b1) && (wrtag_f == t_tag[i]) && (wrway_f != i)) begin
		  $display("I_CACHE : Same tag written to different way(%x) index(%x) Tag(%x)", i, index, wrtag_f);
		  if (ictag_check_off == 1'b0)
 		    `MONITOR_PATH.fail("I_CACHE : Same tag written to different");
	       end
 	    end
	    tag[{index, wrway_f}] = wrtag_f;
	    $display("Info (%d): Tag updated, index = %x, way = %x, tag = %x", $time, index, wrway_f, wrtag_f);
	 end // if (wrreq_f)
	 if(delay_bf)begin
	    if (wren_f[0])begin
	       vld[{delay_ix, 4'b0000}]     = wr_data;
	       one_way                      = wait_fill[0];
	       one_way[{delay_ix, 4'b0000}] = wr_data;
	       //wait_fill[0]                 = one_way;
	    end
	    if (wren_f[1])begin
	       vld[{delay_ix, 4'b0001}]     = wr_data;
	       one_way                      = wait_fill[1];
	       one_way[{delay_ix, 4'b0001}] = wr_data;
	       //wait_fill[1]                 = one_way;
	    end
	    if (wren_f[2])begin
	       vld[{delay_ix, 4'b0010}]     = wr_data;
	       one_way                      = wait_fill[2];
	       one_way[{delay_ix, 4'b0010}] = wr_data;
	       //wait_fill[2]                 = one_way;
	    end
	    if (wren_f[3])begin
	       vld[{delay_ix, 4'b0011}]     = wr_data;
	       one_way                      = wait_fill[3];
	       one_way[{delay_ix, 4'b0011}] = wr_data;
	       //wait_fill[3]                 = one_way;
	    end

	    if (wren_f[4])begin
	       vld[{delay_ix, 4'b0100}]     = wr_data;
	       one_way                      = wait_fill[0];
	       one_way[{delay_ix, 4'b0100}] = wr_data;
	       //wait_fill[0]                 = one_way;
	    end
	    if (wren_f[5])begin
	       vld[{delay_ix, 4'b0101}]     = wr_data;
	       one_way                      = wait_fill[1];
	       one_way[{delay_ix, 4'b0101}] = wr_data;
	       //wait_fill[1]                 = one_way;
	    end
	    if (wren_f[6])begin
	       vld[{delay_ix, 4'b0110}]     = wr_data;
	       one_way                      = wait_fill[2];
	       one_way[{delay_ix, 4'b0110}] = wr_data;
	       //wait_fill[2]                 = one_way;
	    end
	    if (wren_f[7])begin
	       vld[{delay_ix, 4'b0111}]     = wr_data;
	       one_way                      = wait_fill[3];
	       one_way[{delay_ix, 4'b0111}] = wr_data;
	       //wait_fill[3]                 = one_way;
	    end

	    if (wren_f[8])begin
	       vld[{delay_ix, 4'b1000}]  = wr_data;
	       one_way                      = wait_fill[0];
	       one_way[{delay_ix, 4'b1000}] = wr_data;
	       //wait_fill[0]                 = one_way;
	    end
	    if (wren_f[9])begin
	       vld[{delay_ix, 4'b1001}]     = wr_data;
	       one_way                      = wait_fill[1];
	       one_way[{delay_ix, 4'b1001}] = wr_data;
	       //wait_fill[1]                 = one_way;
	    end
	    if (wren_f[10])begin
	       vld[{delay_ix, 4'b1010}]     = wr_data;
	       one_way                      = wait_fill[2];
	       one_way[{delay_ix, 4'b1010}] = wr_data;
	       //wait_fill[2]                 = one_way;
	    end
	    if (wren_f[11])begin
	       vld[{delay_ix, 4'b1011}]     = wr_data;
	       one_way                      = wait_fill[3];
	       one_way[{delay_ix, 4'b1011}] = wr_data;
	       //wait_fill[3]                 = one_way;
	    end

	    if (wren_f[12])begin
	       vld[{delay_ix, 4'b1100}]     = wr_data;
	       one_way                      = wait_fill[0];
	       one_way[{delay_ix, 4'b1100}] = wr_data;
	       //wait_fill[0]                 = one_way;
	    end
	    if (wren_f[13])begin
	       vld[{delay_ix, 4'b1101}]     = wr_data;
	       one_way                      = wait_fill[1];
	       one_way[{delay_ix, 4'b1101}] = wr_data;
	       //wait_fill[1]                 = one_way;
	    end
	    if (wren_f[14])begin
	       vld[{delay_ix, 4'b1110}]     = wr_data;
	       one_way                      = wait_fill[2];
	       one_way[{delay_ix, 4'b1110}] = wr_data;
	       //wait_fill[2]                 = one_way;
	    end
	    if (wren_f[15])begin
	       vld[{delay_ix, 4'b1111}] = wr_data;
	       one_way                      = wait_fill[3];
	       one_way[{delay_ix, 4'b1111}] = wr_data;
	       //wait_fill[3]                 = one_way;
	    end
	 end // if (delay_bf)
      end // if (rst_l)
      else begin
	 vld = 0;
      end // else: !if(rst_l)
   end // always @ (negedge clk)
//i$ and d$
   integer              at_pos ;
   reg [1:0] 		way;
   reg [5:0] 		addr_index;
   reg [6:0] 		d_index, i_index;
   reg [127:0] 		i_cache [3:0];
   reg [127:0]          d_cache [3:0];

   reg [`CPX_WIDTH-1:0] cpx;

   reg [3:0]		d_watch_dog;
   reg [3:0] 		i_watch_dog;
   reg [3:0]		pcx_dwatch_dog;
   reg [3:0] 		pcx_iwatch_dog;
   reg [7:0] 		d_count[255:0];
   reg [7:0] 		i_count[255:0];

   reg [127:0] 		pcx_icache [3:0];
   reg [127:0]          pcx_dcache [3:0];
   reg [7:0] 		pcx_dcount[511:0];
   reg [7:0] 		pcx_icount[511:0];

   reg [1:0] 		thrid;
   reg [127:0] 		t_vald;
   reg [3:0] 		imiss_vld;


   initial begin
      for(i = 0; i < 4;i = i + 1)begin
	 i_cache[i] = 0;
	 d_cache[i] = 0;
	 pcx_icache[i] = 0;
	 pcx_dcache[i] = 0;
	 pcx_dcount[i] = 0;
	 pcx_icount[i] = 0;
	 wait_fill[i]  = 0;

      end
      for(i = 0; i < 255;i = i + 1)begin
	 i_count[i] = 0;
	 d_count[i] = 0;
      end
      d_watch_dog   = 0;
      i_watch_dog   = 0;
      imiss_vld     = 0;

   end
   //generate watch dog signal
   task watch;
      begin
	 i_watch_dog    = 0;
	 d_watch_dog    = 0;
	 pcx_dwatch_dog = 0;
	 pcx_iwatch_dog = 0;
	 for(i = 0; i < 4;i = i + 1)begin
	    d_watch_dog[i] = |d_cache[i];
	    i_watch_dog[i] = |i_cache[i];
	 end
      end
    endtask

//generate cache update bit.
   task update_cache;
      input [1:0]  db;
      input        ib;
      input        i_ok;
      reg [63:0]   dw;


      begin
	 if(cpx[0])begin
	    case(way)
	      2'b00 : dw = w0;
	      2'b01 : dw = w1;
	      2'b10 : dw = w2;
	      2'b11 : dw = w3;
	    endcase // case(way)
	    d_index      = {addr_index[3:0], db};
	    one_way      = (1 << d_index);
	    d_cache[way] = d_cache[way] | one_way;
	    if(dw[d_index] == 1'b0)begin
	      /*$display("%0d:Error->way(%x) index(%x) Dcache valid bit is zero.",
		       $time, way, d_index);

	       $display("%d : Simulation -> FAIL(%0s)", $time, "Dcache valid bit is zero");
	       //$sas_client("quit");
	       repeat(5)@(posedge clk);
	       `TOP_MOD.fail_flag = 1'b1;
	       $finish;*/
	    end
	 end
	 if(i_ok) begin
	   if(cpx[1])begin //icache
	      d_index      = {addr_index[5:0], ib};
	      one_way      = (1 << d_index);
	      i_cache[way] = i_cache[way] | one_way;
	      if(vld[{d_index, way}] == 1'b0)begin
		 if(wait_ifill(d_index, way))begin
		    $display("%0d:Error->way(%x) index(%x) Icache received the store invalid befor imiss return",
			     $time, way, d_index);
		    $display("%d : Simulation -> FAIL(%0s)", $time, "Icache valid bit is zero");
            `ifndef VERILATOR
		    repeat(5)@(posedge clk);
            `endif
		    `MONITOR_PATH.fail("Icache received the store invalid before imiss return");
		 end
	      end
	   end
	 end
      end
   endtask // update_cache
   //cal index and way to generate a cache invalid signal
   task cal_index;
      begin
	 at_pos          = spc << 2;
	 cpx             = cpx_spc_data_cx;//save
	 addr_index[5:0] = cpx[117:112];//address 10:6
	 cpx             = (cpx >> at_pos);
	 way             = cpx[3:2];
	 update_cache(0, 0, 1);
	 cpx             = cpx >> 32;
	 way             = cpx[2:1];
	 update_cache(1, 0, 0);
	 cpx             = cpx >> 24;
	 way             = cpx[3:2];
	 update_cache(2, 1, 1);
	 cpx             = cpx >> 32;
	 way             = cpx[2:1];
	 update_cache(3, 0, 0);
	 watch;
      end
   endtask // cal_index
   //monitor cpx packe and generate invalid information.
   reg [127:0] tmp_one;

   always @(posedge clk) begin
      if(rst_l && cpx_spc_data_rdy_cx && cpx_spc_data_cx[`CPX_VLD])begin
	 case(cpx_spc_data_cx[`CPX_RQ_HI:`CPX_RQ_LO])
	   `ST_ACK,`STRST_ACK,`EVICT_REQ : begin
	      if(cpx_spc_data_cx[`CPX_DA_LO+111:`CPX_DA_LO] != 0)begin
		 $display("%0d:Info: Spc(%x) received invalid packet -> %x", $time, spc[2:0], cpx_spc_data_cx);
		 cal_index;
	      end
	   end
	   `IFILL_RET : begin
	      thrid = cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO];
	      if((cpx_spc_data_cx[`CPX_NC] == 0) &&
		  imiss_vld[thrid]               )begin
		 one_way                       = (1 << imiss_index[thrid]);
		 tmp_one                       = wait_fill[imiss_way[thrid]];
		 pcx_icache[imiss_way[thrid]]  = pcx_icache[imiss_way[thrid]] | one_way;
		 pcx_iwatch_dog                = |pcx_icache[imiss_way[thrid]];
		 wait_fill[imiss_way[thrid]]   = one_way | tmp_one ;
		 imiss_vld[thrid]              = 0;
	      end
	   end
	   `LOAD_RET  : begin
	      if((cpx_spc_data_cx[`CPX_NC] == 0) && (l_ptr != la_ptr))begin
		la_ptr = la_ptr + 1;
	      end //
	   end
	 endcase
      end
   end // always @ (posedge clk)

   function wait_ifill;
      input [7:0] index;
      input [1:0] way;
      reg [127:0] valid;

      begin
	 valid      = wait_fill[way];
	 wait_ifill = ~valid[index];
      end
    endfunction // wait_ifill

   //  check dcache
   function [63:0] check_valid_dcache;
      input [63:0] dw;
      input [63:0] w;
      input [7:0]  ind;
      input [1:0]  way;
      integer      i;
      begin
	 check_valid_dcache = dw;
	 for(i = 0; i < 128; i = i + 1)begin
	    if(dw[i])begin
	       if(w[i] == 0)begin//invalid happen
		  check_valid_dcache[i] = 0;
		  d_count[ind+i]        = 0;
		  d_watch_dog[way]      = |check_valid_dcache;
		  $display("%0d:Info:Dcache updated way(%x) index(%x)", $time, way, i);
	       end
	       else if(d_count[i] > `CPX_INVALID_TIME)begin
      		  $display("Error: Dcache not invalidated during %0d cycles way(%x) index(%x)",
      			`CPX_INVALID_TIME, way, i);
      		  $display("%d : Simulation -> FAIL(%0s)", $time, "Dcache not Invalidated");
      		  // $sas_client("quit");
      		  `SIM_TOP.fail_flag = 1'b1;
      		  $finish;
	       end
	       else d_count[ind+i] = d_count[ind+i] + 1;
	    end
	 end
      end
   endfunction // check_valid
   //check icache
   reg [127:0] check_valid_icache_reg;

   task  check_valid_icache;
      input [127:0] dw;
      input [7:0]  ind;
      input [1:0]  way;
      integer      i;
      begin
    	 check_valid_icache_reg = dw;
    	 for(i = 0; i < 128; i = i + 1)begin
    	    if(dw[i])begin
    	       if(vld[{i, way}] == 0)begin//invalid happen
        		  check_valid_icache_reg[i] = 0;
        		  i_count[ind+i]        = 0;
        		  i_watch_dog[way]      = |check_valid_icache_reg;
        		  $display("%0d:Info:Icache updated way(%x) index(%x)", $time, way, i);
    	       end
    	       else if(i_count[i] > `CPX_INVALID_TIME)begin
        		  $display("Error: Icache not invalidated during %0d cycles way(%x) index(%x)",
        			   `CPX_INVALID_TIME, way, i);
        		  $display("%d : Simulation -> FAIL(%0s)", $time, "Icache not Invalidated");
        		  `MONITOR_PATH.fail("Icache not Invalidated");
    	       end
    	       else i_count[ind+i] = i_count[ind+i] + 1;
    	    end
    	 end
      end
   endtask

   //check icache for data validation.
    function [127:0] check_valid_pcx_icache;
      input [127:0] dw;
      input [7:0]  ind;
      input [1:0]  way;
      integer      i;
      begin
    	 check_valid_pcx_icache = dw;
    	 for(i = 0; i < 127; i = i + 1)begin
    	    if(dw[i])begin
    	       if(vld[{i, way}])begin//invalid happen
        		  check_valid_pcx_icache[i] = 0;
        		  pcx_icount[ind+i]         = 0;
        		  pcx_iwatch_dog[way]       = |check_valid_pcx_icache;
        		  $display("%0d:Info:Icache updated way(%x) index(%x)", $time, way, i);
    	       end
    	       else if(pcx_icount[i] > `CPX_INVALID_TIME)begin
          		 $display("Error: Icache not validated during %0d cycles way(%x) index(%x)",
          			`CPX_INVALID_TIME, way, i);
          		 $display("%d : Simulation -> FAIL(%0s)", $time, "Icache not validated");
          		 // $sas_client("quit");
          		 `SIM_TOP.fail_flag = 1'b1;
          		 $finish;
    	       end
    	       else pcx_icount[ind+i] = pcx_icount[ind+i] + 1;
    	    end
    	 end
      end
   endfunction // check_validinteger ind;
   reg [3:0] ind;

   always @(negedge clk)begin
      if(rst_l && ((|d_watch_dog) || (|i_watch_dog) || (|pcx_iwatch_dog)))begin
	 for(ind = 0; ind < 4; ind = ind + 1)begin
	    if(d_watch_dog[ind])begin
	       case(ind)
		 0 : d_cache[ind] = check_valid_dcache(d_cache[ind], w0, 0,   0);
		 1 : d_cache[ind] = check_valid_dcache(d_cache[ind], w1, 128, 1);
		 2 : d_cache[ind] = check_valid_dcache(d_cache[ind], w2, 256, 2);
		 3 : d_cache[ind] = check_valid_dcache(d_cache[ind], w3, 384, 3);
	       endcase
	    end
	    if(i_watch_dog[ind])begin
	       case(ind)
		 0 : begin  check_valid_icache(i_cache[ind], 0,   0);i_cache[ind] = check_valid_icache_reg;end
		 1 : begin  check_valid_icache(i_cache[ind], 128, 1);i_cache[ind] = check_valid_icache_reg;end
		 2 : begin  check_valid_icache(i_cache[ind], 256, 2);i_cache[ind] = check_valid_icache_reg;end
		 3 : begin  check_valid_icache(i_cache[ind], 384, 3);i_cache[ind] = check_valid_icache_reg;end
	       endcase
	    end
	    if(pcx_iwatch_dog[ind])begin
	       case(ind)
		 0 : pcx_icache[ind] = check_valid_pcx_icache(pcx_icache[ind], 0,   0);
		 1 : pcx_icache[ind] = check_valid_pcx_icache(pcx_icache[ind], 128, 1);
		 2 : pcx_icache[ind] = check_valid_pcx_icache(pcx_icache[ind], 256, 2);
		 3 : pcx_icache[ind] = check_valid_pcx_icache(pcx_icache[ind], 384, 3);
	       endcase
	    end
	 end
     end
   end
   //monitor pcx packet
   reg [1:0] wy;
   reg [6:0] idx;

   always @(posedge clk)begin
      if(rst_l)begin
	 if(spc_pcx_data_pa[`PCX_VLD])begin
	    case(spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO])
	      `IMISS_RQ : begin
		  if(spc_pcx_data_pa[`PCX_NC] == 0)begin
		     thrid                       = spc_pcx_data_pa[`PCX_TH_HI:`PCX_TH_LO];//new implement
		     idx                         = spc_pcx_data_pa[`PCX_AD_LO+11:`PCX_AD_LO+5];//new implement
		     wy                          = spc_pcx_data_pa[`PCX_WY_HI:`PCX_WY_LO];
//		     t_vald                      = wait_fill[wy];
		     t_vald[idx]                 = 0;
		     imiss_vld[thrid]            = 1'b1;
//		     wait_fill[wy]               = t_vald;
		     imiss_index[thrid]          = idx;
		     imiss_way[thrid]            = wy;
		  end
	       end // case: `IMISS_RQ
	      `LOAD_RQ : begin
		 if((spc_pcx_data_pa[`PCX_NC] == 0) && (spc_pcx_data_pa[`PCX_AD_HI:`PCX_AD_HI] == 0))begin
		    load_index[l_ptr] = spc_pcx_data_pa[`PCX_AD_LO+10:`PCX_AD_LO+4];
		    load_way[l_ptr]   = spc_pcx_data_pa[`PCX_WY_HI:`PCX_WY_LO];
		    l_ptr = l_ptr + 1;
		  end
	      end
	    endcase
	 end
      end
   end
endmodule





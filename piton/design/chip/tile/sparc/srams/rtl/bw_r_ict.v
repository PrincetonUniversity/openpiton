// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_ict.v
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
/*
 //  Module Name:  bw_r_ict.v
 //  Description:
 //    Contains the RTL for the icache and dcache tag blocks.
 //    This is a 1RW 512 entry X 33b macro, with 132b rd and 132b wr,
 //    broken into 4 33b segments with its own write enable.
 //    Address and Control inputs are available the stage before
 //    array access, which is referred to as "_x".  Write data is
 //    available in the same stage as the write to the ram, referred
 //    to as "_y".  Read data is also read out and available in "_y".
 //
 //            X       |      Y
 //     index          |  ram access
 //     index sel      |  write_tag
 //     rd/wr req      |     -> read_tag
 //     way enable     |
 */


////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

`ifndef NO_USE_IBM_SRAMS
`define IBM_SRAM_CACHE_TAG
`endif


//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_ICT
`endif

//`ifdef IBM_SRAM_CACHE_TAG_MODEL_CHECKER
`ifdef NO_USE_IBM_SRAMS

`ifdef FPGA_SYN_ICT

//`ifndef IBM_SRAM_CACHE_TAG
module bw_r_ict(rdtag_w0_y, rdtag_w1_y, rdtag_w2_y, rdtag_w3_y, so, rclk, se,
//`else
//module bw_r_ict_orig(rdtag_w0_y, rdtag_w1_y, rdtag_w2_y, rdtag_w3_y, so, rclk, se,
//`endif
  si, reset_l, sehold, rst_tri_en, index0_x, index1_x, index_sel_x,
  dec_wrway_x, rdreq_x, wrreq_x, wrtag_w0_y, wrtag_w1_y, wrtag_w2_y,
  wrtag_w3_y, wrtag_w0_x, wrtag_w1_x, wrtag_w2_x,
  wrtag_w3_x, adj,

  // sram wrapper interface
  sramid,
  srams_rtap_data,
  rtap_srams_bist_command,
  rtap_srams_bist_data
  );

  input     rclk;
  input     se;
  input     si;
  input     reset_l;
  input     sehold;
  input     rst_tri_en;
  input [6:0]   index0_x;
  input [6:0]   index1_x;
  input     index_sel_x;
  input [3:0]   dec_wrway_x;
  input     rdreq_x;
  input     wrreq_x;
  input [32:0]    wrtag_w0_y;
  input [32:0]    wrtag_w1_y;
  input [32:0]    wrtag_w2_y;
  input [32:0]    wrtag_w3_y;
  input [32:0]    wrtag_w0_x;
  input [32:0]    wrtag_w1_x;
  input [32:0]    wrtag_w2_x;
  input [32:0]    wrtag_w3_x;
  input [3:0]   adj;

  // sram wrapper interface
  output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
  // dummy output for the reference model
  assign srams_rtap_data = 4'b0;
  input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
  input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;
  input  [`BIST_ID_WIDTH-1:0] sramid;
  wire unused = rtap_srams_bist_command
                | rtap_srams_bist_data
                | sramid;

  output  [32:0]    rdtag_w0_y;
  output  [32:0]    rdtag_w1_y;
  output  [32:0]    rdtag_w2_y;
  output  [32:0]    rdtag_w3_y;
  output      so;

  wire      clk;
  reg [6:0]   index_y;
  reg     rdreq_y;
  reg     wrreq_y;
  reg [3:0]   dec_wrway_y;
  wire  [6:0]   index_x;
  wire  [3:0]   we;

    reg [131:0]  rdtag_sa_y; //for error_inject XMR

  assign clk = rclk;
  assign index_x = (index_sel_x ? index1_x : index0_x);
    assign we = ({4 {((wrreq_y & reset_l) & (~rst_tri_en))}} & dec_wrway_y);

  always @(posedge clk) begin
    if (~sehold) begin
      rdreq_y <= rdreq_x;
      wrreq_y <= wrreq_x;
      index_y <= index_x;
      dec_wrway_y <= dec_wrway_x;
    end
  end

  bw_r_ict_array ictag_ary_00(
    .we (we[0]),
    .clk  (clk),
        .way (2'b00),
    .rd_data(rdtag_w0_y),
    .wr_data(wrtag_w0_y),
    .addr (index_y),
        .dec_wrway_y (dec_wrway_y));

  bw_r_ict_array ictag_ary_01(
    .we (we[1]),
    .clk  (clk),
        .way (2'b01),
    .rd_data(rdtag_w1_y),
    .wr_data(wrtag_w1_y),
    .addr (index_y),
        .dec_wrway_y (dec_wrway_y));

  bw_r_ict_array ictag_ary_10(
    .we (we[2]),
    .clk  (clk),
        .way(2'b10),
    .rd_data(rdtag_w2_y),
    .wr_data(wrtag_w2_y),
    .addr (index_y),
        .dec_wrway_y (dec_wrway_y));

  bw_r_ict_array ictag_ary_11(
    .we (we[3]),
    .clk  (clk),
        .way(2'b11),
    .rd_data(rdtag_w3_y),
    .wr_data(wrtag_w3_y),
    .addr (index_y),
        .dec_wrway_y (dec_wrway_y));

endmodule

module bw_r_ict_array(we, clk, rd_data, wr_data, addr,dec_wrway_y,way);

input we;
input clk;
input [32:0] wr_data;
input [6:0] addr;
input [3:0] dec_wrway_y;
input [1:0] way;
output [32:0] rd_data;
reg [32:0] rd_data;

reg [32:0]    array[511:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
integer i;

initial begin
// `ifdef DO_MEM_INIT
//     // Add the memory init file in the database
//     $readmemb("/import/dtg-data11/sandeep/niagara/design/sys/iop/srams/rtl/mem_init_ict.txt",array);
// `endif
  // Tri: nonsynthesizable
  for (i = 0; i < 511; i = i + 1)
  begin
    array[i] = 33'b0;
  end
end

  always @(negedge clk) begin
    if (we)
          begin
              array[addr] <= wr_data;
          end
    else
          rd_data <= array[addr];
  end
endmodule

`else

//`ifndef IBM_SRAM_CACHE_TAG
module bw_r_ict(/*AUTOARG*/
//`else
//module bw_r_ict_orig(/*AUTOARG*/
//`endif
   // Outputs
   rdtag_w0_y, rdtag_w1_y, rdtag_w2_y, rdtag_w3_y, so,
   // Inputs
   rclk, se, si, reset_l, sehold, rst_tri_en, index0_x, index1_x,
   index_sel_x, dec_wrway_x, rdreq_x, wrreq_x, wrtag_w0_y,
   wrtag_w1_y, wrtag_w2_y, wrtag_w3_y, wrtag_w0_x,
   wrtag_w1_x, wrtag_w2_x, wrtag_w3_x, adj,

  // sram wrapper interface
  sramid,
  srams_rtap_data,
  rtap_srams_bist_command,
  rtap_srams_bist_data

   );

   input          rclk,
                  se,
                  si,
                  reset_l;      // active LOW reset

   input          sehold;
   input          rst_tri_en;

   input [6:0]    index0_x;     // read/write address0
   input [6:0]    index1_x;     // read/write address1

   input          index_sel_x;  // selects between index1 and index0

   input [3:0]    dec_wrway_x;  // way -- functions as a write enable
                                // per 33b

   input          rdreq_x,      // read enable
                  wrreq_x;      // write enable

   // Don't use rdreq and wrreq to gate off the clock, since these are
   // critical.  A separate power down signal can be supplied if
   // needed.

   input [32:0]   wrtag_w0_y;      // write data, not flopped
   input [32:0]   wrtag_w1_y;      //
   input [32:0]   wrtag_w2_y;      //
   input [32:0]   wrtag_w3_y;      //

   input [32:0]   wrtag_w0_x;      // write data, not flopped
   input [32:0]   wrtag_w1_x;      //
   input [32:0]   wrtag_w2_x;      //
   input [32:0]   wrtag_w3_x;      //

   input [3:0]    adj;

  // sram wrapper interface
  output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
  // dummy output for the reference model
  assign srams_rtap_data = 4'b0;
  input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
  input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;
  input  [`BIST_ID_WIDTH-1:0] sramid;
  wire unused = rtap_srams_bist_command
                | rtap_srams_bist_data
                | sramid;


   output [32:0] rdtag_w0_y;    // read data split into 4 ports
   output [32:0] rdtag_w1_y;    // not flopped
   output [32:0] rdtag_w2_y;    //
   output [32:0] rdtag_w3_y;    //

   output        so;


   // Declarations
   // local signals
`ifdef DEFINE_0IN
`else
   reg [32:0]   ictag_ary  [511:0];
   reg [131:0]  rdtag_bl_y,
                rdtag_sa_y;
`endif

   wire         clk;


   reg [6:0]    index_y;
   reg          rdreq_y,
                wrreq_y;
   reg [3:0]    dec_wrway_y;

   wire [6:0]   index_x;


   //----------------
   // Code start here
   //----------------

   assign       clk = rclk;

   //-------------------------
   // 2:1 mux on address input
   //-------------------------
   // address inputs are critical and this mux needs to be merged with
   // the receiving flop.
   assign index_x = index_sel_x ? index1_x :
                                  index0_x;

   //------------------------
   // input flops from x to y
   //------------------------
   // these need to be scannable
   always @ (posedge clk)
     begin
        if (~sehold)
          begin
                   rdreq_y <= rdreq_x;
                   wrreq_y <= wrreq_x;
                   index_y <= index_x;
                   dec_wrway_y <= dec_wrway_x;
          end
     end

`ifdef DEFINE_0IN
wire [131:0] wm = { {33{(dec_wrway_y[3])}},{33{(dec_wrway_y[2])}},{33{(dec_wrway_y[1])}},{33{(dec_wrway_y[0])}} };
wire         we = wrreq_y & ~se;

l1_tag l1_tag ( .nclk(~clk), .adr(index_y[6:0]), .we(we), .wm(wm),
                                              .din ({wrtag_w3_y,wrtag_w2_y,wrtag_w1_y,wrtag_w0_y}),
                                              .dout({rdtag_w3_y,rdtag_w2_y,rdtag_w1_y,rdtag_w0_y}) );
`else

   //----------------------------------------------------------------------
   // Read Operation
   //----------------------------------------------------------------------

   always @(/*AUTOSENSE*/ /*memory or*/ index_y or rdreq_y or reset_l
            or wrreq_y)
     begin
        if (rdreq_y & reset_l)
          begin
             if (wrreq_y)    // rd_wr conflict
               begin
                  rdtag_bl_y = {132{1'bx}};
               end

             else   // no write, read only
               begin
                  rdtag_bl_y[32:0] = ictag_ary[{index_y,2'b00}];  // way0
                  rdtag_bl_y[65:33] = ictag_ary[{index_y,2'b01}]; // way1
                  rdtag_bl_y[98:66] = ictag_ary[{index_y,2'b10}]; // way2
                  rdtag_bl_y[131:99] = ictag_ary[{index_y,2'b11}];// way3
               end
          end
        else    // no read
          begin
             rdtag_bl_y =  {132{1'bx}};
          end

     end // always @ (...


   // SA latch -- to make 0in happy
   always @ (/*AUTOSENSE*/clk or rdreq_y or rdtag_bl_y or reset_l)
     begin
        if (rdreq_y & ~clk & reset_l)
          begin
             rdtag_sa_y <= rdtag_bl_y;
          end
     end

   // Output is held the same if there is no read.  This is not a
   // hard requirement, please let me know if the output has to
   // be something else for ease of implementation.

   // Output behavior during reset is currently not coded.
   // Functionally there is no preference, though it should be
   // unchanging to keep the power low.

   // Final Output
   assign rdtag_w0_y = rdtag_sa_y[32:0];
   assign rdtag_w1_y = rdtag_sa_y[65:33];
   assign rdtag_w2_y = rdtag_sa_y[98:66];
   assign rdtag_w3_y = rdtag_sa_y[131:99];

   integer i;
   initial
   begin
      for (i = 0; i < 511; i = i + 1)
      begin
         ictag_ary[i] = 0;
      end
   end

   //----------------------------------------------------------------------
   // Write Operation
   //----------------------------------------------------------------------
   // Writes should be blocked off during scan shift.
   always @ (negedge clk)
     begin
     if (wrreq_y & reset_l & ~rst_tri_en)
     begin
             if (dec_wrway_y[0])
               ictag_ary[{index_y, 2'b00}] = wrtag_w0_y;
             if (dec_wrway_y[1])
               ictag_ary[{index_y, 2'b01}] = wrtag_w1_y;
             if (dec_wrway_y[2])
               ictag_ary[{index_y, 2'b10}] = wrtag_w2_y;
             if (dec_wrway_y[3])
               ictag_ary[{index_y, 2'b11}] = wrtag_w3_y;
     end
     end

   // TBD: Need to model rd-wr contention
`endif

   //******************************************************
   // The stuff below is not part of the main functionality
   // and has no representation in the actual circuit.
   //******************************************************

   // synopsys translate_off

   //-----------------------
   // Contention Monitor
   //-----------------------
 `ifdef INNO_MUXEX
 `else
   always @ (negedge clk)
   begin
      if (rdreq_y & wrreq_y & reset_l)
        begin
           // 0in <fire -message "FATAL ERROR: rd and wr contention in ict"
           //$error("IDtag Contention", "ERROR rd and wr contention in ict");
        end
   end // always @ (negedge clk)

 `endif


   //--------------------------------
//   // For dump_cache.v
//   //--------------------------------
//   //fake to make dump_cache.v happy
//   reg [29:0] w0 [127:0];
//   reg [29:0] w1 [127:0];
//   reg [29:0] w2 [127:0];
//   reg [29:0] w3 [127:0];
//
//   always @ (negedge clk)
//     begin
//        if (wrreq_y & ~se)
//          begin
//             if (rdreq_y) begin // rd/wr contention
//               case (dec_wrway_y)
//                 4'b0001 : w0[index_y[6:0]] ={30{1'bx}};
//                 4'b0010 : w1[index_y[6:0]] ={30{1'bx}};
//                 4'b0100 : w2[index_y[6:0]] ={30{1'bx}};
//                 4'b1000 : w3[index_y[6:0]] ={30{1'bx}};
//               endcase // case(wrway_y)
//             end
//             else begin
//               case (dec_wrway_y)
//                 4'b0001 : w0[index_y[6:0]] = wrtag_w0_y[29:0];
//                 4'b0010 : w1[index_y[6:0]] = wrtag_w1_y[29:0];
//                 4'b0100 : w2[index_y[6:0]] = wrtag_w2_y[29:0];
//                 4'b1000 : w3[index_y[6:0]] = wrtag_w3_y[29:0];
//               endcase // case(wrway_y)
//             end
//          end
//     end

   // synopsys translate_on


endmodule // bw_r_ict
`endif

`endif // checker model

`ifdef IBM_SRAM_CACHE_TAG
module bw_r_ict(rdtag_w0_y, rdtag_w1_y, rdtag_w2_y, rdtag_w3_y, so, rclk, se,
  si, reset_l, sehold, rst_tri_en, index0_x, index1_x, index_sel_x,
  dec_wrway_x, rdreq_x, wrreq_x, wrtag_w0_y, wrtag_w1_y, wrtag_w2_y,
  wrtag_w3_y, wrtag_w0_x, wrtag_w1_x, wrtag_w2_x,
  wrtag_w3_x, adj,

  // sram wrapper interface
  sramid,
  srams_rtap_data,
  rtap_srams_bist_command,
  rtap_srams_bist_data
  );

  input     rclk;
  input     se;
  input     si;
  input     reset_l;
  input     sehold;
  input     rst_tri_en;
  input [6:0]   index0_x;
  input [6:0]   index1_x;
  input     index_sel_x;
  input [3:0]   dec_wrway_x;
  input     rdreq_x;
  input     wrreq_x;
  input [32:0]    wrtag_w0_x;
  input [32:0]    wrtag_w1_x;
  input [32:0]    wrtag_w2_x;
  input [32:0]    wrtag_w3_x;
  input [32:0]    wrtag_w0_y;
  input [32:0]    wrtag_w1_y;
  input [32:0]    wrtag_w2_y;
  input [32:0]    wrtag_w3_y;
  input [3:0]   adj;


  // sram wrapper interface
  output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
  input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
  input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;
  input  [`BIST_ID_WIDTH-1:0] sramid;

  output  [32:0]    rdtag_w0_y;
  output  [32:0]    rdtag_w1_y;
  output  [32:0]    rdtag_w2_y;
  output  [32:0]    rdtag_w3_y;
  output      so;

  wire      clk;
  wire  [6:0]   index_x;
  reg   [6:0]   index_y;
  wire  [3:0]   we;
  reg           wrreq_y;
  reg           rdreq_y;

  reg [131:0]  rdtag_sa_y; //for error_inject XMR

  assign clk = rclk;
  assign index_x = (index_sel_x ? index1_x : index0_x);
  assign we = ({4 {((wrreq_x & reset_l) & (~rst_tri_en))}} & dec_wrway_x);

  wire [131:0] write_bus_x = {wrtag_w3_x,wrtag_w2_x,wrtag_w1_x,wrtag_w0_x};
  wire [131:0] write_bus_mask_x = {{33{we[3]}}, {33{we[2]}}, {33{we[1]}}, {33{we[0]}}};

  always @ (posedge rclk)
  begin
    index_y <= index_x;
    wrreq_y <= wrreq_x;
    rdreq_y <= rdreq_x;
  end

`ifdef IBM_SRAM_CACHE_TAG_MODEL
reg [131:0] cache [127:0];
  reg  [32:0]    rdtag_w0_y;
  reg  [32:0]    rdtag_w1_y;
  reg  [32:0]    rdtag_w2_y;
  reg  [32:0]    rdtag_w3_y;

   // integer i;
   // initial
   // begin
   //    for (i = 0; i < 128; i = i + 1)
   //    begin
   //       cache[i] = 0;
   //    end
   // end


always @ (posedge rclk)
begin
    if (wrreq_x)
      cache[index_x] <= (write_bus_x & write_bus_mask_x) | (cache[index_x] & ~write_bus_mask_x);
    else
    begin
        if (rdreq_x)
            {rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y} <= cache[index_x];
        else
            {rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y} <= {rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y};
            // {rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y} <= 132'b0;
    end
end

`else
// real SRAM instance
  wire  [32:0]    rdtag_w0_y;
  wire  [32:0]    rdtag_w1_y;
  wire  [32:0]    rdtag_w2_y;
  wire  [32:0]    rdtag_w3_y;

sram_l1i_tag cache
(
  .MEMCLK(rclk),
    .RESET_N(reset_l),
  .CE(wrreq_x | rdreq_x),
  .A(index_x),
  .DIN(write_bus_x),
  .BW(write_bus_mask_x),
  .RDWEN(~wrreq_x),
  .DOUT({rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y}),

  // .BIST_COMMAND(rtap_srams_bist_command),
  // .BIST_DIN(rtap_srams_bist_data),
  // .BIST_DOUT(sram_dcache_w01_rtap_data),
  // .SRAMID(`BIST_ID_L1_DCACHE_W01)
  .BIST_COMMAND(rtap_srams_bist_command),
  .BIST_DIN(rtap_srams_bist_data),
  .BIST_DOUT(srams_rtap_data),
  .SRAMID(sramid)
);
`endif


`ifdef IBM_SRAM_CACHE_TAG_MODEL_CHECKER

   wire [32:0] rdtag_w0_y_ref;
   wire [32:0] rdtag_w1_y_ref;
   wire [32:0] rdtag_w2_y_ref;
   wire [32:0] rdtag_w3_y_ref;

   wire [131:0] dout = {rdtag_w3_y, rdtag_w2_y, rdtag_w1_y, rdtag_w0_y};
   wire [131:0] dout_ref = {rdtag_w3_y_ref, rdtag_w2_y_ref, rdtag_w1_y_ref, rdtag_w0_y_ref};

   bw_r_ict_orig cache_orig(
      .index0_x(index0_x),
      .index1_x(index1_x),
      .index_sel_x(index_sel_x),
      .dec_wrway_x(dec_wrway_x),
      .rdreq_x(rdreq_x),
      .wrreq_x(wrreq_x),
      .wrtag_w0_y(wrtag_w0_y),
      .wrtag_w1_y(wrtag_w1_y),
      .wrtag_w2_y(wrtag_w2_y),
      .wrtag_w3_y(wrtag_w3_y),
      .wrtag_w0_x(wrtag_w0_x),
      .wrtag_w1_x(wrtag_w1_x),
      .wrtag_w2_x(wrtag_w2_x),
      .wrtag_w3_x(wrtag_w3_x),
      .adj(adj),
      .rdtag_w0_y(rdtag_w0_y_ref),
      .rdtag_w1_y(rdtag_w1_y_ref),
      .rdtag_w2_y(rdtag_w2_y_ref),
      .rdtag_w3_y(rdtag_w3_y_ref),

      .rst_tri_en(rst_tri_en),

      .rclk(rclk),
      .se(se),
      .si(si),
      .reset_l(reset_l),
      .sehold(sehold),

      .so(),

      .sramid(8'b0),
      .srams_rtap_data(),
      .rtap_srams_bist_command(4'b0),
      .rtap_srams_bist_data(4'b0)
   );

always @ (posedge rclk)
begin
  // #1;
   if (rdreq_y == 1'b1 && (dout[131:0] != dout_ref[131:0]))
   begin
      $display("%d : Simulation -> FAIL(%0s)", $time, "bw_r_ict_ref not same");
      repeat(5)@(posedge rclk);
      `MONITOR_PATH.fail("w_r_ict_ref not same");
   end
end

`endif // model checker


endmodule

`endif // IBM TAG


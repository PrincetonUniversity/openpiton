// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_dcd.v
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
//  Module Name:
//  Description:  LSU Data Cache.
//      - Physically-Indexed Physically Tagged (PIPT)
//      - 8KB
//      - 4 way set-associative.
//      - 16B lines
//      - 2:1 column select by choosing either lower
//      or upper half of 16B line.
//      - Parity protected on a byte basis.
//      - Byte enables for byte-wide stores.
//
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
//`include  "sys.h" // system level definition file which contains the
                  // time scale definition

//`include "iop.h"
//`include "fabric.h"

//FPGA_SYN enables all FPGA related modifications
`ifdef FPGA_SYN
`define FPGA_SYN_DCD
`endif

`ifndef NO_USE_IBM_SRAMS
`define IBM_SRAM_LSU_DCACHE
`endif

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module bw_r_dcd ( /*AUTOARG*/
   // Outputs
   so, dcache_rdata_wb, dcache_rparity_wb, dcache_rparity_err_wb,
   dcache_rdata_msb_w0_m, dcache_rdata_msb_w1_m,
   dcache_rdata_msb_w2_m, dcache_rdata_msb_w3_m,
   dcd_fuse_repair_value, dcd_fuse_repair_en,
   // Inputs
   dcache_rd_addr_e, dcache_alt_addr_e, dcache_rvld_e, dcache_wvld_e,
   dcache_wdata_e, dcache_wr_rway_e, dcache_byte_wr_en_e,
   dcache_alt_rsel_way_e, dcache_rsel_way_wb, dcache_alt_mx_sel_e,
   si, se, sehold, rst_tri_en, arst_l, rclk, dcache_alt_data_w0_m,
   dcache_arry_data_sel_m, efc_spc_fuse_clk1, fuse_dcd_wren,
   fuse_dcd_rid, fuse_dcd_repair_value, fuse_dcd_repair_en,


   // sram wrapper interface
   sram_dcache_w01_rtap_data,
   sram_dcache_w23_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data
   ) ;


output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w01_rtap_data;
output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w23_rtap_data;
input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

input [10:3]    dcache_rd_addr_e;     // read cache index [10:4] + bit [3] offset
input [10:3]    dcache_alt_addr_e;    // write/bist/diagnostic read cache index + offset

input           dcache_rvld_e;        // read accesses d$.
input           dcache_wvld_e;        // valid write setup to m-stage.

input [143:0]   dcache_wdata_e;       // write data - 16Bx8 + 8b parity.
input [3:0]     dcache_wr_rway_e;     // replacement way for load miss/store.
input [15:0]    dcache_byte_wr_en_e;  // 16b byte wr enable for stores.

input [3:0]     dcache_alt_rsel_way_e ; // bist/diagnostic read way select
input [3:0]     dcache_rsel_way_wb;     // load way select, connect to cache_way_hit
input           dcache_alt_mx_sel_e;

input           si;
input           se;
input           sehold;

output          so;

input   rst_tri_en ;

input           arst_l; // used for redundancy flops - do not reset on wrm reset.

input           rclk;

output  [63:0]  dcache_rdata_wb;
output  [7:0]   dcache_rparity_wb;
output          dcache_rparity_err_wb;

//=================================
//    dc_fill critical path
//=================================
   input [63:0] dcache_alt_data_w0_m; //from qdp1
   input        dcache_arry_data_sel_m;            //from dctl

   output [7:0] dcache_rdata_msb_w0_m;    //to dcdp
   output [7:0] dcache_rdata_msb_w1_m;    //to dcdp
   output [7:0] dcache_rdata_msb_w2_m;    //to dcdp
   output [7:0] dcache_rdata_msb_w3_m;    //to dcdp

//-----------------------------------------------------------------------------
// 32KB block fuse inputs
//-----------------------------------------------------------------------------
// efuse non ovl clks
input           efc_spc_fuse_clk1;

input           fuse_dcd_wren;          //redundancy register write enable, qualified
input [2:0]     fuse_dcd_rid;           //redundancy register id
input [7:0]     fuse_dcd_repair_value;  //data in for redundancy register
input [1:0]     fuse_dcd_repair_en;     //enable bits to turn on redundancy
output [7:0]    dcd_fuse_repair_value;  //data out for redundancy register
output [1:0]    dcd_fuse_repair_en;     //enable bits out

// Memory declaration.
wire  [10:3]    dcache_rwaddr_e ;
wire  [10:3]    dcache_raddr_e ;

`ifdef IBM_SRAM_LSU_DCACHE

wire [143:0]   temp_w0a;
wire [143:0]   temp_w1a;
wire [143:0]   temp_w2a;
wire [143:0]   temp_w3a;


// this particular macro contains 2 ways
// wire [143:0] way_mask_e = { {8{dcache_byte_wr_en_e[0]}},
//                             {8{dcache_byte_wr_en_e[1]}},
//                             {8{dcache_byte_wr_en_e[2]}},
//                             {8{dcache_byte_wr_en_e[3]}},
//                             {8{dcache_byte_wr_en_e[4]}},
//                             {8{dcache_byte_wr_en_e[5]}},
//                             {8{dcache_byte_wr_en_e[6]}},
//                             {8{dcache_byte_wr_en_e[7]}},
//                             {8{dcache_byte_wr_en_e[8]}},
//                             {8{dcache_byte_wr_en_e[9]}},
//                             {8{dcache_byte_wr_en_e[10]}},
//                             {8{dcache_byte_wr_en_e[11]}},
//                             {8{dcache_byte_wr_en_e[12]}},
//                             {8{dcache_byte_wr_en_e[13]}},
//                             {8{dcache_byte_wr_en_e[14]}},
//                             {8{dcache_byte_wr_en_e[15]}}
//                           };

// Includes data(128b)+parity(16b).
wire [143:0] way_mask_e =
    {{8{dcache_byte_wr_en_e[15]}},{8{dcache_byte_wr_en_e[14]}},{8{dcache_byte_wr_en_e[13]}},
     {8{dcache_byte_wr_en_e[12]}},{8{dcache_byte_wr_en_e[11]}},{8{dcache_byte_wr_en_e[10]}},
     {8{dcache_byte_wr_en_e[9]}}, {8{dcache_byte_wr_en_e[8]}}, {8{dcache_byte_wr_en_e[7]}},
     {8{dcache_byte_wr_en_e[6]}}, {8{dcache_byte_wr_en_e[5]}}, {8{dcache_byte_wr_en_e[4]}},
     {8{dcache_byte_wr_en_e[3]}}, {8{dcache_byte_wr_en_e[2]}}, {8{dcache_byte_wr_en_e[1]}},
     {8{dcache_byte_wr_en_e[0]}}, dcache_byte_wr_en_e[15:0]} ;

wire [143:0] way0_write_mask = {144{dcache_wr_rway_e[0]}} & way_mask_e;
wire [143:0] way1_write_mask = {144{dcache_wr_rway_e[1]}} & way_mask_e;
wire [143:0] way2_write_mask = {144{dcache_wr_rway_e[2]}} & way_mask_e;
wire [143:0] way3_write_mask = {144{dcache_wr_rway_e[3]}} & way_mask_e;


`ifdef IBM_SRAM_LSU_DCACHE_SIMULATION

reg [143:0]   temp_w0a_reg;
reg [143:0]   temp_w1a_reg;
reg [143:0]   temp_w2a_reg;
reg [143:0]   temp_w3a_reg;

reg [575:0] cache [127:0];

wire [575:0] way_write_mask = {way3_write_mask,way2_write_mask,way1_write_mask,way0_write_mask};
always @ (posedge rclk)
begin
    if (dcache_wvld_e)
    cache[dcache_rwaddr_e[10:4]] <= ({4{dcache_wdata_e}} & way_write_mask) | (cache[dcache_rwaddr_e[10:4]] & ~way_write_mask);
    else
    begin
        if (dcache_rvld_e)
            {temp_w3a_reg, temp_w2a_reg,temp_w1a_reg, temp_w0a_reg} <= cache[dcache_rwaddr_e[10:4]];
        else
            {temp_w3a_reg, temp_w2a_reg,temp_w1a_reg, temp_w0a_reg} <= 0;
    end
end

`else // real IBM srams

wire [143:0]   temp_w0a_reg;
wire [143:0]   temp_w1a_reg;
wire [143:0]   temp_w2a_reg;
wire [143:0]   temp_w3a_reg;

sram_1rw_128x288 dcache_way_01
(
  .MEMCLK(rclk),
  .RESET_N(arst_l),
  .CE(dcache_wvld_e | dcache_rvld_e),
  .A(dcache_rwaddr_e[10:4]),
  .DIN({dcache_wdata_e, dcache_wdata_e}),
  .BW({way1_write_mask, way0_write_mask}),
  .RDWEN(~dcache_wvld_e),
  .DOUT({temp_w1a_reg, temp_w0a_reg}),

  .BIST_COMMAND(rtap_srams_bist_command),
  .BIST_DIN(rtap_srams_bist_data),
  .BIST_DOUT(sram_dcache_w01_rtap_data),
  .SRAMID(`BIST_ID_L1_DCACHE_W01)
);


sram_1rw_128x288 dcache_way_23
(
  .MEMCLK(rclk),
  .RESET_N(arst_l),
  .CE(dcache_wvld_e | dcache_rvld_e),
  .A(dcache_rwaddr_e[10:4]),
  .DIN({dcache_wdata_e, dcache_wdata_e}),
  .BW({way3_write_mask, way2_write_mask}),
  .RDWEN(~dcache_wvld_e),
  .DOUT({temp_w3a_reg, temp_w2a_reg}),

  .BIST_COMMAND(rtap_srams_bist_command),
  .BIST_DIN(rtap_srams_bist_data),
  .BIST_DOUT(sram_dcache_w23_rtap_data),
  .SRAMID(`BIST_ID_L1_DCACHE_W23)
);

`endif //IBM_SRAM_LSU_DCACHE_SIMULATION

`else

`ifdef DEFINE_0IN
wire [143:0]   temp_w0a;
wire [143:0]   temp_w1a;
wire [143:0]   temp_w2a;
wire [143:0]   temp_w3a;
`else
reg [143:0]   w0 [127:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */  ;   // way0, byte0. Data+Parity.
reg [143:0]   w1 [127:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */  ;   // way0, byte0. Data+Parity.
reg [143:0]   w2 [127:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */  ;   // way0, byte0. Data+Parity.
reg [143:0]   w3 [127:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */  ;   // way0, byte0. Data+Parity.

reg [143:0]   temp_w0a_reg;
reg [143:0]   temp_w1a_reg;
reg [143:0]   temp_w2a_reg;
reg [143:0]   temp_w3a_reg;

wire [143:0]   temp_w0a;
wire [143:0]   temp_w1a;
wire [143:0]   temp_w2a;
wire [143:0]   temp_w3a;

reg [143:0]   temp_w0;
reg [143:0]   temp_w1;
reg [143:0]   temp_w2;
reg [143:0]   temp_w3;

integer       i,j;
reg [7:0]     ctr;


`endif
`endif // IBM_SRAM

reg [10:3]    dcache_rwaddr_m ;
reg [10:3]    dcache_raddr_m ;
reg           dcache_rvld_m ;
reg           wvld_m ;
reg [143:0]   dcache_wdata_m ;
reg [127:0]   rw_wdline ;
reg [3:0]     dcache_wr_rway_m ;

reg [63:0]    dcache_rdata_w0_wb;   // way0 64b data.
reg [63:0]    dcache_rdata_w1_wb;   // way1 64b data.
reg [63:0]    dcache_rdata_w2_wb;   // way2 64b data.
reg [63:0]    dcache_rdata_w3_wb;   // way3 64b data.
reg [15:0]    byte_wr_enable ;

reg           dcache_alt_mx_sel_m, dcache_alt_mx_sel_wb;
reg [3:0]     dcache_alt_rsel_way_m, dcache_alt_rsel_way_wb;


wire            dcache_wvld_m ;
wire  [63:0]    dcache_rdata_w0_m;    // way0 64b data.
wire  [63:0]    dcache_rdata_w1_m;    // way1 64b data.
wire  [63:0]    dcache_rdata_w2_m;    // way2 64b data.
wire  [63:0]    dcache_rdata_w3_m;    // way3 64b data.
wire  [7:0]     dcache_rparity_w0_m;  // way0 8b parity.
wire  [7:0]     dcache_rparity_w1_m;  // way1 8b parity.
wire  [7:0]     dcache_rparity_w2_m;  // way2 8b parity.
wire  [7:0]     dcache_rparity_w3_m;  // way3 8b parity.

   wire [7:0]   rd_parity_err_w0_m;
   wire [7:0]   rd_parity_err_w1_m;
   wire [7:0]   rd_parity_err_w2_m;
   wire [7:0]   rd_parity_err_w3_m;


wire  [143:0]   way_mask ;
wire  [143:0]   way_mask_inv ;

//calculated parity based on read-out data
wire [7:0]  gen_dcache_parity_w0_m;
wire [7:0]  gen_dcache_parity_w1_m;
wire [7:0]  gen_dcache_parity_w2_m;
wire [7:0]  gen_dcache_parity_w3_m;

   wire     clk;
   assign   clk = rclk;

//=========================================================================================
//  Staging
//=========================================================================================

// BIST Rd used fill address port.
assign  dcache_rwaddr_e[10:3] =
  (dcache_alt_mx_sel_e) ? dcache_alt_addr_e[10:3] : dcache_rd_addr_e[10:3] ;

assign  dcache_raddr_e[10:3] =
  (dcache_alt_mx_sel_e) ? dcache_alt_addr_e[10:3] : dcache_rd_addr_e[10:3] ;

always @(posedge clk)
  begin
    dcache_alt_mx_sel_m   <= sehold ? dcache_alt_mx_sel_m : dcache_alt_mx_sel_e;

    dcache_alt_rsel_way_m <= sehold ? dcache_alt_rsel_way_m : dcache_alt_rsel_way_e;

    dcache_rwaddr_m[10:3] <= sehold ? dcache_rwaddr_m[10:3] : dcache_rwaddr_e[10:3] ;

    dcache_raddr_m[10:3] <= sehold ? dcache_raddr_m[10:3] : dcache_raddr_e[10:3] ;

    dcache_rvld_m         <= sehold ? dcache_rvld_m  : dcache_rvld_e ;

    wvld_m                <= sehold ?  wvld_m : dcache_wvld_e ;

    dcache_wdata_m[143:0] <= sehold ?  dcache_wdata_m[143:0] : dcache_wdata_e[143:0] ;

    dcache_wr_rway_m[3:0] <= sehold ?  dcache_wr_rway_m[3:0] : dcache_wr_rway_e[3:0] ;

    byte_wr_enable[15:0]  <= sehold ? byte_wr_enable[15:0] : dcache_byte_wr_en_e[15:0] ;

  end

always @ (posedge clk)
  begin
// JC modified begin
//    dcache_alt_mx_sel_wb <= dcache_alt_mx_sel_m;
//    dcache_alt_rsel_way_wb  <= dcache_alt_rsel_way_m;
    dcache_alt_mx_sel_wb <= sehold ? dcache_alt_mx_sel_wb :dcache_alt_mx_sel_m;
    dcache_alt_rsel_way_wb  <= sehold ? dcache_alt_rsel_way_wb :dcache_alt_rsel_way_m;
// JC modified end
  end

assign  dcache_wvld_m = wvld_m & ~rst_tri_en ;

`ifndef IBM_SRAM_LSU_DCACHE

`ifdef DEFINE_0IN
wire [3:0] dc_we = dcache_wvld_m ? dcache_wr_rway_m : 4'b0;

dc_data dc_data0 ( .nclk(~clk), .adr(dcache_rwaddr_m[10:4]),
                                 .we(dc_we           [0]  ), .wm(way_mask  [143:0]),
                                .din(dcache_wdata_m[143:0]), .dout(temp_w0a[143:0]) );
dc_data dc_data1 ( .nclk(~clk), .adr(dcache_rwaddr_m[10:4]),
                                 .we(dc_we           [1]  ), .wm(way_mask  [143:0]),
                                .din(dcache_wdata_m[143:0]), .dout(temp_w1a[143:0]) );
dc_data dc_data2 ( .nclk(~clk), .adr(dcache_rwaddr_m[10:4]),
                                 .we(dc_we           [2]  ), .wm(way_mask  [143:0]),
                                .din(dcache_wdata_m[143:0]), .dout(temp_w2a[143:0]) );
dc_data dc_data3 ( .nclk(~clk), .adr(dcache_rwaddr_m[10:4]),
                                 .we(dc_we           [3]  ), .wm(way_mask  [143:0]),
                                .din(dcache_wdata_m[143:0]), .dout(temp_w3a[143:0]) );
`else
//=========================================================================================
//  generate wordlines
//=========================================================================================

// Generate at posedge of clk.
// JC modified begin
/*
always @ (posedge clk)
  begin
    for (ctr=8'h00;ctr<128;ctr=ctr+1)
      begin
      if (clk & ({1'b0,dcache_rwaddr_e[10:4]} == ctr) &
         (dcache_rvld_e | dcache_wvld_e))
        rw_wdline[ctr]  = 1'b1;
      else
        rw_wdline[ctr]  = 1'b0;
      end
  end
*/

`ifdef FPGA_SYN_DCD
`else
always @ (clk or dcache_rwaddr_m or dcache_wvld_m or dcache_rvld_m)
  begin
   if (clk) begin
    for (ctr=8'h00;ctr<128;ctr=ctr+1)
      begin
      if (({1'b0,dcache_rwaddr_m[10:4]} == ctr) &
         (dcache_rvld_m | dcache_wvld_m))
        rw_wdline[ctr]  = 1'b1;
      else
        rw_wdline[ctr]  = 1'b0;
      end
   end
  end
// JC modified end
`endif


//=========================================================================================
//  Read from Memory.
//=========================================================================================

`ifdef FPGA_SYN_DCD
always @(posedge clk) begin
  temp_w0a_reg[143:0] = w0[dcache_raddr_e[10:4]];
  temp_w1a_reg[143:0] = w1[dcache_raddr_e[10:4]];
  temp_w2a_reg[143:0] = w2[dcache_raddr_e[10:4]];
  temp_w3a_reg[143:0] = w3[dcache_raddr_e[10:4]];
end
`else
// Read
always @ (negedge clk)
  begin
    for (i=0;i<128;i=i+1)
      begin
        if (rw_wdline[i] & dcache_rvld_m)
          begin
            temp_w0a_reg[143:0] <= w0[i];
            temp_w1a_reg[143:0] <= w1[i];
            temp_w2a_reg[143:0] <= w2[i];
            temp_w3a_reg[143:0] <= w3[i];
          end
      end
  end
`endif

//removed stablizer, zero out without read
assign  temp_w0a[143:0] = dcache_rvld_m? temp_w0a_reg[143:0]: 144'b0;
assign  temp_w1a[143:0] = dcache_rvld_m? temp_w1a_reg[143:0]: 144'b0;
assign  temp_w2a[143:0] = dcache_rvld_m? temp_w2a_reg[143:0]: 144'b0;
assign  temp_w3a[143:0] = dcache_rvld_m? temp_w3a_reg[143:0]: 144'b0;

`endif  //DEFINE_0IN

`else

//removed stablizer, zero out without read (for IBM sram too)
assign  temp_w0a[143:0] = dcache_rvld_m? temp_w0a_reg[143:0]: 144'b0;
assign  temp_w1a[143:0] = dcache_rvld_m? temp_w1a_reg[143:0]: 144'b0;
assign  temp_w2a[143:0] = dcache_rvld_m? temp_w2a_reg[143:0]: 144'b0;
assign  temp_w3a[143:0] = dcache_rvld_m? temp_w3a_reg[143:0]: 144'b0;

`endif // IBM

// Prior to SA, column mux (64(D)+8(P))x4 bits. Assume parity is
// at the end of the 144b line. Entry is wX||Parity

// Select either upper or lower 64b from each of the 4 ways.
assign  dcache_rdata_w0_m[63:0] = ~dcache_rwaddr_m[3] ? temp_w0a[143:80] : temp_w0a[79:16] ;
assign  dcache_rdata_w1_m[63:0] = ~dcache_rwaddr_m[3] ? temp_w1a[143:80] : temp_w1a[79:16] ;
assign  dcache_rdata_w2_m[63:0] = ~dcache_rwaddr_m[3] ? temp_w2a[143:80] : temp_w2a[79:16] ;
assign  dcache_rdata_w3_m[63:0] = ~dcache_rwaddr_m[3] ? temp_w3a[143:80] : temp_w3a[79:16] ;

   wire [7:0] dcache_msb_w0_m;
   wire [7:0] dcache_alt_data_w0_msb_m;

//MSB sent out to dcdp in M stage
assign dcache_msb_w0_m[7:0]=
    {dcache_rdata_w0_m[63],
     dcache_rdata_w0_m[55],
     dcache_rdata_w0_m[47],
     dcache_rdata_w0_m[39],
     dcache_rdata_w0_m[31],
     dcache_rdata_w0_m[23],
     dcache_rdata_w0_m[15],
     dcache_rdata_w0_m[07]} ;

assign dcache_alt_data_w0_msb_m [7:0]=
    {dcache_alt_data_w0_m[63],
     dcache_alt_data_w0_m[55],
     dcache_alt_data_w0_m[47],
     dcache_alt_data_w0_m[39],
     dcache_alt_data_w0_m[31],
     dcache_alt_data_w0_m[23],
     dcache_alt_data_w0_m[15],
     dcache_alt_data_w0_m[07]} ;

//2-to-1 mux
assign dcache_rdata_msb_w0_m[7:0] = dcache_arry_data_sel_m ?
                                    dcache_msb_w0_m[7:0] :
                                    dcache_alt_data_w0_msb_m[7:0];

assign dcache_rdata_msb_w1_m[7:0]=
    {dcache_rdata_w1_m[63],
     dcache_rdata_w1_m[55],
     dcache_rdata_w1_m[47],
     dcache_rdata_w1_m[39],
     dcache_rdata_w1_m[31],
     dcache_rdata_w1_m[23],
     dcache_rdata_w1_m[15],
     dcache_rdata_w1_m[07]} ;

assign dcache_rdata_msb_w2_m[7:0]=
    {dcache_rdata_w2_m[63],
     dcache_rdata_w2_m[55],
     dcache_rdata_w2_m[47],
     dcache_rdata_w2_m[39],
     dcache_rdata_w2_m[31],
     dcache_rdata_w2_m[23],
     dcache_rdata_w2_m[15],
     dcache_rdata_w2_m[07]} ;

assign dcache_rdata_msb_w3_m[7:0]=
    {dcache_rdata_w3_m[63],
     dcache_rdata_w3_m[55],
     dcache_rdata_w3_m[47],
     dcache_rdata_w3_m[39],
     dcache_rdata_w3_m[31],
     dcache_rdata_w3_m[23],
     dcache_rdata_w3_m[15],
     dcache_rdata_w3_m[07]} ;

   wire [63:0] rdata_w0_m;
   wire [63:0] rdata_w1_m;
   wire [63:0] rdata_w2_m;
   wire [63:0] rdata_w3_m;

//2-to-1 mux
//dcache_alt_mx_sel default 0001 (way 0) when not in MBIST mode (logic in qdp2)
assign rdata_w0_m[63:0] = dcache_arry_data_sel_m ?
                          dcache_rdata_w0_m[63:0] : dcache_alt_data_w0_m[63:0];

//assign rdata_w0_m[63:0] = dcache_rdata_w0_m[63:0];
assign rdata_w1_m[63:0] = dcache_rdata_w1_m[63:0];
assign rdata_w2_m[63:0] = dcache_rdata_w2_m[63:0];
assign rdata_w3_m[63:0] = dcache_rdata_w3_m[63:0];

// Select upper half or lower half of parity.
assign  dcache_rparity_w0_m[7:0] = ~dcache_rwaddr_m[3] ? temp_w0a[15:8] : temp_w0a[7:0] ;
assign  dcache_rparity_w1_m[7:0] = ~dcache_rwaddr_m[3] ? temp_w1a[15:8] : temp_w1a[7:0] ;
assign  dcache_rparity_w2_m[7:0] = ~dcache_rwaddr_m[3] ? temp_w2a[15:8] : temp_w2a[7:0] ;
assign  dcache_rparity_w3_m[7:0] = ~dcache_rwaddr_m[3] ? temp_w3a[15:8] : temp_w3a[7:0] ;

   reg [7:0] dcache_rparity_w0_wb;
   reg [7:0] dcache_rparity_w1_wb;
   reg [7:0] dcache_rparity_w2_wb;
   reg [7:0] dcache_rparity_w3_wb;

   reg [7:0] rd_parity_err_w0_wb;
   reg [7:0] rd_parity_err_w1_wb;
   reg [7:0] rd_parity_err_w2_wb;
   reg [7:0] rd_parity_err_w3_wb;


// Stage to WB
always  @(posedge clk)
  begin
    dcache_rdata_w0_wb[63:0] <= rdata_w0_m[63:0] ;
    dcache_rdata_w1_wb[63:0] <= rdata_w1_m[63:0] ;
    dcache_rdata_w2_wb[63:0] <= rdata_w2_m[63:0] ;
    dcache_rdata_w3_wb[63:0] <= rdata_w3_m[63:0] ;

    dcache_rparity_w0_wb[7:0] <=  dcache_rparity_w0_m[7:0];
    dcache_rparity_w1_wb[7:0] <=  dcache_rparity_w1_m[7:0];
    dcache_rparity_w2_wb[7:0] <=  dcache_rparity_w2_m[7:0];
    dcache_rparity_w3_wb[7:0] <=  dcache_rparity_w3_m[7:0];

    rd_parity_err_w0_wb [7:0] <= rd_parity_err_w0_m[7:0];
    rd_parity_err_w1_wb [7:0] <= rd_parity_err_w1_m[7:0];
    rd_parity_err_w2_wb [7:0] <= rd_parity_err_w2_m[7:0];
    rd_parity_err_w3_wb [7:0] <= rd_parity_err_w3_m[7:0];

  end

//parity calculation and check are done in M stage for 4 way data
   wire rd_parity_err_w0;
   wire rd_parity_err_w1;
   wire rd_parity_err_w2;
   wire rd_parity_err_w3;

lsu_dc_parity_gen #(8,8)  parity_gen_w0 (
                .data_in        (dcache_rdata_w0_m[63:0]),
                .parity_out     (gen_dcache_parity_w0_m[7:0])
        );

assign rd_parity_err_w0_m[7:0] = dcache_rvld_m ? (dcache_rparity_w0_m[7:0] ^ gen_dcache_parity_w0_m[7:0]) :
                                                  8'hff;


lsu_dc_parity_gen #(8,8)  parity_gen_w1 (
                .data_in        (dcache_rdata_w1_m[63:0]),
                .parity_out     (gen_dcache_parity_w1_m[7:0])
        );

assign rd_parity_err_w1_m[7:0] = dcache_rvld_m ? (dcache_rparity_w1_m[7:0] ^ gen_dcache_parity_w1_m[7:0]) :
                                                 8'hff;

lsu_dc_parity_gen #(8,8)  parity_gen_w2 (
                .data_in        (dcache_rdata_w2_m[63:0]),
                .parity_out     (gen_dcache_parity_w2_m[7:0])
        );
assign rd_parity_err_w2_m[7:0] = dcache_rvld_m ? (dcache_rparity_w2_m[7:0] ^ gen_dcache_parity_w2_m[7:0])  :
                                                   8'hff;

lsu_dc_parity_gen #(8,8)  parity_gen_w3 (
                .data_in        (dcache_rdata_w3_m[63:0]),
                .parity_out     (gen_dcache_parity_w3_m[7:0])
        );
assign rd_parity_err_w3_m[7:0] =  dcache_rvld_m ? (dcache_rparity_w3_m[7:0] ^ gen_dcache_parity_w3_m[7:0]) :
                                                  8'hff;


// way select mux on READ
// Select one of four ways from indexed cache set.

wire [3:0] dcache_rd_sel_way_wb;
assign dcache_rd_sel_way_wb[3:0] = dcache_alt_mx_sel_wb ? dcache_alt_rsel_way_wb[3:0] :
                                                          dcache_rsel_way_wb[3:0];

assign  dcache_rdata_wb[63:0]  =
 (dcache_rd_sel_way_wb[0] ? dcache_rdata_w0_wb[63:0] : 64'b0) |
 (dcache_rd_sel_way_wb[1] ? dcache_rdata_w1_wb[63:0] : 64'b0) |
 (dcache_rd_sel_way_wb[2] ? dcache_rdata_w2_wb[63:0] : 64'b0) |
 (dcache_rd_sel_way_wb[3] ? dcache_rdata_w3_wb[63:0] : 64'b0);

//parity err in W-stage, cache_way_hit may not be one-hot
assign rd_parity_err_w0 =   |(rd_parity_err_w0_wb[7:0]);
assign rd_parity_err_w1 =   |(rd_parity_err_w1_wb[7:0]);
assign rd_parity_err_w2 =   |(rd_parity_err_w2_wb[7:0]);
assign rd_parity_err_w3 =   |(rd_parity_err_w3_wb[7:0]);

assign dcache_rparity_err_wb = rd_parity_err_w3 & dcache_rd_sel_way_wb[3] |
                               rd_parity_err_w2 & dcache_rd_sel_way_wb[2] |
                               rd_parity_err_w1 & dcache_rd_sel_way_wb[1] |
                               rd_parity_err_w0 & dcache_rd_sel_way_wb[0] ;

//mux4ds #(64) dcache_rdata_wb_mx (
//  .in0  (dcache_rdata_w0_wb[63:0]),
//  .in1  (dcache_rdata_w1_wb[63:0]),
//  .in2  (dcache_rdata_w2_wb[63:0]),
//  .in3  (dcache_rdata_w3_wb[63:0]),
//  .sel0 (dcache_rd_sel_way_wb[0]),
//  .sel1 (dcache_rd_sel_way_wb[1]),
//  .sel2 (dcache_rd_sel_way_wb[2]),
//  .sel3 (dcache_rd_sel_way_wb[3]),
//  .dout (dcache_rdata_wb[63:0])
//);

// dcache_rparity_wb only used by MBIST
//mux4ds #(8) dcache_rparity_wb_mx (
//  .in0 (dcache_rparity_w0_wb[7:0]),
//  .in1 (dcache_rparity_w1_wb[7:0]),
//  .in2 (dcache_rparity_w2_wb[7:0]),
//  .in3 (dcache_rparity_w3_wb[7:0]),
//  .sel0(dcache_alt_rsel_way_wb[0]),
//  .sel1(dcache_alt_rsel_way_wb[1]),
//  .sel2(dcache_alt_rsel_way_wb[2]),
//  .sel3(dcache_alt_rsel_way_wb[3]),
//  .dout(dcache_rparity_wb[7:0])
//);

assign  dcache_rparity_wb[7:0] =
( dcache_rd_sel_way_wb[0] ? dcache_rparity_w0_wb[7:0] : 8'b0 ) |
( dcache_rd_sel_way_wb[1] ? dcache_rparity_w1_wb[7:0] : 8'b0 ) |
( dcache_rd_sel_way_wb[2] ? dcache_rparity_w2_wb[7:0] : 8'b0 ) |
( dcache_rd_sel_way_wb[3] ? dcache_rparity_w3_wb[7:0] : 8'b0 ) ;

`ifndef IBM_SRAM_LSU_DCACHE
// These simulation codes are not used in real implementation

//=========================================================================================
//  Write to Memory
//=========================================================================================

// Reads and writes are mutex as array is single-ported.


// Includes data(128b)+parity(16b).
assign way_mask[143:0]  =
    {{8{byte_wr_enable[15]}},{8{byte_wr_enable[14]}},{8{byte_wr_enable[13]}},
     {8{byte_wr_enable[12]}},{8{byte_wr_enable[11]}},{8{byte_wr_enable[10]}},
     {8{byte_wr_enable[9]}}, {8{byte_wr_enable[8]}}, {8{byte_wr_enable[7]}},
     {8{byte_wr_enable[6]}}, {8{byte_wr_enable[5]}}, {8{byte_wr_enable[4]}},
     {8{byte_wr_enable[3]}}, {8{byte_wr_enable[2]}}, {8{byte_wr_enable[1]}},
     {8{byte_wr_enable[0]}}, byte_wr_enable[15:0]} ;

assign way_mask_inv[143:0] =  ~way_mask[143:0];


always @ (negedge clk)
  begin

`ifdef FPGA_SYN_DCD

  if(dcache_wvld_m & dcache_wr_rway_m[0]) begin
    w0[dcache_rwaddr_m[10:4]] = (temp_w0a_reg[143:0] & way_mask_inv[143:0]) |
             (dcache_wdata_m[143:0] & way_mask[143:0]) ;
  end
  if(dcache_wvld_m & dcache_wr_rway_m[1]) begin
    w1[dcache_rwaddr_m[10:4]] = (temp_w1a_reg[143:0] & way_mask_inv[143:0]) |
             (dcache_wdata_m[143:0] & way_mask[143:0]) ;
  end
  if(dcache_wvld_m & dcache_wr_rway_m[2]) begin
    w2[dcache_rwaddr_m[10:4]] = (temp_w2a_reg[143:0] & way_mask_inv[143:0]) |
             (dcache_wdata_m[143:0] & way_mask[143:0]) ;
  end
  if(dcache_wvld_m & dcache_wr_rway_m[3]) begin
    w3[dcache_rwaddr_m[10:4]] = (temp_w3a_reg[143:0] & way_mask_inv[143:0]) |
             (dcache_wdata_m[143:0] & way_mask[143:0]) ;
  end

`else // !`ifdef FPGA_SYN_DCD

    for (j=0;j<128;j=j+1)
      begin
      if (rw_wdline[j] & dcache_wvld_m & dcache_wr_rway_m[0])
        begin
        // read
        temp_w0[143:0] = w0[j];
        // modify & write
        w0[j] = (temp_w0[143:0] & way_mask_inv[143:0]) |
            (dcache_wdata_m[143:0] & way_mask[143:0]) ;
        end
      if (rw_wdline[j] & dcache_wvld_m & dcache_wr_rway_m[1])
        begin
        // read
             temp_w1[143:0] = w1[j];
        // modify & write
        w1[j] = (temp_w1[143:0] & way_mask_inv[143:0]) |
            (dcache_wdata_m[143:0] & way_mask[143:0]) ;
        end
      if (rw_wdline[j] & dcache_wvld_m & dcache_wr_rway_m[2])
        begin
        // read
        temp_w2[143:0] = w2[j];
        // modify & write
        w2[j] = (temp_w2[143:0] & way_mask_inv[143:0]) |
            (dcache_wdata_m[143:0] & way_mask[143:0]) ;
        end
      if (rw_wdline[j] & dcache_wvld_m & dcache_wr_rway_m[3])
        begin
        // read
        temp_w3[143:0] = w3[j];
        // modify & write.
        w3[j] = (temp_w3[143:0] & way_mask_inv[143:0])  |
                (dcache_wdata_m[143:0] & way_mask[143:0]) ;
        end
      end
`endif // !`ifdef FPGA_SYN_DCD

  end // always @ (negedge clk)

`endif // IBM

endmodule


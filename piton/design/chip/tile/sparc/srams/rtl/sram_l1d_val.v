// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sram_l1d_val.v
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
 //  Module Name:  sram_l1d_val
 //  Description:
 //   1r1w array for icache and dcache valid bits.
 //   Modified to conform to naming convention
 //   Added 16 bit wr en
 //   Made bit_wen and din flopped inputs
 //   So all inputs are setup to flops in the stage before memory
 //   access.  The data output is available one cycle later (same
 //   stage as mem access)
 //
 //  IMPORTANT NOTE: This block has to work even in the case where
 //  there is contention between a read and write operation for the
 //  same address.  Based on ease of implementation, the behavior
 //  during contention is defined as follows.
 //    -- write always succeeds
 //    -- read data is (array_data & write_data)
 //       (i.e. old_data & new_data)
 //
 //   So read 0 always succeeds.  read 1 succeeds if the data being
 //   written is also a 1.  Otherwise it fails.
 //
 // new_data = 1, old_data = 0, does not give the expected or
 // predictable result in post layout, so the code has been modified
 // to be
 // old new rd_data
 // --- --- -------
 // 0    0     0
 // 0    1     X
 // 1    0     0
 // 1    1     1
 //
 // **The write still succeeds in ALL cases**
 */

////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
//`include "sys.h" // system level definition file which contains the
// time scale definition

`include "lsu.tmp.h"
//`include "iop.h"

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////


module sram_l1d_val (/*AUTOARG*/
   // Outputs
   dout, so,
   // Inputs
   rclk, se, si, reset_l, sehold, rst_tri_en, rd_adr1, rd_adr2,
   rd_adr1_sel, rd_en, wr_adr, wr_en, bit_wen, din,

   sramid,
   srams_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data
   );


input        rclk;
input        se;
input        si;
input        reset_l;
input        sehold;          // scan enable hold
input        rst_tri_en;

// 11:5(I);10:4(D)
input [`L1D_SET_IDX_MASK]     rd_adr1 ;     // rd address-1
input [`L1D_SET_IDX_MASK]     rd_adr2 ;     // rd address-2

input        rd_adr1_sel ;  // sel rd addr 1
input        rd_en ;            // rd enable

// 11:7(I);10:6(D)
input [`L1D_SET_IDX_HI:2]     wr_adr ;  // wr address

input        wr_en ;        // wr enable
input [`L1D_VAL_ARRAY_HI:0] bit_wen ;  // write enable with bit select
input        din ;        // write data

output reg [`L1D_WAY_COUNT-1:0]    dout ;    // valid bits for tag compare

output       so;

wire         clk;
assign       clk = rclk;


// sram wrapper interface
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;
input  [`BIST_ID_WIDTH-1:0] sramid;

// interface to debug module
reg [`L1D_VAL_ARRAY_HI:0] debug_data_bmask;
reg [`L1D_VAL_ARRAY_HI:0] debug_data_in;
reg [`L1D_VAL_ARRAY_HI:0] debug_data_out;
reg [`L1D_SET_IDX_MASK] debug_address;
reg debug_rw;
reg debug_en;

// trin's reimplementation
reg [`L1D_VAL_ARRAY_HI:0] mem [0:`L1D_VAL_SET_COUNT-1];
wire rst_all = rst_tri_en | ~reset_l;

reg write_en_x;
reg write_bit_x;
reg [`L1D_VAL_ARRAY_HI:0] write_mask_x;
reg [`L1D_SET_IDX_HI:2] write_address_x;
reg read_en_x;
reg [`L1D_SET_IDX_MASK] read_address_x;
reg debug_en_x;

reg write_en_y;
reg write_bit_y;
reg [`L1D_VAL_ARRAY_HI:0] write_mask_y;
reg [`L1D_SET_IDX_HI:2] write_address_y;
reg read_en_y;
reg [`L1D_SET_IDX_MASK] read_address_y;
reg debug_en_y;

always @ *
begin

   write_en_x = wr_en; 
   write_bit_x = din;
   write_mask_x = bit_wen;
   write_address_x = wr_adr;

   read_en_x = rd_en;
   read_address_x = rd_adr1_sel ? rd_adr1 : rd_adr2;

   if (debug_en)
   begin
      write_en_x = debug_rw == 1'b1; 
      // write_bit_x = debug_data_in;
      write_mask_x = debug_data_in;
      write_address_x = 0;
      write_address_x[`L1D_SET_IDX_HI:2] = debug_address[4:0];

      read_en_x = debug_rw == 1'b0;
      read_address_x = 0;
      read_address_x[`L1D_SET_IDX_HI:2] = debug_address[4:0];
   end
   debug_en_x = debug_en;

end

always @ (posedge clk)
begin
   write_en_y <= write_en_x;
   write_bit_y <= write_bit_x;
   write_mask_y <= write_mask_x;
   write_address_y <= write_address_x;
   read_en_y <= read_en_x;
   debug_en_y <= debug_en_x;
   read_address_y <= read_address_x;
end

// WRITE
reg [`L1D_VAL_ARRAY_HI:0] write_data_y;
always @ *
begin
   write_data_y = (mem[write_address_y[`L1D_SET_IDX_HI:2]] & ~write_mask_y) | ({16{write_bit_y}} & write_mask_y);
   if (debug_en_y)
      write_data_y = write_mask_y;
end
always @ (posedge clk)
begin
   if (rst_all)
   begin
      mem[0] <= 16'b0;
      mem[1] <= 16'b0;
      mem[2] <= 16'b0;
      mem[3] <= 16'b0;
      mem[4] <= 16'b0;
      mem[5] <= 16'b0;
      mem[6] <= 16'b0;
      mem[7] <= 16'b0;
      mem[8] <= 16'b0;
      mem[9] <= 16'b0;
      mem[10] <= 16'b0;
      mem[11] <= 16'b0;
      mem[12] <= 16'b0;
      mem[13] <= 16'b0;
      mem[14] <= 16'b0;
      mem[15] <= 16'b0;
      mem[16] <= 16'b0;
      mem[17] <= 16'b0;
      mem[18] <= 16'b0;
      mem[19] <= 16'b0;
      mem[20] <= 16'b0;
      mem[21] <= 16'b0;
      mem[22] <= 16'b0;
      mem[23] <= 16'b0;
      mem[24] <= 16'b0;
      mem[25] <= 16'b0;
      mem[26] <= 16'b0;
      mem[27] <= 16'b0;
      mem[28] <= 16'b0;
      mem[29] <= 16'b0;
      mem[30] <= 16'b0;
      mem[31] <= 16'b0;
   end
   else
   begin
      if (write_en_y)
      begin
         mem[write_address_y[`L1D_SET_IDX_HI:2]] <= write_data_y;
      end
   end
end

// READ
reg [`L1D_VAL_ARRAY_HI:0] read1;
reg [`L1D_VAL_ARRAY_HI:0] read2;
reg [`L1D_VAL_ARRAY_HI:0] read3;
reg [`L1D_VAL_ARRAY_HI:0] write_to_0;
always @ *
begin
   read1 = mem[read_address_y[`L1D_SET_IDX_HI:2]];

   // write/read conflict
   // basically, final_read = sram_read & write
   read2 = read1;
   write_to_0 = ~{16{write_bit_y}} & write_mask_y;
   if ((read_address_y[`L1D_SET_IDX_HI:2] == write_address_y[`L1D_SET_IDX_HI:2]) && write_en_y)
      read2 = read1 & ~write_to_0;

   // write_to_0 = 0;
   // if ((read_address_y[`L1D_SET_IDX_HI:2] == write_address_y[`L1D_SET_IDX_HI:2]) && write_en_y)
   //    write_to_0 = write_mask_y;

   // read2 = (~write_to_0 & read1 | write_to_0 & {16{write_bit_y}} & read1);
   debug_data_out = read2;

   case (read_address_y[1:0])
      2'b00:
         read3 = read2[`L1D_WAY_COUNT*1-1 -: `L1D_WAY_COUNT];
      2'b01:
         read3 = read2[`L1D_WAY_COUNT*2-1 -: `L1D_WAY_COUNT];
      2'b10:
         read3 = read2[`L1D_WAY_COUNT*3-1 -: `L1D_WAY_COUNT];
      2'b11:
         read3 = read2[`L1D_WAY_COUNT*4-1 -: `L1D_WAY_COUNT];
   endcase

   dout = 0;
   if (read_en_y)
      dout = read3;
end


///////////////////////////////////////////////////
// implements the standardized SRAM interface
///////////////////////////////////////////////////
localparam BIST_STATE_INIT = 1'b0;
localparam BIST_STATE_CAPTURE_READ = 1'b1;
localparam BIST_DATA_WIDTH = 16;

reg [15:0] bist_address_reg;
reg [3:0] bist_id_reg;
reg [BIST_DATA_WIDTH-1:0] bist_data_reg;
reg [7:0] bist_bsel_reg;
reg bist_state;

reg [15:0] bist_address_reg_next;
reg [3:0] bist_id_reg_next;
reg [BIST_DATA_WIDTH-1:0] bist_data_reg_next;
reg [7:0] bist_bsel_reg_next;
reg bist_state_next;

// wires
reg bist_en;
reg bist_rdwen;
reg bist_data_capture_read_en;
reg bist_address_shift_en;
reg bist_data_shift_en;
reg bist_bsel_shift_en;
reg bist_id_shift_en;
reg [`BIST_OP_WIDTH-1:0] bist_command;


always @ (posedge clk)
begin
   if (!reset_l)
   begin
      // only resetting important variables
      bist_id_reg <= 0;
      bist_state <= BIST_STATE_INIT;
   end
   else
   begin
      bist_data_reg <= bist_data_reg_next;
      bist_state <= bist_state_next;
      bist_address_reg <= bist_address_reg_next;
      bist_bsel_reg <= bist_bsel_reg_next;
      bist_id_reg <= bist_id_reg_next;
   end
end

always @ *
begin
   bist_data_reg_next = bist_data_reg;
   bist_bsel_reg_next = bist_bsel_reg;
   bist_address_reg_next = bist_address_reg;
   bist_id_reg_next = bist_id_reg;

   if (bist_data_capture_read_en)
   begin
      bist_data_reg_next = debug_data_out[BIST_DATA_WIDTH-1:0]; // trin reconfig
   end

   if (bist_data_shift_en)
   begin
      bist_data_reg_next = {bist_data_reg[BIST_DATA_WIDTH-1 - `SRAM_WRAPPER_BUS_WIDTH : 0], rtap_srams_bist_data};
   end

   if (bist_address_shift_en)
   begin
      bist_address_reg_next = {bist_address_reg[15 - `SRAM_WRAPPER_BUS_WIDTH : 0], rtap_srams_bist_data};
   end

   if (bist_bsel_shift_en)
   begin
      // assuming bus width is 4 and bsel is 8b
      bist_bsel_reg_next = {bist_bsel_reg[3:0], rtap_srams_bist_data[3:0]};
   end

   if (bist_id_shift_en)
   begin
      // assuming bus width is 4 and id is 4b
      bist_id_reg_next = rtap_srams_bist_data[3:0];
   end

   // assign output to be the most significant bits while shifting
   srams_rtap_data = bist_data_reg[BIST_DATA_WIDTH-1 -: `SRAM_WRAPPER_BUS_WIDTH];
end

// make/validate bist command
always @ *
begin
   // except for id shift, all commands need to have matching sramid to be activated
   bist_command = 0;
   if (bist_id_reg == sramid 
         || rtap_srams_bist_command == `BIST_OP_SHIFT_ID
         || bist_id_reg == `BIST_ID_BROADCAST)
      bist_command = rtap_srams_bist_command;
end
// combinational logics for states
always @ *
begin
   bist_state_next = BIST_STATE_INIT;
   // general processing of commands
   bist_data_capture_read_en = 1'b0;
   bist_en = 1'b0;
   bist_rdwen = 1'b0;
   bist_data_shift_en = 1'b0;
   bist_address_shift_en = 1'b0;
   bist_bsel_shift_en = 1'b0;
   bist_id_shift_en = 1'b0;
   case (bist_state)
      BIST_STATE_INIT:
      begin
         bist_state_next = BIST_STATE_INIT;
         if (bist_command == `BIST_OP_READ)
         begin
            bist_state_next = BIST_STATE_CAPTURE_READ;
         end
      end
      BIST_STATE_CAPTURE_READ:
      begin
         bist_data_capture_read_en = 1'b1;
         bist_state_next = BIST_STATE_INIT;
      end
   endcase
   if (bist_command == `BIST_OP_READ)
   begin
      bist_en = 1'b1;
      bist_rdwen = 1'b0;
   end
   if (bist_command == `BIST_OP_WRITE)
   begin
      bist_en = 1'b1;
      bist_rdwen = 1'b1;
   end
   if (bist_command == `BIST_OP_SHIFT_DATA)
   begin
      bist_data_shift_en = 1'b1;
   end
   if (bist_command == `BIST_OP_SHIFT_ADDRESS)
   begin
      bist_address_shift_en = 1'b1;
   end
   if (bist_command == `BIST_OP_SHIFT_ID)
   begin
      bist_id_shift_en = 1'b1;
   end
   if (bist_command == `BIST_OP_SHIFT_BSEL)
   begin
      bist_bsel_shift_en = 1'b1;
   end

   // TODO
   debug_en = bist_en;
   debug_rw = bist_rdwen;
   debug_address[`L1D_SET_IDX_MASK] = bist_address_reg[`L1D_SET_IDX_MASK];
   debug_data_in[`L1D_VAL_ARRAY_HI:0] = bist_data_reg[`L1D_VAL_ARRAY_HI:0];
   debug_data_bmask = ~(16'b0);
end


endmodule // sram_l1d_val













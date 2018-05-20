// Modified by Princeton Unviersity on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_r_irf_register.v
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

`ifdef FPGA_SYN_1THREAD

`ifdef FPGA_SYN_SAVE_BRAM


module bw_r_irf_register(clk, reset_l, wren, save, save_addr, restore, restore_addr, wr_data, rd_data);
	input		clk;
	input       reset_l;
	input		wren;
	input		save;
	input	[2:0]	save_addr;
	input		restore;
	input	[2:0]	restore_addr;
	input	[71:0]	wr_data;
	output	[71:0]	rd_data;
`ifdef FPGA_SYN_ALTERA
    reg	[35:0]	window[15:0]/* synthesis syn_ramstyle = block_ram*/; //  syn_ramstyle = no_rw_check */;
`else
    reg	[35:0]	window[15:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */;
`endif    
reg	[71:0]	onereg;

  // Alexey
  // use reset_l instead
  //initial onereg = 72'h0;
  always @(posedge clk) begin
    if (~reset_l)
        onereg <= 72'h0;
    else
        if (wr_en) onereg <= wrdata;
  end

  assign rd_data = onereg;

  reg [71:0] restore_data;
  wire [71:0] wrdata = restore ? restore_data : wr_data;

  wire wr_en = wren | restore;

//  always @(posedge clk) begin
//    if(wr_en) onereg <= wrdata;
//  end

  wire [2:0] addr = save ? save_addr : restore_addr;

  wire [3:0] addr1 = {1'b1, addr};
  wire [3:0] addr0 = {1'b0, addr};

  always @(negedge clk) begin
    if(save) window[addr1] <= wren ? wr_data[71:36] : rd_data[71:36];
    else restore_data[71:36] <= window[addr1];
  end

  always @(negedge clk) begin
    if(save) window[addr0] <= wren ? wr_data[35:0] : rd_data[35:0];
    else restore_data[35:0] <= window[addr0];
  end


endmodule


`else


module bw_r_irf_register(clk, reset_l, wren, save, save_addr, restore, restore_addr, wr_data, rd_data);
    input       clk;
    input       reset_l;
    input       wren;
    input       save;
    input   [2:0]   save_addr;
    input       restore;
    input   [2:0]   restore_addr;
    input   [71:0]  wr_data;
    output  [71:0]  rd_data;
`ifdef FPGA_SYN_ALTERA
    reg [71:0]  window[7:0]/* synthesis syn_ramstyle = block_ram*/; //  syn_ramstyle = no_rw_check */;
`else
reg [71:0]  window[7:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */;
`endif
reg [71:0]  onereg;

reg [2:0]   rd_addr;
reg [2:0]   wr_addr;
reg     save_d;
`ifdef FPGA_SYN_ALTERA
    integer k;

    initial
    begin
        for (k = 0; k < 8 ; k = k + 1)
        begin
            window[k] = 72'h0;  
        end
    end
`endif

  initial 
      begin
          // Alexey
          // reseted using reset_l
          // onereg = 72'b0;
          wr_addr = 3'h0;
          rd_addr = 3'h0;
      end
  
  always @(negedge clk) begin
    rd_addr = restore_addr;
  end

  always @(posedge clk) begin
    wr_addr <= save_addr;
  end
  always @(posedge clk) begin
    save_d <= save;
  end

  assign rd_data = onereg;

  wire [71:0] restore_data = window[rd_addr];
  wire [71:0] wrdata = restore ? restore_data : wr_data;

  wire wr_en = wren | (restore & (wr_addr != rd_addr));

  always @(posedge clk) begin
    if (~reset_l)
    begin
      onereg <= 72'h0;
    end
    else begin
      if(wr_en) onereg <= wrdata;
    end
  end
    
  always @(negedge clk) begin
    if(save_d) window[wr_addr] <= rd_data;
  end

endmodule

`endif

`else //FPGA_SYN_1THREAD


`ifndef CONFIG_NUM_THREADS

module bw_r_irf_register(clk, reset_l, wrens, save, save_addr, restore, restore_addr, wr_data0, wr_data1, rd_thread, rd_data);
    parameter NUM_WINDOW_ENTRIES = 16;
    parameter SHIFT_ADDR = 0;
	input		clk;
	input		reset_l;
	input	[1:0]	wrens;
	input		save;
	input	[3:0]	save_addr;
	input		restore;
	input	[3:0]	restore_addr;
	input	[71:0]	wr_data0;
	input	[71:0]	wr_data1;
	input		rd_thread;
	output	[71:0]	rd_data;
`ifdef FPGA_SYN_ALTERA
    reg	[71:0]	window[NUM_WINDOW_ENTRIES-1:0]/* synthesis syn_ramstyle = block_ram*/; //  syn_ramstyle = no_rw_check */;
`else
    reg	[71:0]	window[NUM_WINDOW_ENTRIES-1:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */;
`endif
reg	[71:0]	reg_th0, reg_th1;

reg	[3:0]	rd_addr;
reg	[3:0]	wr_addr;
reg		save_d;

// wentzlaff I disabled the initialization block. We are replacing the reset
// of reg_th0 and reg_th1 with a functional reset to zero done below
// initial begin
//  reg_th0 = 72'b0;
//  reg_th1 = 72'b0;
// end

bw_r_irf_72_2x1_mux mux2_1(
	.sel(rd_thread),
	.x0(reg_th0),
	.x1(reg_th1),
	.y(rd_data)
	);

  always @(negedge clk) begin
    rd_addr = restore_addr;
  end

  wire [71:0] restore_data = window[{(rd_addr[3:2]>>SHIFT_ADDR),rd_addr[1:0]}];

  always @(posedge clk) begin
    wr_addr <= save_addr;
  end
  always @(posedge clk) begin
    save_d <= save;
  end

  wire [71:0] save_data;

  bw_r_irf_72_2x1_mux mux2_2(
        .sel(wr_addr[3]),
        .x0(reg_th0),
        .x1(reg_th1),
        .y(save_data)
        );

  always @(negedge clk) begin
    if(save_d) window[{(wr_addr[3:2]>>SHIFT_ADDR),wr_addr[1:0]}] <= save_data;
  end

//Register implementation for 2 threads / 2 write & 1 restore port

  wire [1:0] restores = (1'b1 << rd_addr[3]) & {2{restore}};
  //wire [1:0] wren1s = (1'b1 << wr1_th) & {2{wren1}};
  //wire [1:0] wren2s = (1'b1 << wr2_th) & {2{wren2}};

  wire [71:0] wrdata0, wrdata1;

  bw_r_irf_72_2x1_mux mux2_5(
        .sel(restores[0]),
        .x0(wr_data0),
        .x1(restore_data),
        .y(wrdata0)
        );

  bw_r_irf_72_2x1_mux mux2_6(
        .sel(restores[1]),
        .x0(wr_data1),
        .x1(restore_data),
        .y(wrdata1)
        );

  //wire [1:0] wr_en = wren1s | wren2s | (restores & {2{(wr_addr[3:0] != rd_addr[3:0])}});
  wire [1:0] wr_en = wrens | (restores & {2{(wr_addr[3:0] != rd_addr[3:0])}});

  //144 Flops
  always @(posedge clk) begin
    if(!reset_l)
    begin
      reg_th0 <= 72'd0;
      reg_th1 <= 72'd0;
    end
    else
    begin
      if(wr_en[0]) reg_th0 <= wrdata0;
      if(wr_en[1]) reg_th1 <= wrdata1;
    end
  end
    
endmodule

`else

module bw_r_irf_register(clk, reset_l, wrens, save, save_addr, restore, restore_addr, wr_data0, wr_data1, wr_data2, wr_data3, rd_thread, rd_data);
	input		clk;
	input		reset_l;
	input	[3:0]	wrens;
	input		save;
	input	[4:0]	save_addr;
	input		restore;
	input	[4:0]	restore_addr;
	input	[71:0]	wr_data0;
	input	[71:0]	wr_data1;
	input	[71:0]	wr_data2;
	input	[71:0]	wr_data3;
	input	[1:0]	rd_thread;
	output	[71:0]	rd_data;
`ifdef FPGA_SYN_ALTERA
    reg	[71:0]	window[31:0]/* synthesis syn_ramstyle = block_ram*/; //  syn_ramstyle = no_rw_check */;
`else
    reg	[71:0]	window[31:0]/* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */;
`endif
reg	[71:0]	reg_th0, reg_th1, reg_th2, reg_th3;

reg	[4:0]	rd_addr;
reg	[4:0]	wr_addr;
reg		save_d;

//initial begin
//  reg_th0 = 72'b0;
//  reg_th1 = 72'b0;
//  reg_th2 = 72'b0;
//  reg_th3 = 72'b0;
//end

bw_r_irf_72_4x1_mux mux4_1(
	.sel(rd_thread),
	.x0(reg_th0),
	.x1(reg_th1),
	.x2(reg_th2),
	.x3(reg_th3),
	.y(rd_data)
	);

  always @(negedge clk) begin
    rd_addr = restore_addr;
  end

  wire [71:0] restore_data = window[rd_addr];

  always @(posedge clk) begin
    wr_addr <= save_addr;
  end
  always @(posedge clk) begin
    save_d <= save;
  end

  wire [71:0] save_data;

  bw_r_irf_72_4x1_mux mux4_2(
        .sel(wr_addr[4:3]),
        .x0(reg_th0),
        .x1(reg_th1),
        .x2(reg_th2),
        .x3(reg_th3),
        .y(save_data)
        );

  always @(negedge clk) begin
    if(save_d) window[wr_addr] <= save_data;
  end

//Register implementation for 4 threads / 2 write & 1 restore port

  wire [3:0] restores = (1'b1 << rd_addr[4:3]) & {4{restore}};
  //wire [3:0] wren1s = (1'b1 << wr1_th) & {4{wren1}};
  //wire [3:0] wren2s = (1'b1 << wr2_th) & {4{wren2}};

  wire [71:0] wrdata0, wrdata1, wrdata2, wrdata3;

  bw_r_irf_72_2x1_mux mux2_5(
        .sel(restores[0]),
        .x0(wr_data0),
        .x1(restore_data),
        .y(wrdata0)
        );

  bw_r_irf_72_2x1_mux mux2_6(
        .sel(restores[1]),
        .x0(wr_data1),
        .x1(restore_data),
        .y(wrdata1)
        );

  bw_r_irf_72_2x1_mux mux2_7(
        .sel(restores[2]),
        .x0(wr_data2),
        .x1(restore_data),
        .y(wrdata2)
        );

  bw_r_irf_72_2x1_mux mux2_8(
        .sel(restores[3]),
        .x0(wr_data3),
        .x1(restore_data),
        .y(wrdata3)
        );

  //wire [3:0] wr_en = wren1s | wren2s | (restores & {4{(wr_addr[4:0] != rd_addr[4:0])}});
  wire [3:0] wr_en = wrens | (restores & {4{(wr_addr[4:0] != rd_addr[4:0])}});

  //288 Flops
  always @(posedge clk) begin
    if (~reset_l)
    begin
      reg_th0 <= 72'd0;
      reg_th1 <= 72'd0;
      reg_th2 <= 72'd0;
      reg_th3 <= 72'd0;
    end
    else
    begin
      if(wr_en[0]) reg_th0 <= wrdata0;
      if(wr_en[1]) reg_th1 <= wrdata1;
      if(wr_en[2]) reg_th2 <= wrdata2;
      if(wr_en[3]) reg_th3 <= wrdata3;
    end
  end
    
endmodule

module bw_r_irf_72_4x1_mux(sel, y, x0, x1, x2, x3);
  input [1:0] sel;
  input [71:0]  x0;
  input [71:0]  x1;
  input [71:0]  x2;
  input [71:0]  x3;
  output  [71:0] y;
  reg [71:0] y;

  always @(sel or x0 or x1 or x2 or x3)
    case(sel)
      2'b00: y = x0;
      2'b01: y = x1;
      2'b10: y = x2;
      2'b11: y = x3;
    endcase

endmodule
  
`endif


module bw_r_irf_72_2x1_mux(sel, y, x0, x1);
	input		sel;
	input	[71:0]	x0;
	input	[71:0]	x1;
	output	[71:0] y;
	reg	[71:0] y;

	always @(sel or x0 or x1)
		case(sel)
		  1'b0: y = x0;
		  1'b1: y = x1;
		endcase

endmodule
	
`endif

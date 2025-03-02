// Copyright 2022 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Author: Alexander Kropotov, BSC-CNS
// Date: 22.02.2022
// Description: 
//  Xilinx True Dual Port RAM, Write First with Single Clock (taken from Xilinx Vivado synthesis templates)
//  This code implements a parameterizable true dual port memory (both ports can read and write).
//  This implements write-first mode where the data being written to the RAM also resides on
//  the output port.  If the output data is not needed during writes or the last read value is
//  desired to be retained, it is suggested to use no change as it is more power efficient.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

module bram_tdp_1ck_wrfirst #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entries)
  parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [clogb2(RAM_DEPTH-1)-1:0] addra,  // Port A address bus, width determined from RAM_DEPTH
  input [clogb2(RAM_DEPTH-1)-1:0] addrb,  // Port B address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,           // Port A RAM input data
  input [RAM_WIDTH-1:0] dinb,           // Port B RAM input data
  input clka,                           // Clock
  input wea,                            // Port A write enable
  input web,                            // Port B write enable
  input ena,                            // Port A RAM Enable, for additional power savings, disable port when not in use
  input enb,                            // Port B RAM Enable, for additional power savings, disable port when not in use
  input rsta,                           // Port A output reset (does not affect memory contents)
  input rstb,                           // Port B output reset (does not affect memory contents)
  input regcea,                         // Port A output register enable
  input regceb,                         // Port B output register enable
  output [RAM_WIDTH-1:0] douta,         // Port A RAM output data
  output [RAM_WIDTH-1:0] doutb          // Port B RAM output data
);

  reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data_a = {RAM_WIDTH{1'b0}};
  reg [RAM_WIDTH-1:0] ram_data_b = {RAM_WIDTH{1'b0}};

  // actual read pipeline for inter-port write-first policy
  reg [clogb2(RAM_DEPTH-1)-1:0] addra_rd;
  reg [clogb2(RAM_DEPTH-1)-1:0] addrb_rd;

  // The following code either initializes the memory values to a specified file or to all zeros to match Xilinx hardware
  generate
    if (INIT_FILE == "xilinx_default_zeroes") // Explicit initialization with zeroes (power-up zero filling is not applicable for ASIC)
    begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
    else if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
    end
  endgenerate

  always @(posedge clka)
    if (ena)
    begin
      addra_rd <= addra;
      if (wea) begin
        BRAM[addra] <= dina;
        ram_data_a <= dina;
      end else
        ram_data_a <= BRAM[addra];
    end
  // always @(*) ram_data_a = BRAM[addra_rd];

  always @(posedge clka)
    if (enb)
    begin
      addrb_rd <= addrb;
      if (web) begin
        BRAM[addrb] <= dinb;
        ram_data_b <= dinb;
      end else
        ram_data_b <= BRAM[addrb];
    end
  // always @(*) ram_data_b = BRAM[addrb_rd];

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign douta = ram_data_a;
       assign doutb = ram_data_b;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] douta_reg = {RAM_WIDTH{1'b0}};
      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clka)
        if (rsta)
          douta_reg <= {RAM_WIDTH{1'b0}};
        else if (regcea)
          douta_reg <= ram_data_a;

      always @(posedge clka)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data_b;

      assign douta = douta_reg;
      assign doutb = doutb_reg;

    end
  endgenerate

  //  The following function calculates the address width based on specified RAM depth
  function integer clogb2;
    input integer depth;
      for (clogb2=0; depth>0; clogb2=clogb2+1)
        depth = depth >> 1;
  endfunction

endmodule

// The following is an instantiation template for bram_tdp_1ck_wrfirst
/*
  //  Xilinx True Dual Port RAM, Write First with Single Clock
  bram_tdp_1ck_wrfirst #(
    .RAM_WIDTH(18),                       // Specify RAM data width
    .RAM_DEPTH(1024),                     // Specify RAM depth (number of entries)
    .RAM_PERFORMANCE("HIGH_PERFORMANCE"), // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE("")                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) your_instance_name (
    .addra(addra),   // Port A address bus, width determined from RAM_DEPTH
    .addrb(addrb),   // Port B address bus, width determined from RAM_DEPTH
    .dina(dina),     // Port A RAM input data, width determined from RAM_WIDTH
    .dinb(dinb),     // Port B RAM input data, width determined from RAM_WIDTH
    .clka(clka),     // Clock
    .wea(wea),       // Port A write enable
    .web(web),       // Port B write enable
    .ena(ena),       // Port A RAM Enable, for additional power savings, disable port when not in use
    .enb(enb),       // Port B RAM Enable, for additional power savings, disable port when not in use
    .rsta(rsta),     // Port A output reset (does not affect memory contents)
    .rstb(rstb),     // Port B output reset (does not affect memory contents)
    .regcea(regcea), // Port A output register enable
    .regceb(regceb), // Port B output register enable
    .douta(douta),   // Port A RAM output data, width determined from RAM_WIDTH
    .doutb(doutb)    // Port B RAM output data, width determined from RAM_WIDTH
  );
*/

// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010 Cadence Design Systems, Inc.
//    All Rights Reserved Worldwide
// 
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
// 

`timescale 1ns/1ns

module slave(apb_if    apb,
             input bit rst);

reg [31:0] pr_data;
assign apb.prdata = (apb.psel && apb.penable && !apb.pwrite) ? pr_data : 'z;

typedef struct {
   reg [63:0] SRC;
   reg [63:0] DST;
} socket_t;

reg [ 7:0] INDEX;
socket_t   SESSION[256];
reg [63:0] DST[256];
reg [31:0] TABLES[256];
reg [31:0] DMA[1024];

always @ (posedge apb.pclk)
  begin
   if (rst) begin
      INDEX <= 'h00;
      foreach (TABLES[i]) begin
         TABLES[i] <= 32'h0000_0000;
      end
      pr_data <= 32'h0;
   end
   else begin

      // Wait for a SETUP+READ or ENABLE+WRITE cycle
      if (apb.psel == 1'b1 && apb.penable == apb.pwrite) begin
         pr_data <= 32'h0;
         if (apb.pwrite) begin
            casex (apb.paddr)
              16'h0020: INDEX <= apb.pwdata;
              16'h0024: begin
                 TABLES[INDEX] <= apb.pwdata;
              end
              16'h1XX0: SESSION[apb.paddr[11:2]].SRC[63:32] <= apb.pwdata;
              16'h1XX4: SESSION[apb.paddr[11:2]].SRC[32: 0] <= apb.pwdata;
              16'h1XX8: SESSION[apb.paddr[11:2]].DST[63:32] <= apb.pwdata;
              16'h1XXC: SESSION[apb.paddr[11:2]].DST[32: 0] <= apb.pwdata;
              16'h2XXX: DMA[apb.paddr[11:2]] <= apb.pwdata;
            endcase
         end
         else begin
            casex (apb.paddr)
              16'h0000: pr_data <= {4'h0, 10'h176, 8'h5A, 8'h03};
              16'h0020: pr_data <= {24'h0000, INDEX};
              16'h0024: pr_data <= TABLES[INDEX];
              16'h1XX0: pr_data <= SESSION[apb.paddr[11:2]].SRC[63:32];
              16'h1XX4: pr_data <= SESSION[apb.paddr[11:2]].SRC[32: 0];
              16'h1XX8: pr_data <= SESSION[apb.paddr[11:2]].DST[63:32];
              16'h1XXC: pr_data <= SESSION[apb.paddr[11:2]].DST[32: 0];
              16'h2XXX: pr_data <= DMA[apb.paddr[11:2]];
            endcase
         end
      end
   end
end

endmodule


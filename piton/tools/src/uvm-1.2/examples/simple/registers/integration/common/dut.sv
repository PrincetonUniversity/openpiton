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

module slave(apb_if apb,
             input bit rst);

reg [31:0] pr_data;
assign apb.prdata = (apb.psel && apb.penable && !apb.pwrite) ? pr_data : 'z;

reg [31:0] DATA;
reg [63:0] SOCKET[256];
reg [31:0] DMA[1024];

always @ (posedge apb.pclk)
  begin
   if (rst) begin
      DATA <= 'h00;
      foreach (SOCKET[i]) begin
         SOCKET[i] <= 64'h0000_0000;
      end
      pr_data <= 32'h0;
   end
   else begin

      // Wait for a SETUP+READ or ENABLE+WRITE cycle
      if (apb.psel == 1'b1 && apb.penable == apb.pwrite) begin
         pr_data <= 32'h0;
         if (apb.pwrite) begin
            casex (apb.paddr)
              16'h0024: DATA <= apb.pwdata;
              16'h1XX0: SOCKET[apb.paddr[11:4]][63:32] <= apb.pwdata; 
              16'h1XX4: SOCKET[apb.paddr[11:4]][31: 0] <= apb.pwdata;
              16'h2XXX: DMA[apb.paddr[11:2]] <= apb.pwdata;
            endcase
         end
         else begin
            casex (apb.paddr)
              16'h0000: pr_data <= {4'h0, 10'h176, 8'h5A, 8'h03};
              16'h0024: pr_data <= DATA;
              16'h1XX0: pr_data <= SOCKET[apb.paddr[11:4]][63:32];
              16'h1XX4: pr_data <= SOCKET[apb.paddr[11:4]][31: 0];
              16'h2XXX: pr_data <= DMA[apb.paddr[11:2]];
            endcase
         end
      end
   end
end

endmodule


// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
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


module blk(apb_if apb, input bit rst);

reg [2:0]  mode;
reg [7:0]  rate;

reg [31:0] pr_data;

assign apb.prdata = (apb.psel && apb.penable) ? pr_data : 'z;

always @ (posedge apb.pclk)
  begin
   if (rst) begin
      mode <= 0;
      rate <= 0;
   end
   else begin
      // Wait for a SETUP+READ or ENABLE+WRITE cycle
      if (apb.psel == 1'b1 && apb.penable == apb.pwrite) begin
         pr_data = 32'h0;
         case (apb.paddr[7:0])
          8'h00: if (apb.pwrite) mode <= apb.pwdata;
                 else            pr_data = mode;
          8'h04: if (apb.pwrite) rate <= apb.pwdata;
                 else            pr_data = rate;
         endcase
      end
   end
end

endmodule



module soc(apb_if apb, input bit rst);

apb_if apb0(apb.pclk);
apb_if apb1(apb.pclk);
apb_if apb2(apb.pclk);

blk blk0(apb0, rst);
blk blk1(apb1, rst);
blk blk2(apb2, rst);

assign apb0.paddr   = apb.paddr;
assign apb0.psel    = apb.paddr[31:8] == 24'h000000 ||
                      apb.paddr[31:8] == 24'h030000;
assign apb0.penable = apb.penable;
assign apb0.pwrite  = apb.pwrite;
assign apb0.pwdata  = apb.pwdata;
assign apb.prdata   = apb0.prdata;

assign apb1.paddr   = apb.paddr;
assign apb1.psel    = apb.paddr[31:8] == 24'h010000 ||
                      apb.paddr[31:8] == 24'h030000;
assign apb1.penable = apb.penable;
assign apb1.pwrite  = apb.pwrite;
assign apb1.pwdata  = apb.pwdata;
assign apb.prdata   = apb1.prdata;

assign apb2.paddr   = apb.paddr;
assign apb2.psel    = apb.paddr[31:8] == 24'h020000 ||
                      apb.paddr[31:8] == 24'h030000;
assign apb2.penable = apb.penable;
assign apb2.pwrite  = apb.pwrite;
assign apb2.pwdata  = apb.pwdata;
assign apb.prdata   = apb2.prdata;

endmodule




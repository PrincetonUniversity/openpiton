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

module blk_dut #(int BASE_ADDR='h0) (apb_if    apb,
                                     input bit rst);

reg [7:0] R;

reg [31:0] pr_data;

wire in_range;

wire [31:0] pr_addr;

assign in_range = (apb.paddr - BASE_ADDR) < 'h100;
assign pr_addr = apb.paddr - BASE_ADDR;

assign apb.prdata = (apb.psel && apb.penable && !apb.pwrite && in_range) ? pr_data : 'z;


always @ (posedge apb.pclk)
  begin
   if (rst) begin
      R <= 'h00;
      pr_data <= 32'h0;
   end
   else begin

      // Wait for a SETUP+READ or ENABLE+WRITE cycle
      if (apb.psel == 1'b1 && apb.penable == apb.pwrite) begin
         pr_data <= 32'h0;
         if (apb.pwrite) begin
            casex (pr_addr)
              32'h00000000:
                 R <= apb.pwdata[7:0];
              32'h00000001:
                 casez (apb.pwdata[1:0]) 
                   2'b01: R++;
                   2'b10: R--;
                   2'b11: R <= 0;
                 endcase
            endcase
         end
         else begin
            casex (pr_addr)
              32'h00000000: pr_data <= {24'h0, R}; 
              default: pr_data <= 32'h0;
            endcase
            #1;
         end
         #0;
      end
   end
end

endmodule



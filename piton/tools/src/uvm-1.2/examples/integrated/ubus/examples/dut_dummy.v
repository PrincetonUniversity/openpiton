//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

//This is dummy DUT. 

module dut_dummy( 
  input wire ubus_req_master_0,
  output reg ubus_gnt_master_0,
  input wire ubus_req_master_1,
  output reg ubus_gnt_master_1,
  input wire ubus_clock,
  input wire ubus_reset,
  input wire [15:0] ubus_addr,
  input wire [1:0] ubus_size,
  output reg ubus_read,
  output reg ubus_write,
  output reg  ubus_start,
  input wire ubus_bip,
  inout wire [7:0] ubus_data,
  input wire ubus_wait,
  input wire ubus_error);
  bit[2:0]   st;

  // Basic arbiter, supports two masters, 0 has priority over 1

   always @(posedge ubus_clock or posedge ubus_reset) begin
     if(ubus_reset) begin
       ubus_start <= 1'b0;
       st<=3'h0;
     end
       else
         case(st)
         0: begin //Begin out of Reset
             ubus_start <= 1'b1;
             st<=3'h3;
         end
         3: begin //Start state
             ubus_start <= 1'b0;
             if((ubus_gnt_master_0==0) && (ubus_gnt_master_1==0)) begin
                 st<=3'h4;
             end
             else
                 st<=3'h1;
         end
         4: begin // No-op state
             ubus_start <= 1'b1;
             st<=3'h3;
         end
         1: begin // Addr state
             st<=3'h2;
             ubus_start <= 1'b0;
         end
         2: begin // Data state
             if((ubus_error==1) || ((ubus_bip==0) && (ubus_wait==0))) begin
                 st<=3'h3;
                 ubus_start <= 1'b1;
             end
             else begin
                 st<=3'h2;
                 ubus_start <= 1'b0;
             end
         end
         endcase
     end

   always @(negedge ubus_clock or posedge ubus_reset) begin
     if(ubus_reset == 1'b1) begin
       ubus_gnt_master_0 <= 0;
       ubus_gnt_master_1 <= 0;
     end
     else begin
       if(ubus_start && ubus_req_master_0) begin
         ubus_gnt_master_0 <= 1;
         ubus_gnt_master_1 <= 0;
       end
       else if(ubus_start && !ubus_req_master_0 && ubus_req_master_1) begin
         ubus_gnt_master_0 <= 0;
         ubus_gnt_master_1 <= 1;
       end
       else begin
         ubus_gnt_master_0 <= 0;
         ubus_gnt_master_1 <= 0;
       end
     end
   end

   always @(posedge ubus_clock or posedge ubus_reset) begin
     if(ubus_reset) begin
       ubus_read <= 1'bZ;
       ubus_write <= 1'bZ;
     end
     else if(ubus_start && !ubus_gnt_master_0 && !ubus_gnt_master_1) begin
       ubus_read <= 1'b0;
       ubus_write <= 1'b0;
     end
     else begin
       ubus_read <= 1'bZ;
       ubus_write <= 1'bZ;
     end
   end

endmodule


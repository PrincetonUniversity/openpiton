// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010-2011 Mentor Graphics Corporation
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


`include "reg_agent.sv"

class dut;
   static bit [7:0] F1 = 0;
   static bit [7:0] F2 = 0;

   static task rw(reg_rw rw);
      case (rw.addr)
       'h000: // Ra
          if (rw.read) rw.data = {8'h00, F2, 8'h00, F1};
          else if (rw.byte_en[0]) F1 = rw.data[7:0];
       'h100: // Rb
          if (rw.read) rw.data = {8'h00, F2, 8'h00, F1};
          else begin
             if (rw.byte_en[0]) F1 = rw.data[7:0];
             if (rw.byte_en[2]) F2 = rw.data[23:16];
          end
      endcase
      // $write("%s\n", rw.convert2string());
   endtask
endclass


class tb_env extends uvm_env;

   `uvm_component_utils(tb_env)

   block_B   regmodel;
   reg_agent#(dut) bus;
   uvm_reg_predictor#(reg_rw) predict;

   function new(string name = "tb_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      regmodel = block_B::type_id::create("regmodel");
      regmodel.build();
      regmodel.lock_model();

      bus = reg_agent#(dut)::type_id::create("bus", this);
      predict = uvm_reg_predictor#(reg_rw)::type_id::create("predict", this);
  endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      reg2rw_adapter reg2rw  = new("reg2rw");
      regmodel.default_map.set_sequencer(bus.sqr, reg2rw);

      predict.map = regmodel.default_map;
      predict.adapter = reg2rw;
      bus.mon.ap.connect(predict.bus_in);
      regmodel.default_map.set_auto_predict(0);
   endfunction

endclass

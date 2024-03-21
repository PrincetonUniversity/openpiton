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
   static bit [7:0] F2 = 'hA5;

   static task rw(reg_rw rw);
      case (rw.addr)
       'h000: // Ra
          if (rw.read) rw.data = {8'h00, F2, 8'h00, F1};
          else if (rw.byte_en[0]) F1 = rw.data[7:0];
`ifdef NOT_YET_IMPLEMENTED
       'h04: // Rb
          if (rw.read) begin
             rw.data = {8'h00, F2, 8'h00, F1};
             if (rw.byte_en[0]) F1 = 0;
             if (rw.byte_en[2]) F2 = -1;
          end
          else begin
             if (rw.byte_en[0]) F1 = -1;
             if (rw.byte_en[2]) F2 = 0;
          end
`endif
      endcase
      // $write("%s\n", rw.convert2string());
   endtask
endclass



typedef class reg_R2_fd;

class tb_env extends uvm_env;

   `uvm_component_utils(tb_env)

   block_B         regmodel;
   reg_agent#(dut) bus;

   function new(string name = "tb_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      regmodel = block_B::type_id::create("regmodel",,get_full_name());
      regmodel.build();
      regmodel.lock_model();

      bus = reg_agent#(dut)::type_id::create("bus", this);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      reg2rw_adapter reg2rw  = new("reg2rw");
      regmodel.default_map.set_sequencer(bus.sqr, reg2rw);
      regmodel.default_map.set_auto_predict();

      // Use a user-defined front-door for unimplemented registers
      begin
         reg_R2_fd fd = new;
         regmodel.R2.set_frontdoor(fd);
      end
   endfunction

endclass


class reg_R2_fd extends uvm_reg_frontdoor;
   virtual task body();
      uvm_reg R;

      $cast(R, rw_info.element);
      if (rw_info.kind == UVM_READ) rw_info.value[0] = R.get();
      
      R.do_predict(rw_info,
              (rw_info.kind == UVM_READ)? UVM_PREDICT_READ : UVM_PREDICT_WRITE);
   endtask

   // Function: new
   function new(string name = "reg_R2_fd");
      super.new(name);
   endfunction

endclass


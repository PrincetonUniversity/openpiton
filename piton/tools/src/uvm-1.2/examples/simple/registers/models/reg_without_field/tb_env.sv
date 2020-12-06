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


typedef class reg_R_fd;

class tb_env extends uvm_env;

   `uvm_component_utils(tb_env)

   block_B  regmodel;

   function new(string name = "tb_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      regmodel = block_B::type_id::create("regmodel");
      regmodel.build();
      regmodel.lock_model();
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      // Use a user-defined front-door in lieu of a bus-agent
      reg_R_fd fd = new;
      regmodel.R.set_frontdoor(fd);
      regmodel.default_map.set_auto_predict(1);
   endfunction

endclass


class reg_R_fd extends uvm_reg_frontdoor;
   bit [7:0] R = 0;

   virtual task body();
      if (rw_info.kind == UVM_WRITE) R = rw_info.value[0];
      else rw_info.value[0] = R;
   endtask

   // Function: new
   function new(string name = "reg_R_fd");
      super.new(name);
   endfunction

endclass


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


import apb_pkg::*;

class sys_env extends uvm_env;

   `uvm_component_utils(sys_env)

   blk_env blk0;
   blk_env blk1;
   
   reg_sys_S model;
   apb_agent apb;

   function new(string name = "sys_env", uvm_component parent = null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      blk0 = blk_env::type_id::create("blk0", this);
      blk1 = blk_env::type_id::create("blk1", this);

      if (model == null) begin
         model = reg_sys_S::type_id::create("reg_sys_S",,get_full_name());
         model.build();
         model.lock_model();
      end

      blk0.model = model.B[0];
      blk1.model = model.B[1];
      
      apb = apb_agent::type_id::create("apb",this);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      if (model.get_parent() == null) begin
         reg2apb_adapter reg2apb = new;
         model.default_map.set_sequencer(apb.sqr,reg2apb);
         model.default_map.set_auto_predict();
      end
   endfunction

endclass: sys_env


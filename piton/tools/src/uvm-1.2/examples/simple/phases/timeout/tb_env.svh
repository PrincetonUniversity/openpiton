// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
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


class tb_env extends uvm_env;
   `uvm_component_utils(tb_env)

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      uvm_config_db#(time)::set(null, "global_timer.*",    "timeout", 1000);
      uvm_config_db#(time)::set(null, "global_timer.main", "timeout", 3000);
      uvm_config_db#(time)::set(null, "global_timer.run",  "timeout", 0);
   endfunction

   
   task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      #20;
      phase.drop_objection(this);
   endtask
   
   task configure_phase(uvm_phase phase);
      phase.raise_objection(this);
      #200;
      phase.drop_objection(this);
   endtask
   
   task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      #1000;
      phase.drop_objection(this);
   endtask

   task shutdown_phase(uvm_phase phase);
      phase.raise_objection(this);
      #10;
      phase.drop_objection(this);
   endtask
endclass

// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
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

class hw_reset_test extends test;

   `uvm_component_utils(hw_reset_test)

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction

   local bit once = 1;
   task main_phase(uvm_phase phase);
      if (once) begin
         once = 0;
         phase.raise_objection(this);
         repeat (100 * 8) @(posedge env.vif.sclk);
         // This will clear the objection
         `uvm_info("TEST", "Jumping back to reset phase", UVM_NONE);
         phase.jump(uvm_reset_phase::get());
      end
   endtask
   
endclass

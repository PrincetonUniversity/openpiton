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


program test;

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "tb_timer.svh"
`include "tb_env.svh"

tb_env env;


class test extends uvm_test;
   `uvm_component_utils(test)

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction

   task pre_main_phase(uvm_phase phase);
      phase.raise_objection(this);
      #100;
      phase.drop_objection(this);
   endtask
   
   task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      // Will cause a time-out
      // because we forgot to drop the objection
   endtask
   
   task shutdown_phase(uvm_phase phase);
      phase.raise_objection(this);
      #100;
      phase.drop_objection(this);
   endtask
endclass


initial
begin
   env = new("env");
   run_test("test");
end

endprogram

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

`include "uvm_macros.svh"
`include "tb_top.sv"
`include "apb.sv"

program test;

import uvm_pkg::*;
import apb_pkg::*;

`include "tb_env.sv"
tb_env env = new("env");


class test_base extends uvm_test;
   tb_env env;

   `uvm_component_utils(test_base)
   
   function new(string name = "test_base", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void end_of_elaboration_phase(uvm_phase phase);
      $cast(env, $root.test.env);
      env.regmodel.set_hdl_path_root("$root.tb_top.dut");
   endfunction

   task reset_phase(uvm_phase phase);
      env.regmodel.reset();
   endtask
endclass


class test extends test_base;
   `uvm_component_utils(test)

   function new(string name = "test_base", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   task main_phase(uvm_phase phase);
      uvm_status_e status;
      uvm_reg_data_t data;

      phase.raise_objection(this);

      `uvm_info("TEST", "Checking initial values in blocks...", UVM_NONE)
      foreach (env.regmodel.blk[i]) begin
         env.regmodel.blk[i].mirror(status, UVM_CHECK);
      end

      `uvm_info("TEST", "Checking broadcast-write via front-door...", UVM_NONE)
      env.regmodel.all_blks.mode.write(status, 32'hFFFFFFFF);
      env.regmodel.all_blks.mode.write(status, 32'hFFFFFF55);
      foreach (env.regmodel.blk[i]) begin
         env.regmodel.blk[i].mirror(status, UVM_CHECK);
      end
      
      `uvm_info("TEST", "Checking broadcast-write via back-door...", UVM_NONE)
      env.regmodel.all_blks.mode.write(status, 32'h00000002, UVM_BACKDOOR);
      env.regmodel.all_blks.mode.write(status, 32'h000000AA, UVM_BACKDOOR);
      foreach (env.regmodel.blk[i]) begin
         env.regmodel.blk[i].mirror(status, UVM_CHECK);
      end
      
      phase.drop_objection(this);
   endtask
endclass

initial begin
   uvm_config_db#(apb_vif)::set(env, "apb", "vif", $root.tb_top.apb);

   run_test("test");
end

endprogram

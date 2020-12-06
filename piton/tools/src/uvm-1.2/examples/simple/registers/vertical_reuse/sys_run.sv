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

`include "uvm_pkg.sv"
`include "apb.sv"
`include "blk_reg_pkg.sv"
`include "sys_reg_pkg.sv"
`include "blk_pkg.sv"
`include "sys_pkg.sv"
`include "sys_top.sv"

program tb;

import uvm_pkg::*;
import sys_reg_pkg::*;
import sys_pkg::*;

`include "sys_testlib.sv"

class dut_reset_seq extends uvm_sequence;

   function new(string name = "dut_reset_seq");
      super.new(name);
   endfunction

   `uvm_object_utils(dut_reset_seq)
   
   virtual task body();
      sys_top.rst = 1;
      repeat (5) @(negedge sys_top.clk);
      sys_top.rst = 0;
   endtask
endclass


initial
begin
   static sys_env env = new("env");

   uvm_config_db#(apb_vif)::set(env, "apb", "vif", $root.sys_top.apb0);

   run_test();
end

endprogram

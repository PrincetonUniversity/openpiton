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

`include "apb.sv"
`include "vip.sv"

import apb_pkg::*;
import vip_pkg::*;

program test;

`include "sym_sb.svh"
`include "apb2txrx.svh"
`include "tb_env.svh"

class test extends uvm_test;
   tb_env env;

   `uvm_component_utils(test)

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void start_of_simulation_phase(uvm_phase phase); uvm_coreservice_t cs_ = uvm_coreservice_t::get();

      uvm_root top = cs_.get_root();
      $cast(env, top.find("env"));
   endfunction

endclass

`include "testlib.svh"


tb_env env;

initial
begin
   env = new("env");

   uvm_config_db#(tb_ctl_vif)::set(null, "env", "vif", tb_top.ctl);
   uvm_config_db#(apb_vif)::set(null, "env.apb", "vif", tb_top.apb0);
   uvm_config_db#(vip_vif)::set(null, "env.vip", "vif", tb_top.vip0);

   run_test();
end

endprogram

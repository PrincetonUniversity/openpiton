// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
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
//    permissions and limitations under t,he License.
// -------------------------------------------------------------
// 

`include "uvm_pkg.sv"

program tb;

import uvm_pkg::*;

`include "regmodel.sv"
`include "tb_env.sv"


class tb_test extends uvm_test;

   function new(string name = "tb_test", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual task run_phase(uvm_phase phase);
      tb_env env;
      uvm_status_e   status;
      uvm_reg_data_t data;

      phase.raise_objection(this);
      
      if (!$cast(env, uvm_top.find("env")) || env == null) begin
         `uvm_fatal("test", "Cannot find tb_env");
      end

      env.regmodel.reset();

      begin
         uvm_sequence_base seq = new;
            
         `uvm_info("Test", "Demonstrating RO/WO sharing...", UVM_NONE);
         env.regmodel.R.read(status, data, .parent(seq));
         env.regmodel.W.write(status, 32'hDEADBEEF, .parent(seq));
      end

      phase.drop_objection(this);
   endtask
endclass


initial begin automatic uvm_coreservice_t cs_ = uvm_coreservice_t::get();

   tb_env env;
   tb_test test;
   uvm_report_server svr;
   
   env = new("env");
   test = new("test");

   svr = cs_.get_report_server();
   svr.set_max_quit_count(10);
   
   run_test();
end

endprogram

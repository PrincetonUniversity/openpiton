//
//----------------------------------------------------------------------
//   Copyright 2010-2011 Synopsys, Inc.
//   Copyright 2010 Mentor Graphics Corporation
//   Copyright 2010-2011 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

import apb_pkg::*;

typedef class dut_reset_seq;
class blk_R_test extends uvm_test;

   `uvm_component_utils(blk_R_test)

   blk_env env;

   function new(string name="blk_R_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      if (env == null)
         $cast(env, uvm_top.find("env"));
   endfunction

   task run_phase(uvm_phase phase);
      uvm_sequence_base reset_seq;
      blk_R_test_seq seq;

      phase.raise_objection(this);

      begin
         dut_reset_seq rst_seq;
         rst_seq = dut_reset_seq::type_id::create("rst_seq", this);
         rst_seq.start(null);
      end
      env.model.reset();

      seq = blk_R_test_seq::type_id::create("blk_R_test_seq",this);
      seq.model = env.model;
      seq.start(null);

      phase.drop_objection(this);
   endtask
   
endclass



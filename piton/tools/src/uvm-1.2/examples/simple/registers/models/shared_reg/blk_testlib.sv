//----------------------------------------------------------------------
//   Copyright 2010-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
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


class blk_test extends uvm_test;

   `uvm_component_utils(blk_test)

   blk_env env;

   function new(string name = "blk_test", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
     env = blk_env::type_id::create("blk_env",this);
   endfunction

   task run_phase(uvm_phase phase);
      blk_AXW_test_seq seq = blk_AXW_test_seq::type_id::create("blk_AXW_test_seq",this);
      seq.model = env.model;

      phase.raise_objection(this);
      
      seq.start(null);
      seq.wait_for_sequence_state(UVM_FINISHED);

      phase.drop_objection(this);
   endtask
   
endclass



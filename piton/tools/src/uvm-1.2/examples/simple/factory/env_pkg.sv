//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010-2011 Synopsys, Inc.
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
package env_pkg;
  import uvm_pkg::*;
  import packet_pkg::*;
  import gen_pkg::*;

  `include "uvm_macros.svh"
  
  class env extends uvm_env;
    gen gen1;

    //Use the macro in a class to implement factory registration along with other
    //utilities (create, get_type_name). For only factory registration, use the
    // macro `uvm_component_registry(env,"env").
    `uvm_component_utils(env)
    
    function new (string name, uvm_component parent);
      uvm_component cmp;
      super.new(name, parent);
     
      //use the factory to create the generator
      gen1 = gen::type_id::create("gen1", this);

    endfunction

    task run_phase(uvm_phase phase);
      packet p;
      phase.raise_objection(this);
      uvm_default_tree_printer.knobs.separator = "";
      repeat(5) begin
        #15 p = gen1.get_packet();
        `uvm_info("PKTGEN", $sformatf("Got packet: %s", p.sprint(uvm_default_tree_printer)), UVM_NONE)
      end
      #15;
      phase.drop_objection(this);
    endtask
  endclass
endpackage

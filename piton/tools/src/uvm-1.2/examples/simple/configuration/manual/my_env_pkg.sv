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

package my_env_pkg;
  import uvm_pkg::*;

  `include "classA.svh"
  `include "classB.svh"
  
  class my_env extends uvm_env;
    bit debug = 0;
    A inst1;
    B inst2;
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      void'(uvm_config_int::get(this, "", "debug", debug));
      uvm_config_int::set(this, "inst1.u2", "v", 5);
      uvm_config_int::set(this, "inst2.u1", "v", 3);
      uvm_config_int::set(this, "inst1.*", "s", 'h10);
  
      $display("%s: In Build: debug = %0d", get_full_name(), debug);
  
      inst1 = new("inst1", this);
      inst2 = new("inst2", this);
    endfunction
  
    function string get_type_name();
      return "my_env";
    endfunction
    function void do_print(uvm_printer printer);
      printer.print_field("debug", debug, 1);
    endfunction

    task run_phase(uvm_phase phase);
       phase.raise_objection(this);
       uvm_top.print_topology();
       #10;
       phase.drop_objection(this);
    endtask

  endclass
  
endpackage : my_env_pkg

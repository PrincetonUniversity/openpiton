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

//----------------------------------------------------------------------
// This example illustrates basic hierarchy construction and test phasing
//----------------------------------------------------------------------

module top;
  import uvm_pkg::*;

  //Create a topology
  //            top
  //       |            |
  //     u1(A)         u2(A)
  //    |     |      |        |
  //   b1(B) d1(D)  b1(B)    d1(D)

  //No run phase
  class D extends uvm_component;
    function new (string name, uvm_component parent);
      super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
      $display("%0t: %0s:  build", $time, get_full_name());
    endfunction
    function void end_of_elaboration_phase(uvm_phase phase);
      $display("%0t: %0s:  end_of_elaboration", $time, get_full_name());
    endfunction
    function void start_of_simulation_phase(uvm_phase phase);
      $display("%0t: %0s:  start_of_simulation", $time, get_full_name());
    endfunction
    function void extract_phase(uvm_phase phase);
      $display("%0t: %0s:  extract", $time, get_full_name());
    endfunction
    function void check_phase(uvm_phase phase);
      $display("%0t: %0s:  check", $time, get_full_name());
    endfunction
    function void report_phase(uvm_phase phase);
      $display("%0t: %0s:  report", $time, get_full_name());
    endfunction
  endclass

  //Has run phase
  class B extends uvm_component;
    rand logic [7:0] delay;
    function new (string name, uvm_component parent);
      super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
      $display("%0t: %0s:  build", $time, get_full_name());
    endfunction
    function void end_of_elaboration_phase(uvm_phase phase);
      $display("%0t: %0s:  end_of_elaboration", $time, get_full_name());
    endfunction
    function void start_of_simulation_phase(uvm_phase phase);
      $display("%0t: %0s:  start_of_simulation", $time, get_full_name());
    endfunction
    function void extract_phase(uvm_phase phase);
      $display("%0t: %0s:  extract", $time, get_full_name());
    endfunction
    function void check_phase(uvm_phase phase);
      $display("%0t: %0s:  check", $time, get_full_name());
    endfunction
    function void report_phase(uvm_phase phase);
      $display("%0t: %0s:  report", $time, get_full_name());
    endfunction
    task run_phase(uvm_phase phase);
      $display("%0t: %0s:  start run phase", $time, get_full_name());
      #delay;
      $display("%0t: %0s:  end run phase", $time, get_full_name());
    endtask
  endclass
  
  //Has run phase and contains subcomponents
  class A extends uvm_component;
    rand B b1;
    rand D d1;
    rand logic [7:0] delay;
    function new (string name, uvm_component parent);
      super.new(name,parent);
      b1 = new("b1", this);
      d1 = new("d1", this);
    endfunction
    function void build_phase(uvm_phase phase);
      $display("%0t: %0s:  build", $time, get_full_name());
    endfunction
    function void end_of_elaboration_phase(uvm_phase phase);
      $display("%0t: %0s:  end_of_elaboration", $time, get_full_name());
    endfunction
    function void start_of_simulation_phase(uvm_phase phase);
      $display("%0t: %0s:  start_of_simulation", $time, get_full_name());
    endfunction
    function void extract_phase(uvm_phase phase);
      $display("%0t: %0s:  extract", $time, get_full_name());
    endfunction
    function void check_phase(uvm_phase phase);
      $display("%0t: %0s:  check", $time, get_full_name());
    endfunction
    function void report_phase(uvm_phase phase);
      $display("%0t: %0s:  report", $time, get_full_name());
    endfunction
    task run_phase(uvm_phase phase);
      $display("%0t: %0s:  start run phase", $time, get_full_name());
      #delay;
      $display("%0t: %0s:  end run phase", $time, get_full_name());
    endtask
  endclass

  class AA extends uvm_component;
    rand A a;
    function new (string name, uvm_component parent);
      super.new(name,parent);
      a = new("a", this);
    endfunction
  endclass

  //Top level contains two A components
  class top extends uvm_env;
    rand AA a1;
    rand AA a2;
    function new (string name, uvm_component parent);
      super.new(name,parent);
      a1 = new("a1", this);
      a2 = new("a2", this);
    endfunction
    function void build_phase(uvm_phase phase);
      $display("%0t: %0s:  build", $time, get_full_name());
    endfunction
    function void end_of_elaboration_phase(uvm_phase phase);
      $display("%0t: %0s:  end_of_elaboration", $time, get_full_name());
    endfunction
    function void start_of_simulation_phase(uvm_phase phase);
      $display("%0t: %0s:  start_of_simulation", $time, get_full_name());
    endfunction
    function void extract_phase(uvm_phase phase);
      $display("%0t: %0s:  extract", $time, get_full_name());
    endfunction
    function void check_phase(uvm_phase phase);
      $display("%0t: %0s:  check", $time, get_full_name());
    endfunction
    function void report_phase(uvm_phase phase);
      $display("%0t: %0s:  report", $time, get_full_name());
    endfunction
    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      $display("%0t: %0s:  start run phase", $time, get_full_name());
      #500;
      $display("%0t: %0s:  end run phase", $time, get_full_name());
      phase.drop_objection(this);
    endtask
  endclass


  top t = new("top", null);

  initial begin
    //Randomize all of the delays
    void'(t.randomize());

    run_test();
  end
endmodule

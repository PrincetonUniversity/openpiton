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

`timescale 1ns/1ns

module test;

  // This simple example shows how the uvm_test_done objection is
  // used to coordinate end of test activity. For an example of
  // using end of test coordination in the context of a full
  // environment, refer to the xbus example.

  // In this example, a drain time of 10 is set on the component.
  // The component then forks 4 processes which consume different
  // amounts of time. When the last process is done (time 50),
  // the drain time takes effect. The test is completed at time
  // 60.

  // The example also shows usage of the component objection 
  // callbacks. In this case, the dropped callback is used, but
  // the raised and all_dropped work similarly (except the 
  // all dropped is a time-consuming task).

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class simple_test extends uvm_test;
    function new (string name, uvm_component parent);
      super.new(name, parent);
    endfunction : new

    // Register with the factory.
    `uvm_component_utils(simple_test)

    virtual task run_phase(uvm_phase phase);
      // Set a drain time on the objection if needed
      uvm_report_info("drain", "Setting drain time of 10", UVM_NONE);
      uvm_test_done.set_drain_time(this,10);

      // Run a bunch of processes in parallel
      fork
        doit(35);
        doit(25);
        doit(50);
        doit(15);
      join
    endtask

    // A simple task that consumes some time.
    task doit (time delay);
      static int s_inst = 0; int inst = s_inst++;

      //Raise an objection before starting the activity
      uvm_test_done.raise_objection(this);

      uvm_report_info("doit", $sformatf("Starting doit (%0d) with delay %0t", 
          inst, delay), UVM_NONE);
      #delay;
      uvm_report_info("doit", $sformatf("Ending doit (%0d)", inst), UVM_NONE);

      //Drop the objection when done
      uvm_test_done.drop_objection(this);
    endtask

    // Use an objection callback do something when objections are raised or
    // dropped (or all dropped). This example prints some information on each
    // drop.
    virtual function void dropped (uvm_objection objection, 
        uvm_object source_obj, string description, int count);
      uvm_report_info("dropped", 
        $sformatf("%d objection(s) dropped from %s, total count is now %0d", 
        count, source_obj.get_full_name, objection.get_objection_total(this)), 
        UVM_NONE);
    endfunction

  endclass : simple_test

  // Run the test
  initial
    run_test("simple_test");

endmodule

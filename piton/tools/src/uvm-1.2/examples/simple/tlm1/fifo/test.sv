
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


/*
About: uvm_tlm_fifo

This test case supposed to test a producer consumer connection through a uvm_tlm_fifo of 10 levels.



Walk through the test:
Inside a module, there will be two threads established, the first one the *producer* will put a packet of an integer to put port, the second one *consumer* will get this packet through a get port. The put and get ports will be connected to the uvm_tlm_fifo exports. 

the method *fifo.used* will be used here to display which fifo level is used.

*/



module test;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

  class packet;
    int i;
    function new(int v); i=v; endfunction
  endclass

  class producer extends uvm_component;
    uvm_put_port #(packet) data_out;
    function new(string name, uvm_component parent);
      super.new(name,parent);
      data_out = new("data_out", this);
    endfunction
    task run_phase(uvm_phase phase);
      packet p, pp;
      #1 p=new(0);
      while(data_out.try_put(p)) begin 
        $display("%0t: put data %0d", $time, p.i);
        #10 p = new(p.i+1);
      end
      $display("try_put status return: %0d", p.i);
      $display("%0t: do a blocking put", $time);
      data_out.put(p);
      $display("%0t: blocking put succeeded", $time);
    endtask
  endclass
  class consumer extends uvm_component;
    uvm_get_port #(packet) data_in;
    function new(string name, uvm_component parent);
      super.new(name,parent);
      data_in = new("data_in", this);
    endfunction
    task run_phase(uvm_phase phase);
      packet p;
      #100;  // fifo will fill up
      $display("%0t: getting one", $time);
      data_in.get(p);
      $display("%0t: received data %0d", $time, p.i);
      #100;  // let the blocking put succeed
      while(data_in.try_get(p)) begin
        $display("%0t: received data %0d", $time, p.i);
        #10;
      end
    endtask
  endclass


  class test extends uvm_test;

     `uvm_component_utils(test)

     function new(string name = "", uvm_component parent = null);
        super.new(name, parent);
     endfunction

     task run_phase(uvm_phase phase);
        phase.raise_objection(null);
        #5us;
        phase.drop_objection(null);
     endtask
  endclass

  producer prod = new("prod", null);
  consumer cons = new("cons", null);
  uvm_tlm_fifo #(packet) fifo = new("fifo", null, 10);

  initial begin
    prod.data_out.connect(fifo.put_export);
    cons.data_in.connect(fifo.get_export);

    fork
      run_test("test");
      repeat(30) begin
        $display("%0t:   FIFO level %0d of %0d", $time, fifo.used(), fifo.size());
        #10;
      end
    join
  end

endmodule

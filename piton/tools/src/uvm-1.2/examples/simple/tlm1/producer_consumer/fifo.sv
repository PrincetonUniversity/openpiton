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
About: producer_consumer

this test is the basic simple to illustrates how to create a producer and consumer which are completely independent and connecting them using a uvm_tlm_fifo channel


Walk through the test:

two thrads *producer* and *consumer* will use uvm_blocking_put port and uvm_blocking_get port, to transfer an integer from the producer to the consumer through fifo exports at the connection function of an environment class


*/

`include "uvm_macros.svh"

//----------------------------------------------------------------------
// module top
//----------------------------------------------------------------------
module test;

  import uvm_pkg::*;
  
  //----------------------------------------------------------------------
  // class producer
  //----------------------------------------------------------------------
  class producer extends uvm_component;

    uvm_blocking_put_port#(int) put_port;
    
    function new(string name, uvm_component p = null);
      super.new(name,p);
      put_port = new("put_port", this);
      
    endfunction
    
    task run_phase(uvm_phase phase);
      
      int randval;
      
      for(int i = 0; i < 10; i++)
        begin
          randval = $random % 100;
	  #10;
          `uvm_info("producer", $sformatf("sending   %4d", randval), UVM_MEDIUM)
          put_port.put(randval);
        end
    endtask
    
  endclass : producer
  
  //----------------------------------------------------------------------
  // class consumer
  //----------------------------------------------------------------------
  class consumer extends uvm_component;

    uvm_blocking_get_port#(int) get_port;
    
    function new(string name, uvm_component p = null);
      super.new(name,p);
      get_port = new("get_port", this);
    endfunction
    
    task run_phase(uvm_phase phase);
      
      int val;
      
      forever
        begin
          get_port.get(val);
          `uvm_info("consumer", $sformatf("receiving %4d", val), UVM_MEDIUM)
        end
      
    endtask
    
  endclass : consumer
  
  //----------------------------------------------------------------------
  // class env
  //----------------------------------------------------------------------
  class env extends uvm_env;
    producer p;
    consumer c;
    uvm_tlm_fifo #(int) f;
    
    function new(string name = "env");
      super.new(name);
      p = new("producer", this);
      c = new("consumer", this);
      f = new("fifo", this);
      $display("fifo put_export: %s", f.m_name);
    endfunction
    
    function void connect_phase(uvm_phase phase);
      p.put_port.connect(f.put_export);
      c.get_port.connect(f.get_export);
    endfunction
    
    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      #1000;
      phase.drop_objection(this);
    endtask
    
  endclass
  
  // Main body of module top:
  env e;
  
  initial begin
    e = new();
    run_test();
    //$finish;
  end

endmodule // test


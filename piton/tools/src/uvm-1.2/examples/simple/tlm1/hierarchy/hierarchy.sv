
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
About: hierarchy
This test is supposed to test the hierarchical connection between ports of hierarchical threads using a uvm_tlm_fifo exports.


Walk through the test:
A thread *gen* will use a uvm_blocking_put_port to put a transaction.

A *conv* thread will use a uvm_blocking_put_port to put a transaction,an  uvm_blocking_get_port to get a transactions, and a uvm_analysis_ port to a writte a transaction through it.

Another thread *bfm* will use a uvm_blocking_get_port to only get the transactions that has been sent by the other threads.

A *listener* will extends the uvm_subscriber, to implement the analysis port write function.

A *producer* component will use uvm_blocking_put_port and uvm_analysis_port and a uvm_tlm_fifo, to connect the *gen* and *conv* put, get and analysis ports through the fifo exports.

A *consumer* component will use uvm_blocking_put export and connect it directly to a fifo export, also will connect the *bfm*  get port to the fifo export

At *top* env, the *producer*, *consumer*, and the *listener* will be connected

*/


`include "uvm_macros.svh"


module test;

  import uvm_pkg::*;
  
  //----------------------------------------------------------------------
  // class transaction
  //----------------------------------------------------------------------
  class transaction extends uvm_transaction;

    rand int data;
    rand int addr;
    
    function void copy( input transaction t );
      data = t.data;
      addr = t.addr;
    endfunction
    
    function bit comp( input transaction a , input transaction b );
      return ((a.data == b.data) && (a.addr == b.addr));
    endfunction
    
    function uvm_object clone();
      transaction t;

      t = new();
      t.copy(this);
      return t;
    endfunction
    
    function string convert2string();
      string s;
      $sformat(s, "[ addr = %x, data = %x ]", addr, data);
      return s;
    endfunction
    
  endclass
  
  //----------------------------------------------------------------------
  // component gen
  //----------------------------------------------------------------------
  class gen extends uvm_component;

    uvm_blocking_put_port #(transaction) put_port;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      put_port = new("put_port", this);
    endfunction
    
    task run_phase(uvm_phase phase);
      transaction t;
      string msg;
      
      for(int i=0; i < 20; i++) begin
        t = new();
        assert(t.randomize());
        `uvm_info("gen", $sformatf("sending  : %s", t.convert2string()), UVM_MEDIUM)
        put_port.put(t);
      end
    endtask
    
  endclass
  
  
  //----------------------------------------------------------------------
  // componenet conv
  //----------------------------------------------------------------------
  class conv extends uvm_component;

    uvm_blocking_put_port #(transaction) put_port;
    uvm_blocking_get_port #(transaction) get_port;
    uvm_analysis_port #(transaction) ap;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      put_port = new("put_port", this);
      get_port = new("get_port", this);
      ap = new("analysis_port", this);
    endfunction
    
    task run_phase(uvm_phase phase);
      transaction t;
      
      forever begin
        get_port.get(t);
        ap.write(t);
        put_port.put(t);
      end
    endtask
    
  endclass
  
  //----------------------------------------------------------------------
  // componenet bfm
  //----------------------------------------------------------------------
  class bfm extends uvm_component;

    uvm_blocking_get_port #(transaction) get_port;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      get_port = new("get_port", this);
    endfunction
    
    task run_phase(uvm_phase phase);
      transaction t;
      
      forever begin
        get_port.get(t);
        `uvm_info("bfm", $sformatf("receiving: %s", t.convert2string()),UVM_MEDIUM)
      end
    endtask
    
  endclass
  
  class listener extends uvm_subscriber #(transaction);
    function new(string name, uvm_component parent);
      super.new(name,parent);
    endfunction // new
    
    function void write(input transaction t);
      `uvm_info(m_name, $sformatf("Received: %s", t.convert2string()), UVM_MEDIUM)
    endfunction // write
  endclass // listener
  
  //----------------------------------------------------------------------
  // componenet producer
  //----------------------------------------------------------------------
  // begin codeblock producer
  class producer extends uvm_component;

    uvm_blocking_put_port #(transaction) put_port;
    uvm_analysis_port #(transaction) ap;
    
    gen g;
    conv c;
    uvm_tlm_fifo #(transaction) f;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      put_port = new("put_port", this);
      ap = new("analysis_port", this);
      g = new("gen", this);
      c = new("conv", this);
      f = new("fifo", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
      g.put_port.connect(f.blocking_put_export);  // A
      c.get_port.connect(f.blocking_get_export);  // B
      c.put_port.connect(put_port); // C
      c.ap.connect(ap);
    endfunction
    
  endclass
  
  //----------------------------------------------------------------------
  // componenet consumer
  //----------------------------------------------------------------------
  class consumer extends uvm_component;

    uvm_blocking_put_export #(transaction) put_export;
    
    bfm b;
    uvm_tlm_fifo #(transaction) f;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      put_export = new("put_export", this);
      f = new("fifo", this);
      b = new("bfm", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
      put_export.connect(f.blocking_put_export);
      b.get_port.connect(f.blocking_get_export);
    endfunction
    
  endclass
  
  //----------------------------------------------------------------------
  // componenet top
  //----------------------------------------------------------------------
  class top extends uvm_env;
  
    producer p;
    consumer c;
    listener l;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      p = new("producer", this);
      c = new("consumer", this);
      l = new("listener", this);

      // Connections may also be done in the constructor, if you wish
      p.put_port.connect(c.put_export);
      p.ap.connect(l.analysis_export);
    endfunction
    task run_phase(uvm_phase phase);
      begin
      end
    endtask
    
  endclass
  
  //----------------------------------------------------------------------
  // environment env
  //----------------------------------------------------------------------
  class env extends uvm_env;
    top t;
    
    function new(string name = "env");
      super.new(name);
      t = new("top", this);
    endfunction
    
    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      #1000; 
      phase.drop_objection(this);
    endtask
    
  endclass
  
  //----------------------------------------------------------------------
  // module test
  //----------------------------------------------------------------------
  env e;

  initial begin
    e = new("e");
    run_test();
  end

endmodule // test

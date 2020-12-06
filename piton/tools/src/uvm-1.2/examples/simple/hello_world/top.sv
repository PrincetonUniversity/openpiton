//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
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

class top extends uvm_component;

  producer #(packet) p1;
  producer #(packet) p2;
  uvm_tlm_fifo #(packet) f;
  consumer #(packet) c;

  `uvm_component_utils(top)

  function new (string name, uvm_component parent=null);
    super.new(name,parent);

    p1 = new("producer1",this);
    p2 = new("producer2",this);
    f  = new("fifo",this);
    c  = new("consumer",this);

    p1.out.connect( c.in );
    p2.out.connect( f.blocking_put_export );
    c.out.connect( f.get_export );
  endfunction

  task run_phase(uvm_phase phase);
     phase.raise_objection(this);
     uvm_top.print_topology();
     #1us;
     phase.drop_objection(this);
  endtask
endclass



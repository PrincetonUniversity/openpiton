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

class consumer #(type T=packet) extends uvm_component;

  uvm_blocking_put_imp #(T,consumer #(T)) in;
  uvm_get_port #(T) out;

  function new(string name, uvm_component parent=null);
    super.new(name,parent);
    in=new("in",this);
    out=new("out",this,0);
  endfunction

  protected int count=0;
  local semaphore lock = new(1);

  `uvm_component_utils_begin(consumer #(T))
    `uvm_field_int(count,UVM_ALL_ON + UVM_READONLY + UVM_DEC)
  `uvm_component_utils_end

  task run_phase(uvm_phase phase);
    T p;
    while(out.size()) begin
      out.get(p);
      put(p);
    end
  endtask

  task put (T p);
    lock.get();
    count++;
//    void'(accept_tr(p));
    accept_tr(p);
    #10;
    void'(begin_tr(p));
    #30; 
    end_tr(p); 
    `uvm_info("consumer", $sformatf("Received %0s local_count=%0d",p.get_name(),count), UVM_MEDIUM)
    if(uvm_report_enabled(UVM_HIGH,UVM_INFO,""))
      p.print();
    lock.put();
  endtask 
endclass


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

class producer #(type T=packet) extends uvm_component;

  uvm_blocking_put_port #(T) out;

  function new(string name, uvm_component parent=null);
    super.new(name,parent);
    out = new("out",this);
    void'(uvm_config_int::get(this, "", "num_packets", this.num_packets));
  endfunction

  protected T   proto       = new;
  protected int num_packets = 1;
  protected int count       = 0;

  `uvm_component_utils_begin(producer #(T))
    `uvm_field_object(proto, UVM_ALL_ON + UVM_REFERENCE)
    `uvm_field_int(num_packets, UVM_ALL_ON + UVM_DEC)
    `uvm_field_int(count, UVM_ALL_ON + UVM_DEC + UVM_READONLY)
  `uvm_component_utils_end

  task run_phase(uvm_phase phase);
    T p;
    string image, num;

    `uvm_info("producer", "Starting.", UVM_MEDIUM)

    for (count =0; count < num_packets; count++) begin

      $cast(p, proto.clone());

      num.itoa(count);
      p.set_name({get_name(),"-",num});

      p.set_initiator(this);

      if (uvm_verbosity'(recording_detail)!=UVM_NONE)
        p.enable_recording(get_tr_stream("packet_stream"));

      void'(p.randomize());

      `uvm_info("producer", $sformatf("Sending %s",p.get_name()), UVM_MEDIUM)

      if(uvm_report_enabled(UVM_HIGH,UVM_INFO,""))
        p.print();

      out.put(p);

      #10;

    end

    `uvm_info("producer", "Exiting.", UVM_MEDIUM)

  endtask

endclass


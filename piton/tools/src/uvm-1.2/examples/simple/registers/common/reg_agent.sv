//------------------------------------------------------------------------------
// Copyright 2010-2011 Synopsys, Inc.
// Copyright 2010-2011 Cadence Design Systems, Inc.
// All Rights Reserved Worldwide
// 
// Licensed under the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License.  You may obtain
// a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
// License for the specific language governing permissions and limitations
// under the License.
//------------------------------------------------------------------------------


class reg_rw extends uvm_sequence_item;
  
   rand bit          read;  
   rand bit   [31:0] addr;
   rand logic [31:0] data;
   rand bit   [3:0] byte_en;
 
   `uvm_object_utils_begin(reg_rw)
     `uvm_field_int(read, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(addr, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(data, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(byte_en, UVM_ALL_ON | UVM_NOPACK);
   `uvm_object_utils_end
   
   function new (string name = "reg_rw");
      super.new(name);
   endfunction

   function string convert2string();
     return $sformatf("%s addr=%0h data=%0h be=%b",
                      (read)?"READ":"WRITE",addr,data,byte_en);
   endfunction

endclass: reg_rw



class reg_sequencer extends uvm_sequencer #(reg_rw);

   `uvm_component_utils(reg_sequencer)

   function new(input string name, uvm_component parent=null);
      super.new(name, parent);
   endfunction : new

endclass : reg_sequencer



class reg_monitor extends uvm_monitor;

   uvm_analysis_port#(reg_rw) ap;

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
      ap = new("ap", this);
   endfunction: new

endclass: reg_monitor


class reg_driver #(type DO=int) extends uvm_component;

   `uvm_component_param_utils(reg_driver #(DO))

   uvm_seq_item_pull_port #(reg_rw) seqr_port;

   local uvm_component m_parent;

   function new(string name, uvm_component parent=null);
      super.new(name,parent);
      m_parent = parent;
      seqr_port = new("seqr_port",this);
   endfunction
   

   task run_phase(uvm_phase phase);
      reg_monitor mon;
      $cast(mon, m_parent.get_child("mon"));
           
      forever begin
         reg_rw rw;
         
         seqr_port.peek(rw); // aka 'get_next_rw'
         DO::rw(rw);
         mon.ap.write(rw);
         seqr_port.get(rw); // aka 'item_done'
      end
   endtask
   
endclass


class reg_agent #(type DO=int) extends uvm_agent;

   reg_sequencer   sqr;
   reg_driver#(DO) drv;
   reg_monitor     mon;

   `uvm_component_param_utils_begin(reg_agent#(DO))
      `uvm_field_object(sqr, UVM_ALL_ON)
      `uvm_field_object(drv, UVM_ALL_ON)
      `uvm_field_object(mon, UVM_ALL_ON)
   `uvm_component_utils_end
   
   function new(string name, uvm_component parent = null);
      super.new(name, parent);
      sqr = new("sqr", this);
      drv = new("drv", this);
      mon = new("mon", this);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      $write("Started building...\n");
      super.build_phase(phase);
      $write("Ended building...\n");
   endfunction
   
   virtual function void connect_phase(uvm_phase phase);
      drv.seqr_port.connect(sqr.seq_item_export);
   endfunction
endclass


class reg2rw_adapter extends uvm_reg_adapter;

   `uvm_object_utils(reg2rw_adapter)

   function new(string name = "reg2rw_adapter");
      super.new(name);
      supports_byte_enable = 1;
   endfunction

   virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
      reg_rw bus = reg_rw::type_id::create("rw");
      bus.read    = (rw.kind == UVM_READ);
      bus.addr    = rw.addr;
      bus.data    = rw.data;
      bus.byte_en = rw.byte_en;
      return bus;
   endfunction

   virtual function void bus2reg(uvm_sequence_item bus_item,
                                 ref uvm_reg_bus_op rw);
      reg_rw bus;
      if (!$cast(bus,bus_item)) begin
         `uvm_fatal("NOT_REG_TYPE","Provided bus_item is not of the correct type")
         return;
      end
      rw.kind    = bus.read ? UVM_READ : UVM_WRITE;
      rw.addr    = bus.addr;
      rw.data    = bus.data;
      rw.byte_en = bus.byte_en;
      rw.status  = UVM_IS_OK;
   endfunction

endclass

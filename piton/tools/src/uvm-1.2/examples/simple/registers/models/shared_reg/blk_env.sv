// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
//    All Rights Reserved Worldwide
// 
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
// 

`include "any_agent.sv"

//------------------------------------------------------------------------------
// VIP developer code
//------------------------------------------------------------------------------


// The APB and WSH transaction items appear identical, but they
// differ in type, a very important distinction. The types would
// normally be very different, but we make their members have
// the same names so we can reuse the generic any_driver for
// processing responses for them.

class apb_item extends uvm_sequence_item;
  `uvm_object_utils(apb_item)
  function new(string name="apb_item");
    super.new(name);
  endfunction
  rand bit unsigned   read;
  rand uvm_reg_addr_t addr;
  rand uvm_reg_data_t data;
  virtual function string convert2string();
    return {"read:",$sformatf("%0d",read)," addr:",$sformatf("%0h",addr), " data:",$sformatf("%0h",data)};
  endfunction
endclass


class wsh_item extends uvm_sequence_item;
  `uvm_object_utils(wsh_item)
  function new(string name="apb_item");
    super.new(name);
  endfunction
  rand bit unsigned   read;
  rand uvm_reg_addr_t addr;
  rand uvm_reg_data_t data;
  virtual function string convert2string();
    return {"read:",$sformatf("%0d",read)," addr:",$sformatf("%0h",addr), " data:",$sformatf("%0h",data)};
  endfunction
endclass


class reg2apb_adapter extends uvm_reg_adapter;

  `uvm_object_utils(reg2apb_adapter)

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    apb_item apb = apb_item::type_id::create("apb_item");
    apb.read = (rw.kind == UVM_READ) ? 1 : 0;
    apb.addr = rw.addr;
    apb.data = rw.data;
    return apb;
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    apb_item apb;
    if (!$cast(apb,bus_item)) begin
      `uvm_fatal("NOT_APB_TYPE","Provided bus_item is not of the correct type")
      return;
    end
    rw.status = UVM_IS_OK;
    rw.kind = apb.read ? UVM_READ : UVM_WRITE;
    rw.addr = apb.addr;
    rw.data = apb.data;
  endfunction


  function new(string name="reg2apb_adapter");
     super.new(name);
  endfunction

endclass

class reg2wsh_adapter extends uvm_reg_adapter;

  `uvm_object_utils(reg2wsh_adapter)

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    wsh_item wsh = wsh_item::type_id::create("wsh_item");
    wsh.read = (rw.kind == UVM_READ) ? 1 : 0;
    wsh.addr = rw.addr;
    wsh.data = rw.data;
    return wsh;
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    wsh_item wsh;
    if (!$cast(wsh,bus_item)) begin
      `uvm_fatal("NOT_APB_TYPE","Provided bus_item is not of the correct type")
      return;
    end
    rw.status = UVM_IS_OK;
    rw.kind = wsh.read ? UVM_READ : UVM_WRITE;
    rw.addr = wsh.addr;
    rw.data = wsh.data;
  endfunction


  function new(string name="reg2wsh_adapter");
     super.new(name);
  endfunction

endclass

// TODO: just leverage an actual DUT w/ interface, as in the vert_reuse exmaple... 
class my_apb_driver extends any_driver #(apb_item);
   `uvm_component_utils(my_apb_driver)
   function new(string name = "apb_driver", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new
   virtual task pre_req(apb_item req);
     // remap so for APB: regA is at addr 1, regX is at addr 0
     // for WSH: shared regX is also at addr 0, regW is at addr 'h10
     if (req.addr == 'h10)  // regX bus addr => mem[0]
       req.addr = 'h0;
     else if (req.addr == 'h0) // regA bus addr => mem[1]
       req.addr = 'h1;
   endtask
endclass

//------------------------------------------------------------------------------
// Integrator code
//------------------------------------------------------------------------------


typedef any_agent #(apb_item) apb_agent;
typedef any_agent #(wsh_item) wsh_agent;

class blk_env extends uvm_env;

   `uvm_component_utils(blk_env)

   reg_block_B  model;
   apb_agent    apb;
   wsh_agent    wsh;

   function new(string name = "blk_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      begin // FIXME 839607
      any_driver#(apb_item)::type_id::set_type_override(my_apb_driver::get_type());
      end
      apb =   apb_agent::type_id::create("apb_agent",this);
      wsh =   wsh_agent::type_id::create("wsh_agent",this);
      model = reg_block_B::type_id::create("reg_blk_B");
      model.build();
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      reg2apb_adapter reg2apb = new;
      reg2wsh_adapter reg2wsh = new;
      model.APB.set_sequencer(apb.sqr, reg2apb);
      model.APB.set_auto_predict();
      model.WSH.set_sequencer(wsh.sqr, reg2wsh);
      model.WSH.set_auto_predict();
      apb.drv.base_addr = 'h20;
   endfunction

endclass

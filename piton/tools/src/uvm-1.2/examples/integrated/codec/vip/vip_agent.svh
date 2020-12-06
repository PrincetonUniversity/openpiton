// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
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


class vip_agent extends uvm_agent;

   vip_sequencer sqr;
   vip_driver    drv;
   vip_monitor   tx_mon;
   vip_monitor   rx_mon;

   vip_vif       vif;

   `uvm_component_utils(vip_agent)
   
   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      sqr = vip_sequencer::type_id::create("sqr", this);
      drv = vip_driver::type_id::create("drv", this);
      tx_mon = vip_monitor::type_id::create("tx_mon", this);
      rx_mon = vip_monitor::type_id::create("rx_mon", this);
      
      if (!uvm_config_db#(vip_vif)::get(this, "", "vif", vif)) begin
         `uvm_fatal("VIP/AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db#(vip_rx_vif)::set(this, "tx_mon", "vif", vif.tx_mon);
      uvm_config_db#(vip_rx_vif)::set(this, "rx_mon", "vif", vif.rx);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      drv.seq_item_port.connect(sqr.seq_item_export);
   endfunction

   
   task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this, "Resetting agent");
      reset_and_suspend();
      phase.drop_objection(this);
   endtask



   virtual task reset_and_suspend();
      fork
         drv.reset_and_suspend();
         tx_mon.reset_and_suspend();
         rx_mon.reset_and_suspend();
      join
      sqr.stop_sequences();
   endtask

   virtual task suspend();
      fork
         drv.suspend();
         tx_mon.suspend();
         rx_mon.suspend();
      join
   endtask

   virtual task resume();
      fork
         drv.resume();
         tx_mon.resume();
         rx_mon.resume();
      join
   endtask

endclass: vip_agent

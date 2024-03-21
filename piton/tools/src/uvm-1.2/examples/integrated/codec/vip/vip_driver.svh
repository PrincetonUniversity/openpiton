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


typedef class vip_driver;
class vip_driver_cbs extends uvm_callback;
    virtual task pre_tx(vip_driver xactor , ref bit [7:0] chr);endtask
    virtual task post_tx(vip_driver xactor , bit [7:0] chr);endtask
endclass

class vip_driver extends uvm_driver#(vip_tr);

   local bit m_suspend;
   local bit m_suspended;
   local process m_proc;
   local bit m_interrupted;

   `uvm_component_utils(vip_driver)
   `uvm_register_cb(vip_driver, vip_driver_cbs)
  
   vip_tx_vif vif;

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction
   
   virtual function void build_phase(uvm_phase phase);
      vip_agent agent;
      if ($cast(agent, get_parent()) && agent != null) begin
         vif = agent.vif.tx;
      end
      else begin
         if (!uvm_config_db#(vip_tx_vif)::get(this, "", "vif", vif)) begin
            `uvm_fatal("VIP/DRV/NOVIF", "No virtual interface specified for this driver instance")
         end
      end

      m_suspend   = 1;
      m_suspended = 1;
   endfunction


   task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this, "Resetting driver");
      vif.Tx = 1'bx;
      m_interrupt();
      phase.drop_objection(this);
   endtask


   task reset_phase(uvm_phase phase);
      phase.raise_objection(this, "Resetting driver");
      reset_and_suspend();
      phase.drop_objection(this);
   endtask


   //
   // Abruptly interrupt and suspend this driver
   //
   local task m_interrupt();
      m_suspend = 1;
      if (m_proc != null) begin
        m_proc.kill();
        m_proc = null;
        m_interrupted = 1;
        wait (m_suspended);
      end
   endtask

   virtual task reset_and_suspend();
      vif.Tx = 0;
      m_interrupt();
   endtask

   virtual task suspend();
      m_suspend = 1;
      wait (m_suspended);
   endtask

   virtual task resume();
      m_suspend = 0;
      wait (!m_suspended);
   endtask

   virtual task run_phase(uvm_phase phase);
      int    count = 0;
      vip_tr tr;
      
      vif.Tx = 1'bx;
      
      forever begin
         if (tr != null && !m_interrupted)
           seq_item_port.item_done();
         m_interrupted = 0;

         // Reset and suspend
         m_suspended = 1;
         wait (!m_suspend);
         m_suspended = 0;

         fork
            begin
               m_proc = process::self();

               forever begin

                  // Suspend without reset
                  if (m_suspend) begin
                     m_suspended = 1;
                     wait (!m_suspend);
                     m_suspended = 0;
                  end
               
                  if (count == 0) send(8'hB2); // SYNC

                  seq_item_port.try_next_item(tr);
                  
                  if (tr == null) send(8'h81); // IDLE
                  else begin
                     if (tr.chr == 8'h81 || tr.chr == 8'hE7) begin
                        send(8'hE7); // ESC
                        if (count == 5) begin
                           send(8'hB2); // SYNC
                           count = 0;
                        end
                        else count++;
                     end
                     send(tr.chr);
                     
                     seq_item_port.item_done();
                     tr = null;
                  end
                  count = (count + 1) % 6;
               end
            end
         join

      end
   endtask


   virtual protected task send(input bit [7:0] data);
      pre_tx(data);
      `uvm_do_callbacks(vip_driver, vip_driver_cbs, pre_tx(this, data))

      `uvm_info("VIP/DRV/TX", $sformatf("Sending 0x%h", data),
                UVM_HIGH);
      
      repeat (8) begin
         @(negedge vif.clk);
         vif.Tx = data[7];
         data = {data[6:0], data[7]};
      end

      post_tx(data);
      `uvm_do_callbacks(vip_driver, vip_driver_cbs, post_tx(this, data))
   endtask: send

   virtual protected task pre_tx(ref bit [7:0] chr);
   endtask
 
   virtual protected task post_tx(bit [7:0] chr);
   endtask
endclass: vip_driver

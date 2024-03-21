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


typedef class vip_monitor;
class vip_monitor_cbs extends uvm_callback;
    virtual function void rxed(vip_monitor xactor, ref bit [7:0] chr);endfunction
endclass

class vip_monitor extends uvm_monitor;

   uvm_analysis_port#(vip_tr) ap;

   `uvm_component_utils(vip_monitor)
   `uvm_register_cb(vip_monitor, vip_monitor_cbs)
  
   vip_rx_vif vif;

   local bit m_in_sync;
   local bit m_suspend;
   local bit m_suspended;
   local process m_proc;

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
      ap = new("ap", this);
      
      m_in_sync   = 0;
      m_suspend   = 1;
      m_suspended = 1;
   endfunction

   function bit is_in_sync();
      return m_in_sync;
   endfunction

   task wait_for_sync_change();
      @(m_in_sync);
   endtask
     
   
   virtual function void build_phase(uvm_phase phase);
      if (!uvm_config_db#(vip_rx_vif)::get(this, "", "vif", vif)) begin
         `uvm_fatal("VIP/MON/NOVIF", "No virtual interface specified for this monitor instance")
      end
   endfunction


   task reset_phase(uvm_phase phase);
      phase.raise_objection(this, "Resetting driver");
      reset_and_suspend();
      phase.drop_objection(this);
   endtask


   //
   // Abruptly interrupt and suspend this monitor
   //
   virtual task reset_and_suspend();
      m_suspend = 1;
      if (m_proc != null) begin
         m_proc.kill();
         m_proc = null;
         wait (m_suspended);
      end
   endtask

   virtual task suspend();
      reset_and_suspend();
   endtask

   virtual task resume();
      m_suspend = 0;
      wait (!m_suspended);
   endtask

   virtual task run_phase(uvm_phase phase);
      forever begin
         m_suspended = 1;
         m_in_sync = 0;
         
         wait (!m_suspend);
         m_suspended = 0;

         fork
            begin
               bit [7:0] symbol;
               m_proc = process::self(); 

               forever begin
                  bit ok;
                  bit escaped;
                  
                  `uvm_info("VIP/MON/SYM", "Looking for SYNC", UVM_MEDIUM);

                  // First, acquire symbol sync
                  symbol = 8'h00;
                  while (symbol != 8'hB2) begin
                     @(posedge vif.clk);
                     symbol = {symbol[6:0], vif.Rx};
                  end
                  `uvm_info("VIP/MON/SYM1", "Found first SYNC", UVM_MEDIUM);

                  // Must now find 3 more, 7 symbols apart
                  ok = 1;
                  repeat (3) begin
                     repeat (7 * 8) begin
                        @(posedge vif.clk);
                        symbol = {symbol[6:0], vif.Rx};
                     end
                     if (symbol == 8'hB2) begin
                        `uvm_info("VIP/MON/SYM/FR", "Found another SYNC", UVM_MEDIUM);
                     end
                     else begin
                        ok = 0;
                        break;
                     end
                  end
                  if (ok) m_in_sync = 1;
                  else break;

                  `uvm_info("VIP/MON/SYNC/ACQ", "SYNC acquired!", UVM_MEDIUM);
                  escaped = 0;
               
                  while (m_in_sync) begin
                     repeat (6) begin
                        repeat (8) begin
                           @(posedge vif.clk);
                           symbol = {symbol[6:0], vif.Rx};
                        end
                        if (escaped || (symbol != 8'h81 && symbol != 8'hE7)) begin
                           vip_tr tr;
                           
                           rxed(symbol);
                           `uvm_do_callbacks(vip_monitor, vip_monitor_cbs, rxed(this, symbol))
                           
                           `uvm_info("VIP/MON/RX", $sformatf("Received 0x%h", symbol),
                                     UVM_HIGH);

                           
                           tr = vip_tr::type_id::create("tr",,get_full_name());
                           tr.chr = symbol;
                           ap.write(tr);
                           
                           escaped = 0;
                        end
                        else if (symbol == 8'hE7) begin
                           escaped = 1;
                        end
                     end

                     // Check that we are still in SYNC
                     repeat (8) begin
                        @(posedge vif.clk);
                        symbol = {symbol[6:0], vif.Rx};
                     end
                     if (symbol != 8'hB2) begin
                        m_in_sync = 0;
                        
                        `uvm_warning("VIP/MON/SYNC/LOST", "SYNC lost!");
                     end
                  end
               end
            end
         join
      end
   endtask
   virtual protected function void rxed(ref bit [7:0] chr);
   endfunction
endclass: vip_monitor

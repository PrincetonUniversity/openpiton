// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2011 Cadence Design Systems, Inc.
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
   

class wb_driver extends uvm_driver #(wb_cycle);

   local int m_max_n_wss;

   virtual wb_if.master sigs;

   `uvm_component_utils(wb_driver)


   function new(string name = "", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void bind_vitf(virtual wb_if.master sigs);
      this.sigs = sigs;
   endfunction

   extern virtual task run_phase(uvm_phase phase);

   extern protected virtual task read(input  bit [63:0] addr,
                                      output bit [63:0] data,
                                      input  bit [ 7:0] sel,
                                      input  bit [15:0] tgc,
                                      input  bit [15:0] tga,
                                      output bit [15:0] tgd,
                                      input  bit        lock,
                                      output wb_cycle::status_e status);

   extern protected virtual task write(input  bit [63:0] addr,
                                       input  bit [63:0] data,
                                       input  bit [ 7:0] sel,
                                       input  bit [15:0] tgc,
                                       input  bit [15:0] tga,
                                       input  bit [15:0] tgd,
                                       input  bit        lock,
                                       output wb_cycle::status_e status);

   extern task reset_wb(int cycles);

endclass: wb_driver


task wb_driver::run_phase(uvm_phase phase);
   if (!uvm_config_int::get(this, "", "max_n_wss", this.m_max_n_wss)) begin
      this.m_max_n_wss = 10;
   end

   this.sigs.mck.cyc  <= 'b0;
   this.sigs.mck.stb  <= 'b0;

   forever begin
      wb_cycle tr;

      seq_item_port.get_next_item(tr);

      if (tr.m_next_cycle !== wb_cycle::CLASSIC ||
          (tr.m_kind !== wb_cycle::READ && tr.m_kind != wb_cycle::WRITE )) begin
         `uvm_error("WB_DRIVER", "Only single read/write classic cycles are supported");
         tr.m_status = wb_cycle::ERR;
      end
      else begin
         if (tr.m_reset) begin
           this.reset_wb(tr.m_data);
         end
         else
         case (tr.m_kind)
         wb_cycle::READ : this.read(tr.m_addr, tr.m_data, tr.m_sel,
                                    tr.m_tgc, tr.m_tga, tr.m_tgd, tr.m_lock,
                                    tr.m_status);
         wb_cycle::WRITE : this.write(tr.m_addr, tr.m_data, tr.m_sel,
                                      tr.m_tgc, tr.m_tga, tr.m_tgd, tr.m_lock,
                                      tr.m_status);
         endcase
      end

      `uvm_info("WB_DRIVER", {"Transaction Completed:\n", tr.sprint()}, UVM_HIGH);

      seq_item_port.item_done();
   end
endtask: run_phase


task wb_driver::read(input  bit [63:0] addr,
                     output bit [63:0] data,
                     input  bit [ 7:0] sel,
                     input  bit [15:0] tgc,
                     input  bit [15:0] tga,
                     output bit [15:0] tgd,
                     input  bit        lock,
                     output wb_cycle::status_e status);

   // Section 3.2.1 of Wishbone B3 Specification
   @(this.sigs.mck);

   // Edge 0
   this.sigs.mck.adr <= addr;
   this.sigs.mck.tga <= tga;
   this.sigs.mck.we  <= 1'b0;
   this.sigs.mck.sel <= sel;
   this.sigs.mck.cyc <= 1'b1;
   this.sigs.mck.tgc <= tgc;
   this.sigs.mck.stb <= 1'b1;

   // Edge 1
   status = wb_cycle::TIMEOUT ;
   repeat (this.m_max_n_wss + 1) begin
      // Wait states
      @(this.sigs.mck);

      case (1'b1)
      this.sigs.mck.err: status = wb_cycle::ERR ;
      this.sigs.mck.rty: status = wb_cycle::RTY ;
      this.sigs.mck.ack: status = wb_cycle::ACK ;
      default: continue;
      endcase

      break;
   end
   if (status == wb_cycle::TIMEOUT ) begin
      `uvm_error("WB_DRIVER", "Timeout waiting for ACK_I, RTY_I or ERR_I");
   end
   data = this.sigs.mck.rdat;
   tgd  = this.sigs.mck.rtgd;

   this.sigs.mck.lock <= lock;
   this.sigs.mck.cyc  <= lock;

endtask: read


task wb_driver::write(input  bit [63:0] addr,
                      input  bit [63:0] data,
                      input  bit [ 7:0] sel,
                      input  bit [15:0] tgc,
                      input  bit [15:0] tga,
                      input  bit [15:0] tgd,
                      input  bit        lock,
                      output wb_cycle::status_e status);

   // Section 3.2.2 of Wishbone B3 Specification
   @(this.sigs.mck);

   // Edge 0
   this.sigs.mck.adr  <= addr;
   this.sigs.mck.tga  <= tga;
   this.sigs.mck.wdat <= data;
   this.sigs.mck.wtgd <= tgd;
   this.sigs.mck.we   <= 1'b1;
   this.sigs.mck.sel  <= sel;
   this.sigs.mck.cyc  <= 1'b1;
   this.sigs.mck.tgc  <= tgc;
   this.sigs.mck.stb  <= 1'b1;

   // Edge 1
   status = wb_cycle::TIMEOUT ;
   repeat (this.m_max_n_wss + 1) begin
      // Wait states
      @(this.sigs.mck);

      case (1'b1)
      this.sigs.mck.err: status = wb_cycle::ERR ;
      this.sigs.mck.rty: status = wb_cycle::RTY ;
      this.sigs.mck.ack: status = wb_cycle::ACK ;
      default: continue;
      endcase

      break;
   end
   if (status == wb_cycle::TIMEOUT ) begin
      `uvm_error("WB_DRIVER", "Timeout waiting for ACK_I, RTY_I or ERR_I");
   end

   this.sigs.mck.lock <= lock;
   this.sigs.mck.cyc  <= lock;

endtask: write


task wb_driver::reset_wb(int cycles);
   `uvm_info("WB_DRIVER", $sformatf("Resetting Wishbone for %0d cycles...", cycles), UVM_LOW);
   this.sigs.sysck.rst <= 1;
   repeat (cycles)
`ifdef QUESTA
     @(posedge sigs.sysck);
`else
     @(sigs.sysck);
`endif
   this.sigs.sysck.rst <= 0;
endtask: reset_wb



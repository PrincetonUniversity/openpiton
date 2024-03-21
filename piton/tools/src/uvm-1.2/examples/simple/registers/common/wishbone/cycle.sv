// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
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


class wb_cycle extends uvm_sequence_item;

   wb_cfg m_cfg;  // Must be non-NULL to randomize

   typedef enum {READ, WRITE, BLK_RD, BLK_WR, RMW} cycle_kinds_e;
   rand cycle_kinds_e m_kind;

   typedef enum {CLASSIC, CONSTANT,
                 LINEAR, WRAP4, WRAP8, WRAP16,
                 EOB} pipelining_e;
   rand pipelining_e m_next_cycle;

   rand bit [63:0] m_addr;
   rand bit [63:0] m_data;
   rand bit [ 7:0] m_sel;
   rand bit [15:0] m_tgc;
   rand bit [15:0] m_tga;
   rand bit [15:0] m_tgd;
   rand bit        m_lock;

   int m_n_wss;

   bit m_reset;

   typedef enum {UNKNOWN, ACK, RTY, ERR, TIMEOUT} status_e;
   status_e m_status;
  

   `uvm_object_utils_begin(wb_cycle)
      `uvm_field_enum(cycle_kinds_e, m_kind, UVM_ALL_ON)
      `uvm_field_enum(pipelining_e, m_next_cycle, UVM_ALL_ON)
      `uvm_field_int(m_addr, UVM_ALL_ON)
      `uvm_field_int(m_data, UVM_ALL_ON)
      `uvm_field_int(m_sel, UVM_ALL_ON)
      `uvm_field_int(m_tgc, UVM_ALL_ON)
      `uvm_field_int(m_tga, UVM_ALL_ON)
      `uvm_field_int(m_tgd, UVM_ALL_ON)
      `uvm_field_int(m_lock, UVM_ALL_ON)
      `uvm_field_int(m_n_wss, UVM_ALL_ON)
      `uvm_field_enum(status_e, m_status, UVM_ALL_ON)
   `uvm_object_utils_end


   constraint wb_cycle_valid {
      if (m_cfg.m_cycles == wb_cfg::CLASSIC ) m_next_cycle == CLASSIC;
   }

   constraint supported {
      m_next_cycle == CLASSIC;
      m_kind == READ || m_kind == WRITE;
   }

   constraint valid_address {
      if (m_cfg.m_port_size - m_cfg.m_granularity == 1) m_addr[0:0] == 1'b0;
      if (m_cfg.m_port_size - m_cfg.m_granularity == 2) m_addr[1:0] == 2'b00;
      if (m_cfg.m_port_size - m_cfg.m_granularity == 3) m_addr[2:0] == 3'b000;
   }

   constraint valid_sel {
      m_sel inside {8'h01, 8'h03, 8'h07, 8'h0F, 8'h1F, 8'h3F, 8'h7F, 8'hFF};
      if (m_cfg.m_port_size - m_cfg.m_granularity == 0) m_sel[7:1] == 7'h00;
      if (m_cfg.m_port_size - m_cfg.m_granularity == 1) m_sel[7:2] == 6'h00;
      if (m_cfg.m_port_size - m_cfg.m_granularity == 2) m_sel[7:4] == 4'h0;
   }


   function new(string name = "wb_cycle");
      super.new(name);
   endfunction


   function void pre_randomize();
      uvm_object cfg;

      if (m_cfg != null) return;

      // ToDo: try to get cfg from parent sequencer
   endfunction

endclass: wb_cycle


class wb_reset extends wb_cycle;
   `uvm_object_utils(wb_reset)
   function new (string name = "wb_reset");
      super.new(name);
      m_reset = 1;
      m_data = 5;
   endfunction
endclass


class wb_reset_seq extends uvm_sequence #(wb_cycle);

   `uvm_object_utils(wb_reset_seq)

   function new(string name = "wb_reset_seq");
      super.new(name);
   endfunction: new

   virtual task body();
     req = wb_reset::type_id::create("wb_reset",,get_full_name());
     start_item(req);
     finish_item(req);
   endtask

endclass

class reg2wsh_adapter extends uvm_reg_adapter;

  `uvm_object_utils(reg2wsh_adapter)

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    wb_cycle cyc = wb_cycle::type_id::create("wb_cycle");
    cyc.m_kind = (rw.kind == UVM_READ) ? wb_cycle::READ : wb_cycle::WRITE;
    cyc.m_addr = rw.addr << 2; // BYTE granularity in DWORD bus size
    cyc.m_sel = 4'hf; // 32-bit bus
    cyc.m_data = rw.data; 
    cyc.m_lock = 0;
    return cyc;
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
    wb_cycle cyc;
    if (!$cast(cyc,bus_item)) begin
      `uvm_fatal("NOT_APB_TYPE","Provided bus_item is not of the correct type")
      return;
    end
    rw.kind = (cyc.m_kind == wb_cycle::READ) ? UVM_READ : UVM_WRITE;
    rw.addr = cyc.m_addr;
    rw.data = cyc.m_data;
    // Send the result back to the RegModel
    case (cyc.m_status)
       wb_cycle::ACK: rw.status = UVM_IS_OK;
       wb_cycle::RTY: rw.status = UVM_IS_OK;
       default      : rw.status = UVM_NOT_OK;
    endcase
  endfunction


  function new(string name="reg2wsh_adapter");
     super.new(name);
  endfunction

endclass


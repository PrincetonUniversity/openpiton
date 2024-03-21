//----------------------------------------------------------------------
//   Copyright 2010 Mentor Graphics Corporation
//   Copyright 2010-2011 Synopsys, Inc
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

`timescale 1ps / 1ps

package trgt_pkg;

import uvm_pkg::*;
import apb_pkg::*;

class target extends uvm_component;

   local bit [31:0] m_data;
   
   uvm_tlm_b_target_socket #(target, apb_rw) sock;

   `uvm_component_utils(target)
   
   function new(string name = "target", uvm_component parent = null);
      super.new(name, parent);
      sock = new("sock", this);

      m_data = 32'hDEADBEEF;
   endfunction

   task b_transport(apb_rw rw, uvm_tlm_time delay);

      case (rw.addr)

       32'h0000_FF00: begin
          if (rw.kind == apb_rw::READ) rw.data = m_data;
          else m_data = rw.data;
       end

      endcase

      delay.incr(10ns, 1ns);
      $write("Trgt: delay = %0.3f ps...\n", delay.get_realtime(1ns));
   endtask

   function void start_of_simulation_phase(uvm_phase phase);
      `uvm_info("TRGT/RPT/START", $sformatf("m_data: 'h%h", m_data), UVM_NONE)
   endfunction
   
   function void report_phase(uvm_phase phase);
      `uvm_info("TRGT/RPT/FINAL", $sformatf("m_data: 'h%h", m_data), UVM_NONE)
   endfunction

endclass

endpackage

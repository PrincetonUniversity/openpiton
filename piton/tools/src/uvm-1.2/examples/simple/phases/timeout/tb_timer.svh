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


//
// Generic phase timer
//
// All time-out values are interprted in ns
//
// To set time-out values:
//
// - For one phase:
//
//   uvm_config_db#(time)::set(null, "global_timer.main", "timeout", 100);
//
// - For multiple phases:
//
//   uvm_config_db#(time)::set(null, "global_timer.pre*", "timeout", 100);
//

class tb_timer extends uvm_component;

   `uvm_component_utils(tb_timer)

   local static tb_timer m_global = new("global_timer", null);

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
   endfunction
      
   task run_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "run", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in run phase")
      end
   endtask

   task pre_reset_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "pre_reset", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in pre_reset phase")
      end
   endtask

   task reset_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "reset", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in reset phase")
      end
   endtask

   task post_reset_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "post_reset", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in post_reset phase")
      end
   endtask

   task pre_configure_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "pre_configure", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in pre_configure phase")
      end
   endtask

   task configure_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "configure", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in configure phase")
      end
   endtask

   task post_configure_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "post_configure", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in post_configure phase")
      end
   endtask
   
   task pre_main_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "pre_main", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in pre_main phase")
      end
   endtask

   task main_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "main", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in main phase")
      end
   endtask

   task post_main_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "post_main", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in post_main phase")
      end
   endtask

   task pre_shutdown_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "pre_shutdown", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in pre_shutdown phase")
      end
   endtask

   task shutdown_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "shutdown", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in shutdown phase")
      end
   endtask

   task post_shutdown_phase(uvm_phase phase);
      time t;
      if (uvm_config_db#(time)::get(this, "post_shutdown", "timeout", t) &&
          t > 0) begin
         #(t * 1ns);
         `uvm_fatal("TIMEOUT", "Time-out expired in post_shutdown phase")
      end
   endtask

endclass

//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
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
`timescale 1ns / 1ns

module hello_world;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  `include "packet.sv"
  `include "producer.sv"
  `include "consumer.sv"
  `include "top.sv"
 
  top mytop;

  initial begin
    $timeformat(-9,0," ns",5);
    uvm_default_table_printer.knobs.name_width=20;
    uvm_default_table_printer.knobs.type_width=50;
    uvm_default_table_printer.knobs.size_width=10;
    uvm_default_table_printer.knobs.value_width=14;
    uvm_config_int::set(null, "top.producer1","num_packets",2);
    uvm_config_int::set(null, "top.producer2","num_packets",4);
    uvm_config_int::set(null, "*","recording_detail",UVM_LOW);
    //uvm_default_printer = uvm_default_tree_printer;
    uvm_default_printer.knobs.reference=0;
    mytop = new("top"); 
    uvm_default_table_printer.knobs.type_width=20;
    run_test();
  end
endmodule


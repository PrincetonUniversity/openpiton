//
// -------------------------------------------------------------
//    Copyright 2010 Mentor Graphics Corporation
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
`ifndef REG_B
`define REG_B

import uvm_pkg::*;


class fifo_reg extends uvm_reg_fifo;

    function new(string name = "fifo_reg");
        super.new(name,8,32,UVM_NO_COVERAGE);
    endfunction: new

    `uvm_object_utils(fifo_reg)

endclass

class reg_block_B extends uvm_reg_block;

    rand fifo_reg FIFO;

    function new(string name = "B");
        super.new(name,UVM_NO_COVERAGE);
    endfunction: new

   virtual function void build();
        FIFO = fifo_reg::type_id::create("FIFO");
        FIFO.configure(this, null);
        FIFO.build();

        default_map = create_map("default_map", 'h0, 4, UVM_LITTLE_ENDIAN);
        default_map.add_reg(FIFO, 'h0, "RW");
    endfunction

    `uvm_object_utils(reg_block_B)

endclass


`endif

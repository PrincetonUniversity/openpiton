//
//------------------------------------------------------------------------------
//   Copyright 2011 Mentor Graphics Corporation
//   Copyright 2011 Cadence Design Systems, Inc. 
//   Copyright 2011 Synopsys, Inc.
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
//------------------------------------------------------------------------------

`ifndef REG_S
`define REG_S


class reg_sys_S extends uvm_reg_block;

  rand reg_block_B B[2];

  `uvm_object_utils(reg_sys_S)

  function new(string name = "S");
    super.new(name,UVM_NO_COVERAGE);
  endfunction: new

   function void build();

    default_map = create_map("default_map", 'h0, 1, UVM_LITTLE_ENDIAN);

    foreach (B[i]) begin
      B[i] = reg_block_B::type_id::create($sformatf("B[%0d]", i));
      B[i].configure(this);
      B[i].build();
      default_map.add_submap(this.B[i].default_map, 'h100 + i*'h100);
    end
  endfunction : build

endclass : reg_sys_S


`endif

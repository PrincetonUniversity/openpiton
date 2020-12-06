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

`ifndef REG_B
`define REG_B

class reg_R extends uvm_reg;
   rand uvm_reg_data_t value;
   local rand uvm_reg_field _dummy;

   constraint _dummy_is_reg {
      _dummy.value == value;
   }

   function new(string name = "R");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();
      this._dummy = uvm_reg_field::type_id::create("value");
      this._dummy.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
   endfunction: build

   `uvm_object_utils(reg_R)
   
endclass : reg_R


class block_B extends uvm_reg_block;
   rand reg_R R;

   function new(string name = "B");
      super.new(name,UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 4, UVM_BIG_ENDIAN);

      this.R = reg_R::type_id::create("R");
      this.R.configure(this, null);
      this.R.build();

      default_map.add_reg(R, 'h0,  "RW");
   endfunction : build
   
   `uvm_object_utils(block_B)
   
endclass : block_B



`endif

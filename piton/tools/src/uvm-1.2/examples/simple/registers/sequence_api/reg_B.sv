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

import uvm_pkg::*;

class reg_B_R extends uvm_reg;
   rand uvm_reg_field F;

   function new(string name = "B_R");
      super.new(name,8,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      F = uvm_reg_field::type_id::create("F");
      F.configure(this, 8, 0, "RW", 0, 8'h0, 1, 0, 1);
   endfunction: build

   `uvm_object_utils(reg_B_R)

endclass : reg_B_R


class reg_fld_B_CTL_CTL;
   typedef enum bit[1:0] { 
		           NOP, 
		           INC, 
		           DEC, 
		           CLR
	                   } CTL_values;
endclass : reg_fld_B_CTL_CTL


class reg_B_CTL extends uvm_reg;
   rand uvm_reg_field CTL;

   function new(string name = "B_CTL");
      super.new(name,8,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      CTL = uvm_reg_field::type_id::create("CTL");
      CTL.configure(this, 2, 0, "WO", 0, 2'h0, 1, 0, 1);
      uvm_resource_db#(bit)::set({"REG::",get_full_name()},
                                 "NO_REG_TESTS", 1);
   endfunction: build

   `uvm_object_utils(reg_B_CTL)

endclass : reg_B_CTL


class reg_block_B extends uvm_reg_block;
   rand reg_B_R R;
   rand reg_B_CTL CTL;
   rand uvm_reg_field F;

   function new(string name = "B");
      super.new(name,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();

      // create regs
      R   =   reg_B_R::type_id::create("R");
      CTL = reg_B_CTL::type_id::create("CTL");

      // build regs
      R.build   ();
      R.configure(this, null, "R");
      CTL.build ();
      CTL.configure(this, null);

      // create map
      default_map = create_map("default_map", 'h0, 1, UVM_LITTLE_ENDIAN);
      default_map.add_reg(R, 'h0, "RW");
      default_map.add_reg(CTL, 'h1, "RW");

      // assign field aliases
      F = R.F;
   endfunction : build

   `uvm_object_utils(reg_block_B)

endclass : reg_block_B


`endif

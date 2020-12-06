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

class reg_reg_R extends uvm_reg;
   rand uvm_reg_field F;

   function new(string name = "R");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();
      this.F = uvm_reg_field::type_id::create("F");
      this.F.configure(this, 8, 0, "RW", 0, 8'h0, 1, 0, 1);
   endfunction: build

   `uvm_object_utils(reg_reg_R)
   
endclass : reg_reg_R


class reg_block_B extends uvm_reg_block;
   rand reg_reg_R A;
   rand reg_reg_R X;
   rand reg_reg_R W;

   uvm_reg_map APB;
   uvm_reg_map WSH;
   
   function new(string name = "B");
      super.new(name,UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      APB = create_map("APB", 'h0, 1, UVM_LITTLE_ENDIAN);
      WSH = create_map("WSH", 'h0, 1, UVM_LITTLE_ENDIAN);
      default_map = APB;

      this.A = reg_reg_R::type_id::create("A");
      this.X = reg_reg_R::type_id::create("X");
      this.W = reg_reg_R::type_id::create("W");

      this.A.configure(this, null);
      this.A.build();
      this.X.configure(this, null);
      this.X.build();
      this.W.configure(this, null);
      this.W.build();

      APB.add_reg(A, 'h0,  "RW");
      APB.add_reg(X, 'h10, "RW");

      WSH.add_reg(X, 'h0,  "RW");
      WSH.add_reg(W, 'h10, "RW");

      this.lock_model();
   endfunction : build
   
   `uvm_object_utils(reg_block_B)
   
endclass : reg_block_B



`endif

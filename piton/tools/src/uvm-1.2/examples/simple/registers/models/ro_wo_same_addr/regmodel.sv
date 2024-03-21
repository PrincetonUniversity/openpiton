// 
// -------------------------------------------------------------
//    Copyright 2010-2011 Synopsys, Inc.
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
// This example demonstrates how to model a register containing
// read-only fields and a register containing write-only fields
// at the same physical address.
//

class reg_RO extends uvm_reg;
   uvm_reg_field F1;
   uvm_reg_field F2;

   function new(string name = "RO");
      super.new(name, 32, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();
      F1 = uvm_reg_field::type_id::create("F1");
      F1.configure(this, 8, 0, "RO", 0, 8'h00, 1, 0, 1);
      F2 = uvm_reg_field::type_id::create("F2");
      F2.configure(this, 8, 16, "RC", 0, 8'hFF, 1, 0, 1);
   endfunction: build

   `uvm_object_utils(reg_RO)
   
endclass : reg_RO


class reg_WO extends uvm_reg;
   rand uvm_reg_field F1;
   rand uvm_reg_field F2;

   function new(string name = "WO");
      super.new(name, 32, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();
      F1 = uvm_reg_field::type_id::create("F1");
      F1.configure(this, 8, 4, "WO", 0, 8'hAA, 1, 1, 1);
      F2 = uvm_reg_field::type_id::create("F2");
      F2.configure(this, 12, 12, "WO", 0, 12'hCCC, 1, 1, 1);
   endfunction: build

   `uvm_object_utils(reg_WO)
   
endclass : reg_WO


class block_B extends uvm_reg_block;
   rand reg_RO R;
   rand reg_WO W;

   function new(string name = "B");
      super.new(name, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 4, UVM_BIG_ENDIAN);

      R = reg_RO::type_id::create("R");
      R.configure(this, null, "R_reg");
      R.build();

      W = reg_WO::type_id::create("W");
      W.configure(this, null, "W_reg");
      W.build();

      default_map.add_reg(R, 'h100,  "RO");
      default_map.add_reg(W, 'h100,  "WO");
   endfunction : build
   
   `uvm_object_utils(block_B)
   
endclass : block_B

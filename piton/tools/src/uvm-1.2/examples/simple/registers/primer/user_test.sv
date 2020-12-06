// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010 Cadence Design Systems, Inc.
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

class user_test_seq extends uvm_reg_sequence;

   function new(string name="user_test_seq");
      super.new(name);
   endfunction : new

   rand bit   [31:0] addr;
   rand logic [31:0] data;
   
   `uvm_object_utils(user_test_seq)
   
   virtual task body();
      reg_block_slave model;

      $cast(model, this.model);
      
      // Randomize the content of 10 random indexed registers
      repeat (10) begin
         bit [7:0]         idx = $urandom;
         uvm_reg_data_t    data = $urandom;
         uvm_status_e status;

         model.TABLES[idx].write(status, data, .parent(this));
      end

      // Find which indexed registers are non-zero
      foreach (model.TABLES[i]) begin
         uvm_reg_data_t    data;
         uvm_status_e status;
         
         model.TABLES[i].read(status, data);
         if (data != 0) $write("TABLES[%0d] is 0x%h...\n", i, data);
      end
   endtask : body

endclass : user_test_seq




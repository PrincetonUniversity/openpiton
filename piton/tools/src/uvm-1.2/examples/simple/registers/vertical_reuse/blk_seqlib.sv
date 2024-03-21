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

class blk_R_test_seq extends uvm_reg_sequence;

   `uvm_object_utils(blk_R_test_seq)

   function new(string name = "blk_R_test_seq");
      super.new(name);
   endfunction: new

   reg_block_B model;

   virtual task body();
      uvm_status_e status;
      uvm_reg_data_t    data;
      int n;

      // Initialize R with a random value then check against mirror
      data[7:0] = $urandom();
      model.R.write(status, data, .parent(this));
      model.R.mirror(status, UVM_CHECK, .parent(this));

      // Perform a random number of INC operations
      n = ($urandom() % 7) + 3;
      `uvm_info("blk_R_test_seq", $sformatf("Incrementing R %0d times...", n), UVM_NONE);
      repeat (n) begin
         model.CTL.write(status, reg_fld_B_CTL_CTL::INC, .parent(this));
         data++;
         void'(model.R.predict(data));
      end
      // Check the final value
      model.R.mirror(status, UVM_CHECK, .parent(this));

      // Perform a random number of DEC operations
      n = ($urandom() % 8) + 2;
      `uvm_info("blk_R_test_seq", $sformatf("Decrementing R %0d times...", n), UVM_NONE);
      repeat (n) begin
         model.CTL.write(status, reg_fld_B_CTL_CTL::DEC, .parent(this));
         data--;
         void'(model.R.predict(data));
      end
      // Check the final value
      model.R.mirror(status, UVM_CHECK, .parent(this));

      // Reset the register and check
      model.CTL.write(status, reg_fld_B_CTL_CTL::CLR, .parent(this));
      void'(model.R.predict(0));
      model.R.mirror(status, UVM_CHECK, .parent(this));
   endtask
   
endclass

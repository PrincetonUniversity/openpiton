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


// This example uses the reg/mem write/read convenience API in the
// base sequence class. The convenience methods provide the ~parent~
// argument for you when calling the corresponding method in the
// register or memory. 

class blk_R_test_seq extends uvm_reg_sequence;

   `uvm_object_utils(blk_R_test_seq)

   function new(string name = "blk_R_test_seq");
      super.new(name);
   endfunction: new

   reg_block_B model;

   virtual task body();
      uvm_status_e status;
      uvm_reg_data_t data, rd_data;
      int n;

      // Initialize R with a random value then check against mirror
      data[7:0] = $urandom();

      write_reg(model.R, status, data);
      read_reg (model.R, status, rd_data);

      if (data != rd_data)
        `uvm_error("MISCOMPARE","Unexpected value on read")

      model.R.set(23);
      update_reg(model.R, status);
      mirror_reg(model.R, status, UVM_CHECK);

      data[7:0] = $urandom();

      poke_reg(model.R, status, data);
      peek_reg(model.R, status, rd_data);

      if (data != rd_data)
        `uvm_error("MISCOMPARE","Unexpected value on peek")

      // Perform a random number of INC operations
      n = ($urandom() % 7) + 3;
      `uvm_info("blk_R_test_seq", $sformatf("Incrementing R %0d times...", n), UVM_NONE);
      repeat (n) begin
         write_reg(model.CTL, status, reg_fld_B_CTL_CTL::INC);
         data++;
         void'(model.R.predict(data));
      end
      // Check the final value
      mirror_reg(model.R, status, UVM_CHECK);

      // Perform a random number of DEC operations
      n = ($urandom() % 8) + 2;
      `uvm_info("blk_R_test_seq", $sformatf("Decrementing R %0d times...", n), UVM_NONE);
      repeat (n) begin
         write_reg(model.CTL, status, reg_fld_B_CTL_CTL::DEC);
         data--;
         void'(model.R.predict(data));
      end
      // Check the final value
      mirror_reg(model.R, status, UVM_CHECK);

      // Reset the register and check
      write_reg(model.CTL, status, reg_fld_B_CTL_CTL::CLR);
      void'(model.R.predict(0));
      mirror_reg(model.R, status, UVM_CHECK);
   endtask
   
endclass

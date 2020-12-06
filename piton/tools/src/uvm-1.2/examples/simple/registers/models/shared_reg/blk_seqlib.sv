// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
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

class blk_AXW_test_seq extends uvm_reg_sequence;

   `uvm_object_utils(blk_AXW_test_seq)

   reg_block_B model;

   function new(string name = "blk_AXW_test_seq");
      super.new(name);
   endfunction: new

   virtual task body();
      uvm_status_e status;
      uvm_reg_data_t    data;
      int n;

      // Write all three registers at once. W will be written concurrently with
      // A or X because W will go across the WSH bus, whereas A and X both go
      // across the APB bus and must therefore execute sequentially. It the
      // responsibility of the DUT to handle concurrent accesses across
      // two different interfaces.
      fork
      model.A.write(status, 'h33, .parent(this));
      model.X.write(status, 'h44, .parent(this));
      model.W.write(status, 'hcc, .parent(this));
      join

      // Write A to random value via default map (APB), then check against mirror
      data[7:0] = $urandom();
      model.A.write(status, data, .parent(this));
      model.A.mirror(status, UVM_CHECK, .parent(this));

      // Write ~A to X via APB interface, then check via WSH interface
      model.X.write(status, ~model.A.get(), .map(model.APB), .parent(this));
      model.X.mirror(status, UVM_CHECK, .map(model.WSH), .parent(this));

      // Write ~X to W via default map (APB), then check
      model.W.write(status, ~model.X.get(), .parent(this));
      model.W.mirror(status, UVM_CHECK, .parent(this));

      // W should now be equal to A
      if (model.W.get() !== data) begin
         `uvm_error("test", $sformatf("W == 'h%h != 'h%h", model.X.get(), data));
      end
   endtask
   
endclass

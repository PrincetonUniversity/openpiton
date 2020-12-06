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

class sys_R_test_seq extends uvm_reg_sequence;

   `uvm_object_utils(sys_R_test_seq)

   function new(string name = "sys_R_test_seq");
      super.new(name);
   endfunction: new

   reg_sys_S model;

   virtual task body();

     if (model == null) begin
       `uvm_fatal("NO_REG","RegModel model handle is null")
       return;
     end

     for (int i=0; i < 2; i++)
       start_blk_seq(i);

     wait fork;

   endtask

   virtual task start_blk_seq(int i);
      fork begin
        blk_R_test_seq seq;
        seq = blk_R_test_seq::type_id::create($sformatf("blk_seq%0d",i),,get_full_name());
        seq.model = model.B[i];
        seq.start(null,this);
      end join_none
   endtask

endclass


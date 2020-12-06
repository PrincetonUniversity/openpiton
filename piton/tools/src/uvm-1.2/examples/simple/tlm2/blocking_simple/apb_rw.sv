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


class apb_rw extends uvm_sequence_item;
  
   typedef enum {READ, WRITE} kind_e;
   rand bit   [31:0] addr;
   rand logic [31:0] data;
   rand kind_e kind;  
 
   `uvm_object_utils_begin(apb_rw)
     `uvm_field_int(addr, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_int(data, UVM_ALL_ON | UVM_NOPACK);
     `uvm_field_enum(kind_e,kind, UVM_ALL_ON | UVM_NOPACK);
   `uvm_object_utils_end
   
   function new (string name = "apb_rw");
      super.new(name);
   endfunction

   function string convert2string();
     return $sformatf("kind=%s addr=%0h data=%0h",kind,addr,data);
   endfunction

endclass: apb_rw

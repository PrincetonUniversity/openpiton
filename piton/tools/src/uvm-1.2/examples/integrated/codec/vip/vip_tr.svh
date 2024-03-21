// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
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


class vip_tr extends uvm_sequence_item;
  
   rand bit   [7:0] chr;
   `uvm_object_utils_begin(vip_tr)
     `uvm_field_int(chr, UVM_ALL_ON);
   `uvm_object_utils_end
   
   function new (string name = "vip_tr");
      super.new(name);
   endfunction

   function string convert2string();
     return $sformatf("0x%0h", chr);
   endfunction

endclass: vip_tr

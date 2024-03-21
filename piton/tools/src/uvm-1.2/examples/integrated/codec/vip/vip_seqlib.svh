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


virtual class vip_sequence extends uvm_sequence#(vip_tr);

  function new(string name);
     super.new(name);
     set_automatic_phase_objection(1);
  endfunction
  
endclass


class vip_one_char_seq extends vip_sequence;

  `uvm_object_utils(vip_one_char_seq)
   
  function new(string name="vip_one_char_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do(req)
  endtask
  
endclass


class vip_sentence_seq extends vip_sequence;

  `uvm_object_utils(vip_sentence_seq)

  function new(string name="vip_sentence_seq");
    super.new(name);
  endfunction
  
  virtual task body();
     repeat (128) begin
        `uvm_do(req)
     end
  endtask
  
endclass


class vip_idle_esc_seq extends vip_sequence;

  `uvm_object_utils(vip_idle_esc_seq)

  function new(string name="vip_idle_esc_seq");
    super.new(name);
  endfunction
  
  virtual task body();
     repeat (128) begin
        `uvm_do_with(req, {chr inside {8'hE7, 8'h81}; })
     end
  endtask
  
endclass

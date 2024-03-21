//----------------------------------------------------------------------
//   Copyright 2010 Mentor Graphics Corporation
//   Copyright 2010-2011 Synopsys, Inc
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
//----------------------------------------------------------------------

class tb_env extends uvm_component;

   `uvm_component_utils(tb_env)

   initiator master;
   target    slave;

   function new(string name = "tb_env", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      master = initiator::type_id::create("master", this);
      slave  = target::type_id::create("slave", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      master.sock.connect(slave.sock);
   endfunction

endclass

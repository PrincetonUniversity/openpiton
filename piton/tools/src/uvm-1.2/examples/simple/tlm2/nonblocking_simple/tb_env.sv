//----------------------------------------------------------------------
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

   host hst;
   device dev;

   function new(string name = "tb_env", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      hst = host::type_id::create("hst", this);
      dev = device::type_id::create("dev", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      hst.sock.connect(dev.sock);
   endfunction

endclass

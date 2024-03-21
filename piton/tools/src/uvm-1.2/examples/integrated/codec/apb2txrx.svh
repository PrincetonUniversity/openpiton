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


class apb2txrx extends uvm_component;

   uvm_analysis_imp#(apb_rw, apb2txrx) apb;

   uvm_analysis_port#(vip_tr) tx_ap;
   uvm_analysis_port#(vip_tr) rx_ap;

   `uvm_component_utils(apb2txrx)

   int radd;
   int wadd;

   function new(string name, uvm_component parent = null);
      super.new(name, parent);
      apb   = new("apb", this);
      tx_ap = new("tx_ap", this);
      rx_ap = new("rx_ap", this);

      radd = 'h0100;
      wadd = 'h0100;
   endfunction


   function void build_phase(uvm_phase phase);
      void'(uvm_config_db#(int)::get(this, "", "radd", radd));
      void'(uvm_config_db#(int)::get(this, "", "wadd", wadd));
   endfunction


   function void write(apb_rw rw);
      vip_tr tr;

      // R from 'radd' are Rx characters
      if (rw.kind == apb_rw::READ && rw.addr == radd) begin
         tr = vip_tr::type_id::create("rx",,get_full_name());
         tr.chr = rw.data;
         rx_ap.write(tr);
      end
      
      // W from 'wadd' are Tx characters
      if (rw.kind == apb_rw::WRITE && rw.addr == wadd) begin
         tr = vip_tr::type_id::create("tx",,get_full_name());
         tr.chr = rw.data;
         tx_ap.write(tr);
      end
   endfunction

endclass

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

`include "regmodel.sv"

class tb_env extends uvm_env;

   `uvm_component_utils(tb_env)

   block_soc   regmodel;
   apb_agent   apb;
   uvm_reg_predictor#(apb_rw) predict;

   function new(string name = "tb_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void build_phase(uvm_phase phase);
      if (regmodel == null) begin
         regmodel = block_soc::type_id::create("regmodel");
         regmodel.build();
         regmodel.lock_model();
      end

      apb = apb_agent::type_id::create("apb", this);
      predict = uvm_reg_predictor#(apb_rw)::type_id::create("predict", this);

  endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      if (regmodel.get_parent() == null) begin

        reg2apb_adapter apb_adapter  = new("apb_adapter");
        regmodel.default_map.set_sequencer(apb.sqr, apb_adapter);
        regmodel.default_map.set_auto_predict(0);

        apb.mon.ap.connect(predict.bus_in);

        predict.map = regmodel.default_map;
        predict.adapter = apb_adapter;
      end
   endfunction

endclass

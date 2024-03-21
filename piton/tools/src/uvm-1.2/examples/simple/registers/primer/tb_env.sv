// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
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

class tb_env extends uvm_component;

    `uvm_component_utils(tb_env)

    reg_block_slave model; 
    apb_agent apb;

    function new(string name, uvm_component parent=null);
        super.new(name,parent);
    endfunction

   virtual function void build_phase(uvm_phase phase);
        if (model == null) begin
            model = reg_block_slave::type_id::create("model",this);
            model.build();
            model.lock_model();
        end
         
        apb = apb_agent::type_id::create("apb", this);
    endfunction

   virtual function void connect_phase(uvm_phase phase);
        if (model.get_parent() == null) begin
            reg2apb_adapter reg2apb = new;
            model.default_map.set_sequencer(apb.sqr,reg2apb);
            model.default_map.set_auto_predict(1);

         
        end
    endfunction
    
    virtual function void end_of_elaboration();
        model.print();
    endfunction
                      
endclass


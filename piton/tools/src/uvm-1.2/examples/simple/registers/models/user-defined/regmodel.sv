// 
// -------------------------------------------------------------
//    Copyright 2010-2011 Synopsys, Inc.
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

//
// This example demonstrates how to include a user-defined register
// in a register model.
//

//
// The user_acp_reg has a user-defined behavior
//
// It increments by 1 after every write
//
class user_acp_incr_on_write_cbs extends uvm_reg_cbs;

   virtual function void post_predict(input uvm_reg_field  fld,
                                      input uvm_reg_data_t previous,
                                      inout uvm_reg_data_t value,
                                      input uvm_predict_e  kind,
                                      input uvm_path_e     path,
                                      input uvm_reg_map    map);
      if (kind != UVM_PREDICT_WRITE) return;
      if (path != UVM_FRONTDOOR) return;

      value = previous + 1;
   endfunction
   
endclass


class user_acp_reg extends uvm_reg;

   local uvm_reg_field value;

   `uvm_object_utils(user_acp_reg)

   function new(string name = "user_acp_reg");
      super.new(name,16,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      value = uvm_reg_field::type_id::create("value",,get_full_name());
      value.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 0, 0);
      value.set_compare(UVM_NO_CHECK);

      uvm_resource_db#(bit)::set({"REG::",get_full_name()},
                                 "NO_REG_BIT_BASH_TEST", 1);
      uvm_resource_db#(bit)::set({"REG::",get_full_name()},
                                 "NO_REG_ACCESS_TEST", 1);

      begin
         user_acp_incr_on_write_cbs cb = new;
         uvm_reg_field_cb::add(value, cb);
      end
   endfunction: build


   virtual task pre_write(uvm_reg_item rw);
      uvm_reg_data_t m_data;
      uvm_reg rg;

      assert($cast(rg,rw.element));

      // Predict the value that will be in the register
      m_data = rg.get() + 1;
      
      // If a backdoor write is used, replace the value written
      // with the incremented value to emulate the front-door
      if (rw.path == UVM_BACKDOOR)
         rw.value[0] = m_data;
   endtask: pre_write

endclass : user_acp_reg


class block_B extends uvm_reg_block;
   user_acp_reg user_acp;

   `uvm_object_utils(block_B)
   
   function new(string name = "B");
      super.new(name, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 1, UVM_BIG_ENDIAN);

      user_acp = user_acp_reg::type_id::create("user_acp",,get_full_name());
      user_acp.configure(this, null, "acp");
      user_acp.build();

      default_map.add_reg(user_acp, 'h0000,  "RW");
   endfunction : build

endclass : block_B

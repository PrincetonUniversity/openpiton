// 
// -------------------------------------------------------------
//    Copyright 2010-2011 Synopsys, Inc.
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
// This example demonstrates how to model aliased registers
// i.e. registers that are present at two physical addresses,
// possibily with different access policies.
//
// In this case, we have a register "R" which is known under two names
// "Ra" and "Rb". When accessed as "Ra", field F2 is RO.
//

typedef class reg_Rb;

class reg_Ra extends uvm_reg;
   rand uvm_reg_field F1;
   rand uvm_reg_field F2;

   function new(string name = "Ra");
      super.new(name, 32, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();
      F1 = uvm_reg_field::type_id::create("F1");
      F1.configure(this, 8, 0, "RW", 0, 8'h0, 1, 0, 1);
      F2 = uvm_reg_field::type_id::create("F2");
      F2.configure(this, 8, 16, "RO", 0, 8'h0, 1, 0, 1);
   endfunction: build

   `uvm_object_utils(reg_Ra)
   
endclass : reg_Ra


class reg_Rb extends uvm_reg;
   rand uvm_reg_field F1;
   rand uvm_reg_field F2;

   function new(string name = "Rb");
      super.new(name, 32, UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      F1 = uvm_reg_field::type_id::create("F1");
      F1.configure(this, 8, 0, "RW", 0, 8'h0, 1, 0, 1);
      F2 = uvm_reg_field::type_id::create("F2");
      F2.configure(this, 8, 16, "RW", 0, 8'h0, 1, 0, 1);
   endfunction: build

   `uvm_object_utils(reg_Rb)
   
endclass : reg_Rb


class write_also_to_F extends uvm_reg_cbs;
   local uvm_reg_field m_toF;

   function new(uvm_reg_field toF);
      m_toF = toF;
   endfunction
   
   virtual function void post_predict(input uvm_reg_field  fld,
                                      input uvm_reg_data_t previous,
                                      inout uvm_reg_data_t value,
                                      input uvm_predict_e  kind,
                                      input uvm_path_e     path,
                                      input uvm_reg_map    map);
      if (kind != UVM_PREDICT_WRITE) return;

      void'(m_toF.predict(value, -1, UVM_PREDICT_DIRECT, path, map));
   endfunction
   
endclass


class alias_RaRb extends uvm_object;
   protected reg_Ra m_Ra;
   protected reg_Rb m_Rb;

   `uvm_object_utils(alias_RaRb)
   
   function new(string name = "alias_RaRb");
      super.new(name);
   endfunction: new

   function void configure(reg_Ra Ra, reg_Rb Rb);
      write_also_to_F F2F;

      m_Ra = Ra;
      m_Rb = Rb;
      
      F2F = new(Ra.F1);
      uvm_reg_field_cb::add(Rb.F1, F2F);
      F2F = new(Ra.F2);
      uvm_reg_field_cb::add(Rb.F2, F2F);
      F2F = new(Rb.F1);
      uvm_reg_field_cb::add(Ra.F1, F2F);
   endfunction : configure
endclass : alias_RaRb


class block_B extends uvm_reg_block;
   rand reg_Ra Ra;
   rand reg_Rb Rb;

   function new(string name = "B");
      super.new(name,UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 4, UVM_BIG_ENDIAN);

      Ra = reg_Ra::type_id::create("Ra");
      Ra.configure(this, null);
      Ra.build();

      Rb = reg_Rb::type_id::create("Rb");
      Rb.configure(this, null);
      Rb.build();

      default_map.add_reg(Ra, 'h0,  "RW");
      default_map.add_reg(Rb, 'h100,  "RW");

      begin
         alias_RaRb RaRb;

         RaRb = alias_RaRb::type_id::create("RaRb",,get_full_name());;
         RaRb.configure(Ra, Rb);
      end
   endfunction : build
   
   `uvm_object_utils(block_B)
   
endclass : block_B

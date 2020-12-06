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
// This example demonstrates how to include a coverage model
// in a register model.
//
// Three coverage models are included:
//   - Register level coverage
//   - Address-leel coverage
//   - Field value coverage
//
// This example demonstrates *how* to integrate a coverage model
// in a UVM Register model. The details of the coverage model itself
// are generator-specific and outside the scope of UVM.
//

class reg_R extends uvm_reg;
   rand uvm_reg_field F1;
   rand uvm_reg_field F2;

   local uvm_reg_data_t m_current;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

   covergroup cg_bits;
      wF1_0: coverpoint {m_current[0],m_data[0]} iff (!m_is_read && m_be[0]);
      wF1_1: coverpoint {m_current[1],m_data[1]} iff (!m_is_read && m_be[0]);
      wF1_2: coverpoint {m_current[2],m_data[2]} iff (!m_is_read && m_be[0]);
      wF1_3: coverpoint {m_current[3],m_data[3]} iff (!m_is_read && m_be[0]);
      wF2_0: coverpoint {m_current[4],m_data[4]} iff (!m_is_read && m_be[0]);
      wF2_1: coverpoint {m_current[5],m_data[5]} iff (!m_is_read && m_be[0]);
      wF2_2: coverpoint {m_current[6],m_data[6]} iff (!m_is_read && m_be[0]);
      wF2_3: coverpoint {m_current[7],m_data[7]} iff (!m_is_read && m_be[0]);
   endgroup
   
   covergroup cg_vals;
      F1: coverpoint F1.value[3:0];
      F2: coverpoint F2.value[3:0];
      F1F2: cross F1, F2;
   endgroup
   
   
   function new(string name = "reg_R");
      super.new(name, 8, build_coverage(UVM_CVR_REG_BITS +
                                        UVM_CVR_FIELD_VALS));
      if (has_coverage(UVM_CVR_REG_BITS))
         cg_bits = new();
      if (has_coverage(UVM_CVR_FIELD_VALS))
         cg_vals = new();
   endfunction: new
   
   virtual function void build();
      F1 = uvm_reg_field::type_id::create("F1",,get_full_name());
      F1.configure(this, 4, 0, "RW", 0, 8'h0, 1, 1, 1);
      F2 = uvm_reg_field::type_id::create("F2",,get_full_name());
      F2.configure(this, 4, 4, "RO", 0, 8'h0, 1, 1, 1);
   endfunction: build

   `uvm_object_utils(reg_R)


   virtual function void sample(uvm_reg_data_t data,
                                uvm_reg_data_t byte_en,
                                bit            is_read,
                                uvm_reg_map    map);
      if (get_coverage(UVM_CVR_REG_BITS)) begin
         m_current = get();
         m_data    = data;
         m_be      = byte_en;
         m_is_read = is_read;
         cg_bits.sample();
      end
   endfunction

   virtual function void sample_values();
      super.sample_values();

      if (get_coverage(UVM_CVR_FIELD_VALS))
         cg_vals.sample();
   endfunction
endclass : reg_R



class mem_M extends uvm_mem;
   local uvm_reg_addr_t m_offset;

   covergroup cg_addr;
      MIN_MID_MAX: coverpoint m_offset
         {
            bins MIN = {0};
            bins MID = {[1:1022]};
            bins MAX = {1023};
         }
   endgroup

   function new(string name = "mem_M");
      super.new(name, 1024, 8, "RW", build_coverage(UVM_CVR_ADDR_MAP));
      if (has_coverage(UVM_CVR_ADDR_MAP))
         cg_addr = new();
   endfunction: new
   
   `uvm_object_utils(mem_M)
   
   virtual function void sample(uvm_reg_addr_t offset,
                                bit            is_read,
                                uvm_reg_map    map);
      if (get_coverage(UVM_CVR_ADDR_MAP)) begin
         m_offset  = offset;
         cg_addr.sample();
      end
   endfunction

endclass : mem_M



class block_B extends uvm_reg_block;
   rand reg_R Ra;
   rand reg_R Rb;

   mem_M M;

   local uvm_reg_addr_t m_offset;

   covergroup cg_addr;
      Ra: coverpoint m_offset
         {
            bins hit = {'h0000};
         }
      Rb: coverpoint m_offset
         {
            bins hit = {'h0100};
         }
      M: coverpoint m_offset
         {
            bins MIN = {'h2000};
            bins MAX = {'h23FF};
         }
   endgroup

   covergroup cg_vals;
      Ra: coverpoint Ra.F1.value[3:0];
      Rb: coverpoint Rb.F1.value[3:0];
      RaRb: cross Ra, Rb;
   endgroup
   
   
   function new(string name = "B");
      super.new(name, build_coverage(UVM_CVR_ADDR_MAP+UVM_CVR_FIELD_VALS));
      if (has_coverage(UVM_CVR_ADDR_MAP))
         cg_addr = new();
      if (has_coverage(UVM_CVR_FIELD_VALS))
         cg_vals = new();
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 4, UVM_BIG_ENDIAN, 0);

      Ra = reg_R::type_id::create("Ra",,get_full_name());
      Ra.configure(this, null);
      Ra.build();

      Rb = reg_R::type_id::create("Rb",,get_full_name());
      Rb.configure(this, null);
      Rb.build();

      M = mem_M::type_id::create("M",,get_full_name());
      M.configure(this);

      default_map.add_reg(Ra, 'h0000,  "RW");
      default_map.add_reg(Rb, 'h0100,  "RW");
      default_map.add_mem(M,  'h2000,  "RW");

   endfunction : build
   
   `uvm_object_utils(block_B)
   
   virtual function void sample(uvm_reg_addr_t offset,
                                bit            is_read,
                                uvm_reg_map    map);
      if (get_coverage(UVM_CVR_ADDR_MAP)) begin
         m_offset  = offset;
         cg_addr.sample();
      end
   endfunction

   virtual function void sample_values();
      super.sample_values();

      if (get_coverage(UVM_CVR_FIELD_VALS))
         cg_vals.sample();
   endfunction
endclass : block_B

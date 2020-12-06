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

//
// This example demonstrates how to model broadcast addresses
// in a register model.
//

class bcast_on_write_cbs extends uvm_reg_cbs;

   uvm_reg_field bcast_to[];

   virtual function void post_predict(input uvm_reg_field  fld,
                                      input uvm_reg_data_t previous,
                                      inout uvm_reg_data_t value,
                                      input uvm_predict_e  kind,
                                      input uvm_path_e     path,
                                      input uvm_reg_map    map);
      if (kind != UVM_PREDICT_WRITE) return;

      foreach (bcast_to[i]) begin
         void'(bcast_to[i].predict(value, .path(path)));
      end
   endfunction
   
endclass


class mode_reg extends uvm_reg;

   uvm_reg_field value;

   `uvm_object_utils(mode_reg)

   function new(string name = "mode_reg");
      super.new(name, 3, UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      value = uvm_reg_field::type_id::create("value",,get_full_name());
      value.configure(this, 3, 0, "RW", 0, 3'h0, 1, 0, 0);
   endfunction: build
endclass


class rate_reg extends uvm_reg;

   uvm_reg_field value;

   `uvm_object_utils(rate_reg)

   function new(string name = "rate_reg");
      super.new(name, 8, UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      value = uvm_reg_field::type_id::create("value",,get_full_name());
      value.configure(this, 8, 0, "RW", 0, 8'h00, 1, 0, 0);
   endfunction: build
endclass


class block_blk extends uvm_reg_block;
   mode_reg mode;
   rate_reg rate;

   `uvm_object_utils(block_blk)
   
   function new(string name = "blk");
      super.new(name, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 1, UVM_BIG_ENDIAN);

      mode = mode_reg::type_id::create("mode",,get_full_name());
      mode.configure(this, null, "mode");
      mode.build();
      default_map.add_reg(mode, 'h0000,  "RW");

      rate = rate_reg::type_id::create("rate",,get_full_name());
      rate.configure(this, null, "rate");
      rate.build();
      default_map.add_reg(rate, 'h0004,  "RW");
   endfunction

endclass


class block_soc extends uvm_reg_block;
   block_blk blk[3];
   block_blk all_blks;

   `uvm_object_utils(block_soc)
   
   function new(string name = "soc");
      super.new(name, UVM_NO_COVERAGE);
   endfunction: new
   
   virtual function void build();

      default_map = create_map("", 0, 1, UVM_BIG_ENDIAN);

      blk[0] = block_blk::type_id::create("blk[0]",,get_full_name());
      blk[0].configure(this, "blk0");
      blk[0].build();
      default_map.add_submap(blk[0].default_map, 'h0000_0000);

      blk[1] = block_blk::type_id::create("blk[1]",,get_full_name());
      blk[1].configure(this, "blk1");
      blk[1].build();
      default_map.add_submap(blk[1].default_map, 'h0100_0000);

      blk[2] = block_blk::type_id::create("blk[2]",,get_full_name());
      blk[2].configure(this, "blk2");
      blk[2].build();
      default_map.add_submap(blk[2].default_map, 'h0200_0000);

      all_blks = block_blk::type_id::create("all_blks",,get_full_name());
      all_blks.configure(this);
      all_blks.build();
      default_map.add_submap(all_blks.default_map, 'h0300_0000);

      all_blks.clear_hdl_path();
      all_blks.add_hdl_path("blk0");
      all_blks.add_hdl_path("blk1");
      all_blks.add_hdl_path("blk2");
      
      begin
         bcast_on_write_cbs cb;

         cb = new;
         uvm_reg_field_cb::add(all_blks.mode.value, cb);
         
         begin
            uvm_reg_field t[3]='{blk[0].mode.value,
                         blk[1].mode.value,
                         blk[2].mode.value};
            cb.bcast_to = t;
         end

         cb = new;
         uvm_reg_field_cb::add(all_blks.rate.value, cb);
         
         begin
             uvm_reg_field t[3]= '{blk[0].rate.value,
                         blk[1].rate.value,
                         blk[2].rate.value};
            cb.bcast_to = t;
         end
      end

      uvm_resource_db#(bit)::set({"REG::",all_blks.get_full_name(),".*"},
                                 "NO_REG_TESTS", 1);
      
   endfunction

endclass

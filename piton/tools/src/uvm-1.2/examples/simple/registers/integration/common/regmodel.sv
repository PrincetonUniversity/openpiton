//
//------------------------------------------------------------------------------
//   Copyright 2011 Mentor Graphics Corporation
//   Copyright 2011 Cadence Design Systems, Inc. 
//   Copyright 2011 Synopsys, Inc.
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
//------------------------------------------------------------------------------


class dut_ID extends uvm_reg;

   uvm_reg_field REVISION_ID;
   uvm_reg_field CHIP_ID;
   uvm_reg_field PRODUCT_ID;

   function new(string name = "dut_ID");
      super.new(name,32,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      this.REVISION_ID = uvm_reg_field::type_id::create("REVISION_ID");
          this.CHIP_ID = uvm_reg_field::type_id::create("CHIP_ID");
       this.PRODUCT_ID = uvm_reg_field::type_id::create("PRODUCT_ID");

      this.REVISION_ID.configure(this, 8,  0, "RO",   0, 8'h03, 1, 0, 1);
          this.CHIP_ID.configure(this, 8,  8, "RO",   0, 8'h5A, 1, 0, 1);
       this.PRODUCT_ID.configure(this, 10, 16,"RO", 0, 10'h176, 1, 0, 1);
   endfunction
   
   `uvm_object_utils(dut_ID)
   
endclass


class dut_DATA extends uvm_reg;

   uvm_reg_field value;
   
   function new(string name = "dut_DATA");
      super.new(name,32,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      this.value = uvm_reg_field::type_id::create("value");
      this.value.configure(this, 32, 0, "RW", 1, 32'h0, 1, 0, 1);
   endfunction

   `uvm_object_utils(dut_DATA)
   
endclass


class dut_SOCKET extends uvm_reg;

   rand uvm_reg_field IP;
   rand uvm_reg_field PORT;
   
   function new(string name = "dut_ADDR");
      super.new(name,64,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      this.IP   = uvm_reg_field::type_id::create("value");
      this.PORT = uvm_reg_field::type_id::create("value");
      
        this.IP.configure(this, 48,  0, "RW", 0, 48'h0, 1, 0, 1);
      this.PORT.configure(this, 16, 48, "RW", 0, 16'h0, 1, 0, 1);
   endfunction
   
   `uvm_object_utils(dut_SOCKET)
   
endclass


class dut_RAM extends uvm_mem;

   function new(string name = "dut_RAM");
      super.new(name,'h400,32,"RW",UVM_NO_COVERAGE);
   endfunction
   
   `uvm_object_utils(dut_RAM)
   
endclass


class dut_regmodel extends uvm_reg_block;

   rand dut_ID       ID;
   rand dut_DATA     DATA;

   rand dut_SOCKET   SOCKET[256];
   
   rand dut_RAM      RAM;

   function new(string name = "slave");
      super.new(name,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();

      // create
      ID        = dut_ID::type_id::create("ID");
      DATA      = dut_DATA::type_id::create("DATA");
      foreach (SOCKET[i])
         SOCKET[i] = dut_SOCKET::type_id::create($sformatf("SOCKET[%0d]",i));
      RAM   = dut_RAM::type_id::create("DMA_RAM");

      // configure
      ID.configure(this,null,"ID");
      ID.build();
      DATA.configure(this,null,"DATA");
      DATA.build();
      foreach (SOCKET[i]) begin
         SOCKET[i].configure(this,null,$sformatf("SOCKET[%0d]",i));
         SOCKET[i].build();
      end
      RAM.configure(this,"DMA");

      // define default map
      default_map = create_map("default_map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);
      default_map.add_reg(ID,   'h0,  "RW");
      default_map.add_reg(DATA, 'h24, "RW");
      foreach (SOCKET[i])
         default_map.add_reg(SOCKET[i], 'h1000 + 16 * i, "RW");
      default_map.add_mem(RAM,  'h2000, "RW");
      
   endfunction
   
   `uvm_object_utils(dut_regmodel)
   
endclass : dut_regmodel

//
//------------------------------------------------------------------------------
//   Copyright 2011 Mentor Graphics Corporation
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

`ifndef REG_SLAVE
`define REG_SLAVE

class reg_slave_ID extends uvm_reg;

   uvm_reg_field REVISION_ID;
   uvm_reg_field CHIP_ID;
   uvm_reg_field PRODUCT_ID;

   function new(string name = "slave_ID");
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
   
   `uvm_object_utils(reg_slave_ID)
   
endclass


class reg_slave_INDEX extends uvm_reg;

   uvm_reg_field value;
   
   function new(string name = "slave_INDEX");
      super.new(name,8,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      this.value = uvm_reg_field::type_id::create("value");
      this.value.configure(this, 8, 0, "RW", 0, 32'h0, 1, 0, 1);
   endfunction

   `uvm_object_utils(reg_slave_INDEX)

endclass


class reg_slave_DATA extends uvm_reg_indirect_data;

   function new(string name = "slave_DATA");
      super.new(name,32,UVM_NO_COVERAGE);
   endfunction

   `uvm_object_utils(reg_slave_DATA)

endclass


class reg_slave_SOCKET extends uvm_reg;

   rand uvm_reg_field IP;
   rand uvm_reg_field PORT;
   
   function new(string name = "slave_ADDR");
      super.new(name,64,UVM_NO_COVERAGE);
   endfunction: new

   virtual function void build();
      this.IP   = uvm_reg_field::type_id::create("IP");
      this.PORT = uvm_reg_field::type_id::create("PORT");
      
        this.IP.configure(this, 48,  0, "RW", 0, 48'h0, 1, 0, 1);
      this.PORT.configure(this, 16, 48, "RW", 0, 16'h0, 1, 0, 1);
   endfunction
   
   `uvm_object_utils(reg_slave_SOCKET)
   
endclass


class reg_slave_SESSION extends uvm_reg_file;

   rand reg_slave_SOCKET SRC;
   rand reg_slave_SOCKET DST;
   
   function new(string name = "slave_SESSION");
      super.new(name);
   endfunction: new

   virtual function void build();
      this.SRC = reg_slave_SOCKET::type_id::create("SRC");
      this.DST = reg_slave_SOCKET::type_id::create("DST");

      this.SRC.configure(get_block(), this, "SRC");
      this.DST.configure(get_block(), this, "DST");

      this.SRC.build();
      this.DST.build();
   endfunction

   virtual function void map(uvm_reg_map    mp,
                             uvm_reg_addr_t offset);
      mp.add_reg(SRC, offset+'h00);
      mp.add_reg(DST, offset+'h08);
   endfunction
   
   virtual function void set_offset(uvm_reg_map    mp,
                               uvm_reg_addr_t offset);
      SRC.set_offset(mp, offset+'h00);
      DST.set_offset(mp, offset+'h08);
   endfunction
   
   `uvm_object_utils(reg_slave_SESSION)
   
endclass


class reg_slave_TABLES extends uvm_reg;

   rand uvm_reg_field value;
   
   function new(string name = "slave_TABLES");
      super.new(name,32,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      this.value = uvm_reg_field::type_id::create("value");
      this.value.configure(this, 32, 0, "RW", 0, 32'h0, 1, 0, 1);
   endfunction

   `uvm_object_utils(reg_slave_TABLES)
   
endclass


class mem_slave_DMA_RAM extends uvm_mem;

   function new(string name = "slave_DMA_RAM");
      super.new(name,'h400,32,"RW",UVM_NO_COVERAGE);
   endfunction
   
   `uvm_object_utils(mem_slave_DMA_RAM)
   
endclass


class reg_block_slave extends uvm_reg_block;

   reg_slave_ID     ID;
   reg_slave_INDEX  INDEX;
   reg_slave_DATA   DATA;

   rand reg_slave_SESSION  SESSION[256];
   
   rand reg_slave_TABLES   TABLES[256];
   
   mem_slave_DMA_RAM  DMA_RAM;

   uvm_reg_field REVISION_ID;
   uvm_reg_field CHIP_ID;
   uvm_reg_field PRODUCT_ID;

   function new(string name = "slave");
      super.new(name,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();

      // create
      ID        = reg_slave_ID::type_id::create("ID");
      INDEX     = reg_slave_INDEX::type_id::create("INDEX");
      DATA      = reg_slave_DATA::type_id::create("DATA");
      foreach (SESSION[i])
         SESSION[i] = reg_slave_SESSION::type_id::create($sformatf("SESSION[%0d]",i));
      foreach (TABLES[i])
         TABLES[i] = reg_slave_TABLES::type_id::create($sformatf("TABLES[%0d]",i));
      DMA_RAM   = mem_slave_DMA_RAM::type_id::create("DMA_RAM");

      // configure
      ID.configure(this,null,"ID");
      ID.build();
      INDEX.configure(this,null,"INDEX");
      INDEX.build();
      foreach (SESSION[i]) begin
         SESSION[i].configure(this,null,$sformatf("SESSION[%0d]",i));
         SESSION[i].build();
      end
      foreach (TABLES[i]) begin
         TABLES[i].configure(this,null,$sformatf("TABLES[%0d]",i));
         TABLES[i].build();
      end
      // the SV LRM IEEE2009 is not clear if an array of class handles can be assigned to another array if the element types 
      // are assignment compatible OR if the LRM states the element types have to be 'equal' (the LRM states equal types)
      // IUS requires per LRM 'equivalent' element types and does not accept assignment compatible types
`ifdef INCA
      begin
      	uvm_reg r[256];
	foreach(TABLES[i])
		r[i]=TABLES[i];

	DATA.configure(INDEX, r, this, null);
      end
`else
      DATA.configure(INDEX, TABLES, this, null);
`endif
     
      DATA.build();
      
      DMA_RAM.configure(this,"");

      // define default map
      default_map = create_map("default_map", 'h0, 4, UVM_LITTLE_ENDIAN);
      default_map.add_reg(ID,    'h0,  "RW");
      default_map.add_reg(INDEX, 'h20, "RW");
      default_map.add_reg(DATA,  'h24, "RW");
      foreach (SESSION[i])
         SESSION[i].map(default_map, 'h1000 + 16 * i);

      default_map.add_mem(DMA_RAM, 'h2000, "RW");
      
      // field handle aliases
      REVISION_ID = ID.REVISION_ID;
      CHIP_ID     = ID.CHIP_ID;
      PRODUCT_ID  = ID.PRODUCT_ID;
   endfunction
   
   `uvm_object_utils(reg_block_slave)
   
endclass : reg_block_slave


`endif

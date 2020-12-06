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


class reg_IntSrc extends uvm_reg;

   uvm_reg_field TxEmpty;
   uvm_reg_field TxLow;
   uvm_reg_field TxFull;
   uvm_reg_field RxEmpty;
   uvm_reg_field RxHigh;
   uvm_reg_field RxFull;
   uvm_reg_field SA;

   function new(string name = "IntSrc");
      super.new(name,9,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      TxEmpty = uvm_reg_field::type_id::create("TxEmpty",,get_full_name());
      TxLow   = uvm_reg_field::type_id::create("TxLow",,get_full_name());
      TxFull  = uvm_reg_field::type_id::create("TxFull",,get_full_name());
      RxEmpty = uvm_reg_field::type_id::create("RxEmpty",,get_full_name());
      RxHigh  = uvm_reg_field::type_id::create("RxHigh",,get_full_name());
      RxFull  = uvm_reg_field::type_id::create("RxFull",,get_full_name());
      SA      = uvm_reg_field::type_id::create("OOSA",,get_full_name());

      TxEmpty.configure(this, 1, 0, "RO", 1, 1'b1, 1, 0, 0);
        TxLow.configure(this, 1, 1, "RO", 1, 1'b1, 1, 0, 0);
       TxFull.configure(this, 1, 2, "RO", 1, 1'b0, 1, 0, 0);
      RxEmpty.configure(this, 1, 4, "RO", 1, 1'b1, 1, 0, 0);
       RxHigh.configure(this, 1, 5, "RO", 1, 1'b0, 1, 0, 0);
       RxFull.configure(this, 1, 6, "RO", 1, 1'b0, 1, 0, 0);
           SA.configure(this, 1, 8, "W1C", 1, 1'b0, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_IntSrc)
   
endclass


class reg_IntMask extends uvm_reg;

   uvm_reg_field TxEmpty;
   uvm_reg_field TxLow;
   uvm_reg_field TxFull;
   uvm_reg_field RxEmpty;
   uvm_reg_field RxHigh;
   uvm_reg_field RxFull;
   uvm_reg_field SA;

   function new(string name = "IntMask");
      super.new(name,9,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      TxEmpty = uvm_reg_field::type_id::create("TxEmpty",,get_full_name());
      TxLow   = uvm_reg_field::type_id::create("TxLow",,get_full_name());
      TxFull  = uvm_reg_field::type_id::create("TxFull",,get_full_name());
      RxEmpty = uvm_reg_field::type_id::create("RxEmpty",,get_full_name());
      RxHigh  = uvm_reg_field::type_id::create("RxHigh",,get_full_name());
      RxFull  = uvm_reg_field::type_id::create("RxFull",,get_full_name());
      SA      = uvm_reg_field::type_id::create("OOSA",,get_full_name());

      TxEmpty.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
        TxLow.configure(this, 1, 1, "RW", 0, 1'b0, 1, 0, 0);
       TxFull.configure(this, 1, 2, "RW", 0, 1'b0, 1, 0, 0);
      RxEmpty.configure(this, 1, 4, "RW", 0, 1'b0, 1, 0, 0);
       RxHigh.configure(this, 1, 5, "RW", 0, 1'b0, 1, 0, 0);
       RxFull.configure(this, 1, 6, "RW", 0, 1'b0, 1, 0, 0);
           SA.configure(this, 1, 8, "RW", 0, 1'b0, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_IntMask)
   
endclass


class reg_TxStatus extends uvm_reg;

   uvm_reg_field TxEn;

   function new(string name = "TxStatus");
      super.new(name,1,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      TxEn = uvm_reg_field::type_id::create("TxEn",,get_full_name());
      TxEn.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_TxStatus)
   
endclass


class reg_TxLWM extends uvm_reg;

   uvm_reg_field TxLWM;

   function new(string name = "TxLWM");
      super.new(name,5,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      TxLWM = uvm_reg_field::type_id::create("TxLWM",,get_full_name());
      TxLWM.configure(this, 5, 0, "RW", 0, 5'd8, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_TxLWM)
   
endclass


class reg_RxStatus extends uvm_reg;

   uvm_reg_field RxEn;
   uvm_reg_field Align;

   function new(string name = "RxStatus");
      super.new(name,2,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      RxEn = uvm_reg_field::type_id::create("RxEn",,get_full_name());
      RxEn.configure(this, 1, 0, "RW", 0, 1'b0, 1, 0, 0);

      Align = uvm_reg_field::type_id::create("Align",,get_full_name());
      Align.configure(this, 1, 1, "RO", 0, 1'b0, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_RxStatus)
   
endclass


class reg_RxHWM extends uvm_reg;

   uvm_reg_field RxHWM;

   function new(string name = "RxHWM");
      super.new(name,5,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      RxHWM = uvm_reg_field::type_id::create("RxHWM",,get_full_name());
      RxHWM.configure(this, 5, 0, "RW", 0, 5'd16, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_RxHWM)
   
endclass


class reg_TxRx extends uvm_reg;

   uvm_reg_field TxRx;
      
   function new(string name = "TxRx");
      super.new(name,8,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();
      TxRx = uvm_reg_field::type_id::create("TxRx",,get_full_name());
      TxRx.configure(this, 8, 0, "RW", 1, 8'h00, 1, 0, 0);
   endfunction
   
   `uvm_object_utils(reg_TxRx)
   
endclass


class reg_dut extends uvm_reg_block;

   reg_IntSrc     IntSrc;
   reg_IntMask    IntMask;
   reg_TxStatus   TxStatus;
   reg_TxLWM      TxLWM;
   reg_RxStatus   RxStatus;
   reg_RxHWM      RxHWM;
   reg_TxRx       TxRx;

   function new(string name = "dut");
      super.new(name,UVM_NO_COVERAGE);
   endfunction

   virtual function void build();

       IntSrc = reg_IntSrc::type_id::create("IntSrc",,get_full_name());
      IntMask = reg_IntMask::type_id::create("IntMask",,get_full_name());
     TxStatus = reg_TxStatus::type_id::create("TxStatus",,get_full_name());
        TxLWM = reg_TxLWM::type_id::create("TxLWM",,get_full_name());
     RxStatus = reg_RxStatus::type_id::create("RxStatus",,get_full_name());
        RxHWM = reg_RxHWM::type_id::create("RxHWM",,get_full_name());
         TxRx = reg_TxRx::type_id::create("TxRx",,get_full_name());

       IntSrc.configure(this);
      IntMask.configure(this);
     TxStatus.configure(this);
        TxLWM.configure(this);
     RxStatus.configure(this);
        RxHWM.configure(this);
         TxRx.configure(this);

       IntSrc.build();
      IntMask.build();
     TxStatus.build();
        TxLWM.build();
     RxStatus.build();
        RxHWM.build();
         TxRx.build();

      // define default map
      default_map = create_map("default_map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);
      default_map.add_reg(IntSrc,  'h0000, "RW");
      default_map.add_reg(IntMask, 'h0004, "RW");
      default_map.add_reg(TxStatus,'h0010, "RW");
      default_map.add_reg(TxLWM,   'h0014, "RW");
      default_map.add_reg(RxStatus,'h0020, "RW");
      default_map.add_reg(RxHWM,   'h0024, "RW");
      default_map.add_reg(TxRx,    'h0100, "RW");
   endfunction
   
   `uvm_object_utils(reg_dut)
   
endclass : reg_dut

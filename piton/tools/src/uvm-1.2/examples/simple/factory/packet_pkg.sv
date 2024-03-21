//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
//   Copyright 2010-2011 Synopsys, Inc.
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
//----------------------------------------------------------------------
package packet_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class packet extends uvm_object;
    rand int addr;
    rand int data;

    //Use the macro in a class to implement factory registration along with other
    //utilities (create, get_type_name). For only factory registration, use
    //the macro `uvm_object_registry(packet,"packet").
    `uvm_object_utils(packet)
    
    //Base constraints
    constraint c1 { addr inside { ['h0:'h40], ['h100:'h200], ['h1000: 'h1fff], ['h4000: 'h4fff] }; }
    constraint c2 { (addr <= 'h40) -> (data inside { [10:20] } ); }
    constraint c3 { (addr >= 'h100 && addr <= 'h200) -> (data inside { [100:200] } ); }
    constraint c4 { (addr >= 'h1000 && addr <= 'h1fff) -> (data inside { [300:400] } ); }
    constraint c5 { (addr >= 'h4000 && addr <= 'h4fff) -> (data inside { [600:800] } ); }

    //do printing, comparing, etc. These functions can also be automated inside
    //the `uvm_object_utils_begin/end macros if desired. Below show the manual 
    //approach.
    function void do_print(uvm_printer printer);
      printer.print_field("addr", addr, $bits(addr));
      printer.print_field("data", data, $bits(data));
    endfunction
    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      packet rhs_;
      if(rhs==null || !$cast(rhs_, rhs)) return 0;
      do_compare = 1;  
      do_compare &= comparer.compare_field("addr", addr, rhs_.addr, $bits(addr));
      do_compare &= comparer.compare_field("data", data, rhs_.data, $bits(data));
    endfunction
    function void do_copy(uvm_object rhs);
      packet rhs_;
      if(rhs==null || !$cast(rhs_, rhs)) return;
      addr = rhs_.addr;
      data = rhs_.data;
    endfunction

  function new(string name="packet");
     super.new(name);
  endfunction

  endclass
endpackage

//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
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
package user_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

//----------------------------------------------------------------------
// lower
//----------------------------------------------------------------------
class lower extends uvm_component;
  int data;
  string str;

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #10 $display("%0t: %s HI", $time, get_full_name());
    phase.drop_objection(this);
  endtask

  function string get_type_name();
    return "lower";
  endfunction

  function void build_phase(uvm_phase phase);
     void'(uvm_config_int::get(this, "", "data", data));
     void'(uvm_config_string::get(this, "", "str", str));
  endfunction 

  function void do_print(uvm_printer printer);
    printer.print_field("data", data, 32);
    printer.print_string("str", str);
  endfunction
endclass

//----------------------------------------------------------------------
// myunit
//----------------------------------------------------------------------
class myunit extends uvm_component;
  lower l1;
  lower l2;
  int a[];

  function new (string name, uvm_component parent);
    super.new(name, parent);
    uvm_config_string::set(this, "l1", "str", "hi");
    uvm_config_int::set(this, "*", "data", 'h100);
    l1 = new ("l1", this);
    l2 = new ("l2", this);
    l1.data = 'h30;
    l2.data = 'h40;
    a = new[5]; for(int i=0; i<5;++i) a[i] = i*i;
  endfunction

  task run_phase(uvm_phase phase);
    //Check config from initial block
    if(l1.data != 55)
      `uvm_error("BADCFG", $sformatf("Expected l1.data = 55, got %0d", l1.data))
    if(l2.data != 101)
      `uvm_error("BADCFG", $sformatf("Expected l2.data = 101, got %0d", l2.data))
    if(l1.str != l2.str && l1.str != "hi")
      `uvm_error("BADCFG", $sformatf("Expected l1.str = \"hi\" and l2.str = \"hi\", got l1.str = \"%s\" and l2.str = \"%s\"", l1.str, l2.str))
    phase.raise_objection(this);
    #10 $display("%0t: %s HI", $time, get_full_name());
    phase.drop_objection(this);
  endtask

  function string get_type_name();
    return "myunit";
  endfunction

  function void do_print(uvm_printer printer);
    printer.print_array_header("a", a.size());
    for(int i=0; i<a.size(); ++i) 
      printer.print_field( $sformatf("a[%0d]", i), a[i], 32, UVM_HEX, "[");
    printer.print_array_footer();
  endfunction
    
endclass


//----------------------------------------------------------------------
// mydata
//
//----------------------------------------------------------------------

class mydata extends uvm_object;
  `uvm_object_registry(mydata,"mydata")
  function uvm_object create(string name="mydata");
    mydata d; d=new; d.set_name(name);
    return d;
  endfunction
  virtual function string get_type_name();
    return "mydata";
  endfunction
  function new(string name="");
        super.new(name);
  endfunction
endclass

endpackage:user_pkg

//----------------------------------------------------------------------
// top
//----------------------------------------------------------------------
module top;
  import uvm_pkg::*;
  import user_pkg::*;

  myunit mu = new("mu", null);
  mydata bar = new;

  initial begin
    uvm_top.finish_on_completion = 0;
    uvm_config_int::set(null, "mu.*", "data", 101);
    uvm_config_string::set(null, "mu.*", "str", "hi");
    uvm_config_int::set(null, "mu.l1", "data", 55);
    uvm_config_object::set(null, "mu.*", "obj", bar);
    mu.print();
    run_test();
    mu.print();
  end
endmodule

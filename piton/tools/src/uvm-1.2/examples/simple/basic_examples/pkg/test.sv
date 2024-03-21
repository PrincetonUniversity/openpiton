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
module test;
  import uvm_pkg::*;

  //--------------------------------------------------------------------
  // lower
  //--------------------------------------------------------------------
  class lower extends uvm_component;
    int data;
    string str;

    function new (string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      $display("%0t: %m: start run", $time);
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

  //--------------------------------------------------------------------
  // myunit
  //--------------------------------------------------------------------
  class myunit extends uvm_component;
   lower l1;
   lower l2;
   int a[];

    function new (string name, uvm_component parent);
      super.new(name, parent);
      l1 = new ("l1", this);
      l2 = new ("l2", this);
      uvm_config_string::set(this, "l1", "str", "hi");
      uvm_config_int::set(this, "*", "da*", 'h100);
      l1.data = 'h30;
      l2.data = 'h40;
      a = new[5]; for(int i=0; i<5;++i) a[i] = i*i;
    endfunction

    task run_phase(uvm_phase phase);
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
        printer.print_field($sformatf("a[%0d]", i), a[i], 32, UVM_HEX, "[");
      printer.print_array_footer();
    endfunction
      
  endclass


  // Factory registration 

  //--------------------------------------------------------------------
  // lower_wrapper
  //--------------------------------------------------------------------
  class lower_wrapper extends uvm_object_wrapper;
  
    function uvm_component create_component(string name, uvm_component parent);
      lower u;
      u = new(name, parent);
      return u;
    endfunction
  
    function string get_type_name();
      return "lower";
    endfunction
  
    static function bit register_me(); uvm_coreservice_t cs_ = uvm_coreservice_t::get();

      uvm_factory factory = cs_.get_factory();
      lower_wrapper w; w = new;
      factory.register(w);
      return 1;
    endfunction

    static bit is_registered = register_me();
  endclass

  //--------------------------------------------------------------------
  // myunit_wrapper
  //--------------------------------------------------------------------
  class myunit_wrapper extends uvm_object_wrapper;

    function uvm_component create_component(string name, uvm_component parent);
      myunit u;
      u = new(name, parent);
      return u;
    endfunction

    function string get_type_name();
      return "myunit";
    endfunction

    static function bit register_me(); uvm_coreservice_t cs_ = uvm_coreservice_t::get();

      uvm_factory factory = cs_.get_factory();
      myunit_wrapper w; w = new;
      factory.register(w);
      return 1;
    endfunction

    static bit is_registered = register_me();
  endclass

  myunit mu = new("mu", null);

  //--------------------------------------------------------------------
  // mydata
  //--------------------------------------------------------------------
`ifdef USE_MACROS
  class mydata extends uvm_object;
    `uvm_object_utils(mydata)

  function new(string name="mydata");
     super.new(name);
  endfunction

  endclass
`else
  class mydata extends uvm_object;
    function uvm_object create(string name="");
      mydata d; d=new; d.set_name(name);
      return d;
    endfunction // uvm_object
    function string get_type_name();
      return "mydata";
    endfunction
  endclass

  //--------------------------------------------------------------------
  // mydata_wrapper
  //--------------------------------------------------------------------
  class mydata_wrapper extends uvm_object_wrapper;

    function uvm_object create_object(string name="");
      mydata u;
      u = new;
      if(name !="") u.set_name(name);
      return u;
    endfunction

    function string get_type_name();
      return "myobject";
    endfunction

    static function bit register_me(); uvm_coreservice_t cs_ = uvm_coreservice_t::get();

      uvm_factory factory = cs_.get_factory();
      mydata_wrapper w; w = new;
      factory.register(w);
      return 1;
    endfunction

    static bit is_registered = register_me();
  endclass
`endif 

  mydata bar = new;

  initial begin automatic uvm_coreservice_t cs_ = uvm_coreservice_t::get();

    uvm_factory factory;
    factory=cs_.get_factory();
    uvm_config_int::set(null, "mu.*", "data", 101);
    uvm_config_string::set(null, "mu.*", "str", "hi");
    uvm_config_int::set(null, "mu.l1", "data", 55);
    uvm_config_object::set(null, "mu.*", "obj", bar);
    mu.print_config_settings("", null, 1);
    uvm_default_printer = uvm_default_tree_printer;
    mu.print();
    factory.print(1);
    run_test();
    mu.print();
  end
  initial
    #5 mu.l1.kill();
endmodule

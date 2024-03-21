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
`ifndef CLASSC_SVH
`define CLASSC_SVH

class C extends uvm_component;
  int v=0;
  int s=0;
  string myaa [string];
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    string str;
    super.build_phase(phase);
    void'(uvm_config_int::get(this, "", "v", v));
    void'(uvm_config_int::get(this, "", "s", s));
    if(uvm_config_string::get(this, "", "myaa[foo]", str)) myaa["foo"] = str;
    if(uvm_config_string::get(this, "", "myaa[bar]", str)) myaa["bar"] = str;
    if(uvm_config_string::get(this, "", "myaa[foobar]", str)) myaa["foobar"] = str;
  endfunction

  function string get_type_name();
    return "C";
  endfunction

  function void do_print(uvm_printer printer);
    printer.print_field("v", v, 32);
    printer.print_field("s", s, 32);
    printer.print_array_header("myaa", myaa.num(), "aa_string_string");
    foreach(myaa[i])
      printer.print_string($sformatf("myaa[%0s]", i), myaa[i]);
    printer.print_array_footer();
  endfunction

  function void set_string_local (string  field_name,
                                                 string  value,
                                                 bit     recurse=1);
    string index;
    bit wildcarded;
    //call the super function to get child recursion and any registered fields
    super.set_string_local(field_name, value, recurse);

    index = uvm_get_array_index_string(field_name, wildcarded);
    if(!wildcarded && uvm_is_match(field_name, {"myaa[", index, "]"}))
    myaa[index] = value;
  endfunction

endclass

`endif

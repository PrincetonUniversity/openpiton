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


//Begindoc: Automated Configuration
//This test will focus on testing auto configurations using the uvm_component related config methods.
//
//
//Walk through the test:
//Configuration settings are stored in each component instance. 
//
//Then a search is made to verify that those components full names match the field_name that had been set.
// 
//


module top;
  import uvm_pkg::*;
  import my_env_pkg::*;

  my_env topenv;

  initial begin
    //set configuration prior to creating the environment
    uvm_config_int::set(null, "topenv.*.u1", "v", 30);
    uvm_config_int::set(null, "topenv.inst2.u1", "v", 10);
    uvm_config_int::set(null, "*", "recording_detail", 0);
    uvm_config_string::set(null, "*", "myaa[foo]", "hi");
    uvm_config_string::set(null, "*", "myaa[bar]", "bye");
    uvm_config_string::set(null, "*", "myaa[foobar]", "howdy");
    uvm_config_string::set(null, "topenv.inst1.u1", "myaa[foo]", "boo");
    uvm_config_string::set(null, "topenv.inst1.u1", "myaa[foobar]", "boobah");

    topenv = new("topenv", null);

    run_test();
  end

endmodule

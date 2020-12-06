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
package gen_pkg;
  import uvm_pkg::*;
  import packet_pkg::*;

  `include "uvm_macros.svh"
  class gen extends uvm_component;

    //Use the macro in a class to implement factory registration along with other
    //utilities (create, get_type_name). To do only factory registration, use
    //the macro `uvm_component_utils(gen,"gen").
    `uvm_component_utils(gen)
    
    function new (string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    virtual function packet get_packet();
      packet p;

      //use the factory to generate a package
      p = packet::type_id::create("p", this);
     
      //randomize it
      void'(p.randomize());      
     
      return p; 
    endfunction
  endclass
endpackage

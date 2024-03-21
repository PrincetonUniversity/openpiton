//
//----------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
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

`ifndef UVM_MACROS_SVH
`define UVM_MACROS_SVH

//
// Any vendor specific defines go here.
//

`ifdef MODEL_TECH
`ifndef QUESTA
`define QUESTA
`endif
`endif

`ifndef UVM_USE_STRING_QUEUE_STREAMING_PACK
  `define UVM_STRING_QUEUE_STREAMING_PACK(q) uvm_pkg::m_uvm_string_queue_join(q)
`endif

`ifndef QUESTA
`define uvm_typename(X) $typename(X)
`else
`define uvm_typename(X) $typename(X,39)
`endif

`ifdef VCS
// `ifndef UVM_DISABLE_RESOURCE_CONVERTER

//UVM_USE_RESOURCE_CONVERTER enables UVM-1.1d to print resources output to match uvm-1.1c. VCS2014.03 or later does not need resource_converter object.
// As per agreement in Committee at time of UVM-1.1d, from UVM-1.2 onwards the default is to disable resource converter and allow simulators to deal with %p natively. If a user wishes to enable resource converter then they need to compile using +define+UVM_USE_RESOURCE_CONVERTER. The resource converter was never officially sanctioned by Accellera and is placed in the deprecated directory which may be removed in future version. 
// `define UVM_USE_RESOURCE_CONVERTER

// `endif
`endif

`ifdef INCA
  `define UVM_USE_PROCESS_CONTAINER
`endif

//
// Deprecation Control Macros
//
`ifdef UVM_NO_DEPRECATED
`endif

`define uvm_delay(TIME) #(TIME);


`include "macros/uvm_version_defines.svh"
`include "macros/uvm_global_defines.svh"
`include "macros/uvm_message_defines.svh"
`include "macros/uvm_phase_defines.svh"
`include "macros/uvm_object_defines.svh"
`include "macros/uvm_printer_defines.svh"
`include "macros/uvm_tlm_defines.svh"
`include "macros/uvm_sequence_defines.svh"
`include "macros/uvm_callback_defines.svh"
`include "macros/uvm_reg_defines.svh"
`include "macros/uvm_deprecated_defines.svh"

`endif

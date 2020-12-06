//
//----------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2013 NVIDIA Corporation
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

`ifndef UVM_BASE_SVH
`define UVM_BASE_SVH

  typedef class uvm_cmdline_processor;


  `include "base/uvm_coreservice.svh"
  
  // Miscellaneous classes and functions. uvm_void is defined in uvm_misc,
  // along with some auxillary functions that UVM needs but are not really
  // part of UVM.
  `include "base/uvm_version.svh"
  `include "base/uvm_object_globals.svh"
  `include "base/uvm_misc.svh"

  // The base object element. Contains data methods (<copy>, <compare> etc) and
  // factory creation methods (<create>). Also includes control classes.
  `include "base/uvm_object.svh"

  `include "base/uvm_pool.svh"
  `include "base/uvm_queue.svh"

  `include "base/uvm_factory.svh"
  `include "base/uvm_registry.svh"


  // Resources/configuration facility
  `include "base/uvm_spell_chkr.svh"
  `include "base/uvm_resource.svh"
`ifdef UVM_USE_RESOURCE_CONVERTER
  `include "deprecated/uvm_resource_converter.svh"
`endif
  `include "base/uvm_resource_specializations.svh"
  `include "base/uvm_resource_db.svh"
  `include "base/uvm_config_db.svh"


  // Policies
  `include "base/uvm_printer.svh"
  `include "base/uvm_comparer.svh"
  `include "base/uvm_packer.svh"
  `include "base/uvm_links.svh"
  `include "base/uvm_tr_database.svh"
  `include "base/uvm_tr_stream.svh"
  `include "base/uvm_recorder.svh"

  // Event interface
  `include "base/uvm_event_callback.svh"
  `include "base/uvm_event.svh"
  `include "base/uvm_barrier.svh"

  // Callback interface
  `include "base/uvm_callback.svh"

  // Reporting interface
  `include "base/uvm_report_message.svh"
  `include "base/uvm_report_catcher.svh"
  `include "base/uvm_report_server.svh"
  `include "base/uvm_report_handler.svh"
  `include "base/uvm_report_object.svh"

  // Base transaction object
  `include "base/uvm_transaction.svh"

  // The phase declarations
  `include "base/uvm_phase.svh"
  `include "base/uvm_domain.svh"
  `include "base/uvm_bottomup_phase.svh"
  `include "base/uvm_topdown_phase.svh"
  `include "base/uvm_task_phase.svh"
  `include "base/uvm_common_phases.svh"
  `include "base/uvm_runtime_phases.svh"

  `include "base/uvm_component.svh"

  // Objection interface
  `include "base/uvm_objection.svh"
  `include "base/uvm_heartbeat.svh"

  `include "base/uvm_globals.svh"

  // Command Line Processor
  `include "base/uvm_cmdline_processor.svh"
  
  // traversal utilities
  `include "base/uvm_traversal.svh"

`endif // UVM_BASE_SVH

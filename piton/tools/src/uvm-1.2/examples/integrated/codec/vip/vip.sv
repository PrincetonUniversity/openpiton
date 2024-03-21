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

`include "vip_if.sv"

package vip_pkg; 

  import uvm_pkg::*;

  typedef virtual vip_if    vip_vif;
  typedef virtual vip_tx_if vip_tx_vif;
  typedef virtual vip_rx_if vip_rx_vif;

 `include "vip_tr.svh"

  typedef class vip_agent;
  typedef uvm_sequencer#(vip_tr) vip_sequencer;

 `include "vip_driver.svh"
 `include "vip_monitor.svh"
 `include "vip_agent.svh"

 `include "vip_seqlib.svh"
endpackage

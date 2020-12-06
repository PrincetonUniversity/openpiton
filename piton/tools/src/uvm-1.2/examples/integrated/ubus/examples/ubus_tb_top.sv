//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
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

`define UBUS_ADDR_WIDTH 16

`include "ubus_pkg.sv"
`include "dut_dummy.v"
`include "ubus_if.sv"


module ubus_tb_top;
  import uvm_pkg::*;
  import ubus_pkg::*;
  `include "test_lib.sv" 

  ubus_if vif(); // SystemVerilog Interface
  
  dut_dummy dut(
    vif.sig_request[0],
    vif.sig_grant[0],
    vif.sig_request[1],
    vif.sig_grant[1],
    vif.sig_clock,
    vif.sig_reset,
    vif.sig_addr,
    vif.sig_size,
    vif.sig_read,
    vif.sig_write,
    vif.sig_start,
    vif.sig_bip,
    vif.sig_data,
    vif.sig_wait,
    vif.sig_error
  );

  initial begin automatic uvm_coreservice_t cs_ = uvm_coreservice_t::get();

    uvm_config_db#(virtual ubus_if)::set(cs_.get_root(), "*", "vif", vif);
    run_test();
  end

  initial begin
    vif.sig_reset <= 1'b1;
    vif.sig_clock <= 1'b1;
    #51 vif.sig_reset = 1'b0;
  end

  //Generate Clock
  always
    #5 vif.sig_clock = ~vif.sig_clock;

endmodule

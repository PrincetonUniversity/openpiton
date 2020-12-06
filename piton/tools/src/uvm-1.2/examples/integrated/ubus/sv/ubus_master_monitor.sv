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

//------------------------------------------------------------------------------
//
// CLASS: ubus_master_monitor
//
//------------------------------------------------------------------------------

class ubus_master_monitor extends uvm_monitor;

  // This property is the virtual interfaced needed for this component to drive
  // and view HDL signals. 
  protected virtual ubus_if vif;

  // Master Id
  protected int master_id;

  // The following two bits are used to control whether checks and coverage are
  // done both in the monitor class and the interface.
  bit checks_enable = 1;
  bit coverage_enable = 1;

  uvm_analysis_port #(ubus_transfer) item_collected_port;

  // The following property holds the transaction information currently
  // begin captured (by the collect_address_phase and data_phase methods). 
  protected ubus_transfer trans_collected;

  // Fields to hold trans addr, data and wait_state.
  protected bit [15:0] addr;
  protected bit [7:0] data;
  protected int unsigned wait_state;

  // Transfer collected covergroup
  covergroup cov_trans;
    option.per_instance = 1;
    trans_start_addr : coverpoint trans_collected.addr {
      option.auto_bin_max = 16; }
    trans_dir : coverpoint trans_collected.read_write;
    trans_size : coverpoint trans_collected.size {
      bins sizes[] = {1, 2, 4, 8};
      illegal_bins invalid_sizes = default; }
    trans_addrXdir : cross trans_start_addr, trans_dir;
    trans_dirXsize : cross trans_dir, trans_size;
  endgroup : cov_trans

  // Transfer collected beat covergroup
  covergroup cov_trans_beat;
    option.per_instance = 1;
    beat_addr : coverpoint addr {
      option.auto_bin_max = 16; }
    beat_dir : coverpoint trans_collected.read_write;
    beat_data : coverpoint data {
      option.auto_bin_max = 8; }
    beat_wait : coverpoint wait_state {
      bins waits[] = { [0:9] };
      bins others = { [10:$] }; }
    beat_addrXdir : cross beat_addr, beat_dir;
    beat_addrXdata : cross beat_addr, beat_data;
  endgroup : cov_trans_beat

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(ubus_master_monitor)
    `uvm_field_int(master_id, UVM_DEFAULT)
    `uvm_field_int(checks_enable, UVM_DEFAULT)
    `uvm_field_int(coverage_enable, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    cov_trans = new();
    cov_trans.set_inst_name({get_full_name(), ".cov_trans"});
    cov_trans_beat = new();
    cov_trans_beat.set_inst_name({get_full_name(), ".cov_trans_beat"});
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase

  // run phase
  virtual task run_phase(uvm_phase phase);
    `uvm_info({get_full_name()," MASTER ID"},$sformatf(" = %0d",master_id),UVM_MEDIUM)
    fork
      collect_transactions();
    join
  endtask : run_phase

  // collect_transactions
  virtual protected task collect_transactions();
    forever begin
      @(posedge vif.sig_clock);
      if (m_parent != null)
        trans_collected.master = m_parent.get_name();
      collect_arbitration_phase();
      collect_address_phase();
      collect_data_phase();
      `uvm_info(get_full_name(), $sformatf("Transfer collected :\n%s",
        trans_collected.sprint()), UVM_MEDIUM)
      if (checks_enable)
        perform_transfer_checks();
      if (coverage_enable)
         perform_transfer_coverage();
      item_collected_port.write(trans_collected);
    end
  endtask : collect_transactions

  // collect_arbitration_phase
  virtual protected task collect_arbitration_phase();
    @(posedge vif.sig_request[master_id]);
    @(posedge vif.sig_clock iff vif.sig_grant[master_id] === 1);
    void'(this.begin_tr(trans_collected));
  endtask : collect_arbitration_phase

  // collect_address_phase
  virtual protected task collect_address_phase();
    @(posedge vif.sig_clock);
    trans_collected.addr = vif.sig_addr;
    case (vif.sig_size)
      2'b00 : trans_collected.size = 1;
      2'b01 : trans_collected.size = 2;
      2'b10 : trans_collected.size = 4;
      2'b11 : trans_collected.size = 8;
    endcase
    trans_collected.data = new[trans_collected.size];
    case ({vif.sig_read,vif.sig_write})
      2'b00 : trans_collected.read_write = NOP;
      2'b10 : trans_collected.read_write = READ;
      2'b01 : trans_collected.read_write = WRITE;
    endcase
  endtask : collect_address_phase

  // collect_data_phase
  virtual protected task collect_data_phase();
    int i;
    if (trans_collected.read_write != NOP)
      for (i = 0; i < trans_collected.size; i++) begin
        @(posedge vif.sig_clock iff vif.sig_wait === 0);
        trans_collected.data[i] = vif.sig_data;
      end
    this.end_tr(trans_collected);
  endtask : collect_data_phase

  // perform_transfer_checks
  virtual protected function void perform_transfer_checks();
    check_transfer_size();
    check_transfer_data_size();
  endfunction : perform_transfer_checks

  // check_transfer_size
  virtual protected function void check_transfer_size();
    assert_transfer_size : assert(trans_collected.size == 1 || 
      trans_collected.size == 2 || trans_collected.size == 4 || 
      trans_collected.size == 8) else begin
      `uvm_error(get_type_name(),
        "Invalid transfer size!")
    end
  endfunction : check_transfer_size

  // check_transfer_data_size
  virtual protected function void check_transfer_data_size();
    if (trans_collected.size != trans_collected.data.size())
      `uvm_error(get_type_name(),
        "Transfer size field / data size mismatch.")
  endfunction : check_transfer_data_size

  // perform_transfer_coverage
  virtual protected function void perform_transfer_coverage();
    cov_trans.sample();
    for (int unsigned i = 0; i < trans_collected.size; i++) begin
      addr = trans_collected.addr + i;
      data = trans_collected.data[i];
//Wait state is not currently monitored
//      wait_state = trans_collected.wait_state[i];
      cov_trans_beat.sample();
    end
  endfunction : perform_transfer_coverage

  virtual function void report_phase(uvm_phase phase);
    `uvm_info(get_full_name(),$sformatf("Covergroup 'cov_trans' coverage: %2f",
					cov_trans.get_inst_coverage()),UVM_LOW)
  endfunction

endclass : ubus_master_monitor



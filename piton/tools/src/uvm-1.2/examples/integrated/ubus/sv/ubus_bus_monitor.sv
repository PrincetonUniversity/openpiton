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
//   permissions and limitaions under the License.
//----------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: slave_address_map_info
//
// The following class is used to determine which slave should respond 
// to a transfer on the bus
//------------------------------------------------------------------------------

class slave_address_map_info extends uvm_object;

  protected int min_addr;
  protected int max_addr;
 
  function new(string name = "slave_address_map_info");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(slave_address_map_info)
    `uvm_field_int(min_addr, UVM_DEFAULT)
    `uvm_field_int(max_addr, UVM_DEFAULT)
  `uvm_object_utils_end

  function void set_address_map (int min_addr, int max_addr); 
    this.min_addr = min_addr;
    this.max_addr = max_addr;
  endfunction : set_address_map

  // get the min addr
  function bit [15:0] get_min_addr();
    return min_addr;
  endfunction : get_min_addr

  // get the max addr
  function bit [15:0] get_max_addr();
    return max_addr;
  endfunction : get_max_addr

endclass : slave_address_map_info


// Enumerated for ubus bus state

typedef enum {RST_START, RST_STOP, NO_OP, ARBI, ADDR_PH, ADDR_PH_ERROR, 
  DATA_PH} ubus_bus_state;


//------------------------------------------------------------------------------
//
// CLASS: ubus_status
//
//------------------------------------------------------------------------------

class ubus_status extends uvm_object;

  ubus_bus_state bus_state;

  function new(string name = "ubus_status");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(ubus_status)
    `uvm_field_enum(ubus_bus_state, bus_state, UVM_DEFAULT)
  `uvm_object_utils_end

endclass : ubus_status


//------------------------------------------------------------------------------
//
// CLASS: ubus_bus_monitor
//
//------------------------------------------------------------------------------

class ubus_bus_monitor extends uvm_monitor;

  // The virtual interface used to view HDL signals.
  protected virtual ubus_if vif;

  // Property indicating the number of transactions occuring on the ubus.
  protected int unsigned num_transactions = 0;

  // The following two bits are used to control whether checks and coverage are
  // done both in the bus monitor class and the interface.
  bit checks_enable = 1; 
  bit coverage_enable = 1;

  // Analysis ports for the item_collected and state notifier.
  uvm_analysis_port #(ubus_transfer) item_collected_port;
  uvm_analysis_port #(ubus_status) state_port;

  // The state of the ubus
  protected ubus_status status;

  // The following property is used to store slave address map
  protected slave_address_map_info slave_addr_map[string];

  // The following property holds the transaction information currently
  // being captured (by the collect_address_phase and data_phase methods). 
  protected ubus_transfer trans_collected;

  // Events needed to trigger covergroups
  protected event cov_transaction;
  protected event cov_transaction_beat;

  // Fields to hold trans data and wait_state.  No coverage of dynamic arrays.
  protected bit [15:0] addr;
  protected bit [7:0] data;
  protected int unsigned wait_state;

  // Transfer collected covergroup
  covergroup cov_trans @cov_transaction;
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

  // Transfer collected data covergroup
  covergroup cov_trans_beat @cov_transaction_beat;
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
  `uvm_component_utils_begin(ubus_bus_monitor)
    `uvm_field_int(checks_enable, UVM_DEFAULT)
    `uvm_field_int(coverage_enable, UVM_DEFAULT)
    `uvm_field_int(num_transactions, UVM_DEFAULT)
    `uvm_field_aa_object_string(slave_addr_map, UVM_DEFAULT)
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
    state_port = new("state_port", this);
    status = new("status");
  endfunction : new

  // set_slave_configs
  function void set_slave_configs(string slave_name,
    int min_addr, int max_addr);
    slave_addr_map[slave_name] = new();
    slave_addr_map[slave_name].set_address_map(min_addr, max_addr);
  endfunction : set_slave_configs

  function void build_phase(uvm_phase phase);
      if(!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase

  // run phase
  task run_phase(uvm_phase phase);
    fork
      observe_reset();
      collect_transactions();
    join
  endtask : run_phase

  // observe_reset
  task observe_reset();
    fork
      forever begin
        @(posedge vif.sig_reset);
        status.bus_state = RST_START;
        state_port.write(status);
      end
      forever begin
        @(negedge vif.sig_reset);
        status.bus_state = RST_STOP;
        state_port.write(status);
      end
    join
  endtask : observe_reset

  // collect_transactions
  virtual protected task collect_transactions();
    forever begin
      collect_arbitration_phase();
      collect_address_phase();
      collect_data_phase();
      `uvm_info(get_type_name(),$sformatf("Transfer collected :\n%s", 
        trans_collected.sprint()), UVM_HIGH)
      if (checks_enable)
        perform_transfer_checks();
      if (coverage_enable)
        perform_transfer_coverage(); 
      item_collected_port.write(trans_collected);
    end
  endtask : collect_transactions

  // collect_arbitration_phase
  task collect_arbitration_phase();
    string tmpStr;
    @(posedge vif.sig_clock iff (vif.sig_grant != 0));
    status.bus_state = ARBI;
    state_port.write(status);
    void'(this.begin_tr(trans_collected));
    // Check which grant is asserted to determine which master is performing
    // the transfer on the bus.
    for (int j = 0; j <= 15; j++) begin
      if (vif.sig_grant[j] === 1) begin
        $sformat(tmpStr,"masters[%0d]", j);
        trans_collected.master = tmpStr;
        break;   
      end 
    end
  endtask : collect_arbitration_phase

  // collect_address_phase
  task collect_address_phase();
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
      2'b00 : begin
        trans_collected.read_write = NOP;
        status.bus_state = NO_OP;
        state_port.write(status);
      end
      2'b10 : begin
        trans_collected.read_write = READ;
        status.bus_state = ADDR_PH;
        state_port.write(status);
      end
      2'b01 : begin
        trans_collected.read_write = WRITE;
        status.bus_state = ADDR_PH;
        state_port.write(status);
      end
      2'b11 : begin
        status.bus_state = ADDR_PH_ERROR;
        state_port.write(status);
        if (checks_enable)
          `uvm_error(get_type_name(),
            "Read and Write true at the same time")
      end            
    endcase
  endtask : collect_address_phase

  // collect_data_phase
  task collect_data_phase();
    int i;
    if (trans_collected.read_write != NOP) begin
      check_which_slave();
      for (i = 0; i < trans_collected.size; i++) begin
        status.bus_state = DATA_PH;
        state_port.write(status);
        @(posedge vif.sig_clock iff vif.sig_wait === 0);
        trans_collected.data[i] = vif.sig_data;
      end
      num_transactions++;
      this.end_tr(trans_collected);
    end
  endtask : collect_data_phase

  // check_which_slave
  function void check_which_slave();
    string slave_name;
    bit slave_found;
    slave_found = 1'b0;
    if(slave_addr_map.first(slave_name))
      do begin
        if (slave_addr_map[slave_name].get_min_addr() <= trans_collected.addr
          && trans_collected.addr <= slave_addr_map[slave_name].get_max_addr()) 
        begin
          trans_collected.slave = slave_name;
          slave_found = 1'b1;
        end
        if (slave_found == 1'b1)
          break;
      end
    while (slave_addr_map.next(slave_name));
      assert(slave_found) else begin
        `uvm_error(get_type_name(),
          $sformatf("Master attempted a transfer at illegal address 16'h%0h", 
          trans_collected.addr))
      end
  endfunction : check_which_slave

  // perform_transfer_checks
  function void perform_transfer_checks();
    check_transfer_size();
    check_transfer_data_size();
  endfunction : perform_transfer_checks

  // check_transfer_size
  function void check_transfer_size();
   if (trans_collected.read_write != NOP) begin
    assert_transfer_size : assert(trans_collected.size == 1 || 
      trans_collected.size == 2 || trans_collected.size == 4 || 
      trans_collected.size == 8) else begin
      `uvm_error(get_type_name(),
        "Invalid transfer size!")
    end
   end
  endfunction : check_transfer_size

  // check_transfer_data_size
  function void check_transfer_data_size();
    if (trans_collected.size != trans_collected.data.size())
      `uvm_error(get_type_name(),
        "Transfer size field / data size mismatch.")
  endfunction : check_transfer_data_size

  // perform_transfer_coverage
  function void perform_transfer_coverage();
    if (trans_collected.read_write != NOP) begin
      -> cov_transaction;
      for (int unsigned i = 0; i < trans_collected.size; i++) begin
        addr = trans_collected.addr + i;
        data = trans_collected.data[i];
        //wait_state = trans_collected.wait_state[i];
        -> cov_transaction_beat;
      end
    end
  endfunction : perform_transfer_coverage

endclass : ubus_bus_monitor



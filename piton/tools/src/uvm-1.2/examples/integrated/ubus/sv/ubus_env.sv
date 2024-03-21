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
// CLASS: ubus_env
//
//------------------------------------------------------------------------------

class ubus_env extends uvm_env;

  // Virtual Interface variable
  protected virtual interface ubus_if vif;

  // Control properties
  protected bit has_bus_monitor = 1;
  protected int num_masters = 0;
  protected int num_slaves = 0;

  // The following two bits are used to control whether checks and coverage are
  // done both in the bus monitor class and the interface.
  bit intf_checks_enable = 1; 
  bit intf_coverage_enable = 1;

  // Components of the environment
  ubus_bus_monitor bus_monitor;
  ubus_master_agent masters[];
  ubus_slave_agent slaves[];

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(ubus_env)
    `uvm_field_int(has_bus_monitor, UVM_DEFAULT)
    `uvm_field_int(num_masters, UVM_DEFAULT)
    `uvm_field_int(num_slaves, UVM_DEFAULT)
    `uvm_field_int(intf_checks_enable, UVM_DEFAULT)
    `uvm_field_int(intf_coverage_enable, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase
  function void build_phase(uvm_phase phase);
    string inst_name;
//    set_phase_domain("uvm");
    super.build_phase(phase);
     if(!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
     
    if(has_bus_monitor == 1) begin
      bus_monitor = ubus_bus_monitor::type_id::create("bus_monitor", this);
    end
    
    void'(uvm_config_db#(int)::get(this, "", "num_masters", num_masters));
   
    masters = new[num_masters];
    for(int i = 0; i < num_masters; i++) begin
      $sformat(inst_name, "masters[%0d]", i);
      masters[i] = ubus_master_agent::type_id::create(inst_name, this);
      void'(uvm_config_db#(int)::set(this,{inst_name,".monitor"}, 
				 "master_id", i));
      void'(uvm_config_db#(int)::set(this,{inst_name,".driver"}, 
				 "master_id", i));
    end

    void'(uvm_config_db#(int)::get(this, "", "num_slaves", num_slaves));
    
    slaves = new[num_slaves];
    for(int i = 0; i < num_slaves; i++) begin
      $sformat(inst_name, "slaves[%0d]", i);
      slaves[i] = ubus_slave_agent::type_id::create(inst_name, this);
    end
  endfunction : build_phase

  // set_slave_address_map
  function void set_slave_address_map(string slave_name, 
    int min_addr, int max_addr);
    ubus_slave_monitor tmp_slave_monitor;
    if( bus_monitor != null ) begin
      // Set slave address map for bus monitor
      bus_monitor.set_slave_configs(slave_name, min_addr, max_addr);
    end
    // Set slave address map for slave monitor
    $cast(tmp_slave_monitor, lookup({slave_name, ".monitor"}));
    tmp_slave_monitor.set_addr_range(min_addr, max_addr);
  endfunction : set_slave_address_map

  // update_vif_enables
  protected task update_vif_enables();
    forever begin
      @(intf_checks_enable || intf_coverage_enable);
      vif.has_checks <= intf_checks_enable;
      vif.has_coverage <= intf_coverage_enable;
    end
  endtask : update_vif_enables

  // implement run task
  task run_phase(uvm_phase phase);
    fork
      update_vif_enables();
    join
  endtask : run_phase

endclass : ubus_env



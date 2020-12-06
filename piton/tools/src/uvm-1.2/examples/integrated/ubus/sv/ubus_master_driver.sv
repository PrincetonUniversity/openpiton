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
// CLASS: ubus_master_driver
//
//------------------------------------------------------------------------------

class ubus_master_driver extends uvm_driver #(ubus_transfer);

  // The virtual interface used to drive and view HDL signals.
  protected virtual ubus_if vif;

  // Master Id
  protected int master_id;

  // Provide implmentations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(ubus_master_driver)
    `uvm_field_int(master_id, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase

  // run phase
  virtual task run_phase(uvm_phase phase);
    fork
      get_and_drive();
      reset_signals();
    join
  endtask : run_phase

  // get_and_drive 
  virtual protected task get_and_drive();
    @(negedge vif.sig_reset);
    forever begin
      @(posedge vif.sig_clock);
      seq_item_port.get_next_item(req);
      $cast(rsp, req.clone());
      rsp.set_id_info(req);
      drive_transfer(rsp);
      seq_item_port.item_done();
      seq_item_port.put_response(rsp);
    end
  endtask : get_and_drive

  // reset_signals
  virtual protected task reset_signals();
    forever begin
      @(posedge vif.sig_reset);
      vif.sig_request[master_id]  <= 0;
      vif.rw                      <= 'h0;
      vif.sig_addr           <= 'hz;
      vif.sig_data_out       <= 'hz;
      vif.sig_size           <= 'bz;
      vif.sig_read           <= 'bz;
      vif.sig_write          <= 'bz;
      vif.sig_bip            <= 'bz;
    end
  endtask : reset_signals

  // drive_transfer
  virtual protected task drive_transfer (ubus_transfer trans);
    if (trans.transmit_delay > 0) begin
      repeat(trans.transmit_delay) @(posedge vif.sig_clock);
    end
    arbitrate_for_bus();
    drive_address_phase(trans);
    drive_data_phase(trans);
  endtask : drive_transfer

  // arbitrate_for_bus
  virtual protected task arbitrate_for_bus();
    vif.sig_request[master_id] <= 1;
    @(posedge vif.sig_clock iff vif.sig_grant[master_id] === 1);
    vif.sig_request[master_id] <= 0;
  endtask : arbitrate_for_bus

  // drive_address_phase
  virtual protected task drive_address_phase (ubus_transfer trans);
    vif.sig_addr <= trans.addr;
    drive_size(trans.size);
    drive_read_write(trans.read_write);
    @(posedge vif.sig_clock);
    vif.sig_addr <= 32'bz;
    vif.sig_size <= 2'bz;
    vif.sig_read <= 1'bz;
    vif.sig_write <= 1'bz;  
  endtask : drive_address_phase

  // drive_data_phase
  virtual protected task drive_data_phase (ubus_transfer trans);
    bit err;
    for(int i = 0; i <= trans.size - 1; i ++) begin
      if (i == (trans.size - 1))
        vif.sig_bip <= 0;
      else
        vif.sig_bip <= 1;
      case (trans.read_write)
        READ    : read_byte(trans.data[i], err);
        WRITE   : write_byte(trans.data[i], err);
      endcase
    end //for loop
    vif.sig_data_out <= 8'bz;
    vif.sig_bip <= 1'bz;
  endtask : drive_data_phase

  // read_byte
  virtual protected task read_byte (output bit [7:0] data, output bit error);
    vif.rw <= 1'b0;
    @(posedge vif.sig_clock iff vif.sig_wait === 0);
    data = vif.sig_data;
  endtask : read_byte

  // write_byte
  virtual protected task write_byte (bit[7:0] data, output bit error);
    vif.rw <= 1'b1;
    vif.sig_data_out <= data;
    @(posedge vif.sig_clock iff vif.sig_wait === 0);
    vif.rw <= 'h0;
  endtask : write_byte

  // drive_size
  virtual protected task drive_size (int size);
    case (size)
      1: vif.sig_size <=  2'b00;
      2: vif.sig_size <=  2'b01;
      4: vif.sig_size <=  2'b10;
      8: vif.sig_size <=  2'b11;
    endcase
  endtask : drive_size

  // drive_read_write            
  virtual protected task drive_read_write(ubus_read_write_enum rw);
    case (rw)
      NOP   : begin vif.sig_read <= 0; vif.sig_write <= 0; end
      READ  : begin vif.sig_read <= 1; vif.sig_write <= 0; end
      WRITE : begin vif.sig_read <= 0; vif.sig_write <= 1; end
    endcase
  endtask : drive_read_write

endclass : ubus_master_driver



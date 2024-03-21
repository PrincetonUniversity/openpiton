//------------------------------------------------------------------------------
// Copyright 2010-2011 Mentor Graphics Corporation
// Copyright 2011 Synopsys, Inc.
// All Rights Reserved Worldwide
// 
// Licensed under the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License.  You may obtain
// a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
// License for the specific language governing permissions and limitations
// under the License.
//------------------------------------------------------------------------------


// shared memory (representing the DUT's registers)

uvm_reg_data_t mem[uvm_reg_addr_t];

//------------------------------------------------------------------------------
//
// CLASS: any_sequencer
//
//------------------------------------------------------------------------------

class any_sequencer #(type REQ=int,RSP=REQ) extends uvm_sequencer #(REQ,RSP);
  `uvm_component_param_utils(any_sequencer #(REQ,RSP))
  function new(string name, uvm_component parent=null);
    super.new(name,parent);
  endfunction
endclass


//------------------------------------------------------------------------------
//
// CLASS: any_monitor
//
//------------------------------------------------------------------------------

typedef class any_monitor;

class any_monitor #(type REQ=int,RSP=REQ) extends uvm_component;

  `uvm_component_param_utils(any_monitor #(REQ,RSP))

  uvm_analysis_port #(REQ) req_ap;
  uvm_analysis_port #(RSP) rsp_ap;

  function new(string name, uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    req_ap = new("req_ap",this);
    rsp_ap = new("rsp_ap",this);
  endfunction

  REQ req;
  RSP rsp;

  virtual task run_phase(uvm_phase phase);
    fork
      forever begin
        @req;
        req_ap.write(req);
      end
      forever begin
        @rsp;
        rsp_ap.write(rsp);
      end
    join
  endtask

endclass


//------------------------------------------------------------------------------
//
// CLASS: any_driver
//
// This driver's run task will continually retrieve, execute, and send back
// a response in one of three ways, chosen randomly-- either using peek/get,
// get/delay/put, or get_next_item/item_done.
//
// Used for the examples, the transaction type for REQ and RSP must define
//   addr - integral type $bits(uvm_reg_addr_t) or less
//   data - integral type $bits(uvm_reg_data_t) or less
//   read - bit 1=read operation, 0=write operation
//------------------------------------------------------------------------------

class any_driver #(type REQ=int,RSP=REQ) extends uvm_component;

  `uvm_component_param_utils(any_driver #(REQ,RSP))

  static string type_name = {"any_driver#(",REQ::type_name,",",RSP::type_name,")"};
  virtual function string get_type_name();
    return type_name;
  endfunction

  uvm_seq_item_pull_port #(REQ) seqr_port;

  uvm_analysis_port #(RSP) rsp_out;

  function new(string name, uvm_component parent=null);
    super.new(name,parent);
    seqr_port = new("seqr_port",this);
    rsp_out = new("rsp_out",this);
  endfunction


  typedef enum { NO_RESPONSE, RESPONSE_SEQ_PORT, RESPONSE_AP } mode_e;
  mode_e mode;

  function void set_mode(mode_e mode);
    this.mode = mode;
  endfunction

  uvm_reg_addr_t base_addr;
  function void set_base_addr(uvm_reg_addr_t addr);
    this.base_addr = addr;
  endfunction

  virtual task pre_req(REQ req);
  endtask

  virtual task post_req(REQ req);
  endtask

  virtual task post_rsp(RSP rsp);
  endtask

  task do_rsp(REQ req, output RSP rsp);
    rsp = new("rsp");
    rsp.read = req.read;
    rsp.addr = req.addr;
    rsp.data = req.data;
    rsp.set_id_info(req);
    post_rsp(rsp);
  endtask

  virtual task do_req(REQ req);
    uvm_reg_addr_t addr = req.addr - base_addr;
    this.pre_req(req);
    if (!req.read) begin
      mem[req.addr] = req.data;
    end
    else begin
      if (mem.exists(req.addr))
        req.data = mem[req.addr];
      else
        req.data = 'h1;
    end
    post_req(req);
  endtask

  task run_phase(uvm_phase phase);

    REQ req;
    RSP rsp;

    `uvm_info({"DRIVER-",get_type_name()},{"Starting in ",mode.name()," mode."},UVM_LOW);
    
    forever begin

      seqr_port.peek(req); // aka 'get_next_item'

      if (!req.read)
        `uvm_info({"DRIVER-",req.get_type_name()},{"Received write request: ",req.convert2string()},UVM_HIGH)

      #10;

      do_req(req);

      if (req.read)
         `uvm_info({"DRIVER-",req.get_type_name()},{"Executed read request: ",req.convert2string()},UVM_HIGH)

      case (mode)
        NO_RESPONSE: begin
        end
        RESPONSE_SEQ_PORT:  begin
          do_rsp(req,rsp);
          seqr_port.put_response(rsp);
          end
        RESPONSE_AP:  begin
          do_rsp(req,rsp);
          rsp_out.write(rsp);
          end
        default: begin
          `uvm_error("Unknown mode",{"Internal error: unknown mode ",mode.name(),"'"})
          end
      endcase

      seqr_port.get(req); // aka 'item_done'
    end
  endtask

endclass


//------------------------------------------------------------------------------
//
// CLASS: any_sequencer
//
//------------------------------------------------------------------------------

class any_agent #(type REQ=int, RSP=REQ) extends uvm_component;

  `uvm_component_param_utils(any_agent #(REQ,RSP))

  function new(string name, uvm_component parent=null);
    super.new(name,parent);
  endfunction

  uvm_analysis_port #(REQ) req_ap;
  uvm_analysis_port #(RSP) rsp_ap;

  any_sequencer #(REQ,RSP) sqr;
  any_driver    #(REQ,RSP) drv;
  any_monitor   #(REQ,RSP) mon;

  virtual function void build_phase(uvm_phase phase);
    req_ap = new("req_ap",this);
    rsp_ap = new("rsp_ap",this);
    sqr = any_sequencer#(REQ,RSP)::type_id::create("sqr",this);
    drv =    any_driver#(REQ,RSP)::type_id::create("drv",this);
    mon =   any_monitor#(REQ,RSP)::type_id::create("mon",this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    drv.seqr_port.connect(sqr.seq_item_export);
    mon.req_ap.connect(req_ap);
    mon.rsp_ap.connect(rsp_ap);
  endfunction

endclass

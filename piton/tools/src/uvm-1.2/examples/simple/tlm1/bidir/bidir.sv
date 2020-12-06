//
//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
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



/*
About: uvm_examples/uvm_tlm/bidir
This example will illustrate how to create two threads one is the master and the other is the slave. The two threads are completely independent, each one of the two threads has two types of ports interfaces puts and gets.

The communication between the two channel will be done through a uvm_tlm_req_rsp channel , which can handle the dual Request and Response of each thread

This example will use The uvm_tlm_req_rsp channel, transaction-level ports, and the messaging facilities as part of the UVM library.
*/



package user_pkg;
import uvm_pkg::*;


//----------------------------------------------------------------------
// class master
//----------------------------------------------------------------------
class master extends uvm_component;

  uvm_blocking_put_port #(int) req_port;
  uvm_blocking_get_port #(int) rsp_port;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
    req_port = new("req_port", this);
    rsp_port = new("rsp_port", this);
  endfunction
   
  task run_phase(uvm_phase phase);
    fork
      request_process;
      response_process;
    join
  endtask

  task request_process;

    string request_str;
  
      for(int i = 0; i < 10; i++) begin
        $sformat(request_str, "%d", i);
        uvm_report_info("sending request   ", request_str);
        req_port.put(i);
      end
   
  endtask // request_process
   
  task response_process;

    int response;
    string response_str;
  
    forever begin
      rsp_port.get(response);   
      $sformat(response_str, "%d", response);
      uvm_report_info("recieving response", response_str);
    end
  endtask   

endclass // master


//----------------------------------------------------------------------
// class slave
//----------------------------------------------------------------------
class slave extends uvm_component;

  uvm_blocking_get_port #(int) req_port;
  uvm_blocking_put_port #(int) rsp_port;
   
  function new(string name, uvm_component parent = null);
    super.new(name, parent);
    req_port = new("req_port", this);
    rsp_port = new("rsp_port", this);
  endfunction // new
   
  task run_phase(uvm_phase phase);

    int request, response;
    string request_str, response_str;
  
    forever begin
      req_port.get(request);   
      $sformat(request_str, "%d", request);
      uvm_report_info("recieving request  ", request_str);

     response = request;
     
     $sformat(response_str, "%d", response);
     uvm_report_info("sending response   ", response_str);

     rsp_port.put(response);
     
    end // forever begin
  endtask

endclass

//----------------------------------------------------------------------
// class bidir_env
//----------------------------------------------------------------------
class bidir_env extends uvm_env;

  master m;
  slave s;
  uvm_tlm_req_rsp_channel #(int) req_rsp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    m = new("master", this);
    s = new("slave", this);
    req_rsp = new("req_rsp_channel", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    m.req_port.connect(req_rsp.blocking_put_request_export);
    m.rsp_port.connect(req_rsp.blocking_get_response_export);
    s.req_port.connect(req_rsp.blocking_get_request_export);
    s.rsp_port.connect(req_rsp.blocking_put_response_export);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
     #10;
    phase.drop_objection(this);
  endtask
   
endclass

endpackage
import user_pkg::*;

//----------------------------------------------------------------------
// module top
//----------------------------------------------------------------------
module top;
  import uvm_pkg::*;
  bidir_env env;

  initial begin
    env = new("env", null);
    run_test();
  end
  
endmodule

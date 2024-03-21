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

`include "uvm_macros.svh"


`define NUM_SEQS 10
`define NUM_LOOPS 10

// NOTE: a simple convenience shortcut to illustrate two different paths 
// generating a string representatin for an object
`define toSTRING(X) \
`ifdef USE_FIELD_MACROS \
	X.sprint() \
`else \
    X.convert2string() \
`endif

/*

Remark 1:

- this example shows two alternative approaches to handle local properties -

When the define USE_FIELD_MACROS is set, the code is utilizing the uvm_field_xxx macros 
to mark transaction fields as "uvm fields". Doing so automatically infers code which handles 
compare,print,copy,record,pack,unpack without any additional implementation from the user side. 
This is typically shorter to write and easier to maintain on the user side. On the other hand a generic 
implementation might not be as fast and custom tailored.

The two styles can be mixed for most of the uvm_field functionality (manually handling few fields and 
use a default implementation for some others). Only the component level auto configuration for fields is for
`uvm_field_* annotated members only. it means that only when the uvm_field_* macros are used these fields  will be
set to their configured values automatically.

Remark 2:

All classes in this example utilize the uvm_(object|component)[_param]_utils macro. Althrough its not mandatory 
for UVM it is good practice since this macro will register the class in the UVM factory automatically. See the user 
guide for more information regarding uvm factory use models

*/
	

package user_pkg;

	import uvm_pkg::*;

	typedef enum { BUS_READ, BUS_WRITE } bus_op_t;
	typedef enum { STATUS_OK, STATUS_NOT_OK } status_t;

	//--------------------------------------------------------------------
	// bus_trans
	//--------------------------------------------------------------------
	class bus_trans extends uvm_sequence_item;

		bit [11:0] addr;
		bit [7:0] data;
		bus_op_t op;

`ifdef USE_FIELD_MACROS

		`uvm_object_utils_begin(bus_trans)
		`uvm_field_int(addr,UVM_DEFAULT)
		`uvm_field_int(data,UVM_DEFAULT)
		`uvm_field_enum(bus_op_t,op,UVM_DEFAULT)
		`uvm_field_utils_end

`else 

		`uvm_object_utils(bus_trans)

		virtual function void do_copy (uvm_object rhs);
			bus_trans rhs_;
			if(!$cast(rhs_, rhs))
				`uvm_error("do_copy", "cast failed, check type compatability")

			super.do_copy(rhs);

			addr = rhs_.addr;
			data = rhs_.data;
			op = rhs_.op;
		endfunction

		virtual function bit do_compare(uvm_object rhs,uvm_comparer comparer);
			bus_trans rhs_;
			if(!$cast(rhs_, rhs)) 
				`uvm_fatal("do_compare", "cast failed, check type compatability")

			return ((op == rhs_.op) && (addr == rhs_.addr) && (data == rhs_.data));
		endfunction

		virtual function string convert2string();
			return $sformatf("op %s: addr=%03x, data=%02x", op.name(), addr, data);
		endfunction
		
		// NOTE: in contrast to the USE_FIELD_MACROS version this doesnt implement pack/unpack/print/record/...
`endif

		function new(string name="");
			super.new(name);
		endfunction
	endclass

	//--------------------------------------------------------------------
	// bus_req
	//--------------------------------------------------------------------
	class bus_req extends bus_trans;
		`uvm_object_utils(bus_req)
		function new(string name="");
			super.new(name);
		endfunction     
	endclass

	//--------------------------------------------------------------------
	// bus_rsp
	//--------------------------------------------------------------------
	class bus_rsp extends bus_trans;

		status_t status;

		function new(string name="");
			super.new(name);
		endfunction

`ifdef USE_FIELD_MACROS
		`uvm_object_utils_begin(bus_rsp)
		`uvm_field_enum(status_t,status,UVM_DEFAULT)
		`uvm_object_utils_end
`else
		`uvm_object_utils(bus_rsp)

		virtual function void do_copy (uvm_object rhs);
			bus_rsp rhs_;
			if(!$cast(rhs_, rhs)) 
				`uvm_fatal("do_copy", "cast failed, check type compatability")

			super.do_copy(rhs_);
			status = rhs_.status;
		endfunction

		virtual function string convert2string();
			return $sformatf("op %s, status=%s", super.convert2string(), status.name());
		endfunction
		
		// NOTE: in contrast to the USE_FIELD_MACROS version this doesnt implement pack/unpack/print/record/...		
`endif
	endclass

	class my_driver #(type REQ = uvm_sequence_item, 
			type RSP = uvm_sequence_item)  extends uvm_driver #(REQ, RSP);

		`uvm_component_param_utils(my_driver#(REQ,RSP))

		local int data_array[511:0];

		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction

		virtual task run_phase(uvm_phase phase);
			REQ req;
			RSP rsp;

			forever begin
				seq_item_port.get(req);
				rsp = new();
				rsp.set_id_info(req);

				// Actually do the read or write here
				if (req.op == BUS_READ) begin
					rsp.addr = req.addr[8:0];
					rsp.data = data_array[rsp.addr];
					`uvm_info("sending",`toSTRING(rsp),UVM_MEDIUM)
				end else begin
					data_array[req.addr[8:0]] = req.data;
					`uvm_info("sending",`toSTRING(req),UVM_MEDIUM)
				end
				seq_item_port.put(rsp);
			end
		endtask
	endclass



	class sequenceA #(type REQ = uvm_sequence_item,
			type RSP = uvm_sequence_item) extends uvm_sequence #(REQ, RSP);

		`uvm_object_param_utils(sequenceA#(REQ,RSP))

		local static integer g_my_id = 1;
		local integer my_id;

		function new(string name="");
			super.new(name);
			my_id = g_my_id++;
		endfunction

		virtual task body();
			REQ  req;
			RSP  rsp;

			`uvm_info("sequenceA", "Starting sequence", UVM_MEDIUM)

			for(int unsigned i = 0; i < `NUM_LOOPS; i++) begin
				`uvm_create(req)

				req.addr = (my_id * `NUM_LOOPS) + i;
				req.data = my_id + i + 55;
				req.op   = BUS_WRITE;

				`uvm_send(req)
				get_response(rsp);

				`uvm_create(req)
				req.addr = (my_id * `NUM_LOOPS) + i;
				req.data = 0;
				req.op   = BUS_READ;

				`uvm_send(req)
				get_response(rsp);

				if (rsp.data != (my_id + i + 55)) begin
					`uvm_error("SequenceA", $sformatf("Error, addr: %0d, expected data: %0d, actual data: %0d",
							req.addr, req.data, rsp.data))
				end
			end
			`uvm_info("sequenceA", "Finishing sequence", UVM_MEDIUM)
		endtask // body

	endclass

	class env extends uvm_env;
		`uvm_component_utils(env)
		local uvm_sequencer #(bus_req, bus_rsp) sqr;
		local my_driver #(bus_req, bus_rsp) drv ;

		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction

		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);
			sqr = new("sequence_controller", this);

			// create and connect driver
			drv = new("my_driver", this);
			drv.seq_item_port.connect(sqr.seq_item_export);
		endfunction

		virtual task run_phase(uvm_phase phase);
			phase.raise_objection(this);
			for (int i = 0; i < `NUM_SEQS; i++) begin
				fork begin
						sequenceA #(bus_req, bus_rsp) the_sequence=  new("sequence");
						the_sequence.start(sqr, null);
				end
				join_none
			end
			wait fork;
				phase.drop_objection(this);
		endtask

	endclass
endpackage

module top;
	import user_pkg::*;
	import uvm_pkg::*;
	env e;

	initial begin
		`uvm_info("top","In top initial block",UVM_MEDIUM)
		e = new("env", null);
		run_test();
	end
endmodule


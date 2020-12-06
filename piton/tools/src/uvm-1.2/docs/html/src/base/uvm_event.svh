//
//------------------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2014 NVIDIA Corportation
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
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: uvm_event_base
//
// The uvm_event_base class is an abstract wrapper class around the SystemVerilog event
// construct.  It provides some additional services such as setting callbacks
// and maintaining the number of waiters.
//
//------------------------------------------------------------------------------

virtual class uvm_event_base extends uvm_object;
	const static string type_name = "uvm_event_base";
	protected event      m_event;
	protected int        num_waiters;
	protected bit        on;
	protected time       trigger_time=0;
	protected uvm_event_callback  callbacks[$];

	// Function: new
	//
	// Creates a new event object.

	function new (string name="");
		super.new(name);
	endfunction  

	//---------//
	// waiting //
	//---------//

	// Task: wait_on
	//
	// Waits for the event to be activated for the first time.
	//
	// If the event has already been triggered, this task returns immediately.
	// If ~delta~ is set, the caller will be forced to wait a single delta #0
	// before returning. This prevents the caller from returning before
	// previously waiting processes have had a chance to resume.
	//
	// Once an event has been triggered, it will be remain "on" until the event
	// is <reset>.

	virtual task wait_on (bit delta = 0);
		if (on) begin
			if (delta)
				#0;
			return;
		end
		num_waiters++;
		@on;
	endtask


	// Task: wait_off
	//
	// If the event has already triggered and is "on", this task waits for the
	// event to be turned "off" via a call to <reset>.
	//
	// If the event has not already been triggered, this task returns immediately.
	// If ~delta~ is set, the caller will be forced to wait a single delta #0
	// before returning. This prevents the caller from returning before
	// previously waiting processes have had a chance to resume.

	virtual task wait_off (bit delta = 0);
		if (!on) begin
			if (delta)
				#0;
			return;
		end
		num_waiters++;
		@on;
	endtask


	// Task: wait_trigger
	//
	// Waits for the event to be triggered. 
	//
	// If one process calls wait_trigger in the same delta as another process
	// calls <uvm_event#(T)::trigger>, a race condition occurs. If the call to wait occurs
	// before the trigger, this method will return in this delta. If the wait
	// occurs after the trigger, this method will not return until the next
	// trigger, which may never occur and thus cause deadlock.

	virtual task wait_trigger ();
		num_waiters++;
		@m_event;
	endtask


	// Task: wait_ptrigger
	//
	// Waits for a persistent trigger of the event. Unlike <wait_trigger>, this
	// views the trigger as persistent within a given time-slice and thus avoids
	// certain race conditions. If this method is called after the trigger but
	// within the same time-slice, the caller returns immediately.

	virtual task wait_ptrigger ();
		if (m_event.triggered)
			return;
		num_waiters++;
		@m_event;
	endtask


	// Function: get_trigger_time
	//
	// Gets the time that this event was last triggered. If the event has not been
	// triggered, or the event has been reset, then the trigger time will be 0.

	virtual function time get_trigger_time ();
		return trigger_time;
	endfunction


	//-------//
	// state //
	//-------//

	// Function: is_on
	//
	// Indicates whether the event has been triggered since it was last reset. 
	//
	// A return of 1 indicates that the event has triggered.

	virtual function bit is_on ();
		return (on == 1);
	endfunction


	// Function: is_off
	//
	// Indicates whether the event has been triggered or been reset.
	//
	// A return of 1 indicates that the event has not been triggered.

	virtual function bit is_off ();
		return (on == 0);
	endfunction


	// Function: reset
	//
	// Resets the event to its off state. If ~wakeup~ is set, then all processes
	// currently waiting for the event are activated before the reset.
	//
	// No callbacks are called during a reset.

	virtual function void reset (bit wakeup = 0);
		event e;
		if (wakeup)
			->m_event;
		m_event = e;
		num_waiters = 0;
		on = 0;
		trigger_time = 0;
	endfunction



	//--------------//
	// waiters list //
	//--------------//

	// Function: cancel
	//
	// Decrements the number of waiters on the event. 
	//
	// This is used if a process that is waiting on an event is disabled or
	// activated by some other means.

	virtual function void cancel ();
		if (num_waiters > 0)
			num_waiters--;
	endfunction


	// Function: get_num_waiters
	//
	// Returns the number of processes waiting on the event.

	virtual function int get_num_waiters ();
		return num_waiters;
	endfunction


	virtual function string get_type_name();
		return type_name;
	endfunction


	virtual function void do_print (uvm_printer printer);
		printer.print_field_int("num_waiters", num_waiters, $bits(num_waiters), UVM_DEC, ".", "int");
		printer.print_field_int("on", on, $bits(on), UVM_BIN, ".", "bit");
		printer.print_time("trigger_time", trigger_time);
		printer.m_scope.down("callbacks");
		foreach(callbacks[e]) begin
			printer.print_object($sformatf("[%0d]",e), callbacks[e], "[");
		end
		printer.m_scope.up();
	endfunction


	virtual function void do_copy (uvm_object rhs);
		uvm_event_base e;
		super.do_copy(rhs);
		if(!$cast(e, rhs) || (e==null)) return;

		m_event = e.m_event;
		num_waiters = e.num_waiters;
		on = e.on;
		trigger_time = e.trigger_time;
		callbacks.delete();
		callbacks = e.callbacks;   

	endfunction

endclass


//------------------------------------------------------------------------------
//
// CLASS: uvm_event#(T)
//
// The uvm_event class is an extension of the abstract uvm_event_base class.  
// 
// The optional parameter ~T~ allows the user to define a data type which
// can be passed during an event trigger.
//------------------------------------------------------------------------------

class uvm_event#(type T=uvm_object) extends uvm_event_base;

	const static string type_name = "uvm_event";

	local T trigger_data;

	// Function: new
	//
	// Creates a new event object.

	function new (string name="");
		super.new(name);
	endfunction  


	// Task: wait_trigger_data
	//
	// This method calls <uvm_event_base::wait_trigger> followed by <get_trigger_data>.

	virtual task wait_trigger_data (output T data);
		wait_trigger();
		data = get_trigger_data();
	endtask


	// Task: wait_ptrigger_data
	//
	// This method calls <uvm_event_base::wait_ptrigger> followed by <get_trigger_data>.

	virtual task wait_ptrigger_data (output T data);
		wait_ptrigger();
		data = get_trigger_data();
	endtask


	//------------//
	// triggering //
	//------------//

	// Function: trigger
	//
	// Triggers the event, resuming all waiting processes.
	//
	// An optional ~data~ argument can be supplied with the enable to provide
	// trigger-specific information.

	virtual function void trigger (T data=null);
		int skip;
		skip=0;
		if (callbacks.size()) begin
			for (int i=0;i<callbacks.size();i++) begin
				uvm_event_callback#(T) tmp=callbacks[i];
				skip = skip + tmp.pre_trigger(this,data);
			end
		end
		if (skip==0) begin
			->m_event;
			if (callbacks.size()) begin
				for (int i=0;i<callbacks.size();i++) begin
					uvm_event_callback#(T) tmp=callbacks[i];
					tmp.post_trigger(this,data);
				end
			end
			num_waiters = 0;
			on = 1;
			trigger_time = $realtime;
			trigger_data = data;
		end
	endfunction


	// Function: get_trigger_data
	//
	// Gets the data, if any, provided by the last call to <trigger>.

	virtual function T get_trigger_data ();
		return trigger_data;
	endfunction

	virtual function string get_type_name();
		return type_name;
	endfunction
	
		//-----------//
	// callbacks //
	//-----------//

	// Function: add_callback
	//
	// Registers a callback object, ~cb~, with this event. The callback object
	// may include pre_trigger and post_trigger functionality. If ~append~ is set
	// to 1, the default, ~cb~ is added to the back of the callback list. Otherwise,
	// ~cb~ is placed at the front of the callback list.

	virtual function void add_callback (uvm_event_callback#(T) cb, bit append=1);
		for (int i=0;i<callbacks.size();i++) begin
			if (cb == callbacks[i]) begin
				uvm_report_warning("CBRGED","add_callback: Callback already registered. Ignoring.", UVM_NONE);
				return;
			end
		end
		if (append)
			callbacks.push_back(cb);
		else
			callbacks.push_front(cb);
	endfunction


	// Function: delete_callback
	//
	// Unregisters the given callback, ~cb~, from this event. 

	virtual function void delete_callback (uvm_event_callback#(T) cb);
		for (int i=0;i<callbacks.size();i++) begin
			if (cb == callbacks[i]) begin
				callbacks.delete(i);
				return;
			end
		end
		uvm_report_warning("CBNTFD", "delete_callback: Callback not found. Ignoring delete request.", UVM_NONE);
	endfunction

	virtual function void do_print (uvm_printer printer);
		super.do_print(printer);
		printer.print_object("trigger_data", trigger_data);
	endfunction
	
	virtual function void do_copy (uvm_object rhs);
		uvm_event#(T) e;
		super.do_copy(rhs);
		if(!$cast(e, rhs) || (e==null)) return;
		trigger_data = e.trigger_data;
	endfunction // do_copy

   	virtual function uvm_object create(string name=""); 
		uvm_event#(T) v;
		v=new(name);
		return v;
	endfunction

endclass

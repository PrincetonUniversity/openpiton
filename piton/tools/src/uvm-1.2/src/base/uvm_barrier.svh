//
//------------------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc.
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
//------------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
// CLASS: uvm_barrier
//
// The uvm_barrier class provides a multiprocess synchronization mechanism. 
// It enables a set of processes to block until the desired number of processes
// get to the synchronization point, at which time all of the processes are
// released.
//-----------------------------------------------------------------------------

class uvm_barrier extends uvm_object;

  local  int       threshold;
  local  int       num_waiters;
  local  bit       at_threshold;
  local  bit       auto_reset;
  local  uvm_event#(uvm_object) m_event;


  // Function: new
  //
  // Creates a new barrier object.

  function new (string name="", int threshold=0);
    super.new(name);
    m_event = new({"barrier_",name});
    this.threshold = threshold;
    num_waiters = 0;
    auto_reset = 1;
    at_threshold = 0;
  endfunction


  // Task: wait_for
  //
  // Waits for enough processes to reach the barrier before continuing. 
  //
  // The number of processes to wait for is set by the <set_threshold> method.

  virtual task wait_for();

    if (at_threshold)
      return;

    num_waiters++;

    if (num_waiters >= threshold) begin
      if (!auto_reset)
        at_threshold=1;
      m_trigger();
      return;
    end

    m_event.wait_trigger();

  endtask

  
  // Function: reset
  //
  // Resets the barrier. This sets the waiter count back to zero. 
  //
  // The threshold is unchanged. After reset, the barrier will force processes
  // to wait for the threshold again. 
  //
  // If the ~wakeup~ bit is set, any currently waiting processes will
  // be activated.

  virtual function void reset (bit wakeup=1);
    at_threshold = 0;
    if (num_waiters) begin
      if (wakeup)
        m_event.trigger();
      else
        m_event.reset();
    end
    num_waiters = 0;
  endfunction


  // Function: set_auto_reset
  //
  // Determines if the barrier should reset itself after the threshold is
  // reached. 
  //
  // The default is on, so when a barrier hits its threshold it will reset, and
  // new processes will block until the threshold is reached again. 
  //
  // If auto reset is off, then once the threshold is achieved, new processes
  // pass through without being blocked until the barrier is reset.

  virtual function void set_auto_reset (bit value=1);
    at_threshold = 0;
    auto_reset = value;
  endfunction


  // Function: set_threshold
  //
  // Sets the process threshold. 
  //
  // This determines how many processes must be waiting on the barrier before
  // the processes may proceed. 
  //
  // Once the ~threshold~ is reached, all waiting processes are activated. 
  //
  // If ~threshold~ is set to a value less than the number of currently
  // waiting processes, then the barrier is reset and waiting processes are
  // activated.

  virtual function void set_threshold (int threshold);
    this.threshold = threshold;
    if (threshold <= num_waiters)
      reset(1);
  endfunction


  // Function: get_threshold
  //
  // Gets the current threshold setting for the barrier.

  virtual function int get_threshold ();
    return threshold;
  endfunction

  
  // Function: get_num_waiters
  //
  // Returns the number of processes currently waiting at the barrier.

  virtual function int get_num_waiters ();
    return num_waiters;
  endfunction


  // Function: cancel
  //
  // Decrements the waiter count by one. This is used when a process that is
  // waiting on the barrier is killed or activated by some other means.

  virtual function void cancel ();
    m_event.cancel();
    num_waiters = m_event.get_num_waiters();
  endfunction


  const static string type_name = "uvm_barrier";

  virtual  function uvm_object create(string name=""); 
    uvm_barrier v;
    v=new(name);
    return v;
  endfunction

  virtual  function string get_type_name();
    return type_name;
  endfunction

  local task m_trigger();
    m_event.trigger();
    num_waiters=0;
    #0; //this process was last to wait; allow other procs to resume first
  endtask

  virtual function void do_print (uvm_printer printer);
    printer.print_field_int("threshold", threshold, $bits(threshold), UVM_DEC, ".", "int");
    printer.print_field_int("num_waiters", num_waiters, $bits(num_waiters), UVM_DEC, ".", "int");
    printer.print_field_int("at_threshold", at_threshold, $bits(at_threshold), UVM_BIN, ".", "bit");
    printer.print_field_int("auto_reset", auto_reset, $bits(auto_reset), UVM_BIN, ".", "bit");
  endfunction

  virtual function void do_copy (uvm_object rhs);
    uvm_barrier b;
    super.do_copy(rhs);
    if(!$cast(b, rhs) || (b==null)) return;

    threshold = b.threshold;
    num_waiters = b.num_waiters;
    at_threshold = b.at_threshold;
    auto_reset = b.auto_reset;
    m_event = b.m_event;
  endfunction  

endclass



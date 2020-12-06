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


`ifndef UVM_QUEUE_SVH
`define UVM_QUEUE_SVH

//------------------------------------------------------------------------------
//
// CLASS: uvm_queue #(T)
//
//------------------------------------------------------------------------------
// Implements a class-based dynamic queue. Allows queues to be allocated on
// demand, and passed and stored by reference.
//------------------------------------------------------------------------------

class uvm_queue #(type T=int) extends uvm_object;

  const static string type_name = "uvm_queue";

  typedef uvm_queue #(T) this_type;

  static local this_type m_global_queue;
  protected T queue[$];

  // Function: new
  //
  // Creates a new queue with the given ~name~.

  function new (string name="");
    super.new(name);
  endfunction


  // Function: get_global_queue
  //
  // Returns the singleton global queue for the item type, T. 
  //
  // This allows items to be shared amongst components throughout the
  // verification environment.

  static function this_type get_global_queue ();
    if (m_global_queue==null)
      m_global_queue = new("global_queue");
    return m_global_queue;
  endfunction


  // Function: get_global
  //
  // Returns the specified item instance from the global item queue. 

  static function T get_global (int index);
    this_type gqueue;
    gqueue = get_global_queue(); 
    return gqueue.get(index);
  endfunction


  // Function: get
  //
  // Returns the item at the given ~index~.
  //
  // If no item exists by that key, a new item is created with that key
  // and returned.

  virtual function T get (int index);
    T default_value;
    if (index >= size() || index < 0) begin
      uvm_report_warning("QUEUEGET",
        $sformatf("get: given index out of range for queue of size %0d. Ignoring get request",size()));
      return default_value;
    end
    return queue[index];
  endfunction
  

  // Function: size
  //
  // Returns the number of items stored in the queue.

  virtual function int size ();
    return queue.size();
  endfunction


  // Function: insert
  //
  // Inserts the item at the given ~index~ in the queue.

  virtual function void insert (int index, T item);
    if (index >= size() || index < 0) begin
      uvm_report_warning("QUEUEINS",
        $sformatf("insert: given index out of range for queue of size %0d. Ignoring insert request",size()));
      return;
    end
    queue.insert(index,item);
  endfunction


  // Function: delete
  //
  // Removes the item at the given ~index~ from the queue; if ~index~ is
  // not provided, the entire contents of the queue are deleted.

  virtual function void delete (int index=-1);
    if (index >= size() || index < -1) begin
      uvm_report_warning("QUEUEDEL",
        $sformatf("delete: given index out of range for queue of size %0d. Ignoring delete request",size()));
      return;
    end
    if (index == -1)
      queue.delete();
    else
      queue.delete(index);
  endfunction


  // Function: pop_front
  //
  // Returns the first element in the queue (index=0),
  // or ~null~ if the queue is empty.

  virtual function T pop_front();
    return queue.pop_front();
  endfunction


  // Function: pop_back
  //
  // Returns the last element in the queue (index=size()-1),
  // or ~null~ if the queue is empty.

  virtual function T pop_back();
    return queue.pop_back();
  endfunction


  // Function: push_front
  //
  // Inserts the given ~item~ at the front of the queue.

  virtual function void push_front(T item);
    queue.push_front(item);
  endfunction


  // Function: push_back
  //
  // Inserts the given ~item~ at the back of the queue.

  virtual function void push_back(T item);
    queue.push_back(item);
  endfunction


  virtual function uvm_object create (string name=""); 
    this_type v;
    v=new(name);
    return v;
  endfunction

  virtual function string get_type_name ();
    return type_name;
  endfunction

  virtual function void do_copy (uvm_object rhs);
    this_type p;
    super.do_copy(rhs);
    if (rhs == null || !$cast(p, rhs))
      return;
    queue = p.queue;
  endfunction
  
  virtual function string convert2string();
      return $sformatf("%p",queue);
  endfunction


endclass


`endif // UVM_QUEUE_SVH


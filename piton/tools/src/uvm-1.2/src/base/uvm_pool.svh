//
//------------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
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

// Title: Pool Classes
// This section defines the <uvm_pool #(KEY, T)> class and derivative.

//------------------------------------------------------------------------------
//
// CLASS: uvm_pool #(KEY,T)
//
//------------------------------------------------------------------------------
// Implements a class-based dynamic associative array. Allows sparse arrays to
// be allocated on demand, and passed and stored by reference.
//------------------------------------------------------------------------------

class uvm_pool #(type KEY=int, T=uvm_void) extends uvm_object;

  const static string type_name = "uvm_pool";

  typedef uvm_pool #(KEY,T) this_type;

  static protected this_type m_global_pool;
  protected T pool[KEY];


  // Function: new
  //
  // Creates a new pool with the given ~name~.

  function new (string name="");
    super.new(name);
  endfunction


  // Function: get_global_pool
  //
  // Returns the singleton global pool for the item type, T. 
  //
  // This allows items to be shared amongst components throughout the
  // verification environment.

  static function this_type get_global_pool ();
    if (m_global_pool==null)
      m_global_pool = new("pool");
    return m_global_pool;
  endfunction


  // Function: get_global
  //
  // Returns the specified item instance from the global item pool. 

  static function T get_global (KEY key);
    this_type gpool;
    gpool = get_global_pool(); 
    return gpool.get(key);
  endfunction


  // Function: get
  //
  // Returns the item with the given ~key~.
  //
  // If no item exists by that key, a new item is created with that key
  // and returned.

  virtual function T get (KEY key);
    if (!pool.exists(key)) begin
      T default_value;
      pool[key] = default_value;
    end
    return pool[key];
  endfunction
  

  // Function: add
  //
  // Adds the given (~key~, ~item~) pair to the pool. If an item already
  // exists at the given ~key~ it is overwritten with the new ~item~.

  virtual function void add (KEY key, T item);
    pool[key] = item;
  endfunction
  

  // Function: num
  //
  // Returns the number of uniquely keyed items stored in the pool.

  virtual function int num ();
    return pool.num();
  endfunction


  // Function: delete
  //
  // Removes the item with the given ~key~ from the pool.

  virtual function void delete (KEY key);
    if (!exists(key)) begin
      uvm_report_warning("POOLDEL",
        $sformatf("delete: pool key doesn't exist. Ignoring delete request"));
      return;
    end
    pool.delete(key);
  endfunction


  // Function: exists
  //
  // Returns 1 if an item with the given ~key~ exists in the pool,
  // 0 otherwise.

  virtual function int exists (KEY key);
    return pool.exists(key);
  endfunction


  // Function: first
  //
  // Returns the key of the first item stored in the pool.
  //
  // If the pool is empty, then ~key~ is unchanged and 0 is returned.
  //
  // If the pool is not empty, then ~key~ is key of the first item
  // and 1 is returned.

  virtual function int first (ref KEY key);
    return pool.first(key);
  endfunction


  // Function: last
  //
  // Returns the key of the last item stored in the pool.
  //
  // If the pool is empty, then 0 is returned and ~key~ is unchanged. 
  //
  // If the pool is not empty, then ~key~ is set to the last key in
  // the pool and 1 is returned.

  virtual function int last (ref KEY key);
    return pool.last(key);
  endfunction


  // Function: next
  //
  // Returns the key of the next item in the pool.
  //
  // If the input ~key~ is the last key in the pool, then ~key~ is
  // left unchanged and 0 is returned. 
  //
  // If a next key is found, then ~key~ is updated with that key
  // and 1 is returned.

  virtual function int next (ref KEY key);
    return pool.next(key);
  endfunction


  // Function: prev
  //
  // Returns the key of the previous item in the pool.
  //
  // If the input ~key~ is the first key in the pool, then ~key~ is
  // left unchanged and 0 is returned. 
  //
  // If a previous key is found, then ~key~ is updated with that key
  // and 1 is returned.

  virtual function int prev (ref KEY key);
    return pool.prev(key);
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
    KEY key;
    super.do_copy(rhs);
    if (rhs==null || !$cast(p, rhs))
      return;
    pool = p.pool;
  endfunction

  virtual function void do_print (uvm_printer printer);
    string v;
    int cnt;
    string item;
    KEY key;
    printer.print_array_header("pool",pool.num(),"aa_object_string");
    if (pool.first(key))
      do begin
        item.itoa(cnt);
        item = {"[-key",item,"--]"};
        $swrite(v,pool[key]);
        printer.print_generic(item,"",-1,v,"[");
      end
      while (pool.next(key));
    printer.print_array_footer();
  endfunction

endclass


//------------------------------------------------------------------------------
//
// CLASS: uvm_object_string_pool #(T)
//
//------------------------------------------------------------------------------
// This provides a specialization of the generic <uvm_pool #(KEY,T)> class for
// an associative array of <uvm_object>-based objects indexed by string. 
// Specializations of this class include the ~uvm_event_pool~ (a
// uvm_object_string_pool storing ~uvm_event#(uvm_object)~) and
// ~uvm_barrier_pool~ (a uvm_obejct_string_pool storing <uvm_barrier>).
//------------------------------------------------------------------------------

class uvm_object_string_pool #(type T=uvm_object) extends uvm_pool #(string,T);

  typedef uvm_object_string_pool #(T) this_type;
  static protected this_type m_global_pool;


  // Function: new
  //
  // Creates a new pool with the given ~name~.

  function new (string name="");
    super.new(name);
  endfunction


  const static string type_name = {"uvm_obj_str_pool"};

  // Function: get_type_name
  //
  // Returns the type name of this object.

  virtual function string get_type_name();
    return type_name;
  endfunction


  // Function: get_global_pool
  //
  // Returns the singleton global pool for the item type, T. 
  //
  // This allows items to be shared amongst components throughout the
  // verification environment.

  static function this_type get_global_pool ();
    if (m_global_pool==null)
      m_global_pool = new("global_pool");
    return m_global_pool;
  endfunction


  // Function: get_global
  //
  // Returns the specified item instance from the global item pool. 

  static function T get_global (string key);
    this_type gpool;
    gpool = get_global_pool(); 
    return gpool.get(key);
  endfunction


  // Function: get
  //
  // Returns the object item at the given string ~key~.
  //
  // If no item exists by the given ~key~, a new item is created for that key
  // and returned.

  virtual function T get (string key);
    if (!pool.exists(key))
      pool[key] = new (key);
    return pool[key];
  endfunction
  

  // Function: delete
  //
  // Removes the item with the given string ~key~ from the pool.

  virtual function void delete (string key);
    if (!exists(key)) begin
      uvm_report_warning("POOLDEL",
        $sformatf("delete: key '%s' doesn't exist", key));
      return;
    end
    pool.delete(key);
  endfunction


  // Function- do_print

  virtual function void do_print (uvm_printer printer);
    string key;
    printer.print_array_header("pool",pool.num(),"aa_object_string");
    if (pool.first(key))
      do
        printer.print_object({"[",key,"]"}, pool[key],"[");
      while (pool.next(key));
    printer.print_array_footer();
  endfunction

endclass


typedef class uvm_barrier;
typedef class uvm_event;

typedef uvm_object_string_pool #(uvm_barrier) uvm_barrier_pool;
typedef uvm_object_string_pool #(uvm_event#(uvm_object)) uvm_event_pool;



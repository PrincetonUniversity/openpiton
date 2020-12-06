//
// -------------------------------------------------------------
//    Copyright 2004-2009 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    All Rights Reserved Worldwide
//
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
//

//------------------------------------------------------------------------------
// Title: Virtual Registers
//------------------------------------------------------------------------------
//
// A virtual register is a collection of fields,
// overlaid on top of a memory, usually in an array.
// The semantics and layout of virtual registers comes from
// an agreement between the software and the hardware,
// not any physical structures in the DUT.
//
//------------------------------------------------------------------------------

typedef class uvm_mem_region;
typedef class uvm_mem_mam;

typedef class uvm_vreg_cbs;


//------------------------------------------------------------------------------
// Class: uvm_vreg
//
// Virtual register abstraction base class
//
// A virtual register represents a set of fields that are
// logically implemented in consecutive memory locations.
//
// All virtual register accesses eventually turn into memory accesses.
//
// A virtual register array may be implemented on top of
// any memory abstraction class and possibly dynamically
// resized and/or relocated.
//
//------------------------------------------------------------------------------

class uvm_vreg extends uvm_object;

   `uvm_register_cb(uvm_vreg, uvm_vreg_cbs)

   local bit locked;
   local uvm_reg_block parent;
   local int unsigned  n_bits;
   local int unsigned  n_used_bits;

   local uvm_vreg_field fields[$];   // Fields in LSB to MSB order

   local uvm_mem          mem;     // Where is it implemented?
   local uvm_reg_addr_t   offset;  // Start of vreg[0]
   local int unsigned     incr;    // From start to start of next
   local longint unsigned size;    //number of vregs
   local bit              is_static;

   local uvm_mem_region   region;    // Not NULL if implemented via MAM
  
   local semaphore atomic;   // Field RMW operations must be atomic
   local string fname;
   local int lineno;
   local bit read_in_progress;
   local bit write_in_progress;

   //
   // Group: Initialization
   //

   //
   // FUNCTION: new
   // Create a new instance and type-specific configuration
   //
   // Creates an instance of a virtual register abstraction class
   // with the specified name.
   //
   // ~n_bits~ specifies the total number of bits in a virtual register.
   // Not all bits need to be mapped to a virtual field.
   // This value is usually a multiple of 8.
   //
   extern function new(string       name,
                       int unsigned n_bits);
                       

   //
   // Function: configure
   // Instance-specific configuration
   //
   // Specify the ~parent~ block of this virtual register array.
   // If one of the other parameters are specified, the virtual register
   // is assumed to be dynamic and can be later (re-)implemented using
   // the <uvm_vreg::implement()> method.
   //
   // If ~mem~ is specified, then the virtual register array is assumed
   // to be statically implemented in the memory corresponding to the specified
   // memory abstraction class and ~size~, ~offset~ and ~incr~
   // must also be specified.
   // Static virtual register arrays cannot be re-implemented.
   //
   extern function void configure(uvm_reg_block     parent,
                                  uvm_mem       mem    = null,
                                  longint unsigned  size   = 0,
                                  uvm_reg_addr_t    offset = 0,
                                  int unsigned      incr   = 0);

   //
   // FUNCTION: implement
   // Dynamically implement, resize or relocate a virtual register array
   //
   // Implement an array of virtual registers of the specified
   // ~size~, in the specified memory and ~offset~.
   // If an offset increment is specified, each
   // virtual register is implemented at the specified offset increment
   // from the previous one.
   // If an offset increment of 0 is specified,
   // virtual registers are packed as closely as possible
   // in the memory.
   //
   // If no memory is specified, the virtual register array is
   // in the same memory, at the same base offset using the same
   // offset increment as originally implemented.
   // Only the number of virtual registers in the virtual register array
   // is modified.
   //
   // The initial value of the newly-implemented or
   // relocated set of virtual registers is whatever values
   // are currently stored in the memory now implementing them.
   //
   // Returns TRUE if the memory
   // can implement the number of virtual registers
   // at the specified base offset and offset increment.
   // Returns FALSE otherwise.
   //
   // The memory region used to implement a virtual register array
   // is reserved in the memory allocation manager associated with
   // the memory to prevent it from being allocated for another purpose.
   //
   extern virtual function bit implement(longint unsigned  n,
                                         uvm_mem       mem    = null,
                                         uvm_reg_addr_t    offset = 0,
                                         int unsigned      incr   = 0);

   //
   // FUNCTION: allocate
   // Randomly implement, resize or relocate a virtual register array
   //
   // Implement a virtual register array of the specified
   // size in a randomly allocated region of the appropriate size
   // in the address space managed by the specified memory allocation manager.
   // If a memory allocation policy is specified, it is passed to the
   // uvm_mem_mam::request_region() method.
   //
   // The initial value of the newly-implemented
   // or relocated set of virtual registers is whatever values are
   // currently stored in the
   // memory region now implementing them.
   //
   // Returns a reference to a <uvm_mem_region> memory region descriptor
   // if the memory allocation manager was able to allocate a region
   // that can implement the virtual register array with the specified allocation policy.
   // Returns ~null~ otherwise.
   //
   // A region implementing a virtual register array
   // must not be released using the <uvm_mem_mam::release_region()> method.
   // It must be released using the <uvm_vreg::release_region()> method.
   // 
   extern virtual function uvm_mem_region allocate(longint unsigned   n,
                                                   uvm_mem_mam        mam,
                                                   uvm_mem_mam_policy alloc = null);

   //
   // FUNCTION: get_region
   // Get the region where the virtual register array is implemented
   //
   // Returns a reference to the <uvm_mem_region> memory region descriptor
   // that implements the virtual register array.
   //
   // Returns ~null~ if the virtual registers array
   // is not currently implemented.
   // A region implementing a virtual register array
   // must not be released using the <uvm_mem_mam::release_region()> method.
   // It must be released using the <uvm_vreg::release_region()> method.
   // 
   extern virtual function uvm_mem_region get_region();

   //
   // FUNCTION: release_region
   // Dynamically un-implement a virtual register array
   //
   // Release the memory region used to implement a virtual register array
   // and return it to the pool of available memory 
   // that can be allocated by the memory's default allocation manager.
   // The virtual register array is subsequently considered as unimplemented
   // and can no longer be accessed.
   //
   // Statically-implemented virtual registers cannot be released.
   //
   extern virtual function void release_region();


   /*local*/ extern virtual function void set_parent(uvm_reg_block parent);
   /*local*/ extern function void Xlock_modelX();
   
   /*local*/ extern function void add_field(uvm_vreg_field field);
   /*local*/ extern task XatomicX(bit on);

   //
   // Group: Introspection
   //

   //
   // Function: get_name
   // Get the simple name
   //
   // Return the simple object name of this register.
   //

   //
   // Function: get_full_name
   // Get the hierarchical name
   //
   // Return the hierarchal name of this register.
   // The base of the hierarchical name is the root block.
   //
   extern virtual function string        get_full_name();

   //
   // FUNCTION: get_parent
   // Get the parent block
   //
   extern virtual function uvm_reg_block get_parent();
   extern virtual function uvm_reg_block get_block();


   //
   // FUNCTION: get_memory
   // Get the memory where the virtual register array is implemented
   //
   extern virtual function uvm_mem get_memory();

   //
   // Function: get_n_maps
   // Returns the number of address maps this virtual register array is mapped in
   //
   extern virtual function int             get_n_maps      ();

   //
   // Function: is_in_map
   // Return TRUE if this virtual register array is in the specified address ~map~
   //
   extern function         bit             is_in_map       (uvm_reg_map map);

   //
   // Function: get_maps
   // Returns all of the address ~maps~ where this virtual register array is mapped
   //
   extern virtual function void            get_maps        (ref uvm_reg_map maps[$]);

   //
   // FUNCTION: get_rights
   // Returns the access rights of this virtual register array
   //
   // Returns "RW", "RO" or "WO".
   // The access rights of a virtual register array is always "RW",
   // unless it is implemented in a shared memory
   // with access restriction in a particular address map.
   //
   // If no address map is specified and the memory is mapped in only one
   // address map, that address map is used. If the memory is mapped
   // in more than one address map, the default address map of the
   // parent block is used.
   //
   // If an address map is specified and
   // the memory is not mapped in the specified
   // address map, an error message is issued
   // and "RW" is returned. 
   //
   extern virtual function string get_rights(uvm_reg_map map = null);

   //
   // FUNCTION: get_access
   // Returns the access policy of the virtual register array
   // when written and read via an address map.
   //
   // If the memory implementing the virtual register array
   // is mapped in more than one address map,
   // an address ~map~ must be specified.
   // If access restrictions are present when accessing a memory
   // through the specified address map, the access mode returned
   // takes the access restrictions into account.
   // For example, a read-write memory accessed
   // through an address map with read-only restrictions would return "RO". 
   //
   extern virtual function string get_access(uvm_reg_map map = null);

   //
   // FUNCTION: get_size
   // Returns the size of the virtual register array. 
   //
   extern virtual function int unsigned get_size();

   //
   // FUNCTION: get_n_bytes
   // Returns the width, in bytes, of a virtual register.
   //
   // The width of a virtual register is always a multiple of the width
   // of the memory locations used to implement it.
   // For example, a virtual register containing two 1-byte fields
   // implemented in a memory with 4-bytes memory locations is 4-byte wide. 
   //
   extern virtual function int unsigned get_n_bytes();

   //
   // FUNCTION: get_n_memlocs
   // Returns the number of memory locations used
   // by a single virtual register. 
   //
   extern virtual function int unsigned get_n_memlocs();

   //
   // FUNCTION: get_incr
   // Returns the number of memory locations
   // between two individual virtual registers in the same array. 
   //
   extern virtual function int unsigned get_incr();

   //
   // FUNCTION: get_fields
   // Return the virtual fields in this virtual register
   //
   // Fills the specified array with the abstraction class
   // for all of the virtual fields contained in this virtual register.
   // Fields are ordered from least-significant position to most-significant
   // position within the register. 
   //
   extern virtual function void get_fields(ref uvm_vreg_field fields[$]);

   //
   // FUNCTION: get_field_by_name
   // Return the named virtual field in this virtual register
   //
   // Finds a virtual field with the specified name in this virtual register
   // and returns its abstraction class.
   // If no fields are found, returns ~null~.
   //
   extern virtual function uvm_vreg_field get_field_by_name(string name);

   //
   // FUNCTION: get_offset_in_memory
   // Returns the offset of a virtual register
   //
   // Returns the base offset of the specified virtual register,
   // in the overall address space of the memory
   // that implements the virtual register array.
   //
   extern virtual function uvm_reg_addr_t  get_offset_in_memory(longint unsigned idx);

   //
   // FUNCTION: get_address
   // Returns the base external physical address of a virtual register
   //
   // Returns the base external physical address of the specified
   // virtual register if accessed through the specified address ~map~.
   //
   // If no address map is specified and the memory implementing
   // the virtual register array is mapped in only one
   // address map, that address map is used. If the memory is mapped
   // in more than one address map, the default address map of the
   // parent block is used.
   //
   // If an address map is specified and
   // the memory is not mapped in the specified
   // address map, an error message is issued.
   //
   extern virtual function uvm_reg_addr_t  get_address(longint unsigned idx,
                                                       uvm_reg_map map = null);

   //
   // Group: HDL Access
   //

   //
   // TASK: write
   // Write the specified value in a virtual register
   //
   // Write ~value~ in the DUT memory location(s) that implements
   // the virtual register array that corresponds to this
   // abstraction class instance using the specified access
   // ~path~. 
   //
   // If the memory implementing the virtual register array
   // is mapped in more than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   //
   // The operation is eventually mapped into set of
   // memory-write operations at the location where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   //
   extern virtual task write(input  longint unsigned   idx,
                             output uvm_status_e  status,
                             input  uvm_reg_data_t     value,
                             input  uvm_path_e    path = UVM_DEFAULT_PATH,
                             input  uvm_reg_map     map = null,
                             input  uvm_sequence_base  parent = null,
                             input  uvm_object         extension = null,
                             input  string             fname = "",
                             input  int                lineno = 0);

   //
   // TASK: read
   // Read the current value from a virtual register
   //
   // Read from the DUT memory location(s) that implements
   // the virtual register array that corresponds to this
   // abstraction class instance using the specified access
   // ~path~ and return the readback ~value~.
   //
   // If the memory implementing the virtual register array
   // is mapped in more than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   //
   // The operation is eventually mapped into set of
   // memory-read operations at the location where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   //
   extern virtual task read(input  longint unsigned    idx,
                            output uvm_status_e   status,
                            output uvm_reg_data_t      value,
                            input  uvm_path_e     path = UVM_DEFAULT_PATH,
                            input  uvm_reg_map      map = null,
                            input  uvm_sequence_base   parent = null,
                            input  uvm_object          extension = null,
                            input  string              fname = "",
                            input  int                 lineno = 0);

   //
   // TASK: poke
   // Deposit the specified value in a virtual register
   //
   // Deposit ~value~ in the DUT memory location(s) that implements
   // the virtual register array that corresponds to this
   // abstraction class instance using the memory backdoor access.
   //
   // The operation is eventually mapped into set of
   // memory-poke operations at the location where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   //
   extern virtual task poke(input  longint unsigned    idx,
                            output uvm_status_e   status,
                            input  uvm_reg_data_t      value,
                            input  uvm_sequence_base   parent = null,
                            input  uvm_object          extension = null,
                            input  string              fname = "",
                            input  int                 lineno = 0);

   //
   // TASK: peek
   // Sample the current value in a virtual register
   //
   // Sample the DUT memory location(s) that implements
   // the virtual register array that corresponds to this
   // abstraction class instance using the memory backdoor access,
   // and return the sampled ~value~.
   //
   // The operation is eventually mapped into set of
   // memory-peek operations at the location where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   //
   extern virtual task peek(input  longint unsigned    idx,
                            output uvm_status_e   status,
                            output uvm_reg_data_t      value,
                            input  uvm_sequence_base   parent = null,
                            input  uvm_object          extension = null,
                            input  string              fname = "",
                            input  int                 lineno = 0);
  
   //
   // Function: reset
   // Reset the access semaphore
   //
   // Reset the semaphore that prevents concurrent access
   // to the virtual register.
   // This semaphore must be explicitly reset if a thread accessing
   // this virtual register array was killed in before the access
   // was completed
   //
   extern function void reset(string kind = "HARD");


   //
   // Group: Callbacks
   //

   //
   // TASK: pre_write
   // Called before virtual register write.
   //
   // If the specified data value, access ~path~ or address ~map~ are modified,
   // the updated data value, access path or address map will be used
   // to perform the virtual register operation.
   //
   // The registered callback methods are invoked after the invocation
   // of this method.
   // All register callbacks are executed after the corresponding
   // field callbacks
   // The pre-write virtual register and field callbacks are executed
   // before the corresponding pre-write memory callbacks
   //
   virtual task pre_write(longint unsigned     idx,
                          ref uvm_reg_data_t   wdat,
                          ref uvm_path_e  path,
                          ref uvm_reg_map      map);
   endtask: pre_write

   //
   // TASK: post_write
   // Called after virtual register write.
   //
   // If the specified ~status~ is modified,
   // the updated status will be
   // returned by the virtual register operation.
   //
   // The registered callback methods are invoked before the invocation
   // of this method.
   // All register callbacks are executed before the corresponding
   // field callbacks
   // The post-write virtual register and field callbacks are executed
   // after the corresponding post-write memory callbacks
   //
   virtual task post_write(longint unsigned       idx,
                           uvm_reg_data_t         wdat,
                           uvm_path_e        path,
                           uvm_reg_map            map,
                           ref uvm_status_e  status);
   endtask: post_write

   //
   // TASK: pre_read
   // Called before virtual register read.
   //
   // If the specified access ~path~ or address ~map~ are modified,
   // the updated access path or address map will be used to perform
   // the register operation.
   //
   // The registered callback methods are invoked after the invocation
   // of this method.
   // All register callbacks are executed after the corresponding
   // field callbacks
   // The pre-read virtual register and field callbacks are executed
   // before the corresponding pre-read memory callbacks
   //
   virtual task pre_read(longint unsigned     idx,
                         ref uvm_path_e  path,
                         ref uvm_reg_map      map);
   endtask: pre_read

   //
   // TASK: post_read
   // Called after virtual register read.
   //
   // If the specified readback data or ~status~ is modified,
   // the updated readback data or status will be
   // returned by the register operation.
   //
   // The registered callback methods are invoked before the invocation
   // of this method.
   // All register callbacks are executed before the corresponding
   // field callbacks
   // The post-read virtual register and field callbacks are executed
   // after the corresponding post-read memory callbacks
   //
   virtual task post_read(longint unsigned       idx,
                          ref uvm_reg_data_t     rdat,
                          input uvm_path_e  path,
                          input uvm_reg_map      map,
                          ref uvm_status_e  status);
   endtask: post_read

   extern virtual function void do_print (uvm_printer printer);
   extern virtual function string convert2string;
   extern virtual function uvm_object clone();
   extern virtual function void do_copy   (uvm_object rhs);
   extern virtual function bit do_compare (uvm_object  rhs,
                                          uvm_comparer comparer);
   extern virtual function void do_pack (uvm_packer packer);
   extern virtual function void do_unpack (uvm_packer packer);

endclass: uvm_vreg



//------------------------------------------------------------------------------
// Class: uvm_vreg_cbs
//
// Pre/post read/write callback facade class
//
//------------------------------------------------------------------------------

class uvm_vreg_cbs extends uvm_callback;

   string fname;
   int    lineno;

   function new(string name = "uvm_reg_cbs");
      super.new(name);
   endfunction
   

   //
   // Task: pre_write
   // Callback called before a write operation.
   //
   // The registered callback methods are invoked after the invocation
   // of the <uvm_vreg::pre_write()> method.
   // All virtual register callbacks are executed after the corresponding
   // virtual field callbacks
   // The pre-write virtual register and field callbacks are executed
   // before the corresponding pre-write memory callbacks
   //
   // The written value ~wdat~, access ~path~ and address ~map~,
   // if modified, modifies the actual value, access path or address map
   // used in the virtual register operation.
   //
   virtual task pre_write(uvm_vreg         rg,
                          longint unsigned     idx,
                          ref uvm_reg_data_t   wdat,
                          ref uvm_path_e  path,
                          ref uvm_reg_map   map);
   endtask: pre_write


   //
   // TASK: post_write
   // Called after register write.
   //
   // The registered callback methods are invoked before the invocation
   // of the <uvm_reg::post_write()> method.
   // All register callbacks are executed before the corresponding
   // virtual field callbacks
   // The post-write virtual register and field callbacks are executed
   // after the corresponding post-write memory callbacks
   //
   // The ~status~ of the operation,
   // if modified, modifies the actual returned status.
   //
   virtual task post_write(uvm_vreg           rg,
                           longint unsigned       idx,
                           uvm_reg_data_t         wdat,
                           uvm_path_e        path,
                           uvm_reg_map         map,
                           ref uvm_status_e  status);
   endtask: post_write


   //
   // TASK: pre_read
   // Called before register read.
   //
   // The registered callback methods are invoked after the invocation
   // of the <uvm_reg::pre_read()> method.
   // All register callbacks are executed after the corresponding
   // virtual field callbacks
   // The pre-read virtual register and field callbacks are executed
   // before the corresponding pre-read memory callbacks
   //
   // The access ~path~ and address ~map~,
   // if modified, modifies the actual access path or address map
   // used in the register operation.
   //
   virtual task pre_read(uvm_vreg         rg,
                         longint unsigned     idx,
                         ref uvm_path_e  path,
                         ref uvm_reg_map   map);
   endtask: pre_read


   //
   // TASK: post_read
   // Called after register read.
   //
   // The registered callback methods are invoked before the invocation
   // of the <uvm_reg::post_read()> method.
   // All register callbacks are executed before the corresponding
   // virtual field callbacks
   // The post-read virtual register and field callbacks are executed
   // after the corresponding post-read memory callbacks
   //
   // The readback value ~rdat~ and the ~status~ of the operation,
   // if modified, modifies the actual returned readback value and status.
   //
   virtual task post_read(uvm_vreg           rg,
                          longint unsigned       idx,
                          ref uvm_reg_data_t     rdat,
                          input uvm_path_e  path,
                          input uvm_reg_map   map,
                          ref uvm_status_e  status);
   endtask: post_read
endclass: uvm_vreg_cbs


//
// Type: uvm_vreg_cb
// Convenience callback type declaration
//
// Use this declaration to register virtual register callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_vreg, uvm_vreg_cbs) uvm_vreg_cb;

//
// Type: uvm_vreg_cb_iter
// Convenience callback iterator type declaration
//
// Use this declaration to iterate over registered virtual register callbacks
// rather than the more verbose parameterized class
//
typedef uvm_callback_iter#(uvm_vreg, uvm_vreg_cbs) uvm_vreg_cb_iter;



//------------------------------------------------------------------------------
// IMPLEMENTATION
//------------------------------------------------------------------------------

function uvm_vreg::new(string       name,
                           int unsigned n_bits);
   super.new(name);

   if (n_bits == 0) begin
      `uvm_error("RegModel", $sformatf("Virtual register \"%s\" cannot have 0 bits", this.get_full_name()));
      n_bits = 1;
   end
   if (n_bits > `UVM_REG_DATA_WIDTH) begin
      `uvm_error("RegModel", $sformatf("Virtual register \"%s\" cannot have more than %0d bits (%0d)", this.get_full_name(), `UVM_REG_DATA_WIDTH, n_bits));
      n_bits = `UVM_REG_DATA_WIDTH;
   end
   this.n_bits = n_bits;

   this.locked    = 0;
endfunction: new

function void uvm_vreg::configure(uvm_reg_block      parent,
                                      uvm_mem        mem = null,
                                      longint unsigned   size = 0,
                                      uvm_reg_addr_t     offset = 0,
                                      int unsigned       incr = 0);
   this.parent = parent;

   this.n_used_bits = 0;

   if (mem != null) begin
      void'(this.implement(size, mem, offset, incr));
      this.is_static = 1;
   end
   else begin
      this.mem = null;
      this.is_static = 0;
   end
   this.parent.add_vreg(this);

   this.atomic = new(1);
endfunction: configure



function void uvm_vreg::Xlock_modelX();
   if (this.locked) return;

   this.locked = 1;
endfunction: Xlock_modelX


function void uvm_vreg::add_field(uvm_vreg_field field);
   int offset;
   int idx;
   
   if (this.locked) begin
      `uvm_error("RegModel", "Cannot add virtual field to locked virtual register model");
      return;
   end

   if (field == null) `uvm_fatal("RegModel", "Attempting to register NULL virtual field");

   // Store fields in LSB to MSB order
   offset = field.get_lsb_pos_in_register();

   idx = -1;
   foreach (this.fields[i]) begin
      if (offset < this.fields[i].get_lsb_pos_in_register()) begin
         int j = i;
         this.fields.insert(j, field);
         idx = i;
         break;
      end
   end
   if (idx < 0) begin
      this.fields.push_back(field);
      idx = this.fields.size()-1;
   end

   this.n_used_bits += field.get_n_bits();
   
   // Check if there are too many fields in the register
   if (this.n_used_bits > this.n_bits) begin
      `uvm_error("RegModel", $sformatf("Virtual fields use more bits (%0d) than available in virtual register \"%s\" (%0d)",
                                     this.n_used_bits, this.get_full_name(), this.n_bits));
   end

   // Check if there are overlapping fields
   if (idx > 0) begin
      if (this.fields[idx-1].get_lsb_pos_in_register() +
          this.fields[idx-1].get_n_bits() > offset) begin
         `uvm_error("RegModel", $sformatf("Field %s overlaps field %s in virtual register \"%s\"",
                                        this.fields[idx-1].get_name(),
                                        field.get_name(),
                                        this.get_full_name()));
      end
   end
   if (idx < this.fields.size()-1) begin
      if (offset + field.get_n_bits() >
          this.fields[idx+1].get_lsb_pos_in_register()) begin
         `uvm_error("RegModel", $sformatf("Field %s overlaps field %s in virtual register \"%s\"",
                                        field.get_name(),
                                        this.fields[idx+1].get_name(),

                                        this.get_full_name()));
      end
   end
endfunction: add_field


task uvm_vreg::XatomicX(bit on);
   if (on) this.atomic.get(1);
   else begin
      // Maybe a key was put back in by a spurious call to reset()
      void'(this.atomic.try_get(1));
      this.atomic.put(1);
   end
endtask: XatomicX


function void uvm_vreg::reset(string kind = "HARD");
   // Put back a key in the semaphore if it is checked out
   // in case a thread was killed during an operation
   void'(this.atomic.try_get(1));
   this.atomic.put(1);
endfunction: reset


function string uvm_vreg::get_full_name();
   uvm_reg_block blk;

   get_full_name = this.get_name();

   // Do not include top-level name in full name
   blk = this.get_block();
   if (blk == null) return get_full_name;
   if (blk.get_parent() == null) return get_full_name;

   get_full_name = {this.parent.get_full_name(), ".", get_full_name};
endfunction: get_full_name

function void uvm_vreg::set_parent(uvm_reg_block parent);
   this.parent = parent;
endfunction: set_parent

function uvm_reg_block uvm_vreg::get_parent();
   get_parent = this.parent;
endfunction: get_parent

function uvm_reg_block uvm_vreg::get_block();
   get_block = this.parent;
endfunction: get_block


function bit uvm_vreg::implement(longint unsigned n,
                                     uvm_mem      mem = null,
                                     uvm_reg_addr_t   offset = 0,
                                     int unsigned     incr = 0);

   uvm_mem_region region;

   if(n < 1)
   begin
     `uvm_error("RegModel", $sformatf("Attempting to implement virtual register \"%s\" with a subscript less than one doesn't make sense",this.get_full_name()));
      return 0;
   end

   if (mem == null) begin
      `uvm_error("RegModel", $sformatf("Attempting to implement virtual register \"%s\" using a NULL uvm_mem reference", this.get_full_name()));
      return 0;
   end

   if (this.is_static) begin
      `uvm_error("RegModel", $sformatf("Virtual register \"%s\" is static and cannot be dynamically implemented", this.get_full_name()));
      return 0;
   end

   if (mem.get_block() != this.parent) begin
      `uvm_error("RegModel", $sformatf("Attempting to implement virtual register \"%s\" on memory \"%s\" in a different block",
                                     this.get_full_name(),
                                     mem.get_full_name()));
      return 0;
   end

   begin
      int min_incr = (this.get_n_bytes()-1) / mem.get_n_bytes() + 1;
      if (incr == 0) incr = min_incr;
      if (min_incr > incr) begin
         `uvm_error("RegModel", $sformatf("Virtual register \"%s\" increment is too small (%0d): Each virtual register requires at least %0d locations in memory \"%s\".",
                                        this.get_full_name(), incr,
                                        min_incr, mem.get_full_name()));
         return 0;
      end
   end

   // Is the memory big enough for ya?
   if (offset + (n * incr) > mem.get_size()) begin
      `uvm_error("RegModel", $sformatf("Given Offset for Virtual register \"%s[%0d]\" is too big for memory %s@'h%0h", this.get_full_name(), n, mem.get_full_name(), offset));
      return 0;
   end

   region = mem.mam.reserve_region(offset,n*incr*mem.get_n_bytes());

   if (region == null) begin
      `uvm_error("RegModel", $sformatf("Could not allocate a memory region for virtual register \"%s\"", this.get_full_name()));
      return 0;
   end

   if (this.mem != null) begin
      `uvm_info("RegModel", $sformatf("Virtual register \"%s\" is being moved re-implemented from %s@'h%0h to %s@'h%0h",
                                 this.get_full_name(),
                                 this.mem.get_full_name(),
                                 this.offset,
                                 mem.get_full_name(), offset),UVM_MEDIUM);
      this.release_region();
   end

   this.region = region;
   this.mem    = mem;
   this.size   = n;
   this.offset = offset;
   this.incr   = incr;
   this.mem.Xadd_vregX(this);

   return 1;
endfunction: implement


function uvm_mem_region uvm_vreg::allocate(longint unsigned   n,
                                           uvm_mem_mam        mam,
                                           uvm_mem_mam_policy alloc=null);

   uvm_mem mem;

   if(n < 1)
   begin
     `uvm_error("RegModel", $sformatf("Attempting to implement virtual register \"%s\" with a subscript less than one doesn't make sense",this.get_full_name()));
      return null;
   end

   if (mam == null) begin
      `uvm_error("RegModel", $sformatf("Attempting to implement virtual register \"%s\" using a NULL uvm_mem_mam reference", this.get_full_name()));
      return null;
   end

   if (this.is_static) begin
      `uvm_error("RegModel", $sformatf("Virtual register \"%s\" is static and cannot be dynamically allocated", this.get_full_name()));
      return null;
   end

   mem = mam.get_memory();
   if (mem.get_block() != this.parent) begin
      `uvm_error("RegModel", $sformatf("Attempting to allocate virtual register \"%s\" on memory \"%s\" in a different block",
                                     this.get_full_name(),
                                     mem.get_full_name()));
      return null;
   end

   begin
      int min_incr = (this.get_n_bytes()-1) / mem.get_n_bytes() + 1;
      if (incr == 0) incr = min_incr;
      if (min_incr < incr) begin
         `uvm_error("RegModel", $sformatf("Virtual register \"%s\" increment is too small (%0d): Each virtual register requires at least %0d locations in memory \"%s\".",
                                        this.get_full_name(), incr,
                                        min_incr, mem.get_full_name()));
         return null;
      end
   end

   // Need memory at least of size num_vregs*sizeof(vreg) in bytes.
   allocate = mam.request_region(n*incr*mem.get_n_bytes(), alloc);
   if (allocate == null) begin
      `uvm_error("RegModel", $sformatf("Could not allocate a memory region for virtual register \"%s\"", this.get_full_name()));
      return null;
   end

   if (this.mem != null) begin
     `uvm_info("RegModel", $sformatf("Virtual register \"%s\" is being moved from %s@'h%0h to %s@'h%0h",
                                this.get_full_name(),
                                this.mem.get_full_name(),
                                this.offset,
                                mem.get_full_name(),
                                allocate.get_start_offset()),UVM_MEDIUM);

      this.release_region();
   end

   this.region = allocate;

   this.mem    = mam.get_memory();
   this.offset = allocate.get_start_offset();
   this.size   = n;
   this.incr   = incr;

   this.mem.Xadd_vregX(this);
endfunction: allocate


function uvm_mem_region uvm_vreg::get_region();
   return this.region;
endfunction: get_region


function void uvm_vreg::release_region();
   if (this.is_static) begin
      `uvm_error("RegModel", $sformatf("Virtual register \"%s\" is static and cannot be dynamically released", this.get_full_name()));
      return;
   end

   if (this.mem != null)
      this.mem.Xdelete_vregX(this);

   if (this.region != null) begin
      this.region.release_region();
   end

   this.region = null;
   this.mem    = null;
   this.size   = 0;
   this.offset = 0;

   this.reset();
endfunction: release_region


function uvm_mem uvm_vreg::get_memory();
   return this.mem;
endfunction: get_memory


function uvm_reg_addr_t  uvm_vreg::get_offset_in_memory(longint unsigned idx);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_offset_in_memory() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return 0;
   end

   return this.offset + idx * this.incr;
endfunction


function uvm_reg_addr_t  uvm_vreg::get_address(longint unsigned idx,
                                                   uvm_reg_map map = null);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot get address of of unimplemented virtual register \"%s\".", this.get_full_name()));
      return 0;
   end

   return this.mem.get_address(this.get_offset_in_memory(idx), map);
endfunction: get_address


function int unsigned uvm_vreg::get_size();
   if (this.size == 0) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_size() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return 0;
   end

   return this.size;
endfunction: get_size


function int unsigned uvm_vreg::get_n_bytes();
   return ((this.n_bits-1) / 8) + 1;
endfunction: get_n_bytes


function int unsigned uvm_vreg::get_n_memlocs();
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_n_memlocs() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return 0;
   end

   return (this.get_n_bytes()-1) / this.mem.get_n_bytes() + 1;
endfunction: get_n_memlocs


function int unsigned uvm_vreg::get_incr();
   if (this.incr == 0) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_incr() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return 0;
   end

   return this.incr;
endfunction: get_incr


function int uvm_vreg::get_n_maps();
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_n_maps() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return 0;
   end

   return this.mem.get_n_maps();
endfunction: get_n_maps


function void uvm_vreg::get_maps(ref uvm_reg_map maps[$]);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_maps() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return;
   end

   this.mem.get_maps(maps);
endfunction: get_maps


function bit uvm_vreg::is_in_map(uvm_reg_map map);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::is_in_map() on unimplemented virtual register \"%s\"",
                                  this.get_full_name()));
      return 0;
   end

   return this.mem.is_in_map(map);
endfunction


function string uvm_vreg::get_access(uvm_reg_map map = null);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_rights() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return "RW";
   end

   return this.mem.get_access(map);
endfunction: get_access


function string uvm_vreg::get_rights(uvm_reg_map map = null);
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg::get_rights() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      return "RW";
   end

   return this.mem.get_rights(map);
endfunction: get_rights


function void uvm_vreg::get_fields(ref uvm_vreg_field fields[$]);
   foreach(this.fields[i])
      fields.push_back(this.fields[i]);
endfunction: get_fields


function uvm_vreg_field uvm_vreg::get_field_by_name(string name);
   foreach (this.fields[i]) begin
      if (this.fields[i].get_name() == name) begin
         return this.fields[i];
      end
   end
   `uvm_warning("RegModel", $sformatf("Unable to locate field \"%s\" in virtual register \"%s\".",
                                    name, this.get_full_name()));
   get_field_by_name = null;
endfunction: get_field_by_name


task uvm_vreg::write(input  longint unsigned   idx,
                         output uvm_status_e  status,
                         input  uvm_reg_data_t     value,
                         input  uvm_path_e    path = UVM_DEFAULT_PATH,
                         input  uvm_reg_map     map = null,
                         input  uvm_sequence_base  parent = null,
                         input  uvm_object         extension = null,
                         input  string             fname = "",
                         input  int                lineno = 0);
   uvm_vreg_cb_iter cbs = new(this);

   uvm_reg_addr_t  addr;
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  msk;
   int lsb;

   this.write_in_progress = 1'b1;
   this.fname = fname;
   this.lineno = lineno;
   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot write to unimplemented virtual register \"%s\".", this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   if (path == UVM_DEFAULT_PATH)
     path = this.parent.get_default_path();

   foreach (fields[i]) begin
      uvm_vreg_field_cb_iter cbs = new(fields[i]);
      uvm_vreg_field f = fields[i];
      
      lsb = f.get_lsb_pos_in_register();
      msk = ((1<<f.get_n_bits())-1) << lsb;
      tmp = (value & msk) >> lsb;

      f.pre_write(idx, tmp, path, map);
      for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
           cb = cbs.next()) begin
         cb.fname = this.fname;
         cb.lineno = this.lineno;
         cb.pre_write(f, idx, tmp, path, map);
      end

      value = (value & ~msk) | (tmp << lsb);
   end
   this.pre_write(idx, value, path, map);
   for (uvm_vreg_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.pre_write(this, idx, value, path, map);
   end

   addr = this.offset + (idx * this.incr);

   lsb = 0;
   status = UVM_IS_OK;
   for (int i = 0; i < this.get_n_memlocs(); i++) begin
      uvm_status_e s;

      msk = ((1<<(this.mem.get_n_bytes()*8))-1) << lsb;
      tmp = (value & msk) >> lsb;
      this.mem.write(s, addr + i, tmp, path, map , parent, , extension, fname, lineno);
      if (s != UVM_IS_OK && s != UVM_HAS_X) status = s;
      lsb += this.mem.get_n_bytes() * 8;
   end

   for (uvm_vreg_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.post_write(this, idx, value, path, map, status);
   end
   this.post_write(idx, value, path, map, status);
   foreach (fields[i]) begin
      uvm_vreg_field_cb_iter cbs = new(fields[i]);
      uvm_vreg_field f = fields[i];
      
      lsb = f.get_lsb_pos_in_register();
      msk = ((1<<f.get_n_bits())-1) << lsb;
      tmp = (value & msk) >> lsb;

      for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
           cb = cbs.next()) begin
         cb.fname = this.fname;
         cb.lineno = this.lineno;
         cb.post_write(f, idx, tmp, path, map, status);
      end
      f.post_write(idx, tmp, path, map, status);

      value = (value & ~msk) | (tmp << lsb);
   end

   `uvm_info("RegModel", $sformatf("Wrote virtual register \"%s\"[%0d] via %s with: 'h%h",
                              this.get_full_name(), idx,
                              (path == UVM_FRONTDOOR) ? "frontdoor" : "backdoor",
                              value),UVM_MEDIUM);
   
   this.write_in_progress = 1'b0;
   this.fname = "";
   this.lineno = 0;

endtask: write


task uvm_vreg::read(input  longint unsigned   idx,
                        output uvm_status_e  status,
                        output uvm_reg_data_t     value,
                        input  uvm_path_e    path = UVM_DEFAULT_PATH,
                        input  uvm_reg_map     map = null,
                        input  uvm_sequence_base  parent = null,
                        input  uvm_object         extension = null,
                        input  string             fname = "",
                        input  int                lineno = 0);
   uvm_vreg_cb_iter cbs = new(this);

   uvm_reg_addr_t  addr;
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  msk;
   int lsb;
   this.read_in_progress = 1'b1;
   this.fname = fname;
   this.lineno = lineno;

   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot read from unimplemented virtual register \"%s\".", this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   if (path == UVM_DEFAULT_PATH)
     path = this.parent.get_default_path();

   foreach (fields[i]) begin
      uvm_vreg_field_cb_iter cbs = new(fields[i]);
      uvm_vreg_field f = fields[i];

      f.pre_read(idx, path, map);
      for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
           cb = cbs.next()) begin
         cb.fname = this.fname;
         cb.lineno = this.lineno;
         cb.pre_read(f, idx, path, map);
      end
   end
   this.pre_read(idx, path, map);
   for (uvm_vreg_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.pre_read(this, idx, path, map);
   end

   addr = this.offset + (idx * this.incr);

   lsb = 0;
   value = 0;
   status = UVM_IS_OK;
   for (int i = 0; i < this.get_n_memlocs(); i++) begin
      uvm_status_e s;

      this.mem.read(s, addr + i, tmp, path, map, parent, , extension, fname, lineno);
      if (s != UVM_IS_OK && s != UVM_HAS_X) status = s;

      value |= tmp << lsb;
      lsb += this.mem.get_n_bytes() * 8;
   end

   for (uvm_vreg_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.post_read(this, idx, value, path, map, status);
   end
   this.post_read(idx, value, path, map, status);
   foreach (fields[i]) begin
      uvm_vreg_field_cb_iter cbs = new(fields[i]);
      uvm_vreg_field f = fields[i];

      lsb = f.get_lsb_pos_in_register();

      msk = ((1<<f.get_n_bits())-1) << lsb;
      tmp = (value & msk) >> lsb;

      for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
           cb = cbs.next()) begin
         cb.fname = this.fname;
         cb.lineno = this.lineno;
         cb.post_read(f, idx, tmp, path, map, status);
      end
      f.post_read(idx, tmp, path, map, status);

      value = (value & ~msk) | (tmp << lsb);
   end

   `uvm_info("RegModel", $sformatf("Read virtual register \"%s\"[%0d] via %s: 'h%h",
                              this.get_full_name(), idx,
                              (path == UVM_FRONTDOOR) ? "frontdoor" : "backdoor",
                              value),UVM_MEDIUM);
   
   this.read_in_progress = 1'b0;
   this.fname = "";
   this.lineno = 0;
endtask: read


task uvm_vreg::poke(input longint unsigned   idx,
                        output uvm_status_e status,
                        input  uvm_reg_data_t    value,
                        input  uvm_sequence_base parent = null,
                        input  uvm_object        extension = null,
                        input  string            fname = "",
                        input  int               lineno = 0);
   uvm_reg_addr_t  addr;
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  msk;
   int lsb;
   this.fname = fname;
   this.lineno = lineno;

   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot poke in unimplemented virtual register \"%s\".", this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   addr = this.offset + (idx * this.incr);

   lsb = 0;
   status = UVM_IS_OK;
   for (int i = 0; i < this.get_n_memlocs(); i++) begin
      uvm_status_e s;

      msk = ((1<<(this.mem.get_n_bytes() * 8))-1) << lsb;
      tmp = (value & msk) >> lsb;

      this.mem.poke(status, addr + i, tmp, "", parent, extension, fname, lineno);
      if (s != UVM_IS_OK && s != UVM_HAS_X) status = s;

      lsb += this.mem.get_n_bytes() * 8;
   end

   `uvm_info("RegModel", $sformatf("Poked virtual register \"%s\"[%0d] with: 'h%h",
                              this.get_full_name(), idx, value),UVM_MEDIUM);
   this.fname = "";
   this.lineno = 0;

endtask: poke


task uvm_vreg::peek(input longint unsigned   idx,
                        output uvm_status_e status,
                        output uvm_reg_data_t    value,
                        input  uvm_sequence_base parent = null,
                        input  uvm_object        extension = null,
                        input  string            fname = "",
                        input  int               lineno = 0);
   uvm_reg_addr_t  addr;
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  msk;
   int lsb;
   this.fname = fname;
   this.lineno = lineno;

   if (this.mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot peek in from unimplemented virtual register \"%s\".", this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   addr = this.offset + (idx * this.incr);

   lsb = 0;
   value = 0;
   status = UVM_IS_OK;
   for (int i = 0; i < this.get_n_memlocs(); i++) begin
      uvm_status_e s;

      this.mem.peek(status, addr + i, tmp, "", parent, extension, fname, lineno);
      if (s != UVM_IS_OK && s != UVM_HAS_X) status = s;

      value |= tmp << lsb;
      lsb += this.mem.get_n_bytes() * 8;
   end

   `uvm_info("RegModel", $sformatf("Peeked virtual register \"%s\"[%0d]: 'h%h",
                              this.get_full_name(), idx, value),UVM_MEDIUM);
   
   this.fname = "";
   this.lineno = 0;

endtask: peek


function void uvm_vreg::do_print (uvm_printer printer);
  super.do_print(printer);
  printer.print_generic("initiator", parent.get_type_name(), -1, convert2string());
endfunction

function string uvm_vreg::convert2string();
   string res_str;
   string t_str;
   bit with_debug_info;
   $sformat(convert2string, "Virtual register %s -- ", 
            this.get_full_name());

   if (this.size == 0)
     $sformat(convert2string, "%sunimplemented", convert2string);
   else begin
      uvm_reg_map maps[$];
      mem.get_maps(maps);

      $sformat(convert2string, "%s[%0d] in %0s['h%0h+'h%0h]\n", convert2string,
             this.size, this.mem.get_full_name(), this.offset, this.incr); 
      foreach (maps[i]) begin
        uvm_reg_addr_t  addr0 = this.get_address(0, maps[i]);

        $sformat(convert2string, "  Address in map '%s' -- @'h%0h+%0h",
        maps[i].get_full_name(), addr0, this.get_address(1, maps[i]) - addr0);
      end
   end
   foreach(this.fields[i]) begin
      $sformat(convert2string, "%s\n%s", convert2string,
               this.fields[i].convert2string());
   end

endfunction: convert2string



//TODO - add fatal messages
function uvm_object uvm_vreg::clone();
  return null;
endfunction

function void uvm_vreg::do_copy   (uvm_object rhs);
endfunction

function bit uvm_vreg::do_compare (uvm_object  rhs,
                                        uvm_comparer comparer);
  return 0;
endfunction

function void uvm_vreg::do_pack (uvm_packer packer);
endfunction

function void uvm_vreg::do_unpack (uvm_packer packer);
endfunction



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
// Title: Virtual Register Field Classes
//
// This section defines the virtual field and callback classes.
//
// A virtual field is set of contiguous bits in one or more memory locations.
// The semantics and layout of virtual fields comes from
// an agreement between the software and the hardware,
// not any physical structures in the DUT. 
//
//------------------------------------------------------------------------------

typedef class uvm_vreg_field_cbs;


//------------------------------------------------------------------------------
// Class: uvm_vreg_field
//
// Virtual field abstraction class
//
// A virtual field represents a set of adjacent bits that are
// logically implemented in consecutive memory locations.
//
//------------------------------------------------------------------------------

class uvm_vreg_field extends uvm_object;

   `uvm_object_utils(uvm_vreg_field)
   `uvm_register_cb(uvm_vreg_field, uvm_vreg_field_cbs)
   
   local uvm_vreg parent;
   local int unsigned lsb;
   local int unsigned size;
   local string fname;
   local int lineno;
   local bit read_in_progress;
   local bit write_in_progress;


   //
   // Group: initialization
   //

   //
   // Function: new
   // Create a new virtual field instance
   //
   // This method should not be used directly.
   // The uvm_vreg_field::type_id::create() method should be used instead.
   //
   extern function new(string name = "uvm_vreg_field");

   //
   // Function: configure
   // Instance-specific configuration
   //
   // Specify the ~parent~ virtual register of this virtual field, its
   // ~size~ in bits, and the position of its least-significant bit
   // within the virtual register relative to the least-significant bit
   // of the virtual register.
   //
   extern function void configure(uvm_vreg parent,
                                  int unsigned size,
                                  int unsigned lsb_pos);


   //
   // Group: Introspection
   //

   //
   // Function: get_name
   // Get the simple name
   //
   // Return the simple object name of this virtual field
   //

   //
   // Function: get_full_name
   // Get the hierarchical name
   //
   // Return the hierarchal name of this virtual field
   // The base of the hierarchical name is the root block.
   //
   extern virtual function string        get_full_name();

   //
   // FUNCTION: get_parent
   // Get the parent virtual register
   //
   extern virtual function uvm_vreg get_parent();
   extern virtual function uvm_vreg get_register();

   //
   // FUNCTION: get_lsb_pos_in_register
   // Return the position of the virtual field
   ///
   // Returns the index of the least significant bit of the virtual field
   // in the virtual register that instantiates it.
   // An offset of 0 indicates a field that is aligned with the
   // least-significant bit of the register. 
   //
   extern virtual function int unsigned get_lsb_pos_in_register();

   //
   // FUNCTION: get_n_bits
   // Returns the width, in bits, of the virtual field. 
   //
   extern virtual function int unsigned get_n_bits();

   //
   // FUNCTION: get_access
   // Returns the access policy of the virtual field register
   // when written and read via an address map.
   //
   // If the memory implementing the virtual field
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
   // Group: HDL Access
   //

   //
   // TASK: write
   // Write the specified value in a virtual field
   //
   // Write ~value~ in the DUT memory location(s) that implements
   // the virtual field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~. 
   //
   // If the memory implementing the virtual register array
   // containing this virtual field
   // is mapped in more than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   //
   // The operation is eventually mapped into
   // memory read-modify-write operations at the location
   // where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   // If a backdoor is available for the memory implementing the
   // virtual field, it will be used for the memory-read operation.
   //
   extern virtual task write(input  longint unsigned   idx,
                             output uvm_status_e  status,
                             input  uvm_reg_data_t     value,
                             input  uvm_path_e    path = UVM_DEFAULT_PATH,
                             input  uvm_reg_map        map = null,
                             input  uvm_sequence_base  parent = null,
                             input  uvm_object         extension = null,
                             input  string             fname = "",
                             input  int                lineno = 0);

   //
   // TASK: read
   // Read the current value from a virtual field
   //
   // Read from the DUT memory location(s) that implements
   // the virtual field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~, and return the readback ~value~.
   //
   // If the memory implementing the virtual register array
   // containing this virtual field
   // is mapped in more than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   //
   // The operation is eventually mapped into
   // memory read operations at the location(s)
   // where the virtual register
   // specified by ~idx~ in the virtual register array is implemented.
   //
   extern virtual task read(input  longint unsigned    idx,
                            output uvm_status_e   status,
                            output uvm_reg_data_t      value,
                            input  uvm_path_e     path = UVM_DEFAULT_PATH,
                            input  uvm_reg_map         map = null,
                            input  uvm_sequence_base   parent = null,
                            input  uvm_object          extension = null,
                            input  string              fname = "",
                            input  int                 lineno = 0);
               

   //
   // TASK: poke
   // Deposit the specified value in a virtual field
   //
   // Deposit ~value~ in the DUT memory location(s) that implements
   // the virtual field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~. 
   //
   // The operation is eventually mapped into
   // memory peek-modify-poke operations at the location
   // where the virtual register
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
   // Sample the current value from a virtual field
   //
   // Sample from the DUT memory location(s) that implements
   // the virtual field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~, and return the readback ~value~.
   //
   // If the memory implementing the virtual register array
   // containing this virtual field
   // is mapped in more than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   //
   // The operation is eventually mapped into
   // memory peek operations at the location(s)
   // where the virtual register
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
   // Group: Callbacks
   //


   //
   // TASK: pre_write
   // Called before virtual field write.
   //
   // If the specified data value, access ~path~ or address ~map~ are modified,
   // the updated data value, access path or address map will be used
   // to perform the virtual register operation.
   //
   // The virtual field callback methods are invoked before the callback methods
   // on the containing virtual register.
   // The registered callback methods are invoked after the invocation
   // of this method.
   // The pre-write virtual register and field callbacks are executed
   // before the corresponding pre-write memory callbacks
   //
   virtual task pre_write(longint unsigned     idx,
                          ref uvm_reg_data_t   wdat,
                          ref uvm_path_e  path,
                          ref uvm_reg_map   map);
   endtask: pre_write

   //
   // TASK: post_write
   // Called after virtual field write
   //
   // If the specified ~status~ is modified,
   // the updated status will be
   // returned by the virtual register operation.
   //
   // The virtual field callback methods are invoked after the callback methods
   // on the containing virtual register.
   // The registered callback methods are invoked before the invocation
   // of this method.
   // The post-write virtual register and field callbacks are executed
   // after the corresponding post-write memory callbacks
   //
   virtual task post_write(longint unsigned       idx,
                           uvm_reg_data_t         wdat,
                           uvm_path_e        path,
                           uvm_reg_map         map,
                           ref uvm_status_e  status);
   endtask: post_write

   //
   // TASK: pre_read
   // Called before virtual field read.
   //
   // If the specified access ~path~ or address ~map~ are modified,
   // the updated access path or address map will be used to perform
   // the virtual register operation.
   //
   // The virtual field callback methods are invoked after the callback methods
   // on the containing virtual register.
   // The registered callback methods are invoked after the invocation
   // of this method.
   // The pre-read virtual register and field callbacks are executed
   // before the corresponding pre-read memory callbacks
   //
   virtual task pre_read(longint unsigned      idx,
                         ref uvm_path_e   path,
                         ref uvm_reg_map    map);
   endtask: pre_read

   //
   // TASK: post_read
   // Called after virtual field read.
   //
   // If the specified readback data ~rdat~ or ~status~ is modified,
   // the updated readback data or status will be
   // returned by the virtual register operation.
   //
   // The virtual field callback methods are invoked after the callback methods
   // on the containing virtual register.
   // The registered callback methods are invoked before the invocation
   // of this method.
   // The post-read virtual register and field callbacks are executed
   // after the corresponding post-read memory callbacks
   //
   virtual task post_read(longint unsigned       idx,
                          ref uvm_reg_data_t     rdat,
                          uvm_path_e        path,
                          uvm_reg_map         map,
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

endclass: uvm_vreg_field


//------------------------------------------------------------------------------
// Class: uvm_vreg_field_cbs
//
// Pre/post read/write callback facade class
//
//------------------------------------------------------------------------------

class uvm_vreg_field_cbs extends uvm_callback;
   string fname;
   int    lineno;

   function new(string name = "uvm_vreg_field_cbs");
      super.new(name);
   endfunction
   

   //
   // Task: pre_write
   // Callback called before a write operation.
   //
   // The registered callback methods are invoked before the invocation
   // of the virtual register pre-write callbacks and
   // after the invocation of the <uvm_vreg_field::pre_write()> method.
   //
   // The written value ~wdat~, access ~path~ and address ~map~,
   // if modified, modifies the actual value, access path or address map
   // used in the register operation.
   //
   virtual task pre_write(uvm_vreg_field       field,
                          longint unsigned     idx,
                          ref uvm_reg_data_t   wdat,
                          ref uvm_path_e  path,
                          ref uvm_reg_map   map);
   endtask: pre_write


   //
   // TASK: post_write
   // Called after a write operation
   //
   // The registered callback methods are invoked after the invocation
   // of the virtual register post-write callbacks and
   // before the invocation of the <uvm_vreg_field::post_write()> method.
   //
   // The ~status~ of the operation,
   // if modified, modifies the actual returned status.
   //
   virtual task post_write(uvm_vreg_field        field,
                           longint unsigned      idx,
                           uvm_reg_data_t        wdat,
                           uvm_path_e       path,
                           uvm_reg_map        map,
                           ref uvm_status_e status);
   endtask: post_write


   //
   // TASK: pre_read
   // Called before a virtual field read.
   //
   // The registered callback methods are invoked after the invocation
   // of the virtual register pre-read callbacks and
   // after the invocation of the <uvm_vreg_field::pre_read()> method.
   //
   // The access ~path~ and address ~map~,
   // if modified, modifies the actual access path or address map
   // used in the register operation.
   //
   virtual task pre_read(uvm_vreg_field        field,
                         longint unsigned      idx,
                         ref uvm_path_e   path,
                         ref uvm_reg_map    map);
   endtask: pre_read


   //
   // TASK: post_read
   // Called after a virtual field read.
   //
   // The registered callback methods are invoked after the invocation
   // of the virtual register post-read callbacks and
   // before the invocation of the <uvm_vreg_field::post_read()> method.
   //
   // The readback value ~rdat~ and the ~status~ of the operation,
   // if modified, modifies the actual returned readback value and status.
   //
   virtual task post_read(uvm_vreg_field         field,
                          longint unsigned       idx,
                          ref uvm_reg_data_t     rdat,
                          uvm_path_e        path,
                          uvm_reg_map         map,
                          ref uvm_status_e  status);
   endtask: post_read
endclass: uvm_vreg_field_cbs


//
// Type: uvm_vreg_field_cb
// Convenience callback type declaration
//
// Use this declaration to register virtual field callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_vreg_field, uvm_vreg_field_cbs) uvm_vreg_field_cb;

//
// Type: uvm_vreg_field_cb_iter
// Convenience callback iterator type declaration
//
// Use this declaration to iterate over registered virtual field callbacks
// rather than the more verbose parameterized class
//
typedef uvm_callback_iter#(uvm_vreg_field, uvm_vreg_field_cbs) uvm_vreg_field_cb_iter;




function uvm_vreg_field::new(string name="uvm_vreg_field");
   super.new(name);
endfunction: new

function void uvm_vreg_field::configure(uvm_vreg  parent,
                                   int unsigned  size,
                                   int unsigned  lsb_pos);
   this.parent = parent;
   if (size == 0) begin
      `uvm_error("RegModel", $sformatf("Virtual field \"%s\" cannot have 0 bits", this.get_full_name()));
      size = 1;
   end
   if (size > `UVM_REG_DATA_WIDTH) begin
      `uvm_error("RegModel", $sformatf("Virtual field \"%s\" cannot have more than %0d bits",
                                     this.get_full_name(),
                                     `UVM_REG_DATA_WIDTH));
      size = `UVM_REG_DATA_WIDTH;
   end

   this.size   = size;
   this.lsb    = lsb_pos;

   this.parent.add_field(this);
endfunction: configure



function string uvm_vreg_field::get_full_name();
   get_full_name = {this.parent.get_full_name(), ".", this.get_name()};
endfunction: get_full_name


function uvm_vreg uvm_vreg_field::get_register();
   get_register = this.parent;
endfunction: get_register


function uvm_vreg uvm_vreg_field::get_parent();
   get_parent = this.parent;
endfunction: get_parent



function int unsigned uvm_vreg_field::get_lsb_pos_in_register();
   get_lsb_pos_in_register = this.lsb;
endfunction: get_lsb_pos_in_register


function int unsigned uvm_vreg_field::get_n_bits();
   get_n_bits = this.size;
endfunction: get_n_bits


function string uvm_vreg_field::get_access(uvm_reg_map map = null);
   if (this.parent.get_memory() == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg_field::get_rights() on unimplemented virtual field \"%s\"",
                                     this.get_full_name()));
      return "RW";
   end

   return this.parent.get_access(map);
endfunction: get_access


task uvm_vreg_field::write(input  longint unsigned    idx,
                           output uvm_status_e   status,
                           input  uvm_reg_data_t      value,
                           input  uvm_path_e     path = UVM_DEFAULT_PATH,
                           input  uvm_reg_map      map = null,
                           input  uvm_sequence_base   parent = null,
                           input  uvm_object          extension = null,
                           input  string              fname = "",
                           input  int                 lineno = 0);
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  segval;
   uvm_reg_addr_t  segoff;
   uvm_status_e st;

   int flsb, fmsb, rmwbits;
   int segsiz, segn;
   uvm_mem    mem;
   uvm_path_e rm_path;

   uvm_vreg_field_cb_iter cbs = new(this);

   this.fname = fname;
   this.lineno = lineno;

   write_in_progress = 1'b1;
   mem = this.parent.get_memory();
   if (mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg_field::write() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   if (path == UVM_DEFAULT_PATH) begin
      uvm_reg_block blk = this.parent.get_block();
      path = blk.get_default_path();
   end

   status = UVM_IS_OK;

   this.parent.XatomicX(1);

   if (value >> this.size) begin
      `uvm_warning("RegModel", $sformatf("Writing value 'h%h that is greater than field \"%s\" size (%0d bits)", value, this.get_full_name(), this.get_n_bits()));
      value &= value & ((1<<this.size)-1);
   end
   tmp = 0;

   this.pre_write(idx, value, path, map);
   for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.pre_write(this, idx, value, path, map);
   end

   segsiz = mem.get_n_bytes() * 8;
   flsb    = this.get_lsb_pos_in_register();
   segoff  = this.parent.get_offset_in_memory(idx) + (flsb / segsiz);

   // Favor backdoor read to frontdoor read for the RMW operation
   rm_path = UVM_DEFAULT_PATH;
   if (mem.get_backdoor() != null) rm_path = UVM_BACKDOOR;

   // Any bits on the LSB side we need to RMW?
   rmwbits = flsb % segsiz;

   // Total number of memory segment in this field
   segn = (rmwbits + this.get_n_bits() - 1) / segsiz + 1;

   if (rmwbits > 0) begin
      uvm_reg_addr_t  segn;

      mem.read(st, segoff, tmp, rm_path, map, parent, , extension, fname, lineno);
      if (st != UVM_IS_OK && st != UVM_HAS_X) begin
         `uvm_error("RegModel",
                    $sformatf("Unable to read LSB bits in %s[%0d] to for RMW cycle on virtual field %s.",
                              mem.get_full_name(), segoff, this.get_full_name()));
         status = UVM_NOT_OK;
         this.parent.XatomicX(0);
         return;
      end

      value = (value << rmwbits) | (tmp & ((1<<rmwbits)-1));
   end

   // Any bits on the MSB side we need to RMW?
   fmsb = rmwbits + this.get_n_bits() - 1;
   rmwbits = (fmsb+1) % segsiz;
   if (rmwbits > 0) begin
      if (segn > 0) begin
         mem.read(st, segoff + segn - 1, tmp, rm_path, map, parent,, extension, fname, lineno);
         if (st != UVM_IS_OK && st != UVM_HAS_X) begin
            `uvm_error("RegModel",
                       $sformatf("Unable to read MSB bits in %s[%0d] to for RMW cycle on virtual field %s.",
                                 mem.get_full_name(), segoff+segn-1,
                                 this.get_full_name()));
            status = UVM_NOT_OK;
            this.parent.XatomicX(0);
            return;
         end
      end
      value |= (tmp & ~((1<<rmwbits)-1)) << ((segn-1)*segsiz);
   end

   // Now write each of the segments
   tmp = value;
   repeat (segn) begin
      mem.write(st, segoff, tmp, path, map, parent,, extension, fname, lineno);
      if (st != UVM_IS_OK && st != UVM_HAS_X) status = UVM_NOT_OK;

      segoff++;
      tmp = tmp >> segsiz;
   end

   this.post_write(idx, value, path, map, status);
   for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.post_write(this, idx, value, path, map, status);
   end

   this.parent.XatomicX(0);


   `uvm_info("RegModel", $sformatf("Wrote virtual field \"%s\"[%0d] via %s with: 'h%h",
                              this.get_full_name(), idx,
                              (path == UVM_FRONTDOOR) ? "frontdoor" : "backdoor",
                              value),UVM_MEDIUM); 
   
   write_in_progress = 1'b0;
   this.fname = "";
   this.lineno = 0;
endtask: write


task uvm_vreg_field::read(input longint unsigned     idx,
                          output uvm_status_e   status,
                          output uvm_reg_data_t      value,
                          input  uvm_path_e     path = UVM_DEFAULT_PATH,
                          input  uvm_reg_map      map = null,
                          input  uvm_sequence_base   parent = null,
                          input  uvm_object          extension = null,
                          input  string              fname = "",
                          input  int                 lineno = 0);
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  segval;
   uvm_reg_addr_t  segoff;
   uvm_status_e st;

   int flsb, lsb;
   int segsiz, segn;
   uvm_mem    mem;

   uvm_vreg_field_cb_iter cbs = new(this);

   this.fname = fname;
   this.lineno = lineno;

   read_in_progress = 1'b1;
   mem = this.parent.get_memory();
   if (mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg_field::read() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   if (path == UVM_DEFAULT_PATH) begin
      uvm_reg_block blk = this.parent.get_block();
      path = blk.get_default_path();
   end

   status = UVM_IS_OK;

   this.parent.XatomicX(1);

   value = 0;

   this.pre_read(idx, path, map);
   for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.pre_read(this, idx, path, map);
   end

   segsiz = mem.get_n_bytes() * 8;
   flsb    = this.get_lsb_pos_in_register();
   segoff  = this.parent.get_offset_in_memory(idx) + (flsb / segsiz);
   lsb = flsb % segsiz;

   // Total number of memory segment in this field
   segn = (lsb + this.get_n_bits() - 1) / segsiz + 1;

   // Read each of the segments, MSB first
   segoff += segn - 1;
   repeat (segn) begin
      value = value << segsiz;

      mem.read(st, segoff, tmp, path, map, parent, , extension, fname, lineno);
      if (st != UVM_IS_OK && st != UVM_HAS_X) status = UVM_NOT_OK;

      segoff--;
      value |= tmp;
   end

   // Any bits on the LSB side we need to get rid of?
   value = value >> lsb;

   // Any bits on the MSB side we need to get rid of?
   value &= (1<<this.get_n_bits()) - 1;

   this.post_read(idx, value, path, map, status);
   for (uvm_vreg_field_cbs cb = cbs.first(); cb != null;
        cb = cbs.next()) begin
      cb.fname = this.fname;
      cb.lineno = this.lineno;
      cb.post_read(this, idx, value, path, map, status);
   end

   this.parent.XatomicX(0);

   `uvm_info("RegModel", $sformatf("Read virtual field \"%s\"[%0d] via %s: 'h%h",
                              this.get_full_name(), idx,
                              (path == UVM_FRONTDOOR) ? "frontdoor" : "backdoor",
                              value),UVM_MEDIUM);


   read_in_progress = 1'b0;
   this.fname = "";
   this.lineno = 0;
endtask: read
               

task uvm_vreg_field::poke(input  longint unsigned  idx,
                          output uvm_status_e status,
                          input  uvm_reg_data_t    value,
                          input  uvm_sequence_base parent = null,
                          input  uvm_object        extension = null,
                          input  string            fname = "",
                          input  int               lineno = 0);
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  segval;
   uvm_reg_addr_t  segoff;
   uvm_status_e st;

   int flsb, fmsb, rmwbits;
   int segsiz, segn;
   uvm_mem    mem;
   uvm_path_e rm_path;
   this.fname = fname;
   this.lineno = lineno;

   mem = this.parent.get_memory();
   if (mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg_field::poke() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   status = UVM_IS_OK;

   this.parent.XatomicX(1);

   if (value >> this.size) begin
      `uvm_warning("RegModel", $sformatf("Writing value 'h%h that is greater than field \"%s\" size (%0d bits)", value, this.get_full_name(), this.get_n_bits()));
      value &= value & ((1<<this.size)-1);
   end
   tmp = 0;

   segsiz = mem.get_n_bytes() * 8;
   flsb    = this.get_lsb_pos_in_register();
   segoff  = this.parent.get_offset_in_memory(idx) + (flsb / segsiz);

   // Any bits on the LSB side we need to RMW?
   rmwbits = flsb % segsiz;

   // Total number of memory segment in this field
   segn = (rmwbits + this.get_n_bits() - 1) / segsiz + 1;

   if (rmwbits > 0) begin
      uvm_reg_addr_t  segn;

      mem.peek(st, segoff, tmp, "", parent, extension, fname, lineno);
      if (st != UVM_IS_OK && st != UVM_HAS_X) begin
         `uvm_error("RegModel",
                    $sformatf("Unable to read LSB bits in %s[%0d] to for RMW cycle on virtual field %s.",
                              mem.get_full_name(), segoff, this.get_full_name()));
         status = UVM_NOT_OK;
         this.parent.XatomicX(0);
         return;
      end

      value = (value << rmwbits) | (tmp & ((1<<rmwbits)-1));
   end

   // Any bits on the MSB side we need to RMW?
   fmsb = rmwbits + this.get_n_bits() - 1;
   rmwbits = (fmsb+1) % segsiz;
   if (rmwbits > 0) begin
      if (segn > 0) begin
         mem.peek(st, segoff + segn - 1, tmp, "", parent, extension, fname, lineno);
         if (st != UVM_IS_OK && st != UVM_HAS_X) begin
            `uvm_error("RegModel",
                       $sformatf("Unable to read MSB bits in %s[%0d] to for RMW cycle on virtual field %s.",
                                 mem.get_full_name(), segoff+segn-1,
                                 this.get_full_name()));
            status = UVM_NOT_OK;
            this.parent.XatomicX(0);
            return;
         end
      end
      value |= (tmp & ~((1<<rmwbits)-1)) << ((segn-1)*segsiz);
   end

   // Now write each of the segments
   tmp = value;
   repeat (segn) begin
      mem.poke(st, segoff, tmp, "", parent, extension, fname, lineno);
      if (st != UVM_IS_OK && st != UVM_HAS_X) status = UVM_NOT_OK;

      segoff++;
      tmp = tmp >> segsiz;
   end

   this.parent.XatomicX(0);

   `uvm_info("RegModel", $sformatf("Wrote virtual field \"%s\"[%0d] with: 'h%h",
                              this.get_full_name(), idx, value),UVM_MEDIUM);

   this.fname = "";
   this.lineno = 0;
endtask: poke


task uvm_vreg_field::peek(input  longint unsigned  idx,
                          output uvm_status_e status,
                          output uvm_reg_data_t    value,
                          input  uvm_sequence_base parent = null,
                          input  uvm_object        extension = null,
                          input  string            fname = "",
                          input  int               lineno = 0);
   uvm_reg_data_t  tmp;
   uvm_reg_data_t  segval;
   uvm_reg_addr_t  segoff;
   uvm_status_e st;

   int flsb, lsb;
   int segsiz, segn;
   uvm_mem    mem;
   this.fname = fname;
   this.lineno = lineno;

   mem = this.parent.get_memory();
   if (mem == null) begin
      `uvm_error("RegModel", $sformatf("Cannot call uvm_vreg_field::peek() on unimplemented virtual register \"%s\"",
                                     this.get_full_name()));
      status = UVM_NOT_OK;
      return;
   end

   status = UVM_IS_OK;

   this.parent.XatomicX(1);

   value = 0;

   segsiz = mem.get_n_bytes() * 8;
   flsb    = this.get_lsb_pos_in_register();
   segoff  = this.parent.get_offset_in_memory(idx) + (flsb / segsiz);
   lsb = flsb % segsiz;

   // Total number of memory segment in this field
   segn = (lsb + this.get_n_bits() - 1) / segsiz + 1;

   // Read each of the segments, MSB first
   segoff += segn - 1;
   repeat (segn) begin
      value = value << segsiz;

      mem.peek(st, segoff, tmp, "", parent, extension, fname, lineno);

      if (st != UVM_IS_OK && st != UVM_HAS_X) status = UVM_NOT_OK;

      segoff--;
      value |= tmp;
   end

   // Any bits on the LSB side we need to get rid of?
   value = value >> lsb;

   // Any bits on the MSB side we need to get rid of?
   value &= (1<<this.get_n_bits()) - 1;

   this.parent.XatomicX(0);

   `uvm_info("RegModel", $sformatf("Peeked virtual field \"%s\"[%0d]: 'h%h", this.get_full_name(), idx, value),UVM_MEDIUM);

   this.fname = "";
   this.lineno = 0;
endtask: peek
               

function void uvm_vreg_field::do_print (uvm_printer printer);
  super.do_print(printer);
  printer.print_generic("initiator", parent.get_type_name(), -1, convert2string());
endfunction

function string uvm_vreg_field::convert2string();
   string res_str;
   string t_str;
   bit with_debug_info = 1'b0;
   $sformat(convert2string, {"%s[%0d-%0d]"},
            this.get_name(),
            this.get_lsb_pos_in_register() + this.get_n_bits() - 1,
            this.get_lsb_pos_in_register());
   if (read_in_progress == 1'b1) begin
      if (fname != "" && lineno != 0)
         $sformat(res_str, "%s:%0d ",fname, lineno);
      convert2string = {convert2string, "\n", res_str, "currently executing read method"}; 
   end
   if ( write_in_progress == 1'b1) begin
      if (fname != "" && lineno != 0)
         $sformat(res_str, "%s:%0d ",fname, lineno);
      convert2string = {convert2string, "\n", res_str, "currently executing write method"}; 
   end

endfunction

//TODO - add fatal messages

function uvm_object uvm_vreg_field::clone();
  return null;
endfunction

function void uvm_vreg_field::do_copy   (uvm_object rhs);
endfunction

function bit uvm_vreg_field::do_compare (uvm_object  rhs,
                                        uvm_comparer comparer);
  return 0;
endfunction

function void uvm_vreg_field::do_pack (uvm_packer packer);
endfunction

function void uvm_vreg_field::do_unpack (uvm_packer packer);
endfunction



//
// -------------------------------------------------------------
//    Copyright 2004-2009 Synopsys, Inc.
//    Copyright 2010-2011 Mentor Graphics Corporation
//    Copyright 2010 Cadence Design Systems, Inc.
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
//
// Title: Memory Allocation Manager
//
// Manages the exclusive allocation of consecutive memory locations
// called ~regions~.
// The regions can subsequently be accessed like little memories of
// their own, without knowing in which memory or offset they are
// actually located.
//
// The memory allocation manager should be used by any
// application-level process
// that requires reserved space in the memory,
// such as DMA buffers.
//
// A region will remain reserved until it is explicitly released. 
//
//------------------------------------------------------------------------------


`ifndef UVM_MEM_MAM__SV
`define UVM_MEM_MAM__SV


typedef class uvm_mem_mam_cfg;
typedef class uvm_mem_region;
typedef class uvm_mem_mam_policy;

typedef class uvm_mem;


//------------------------------------------------------------------------------
// CLASS: uvm_mem_mam
//------------------------------------------------------------------------------
// Memory allocation manager
//
// Memory allocation management utility class similar to C's malloc()
// and free().
// A single instance of this class is used to manage a single,
// contiguous address space.
//------------------------------------------------------------------------------

class uvm_mem_mam;

   //----------------------
   // Group: Initialization
   //----------------------

   // Type: alloc_mode_e
   //
   // Memory allocation mode
   //
   // Specifies how to allocate a memory region
   //
   // GREEDY   - Consume new, previously unallocated memory
   // THRIFTY  - Reused previously released memory as much as possible (not yet implemented)
   //
   typedef enum {GREEDY, THRIFTY} alloc_mode_e;


   // Type: locality_e
   //
   // Location of memory regions
   //
   // Specifies where to locate new memory regions
   //
   // BROAD    - Locate new regions randomly throughout the address space
   // NEARBY   - Locate new regions adjacent to existing regions
   
   typedef enum {BROAD, NEARBY}   locality_e;



   // Variable: default_alloc
   //
   // Region allocation policy
   //
   // This object is repeatedly randomized when allocating new regions.
   uvm_mem_mam_policy default_alloc;


   local uvm_mem memory;
   local uvm_mem_mam_cfg cfg;
   local uvm_mem_region in_use[$];
   local int for_each_idx = -1;
   local string fname;
   local int lineno;


   // Function: new
   //
   // Create a new manager instance
   //
   // Create an instance of a memory allocation manager
   // with the specified name and configuration.
   // This instance manages all memory region allocation within
   // the address range specified in the configuration descriptor.
   //
   // If a reference to a memory abstraction class is provided, the memory
   // locations within the regions can be accessed through the region
   // descriptor, using the <uvm_mem_region::read()> and
   // <uvm_mem_region::write()> methods.
   //
   extern function new(string name,
                       uvm_mem_mam_cfg cfg,
                       uvm_mem mem=null);


   // Function: reconfigure
   //
   // Reconfigure the manager
   //
   // Modify the maximum and minimum addresses of the address space managed by
   // the allocation manager, allocation mode, or locality.
   // The number of bytes per memory location cannot be modified
   // once an allocation manager has been constructed.
   // All currently allocated regions must fall within the new address space.
   //
   // Returns the previous configuration.
   //
   // if no new configuration is specified, simply returns the current
   // configuration.
   //
   extern function uvm_mem_mam_cfg reconfigure(uvm_mem_mam_cfg cfg = null);


   //-------------------------
   // Group: Memory Management
   //-------------------------

   // Function: reserve_region
   //
   // Reserve a specific memory region
   //
   // Reserve a memory region of the specified number of bytes
   // starting at the specified offset.
   // A descriptor of the reserved region is returned.
   // If the specified region cannot be reserved, ~null~ is returned.
   //
   // It may not be possible to reserve a region because
   // it overlaps with an already-allocated region or
   // it lies outside the address range managed
   // by the memory manager.
   //
   // Regions can be reserved to create "holes" in the managed address space.
   //
   extern function uvm_mem_region reserve_region(bit [63:0]   start_offset,
                                                 int unsigned n_bytes,
                                                 string       fname = "",
                                                 int          lineno = 0);


   // Function: request_region
   //
   // Request and reserve a memory region
   //
   // Request and reserve a memory region of the specified number
   // of bytes starting at a random location.
   // If an policy is specified, it is randomized to determine
   // the start offset of the region.
   // If no policy is specified, the policy found in
   // the <uvm_mem_mam::default_alloc> class property is randomized.
   //
   // A descriptor of the allocated region is returned.
   // If no region can be allocated, ~null~ is returned.
   //
   // It may not be possible to allocate a region because
   // there is no area in the memory with enough consecutive locations
   // to meet the size requirements or
   // because there is another contradiction when randomizing
   // the policy.
   //
   // If the memory allocation is configured to ~THRIFTY~ or ~NEARBY~,
   // a suitable region is first sought procedurally.
   //
   extern function uvm_mem_region request_region(int unsigned   n_bytes,
                                                 uvm_mem_mam_policy alloc = null,
                                                 string         fname = "",
                                                 int            lineno = 0);


   // Function: release_region
   //
   // Release the specified region
   //
   // Release a previously allocated memory region.
   // An error is issued if the
   // specified region has not been previously allocated or
   // is no longer allocated. 
   //
   extern function void release_region(uvm_mem_region region);


   // Function: release_all_regions
   //
   // Forcibly release all allocated memory regions. 
   //
   extern function void release_all_regions();


   //---------------------
   // Group: Introspection
   //---------------------

   // Function: convert2string
   //
   // Image of the state of the manager
   //
   // Create a human-readable description of the state of
   // the memory manager and the currently allocated regions.
   // 
   extern function string convert2string();


   // Function: for_each
   //
   // Iterate over all currently allocated regions
   //
   // If reset is ~TRUE~, reset the iterator
   // and return the first allocated region.
   // Returns ~null~ when there are no additional allocated
   // regions to iterate on. 
   //
   extern function uvm_mem_region for_each(bit reset = 0);


   // Function: get_memory
   //
   // Get the managed memory implementation
   //
   // Return the reference to the memory abstraction class
   // for the memory implementing
   // the locations managed by this instance of the allocation manager.
   // Returns ~null~ if no
   // memory abstraction class was specified at construction time. 
   //
   extern function uvm_mem get_memory();

endclass: uvm_mem_mam



//------------------------------------------------------------------------------
// CLASS: uvm_mem_region
//------------------------------------------------------------------------------
// Allocated memory region descriptor
//
// Each instance of this class describes an allocated memory region.
// Instances of this class are created only by
// the memory manager, and returned by the
// <uvm_mem_mam::reserve_region()> and <uvm_mem_mam::request_region()>
// methods. 
//------------------------------------------------------------------------------

class uvm_mem_region;

   /*local*/ bit [63:0] Xstart_offsetX;  // Can't be local since function
   /*local*/ bit [63:0] Xend_offsetX;    // calls not supported in constraints

   local int unsigned len;
   local int unsigned n_bytes;
   local uvm_mem_mam  parent;
   local string       fname;
   local int          lineno;

   /*local*/ uvm_vreg XvregX;

   extern /*local*/ function new(bit [63:0]   start_offset,
                                 bit [63:0]   end_offset,
                                 int unsigned len,
                                 int unsigned n_bytes,
                                 uvm_mem_mam      parent);

   // Function: get_start_offset
   //
   // Get the start offset of the region
   //
   // Return the address offset, within the memory,
   // where this memory region starts.
   //
   extern function bit [63:0] get_start_offset();


   // Function: get_end_offset
   //
   // Get the end offset of the region
   //
   // Return the address offset, within the memory,
   // where this memory region ends.
   //
   extern function bit [63:0] get_end_offset();


   // Function: get_len
   //
   // Size of the memory region
   //
   // Return the number of consecutive memory locations
   // (not necessarily bytes) in the allocated region. 
   //
   extern function int unsigned get_len();


   // Function: get_n_bytes
   //
   // Number of bytes in the region
   //
   // Return the number of consecutive bytes in the allocated region.
   // If the managed memory contains more than one byte per address,
   // the number of bytes in an allocated region may
   // be greater than the number of requested or reserved bytes. 
   //
   extern function int unsigned get_n_bytes();


   // Function: release_region
   //
   // Release this region
   //
   extern function void release_region();


   // Function: get_memory
   //
   // Get the memory where the region resides
   //
   // Return a reference to the memory abstraction class
   // for the memory implementing this allocated memory region.
   // Returns ~null~ if no memory abstraction class was specified
   // for the allocation manager that allocated this region. 
   //
   extern function uvm_mem get_memory();


   // Function: get_virtual_registers
   //
   // Get the virtual register array in this region
   //
   // Return a reference to the virtual register array abstraction class
   // implemented in this region.
   // Returns ~null~ if the memory region is
   // not known to implement virtual registers. 
   //
   extern function uvm_vreg get_virtual_registers();


   // Task: write
   //
   // Write to a memory location in the region.
   //
   // Write to the memory location that corresponds to the
   // specified ~offset~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::write()> for more details.
   //
   extern task write(output uvm_status_e       status,
                     input  uvm_reg_addr_t     offset,
                     input  uvm_reg_data_t     value,
                     input  uvm_path_e         path   = UVM_DEFAULT_PATH,
                     input  uvm_reg_map        map    = null,
                     input  uvm_sequence_base  parent = null,
                     input  int                prior = -1,
                     input  uvm_object         extension = null,
                     input  string             fname = "",
                     input  int                lineno = 0);


   // Task: read
   //
   // Read from a memory location in the region.
   //
   // Read from the memory location that corresponds to the
   // specified ~offset~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::read()> for more details.
   //
   extern task read(output uvm_status_e       status,
                    input  uvm_reg_addr_t     offset,
                    output uvm_reg_data_t     value,
                    input  uvm_path_e         path   = UVM_DEFAULT_PATH,
                    input  uvm_reg_map        map    = null,
                    input  uvm_sequence_base  parent = null,
                    input  int                prior = -1,
                    input  uvm_object         extension = null,
                    input  string             fname = "",
                    input  int                lineno = 0);


   // Task: burst_write
   //
   // Write to a set of memory location in the region.
   //
   // Write to the memory locations that corresponds to the
   // specified ~burst~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::burst_write()> for more details.
   //
   extern task burst_write(output uvm_status_e       status,
                           input  uvm_reg_addr_t     offset,
                           input  uvm_reg_data_t     value[],
                           input  uvm_path_e         path   = UVM_DEFAULT_PATH,
                           input  uvm_reg_map        map    = null,
                           input  uvm_sequence_base  parent = null,
                           input  int                prior  = -1,
                           input  uvm_object         extension = null,
                           input  string             fname  = "",
                           input  int                lineno = 0);


   // Task: burst_read
   //
   // Read from a set of memory location in the region.
   //
   // Read from the memory locations that corresponds to the
   // specified ~burst~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::burst_read()> for more details.
   //
   extern task burst_read(output uvm_status_e       status,
                          input  uvm_reg_addr_t     offset,
                          output uvm_reg_data_t     value[],
                          input  uvm_path_e         path   = UVM_DEFAULT_PATH,
                          input  uvm_reg_map        map    = null,
                          input  uvm_sequence_base  parent = null,
                          input  int                prior  = -1,
                          input  uvm_object         extension = null,
                          input  string             fname  = "",
                          input  int                lineno = 0);


   // Task: poke
   //
   // Deposit in a memory location in the region.
   //
   // Deposit the specified value in the memory location
   // that corresponds to the
   // specified ~offset~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::poke()> for more details.
   //
   extern task poke(output uvm_status_e       status,
                    input  uvm_reg_addr_t     offset,
                    input  uvm_reg_data_t     value,
                    input  uvm_sequence_base  parent = null,
                    input  uvm_object         extension = null,
                    input  string             fname = "",
                    input  int                lineno = 0);


   // Task: peek
   //
   // Sample a memory location in the region.
   //
   // Sample the memory location that corresponds to the
   // specified ~offset~ within this region.
   // Requires that the memory abstraction class be associated with
   // the memory allocation manager that allocated this region.
   //
   // See <uvm_mem::peek()> for more details.
   //
   extern task peek(output uvm_status_e       status,
                    input  uvm_reg_addr_t     offset,
                    output uvm_reg_data_t     value,
                    input  uvm_sequence_base  parent = null,
                    input  uvm_object         extension = null,
                    input  string             fname = "",
                    input  int                lineno = 0);


   extern function string convert2string();

endclass



//------------------------------------------------------------------------------
// Class: uvm_mem_mam_policy
//------------------------------------------------------------------------------
//
// An instance of this class is randomized to determine
// the starting offset of a randomly allocated memory region.
// This class can be extended to provide additional constraints
// on the starting offset, such as word alignment or
// location of the region within a memory page.
// If a procedural region allocation policy is required,
// it can be implemented in the pre/post_randomize() method.
//------------------------------------------------------------------------------

class uvm_mem_mam_policy;
   // variable: len
   // Number of addresses required
   int unsigned len;

   // variable: start_offset
   // The starting offset of the region
   rand bit [63:0] start_offset;

   // variable: min_offset
   // Minimum address offset in the managed address space
   bit [63:0] min_offset;

   // variable: max_offset
   // Maximum address offset in the managed address space
   bit [63:0] max_offset;

   // variable: in_use
   // Regions already allocated in the managed address space
   uvm_mem_region in_use[$];

   constraint uvm_mem_mam_policy_valid {
      start_offset >= min_offset;
      start_offset <= max_offset - len + 1;
   }

   constraint uvm_mem_mam_policy_no_overlap {
      foreach (in_use[i]) {
         !(start_offset <= in_use[i].Xend_offsetX &&
           start_offset + len - 1 >= in_use[i].Xstart_offsetX);
      }
   }

endclass



//
// CLASS: uvm_mem_mam_cfg
// Specifies the memory managed by an instance of a <uvm_mem_mam> memory
// allocation manager class. 
//
class uvm_mem_mam_cfg;
   // variable: n_bytes
   // Number of bytes in each memory location
   rand int unsigned n_bytes;

// FIXME start_offset and end_offset should be "longint unsigned" to match the memory addr types
   // variable: start_offset
   // Lowest address of managed space
   rand bit [63:0] start_offset;

   // variable: end_offset
   // Last address of managed space
   rand bit [63:0] end_offset;

   // variable: mode
   // Region allocation mode
   rand uvm_mem_mam::alloc_mode_e mode;

   // variable: locality
   // Region location mode
   rand uvm_mem_mam::locality_e   locality;

   constraint uvm_mem_mam_cfg_valid {
      end_offset > start_offset;
      n_bytes < 64;
   }
endclass



//------------------------------------------------------------------
//  Implementation
//------------------------------------------------------------------

function uvm_mem_region::new(bit [63:0] start_offset,
                             bit [63:0] end_offset,
                             int unsigned len,
                             int unsigned n_bytes,
                             uvm_mem_mam      parent);
   this.Xstart_offsetX = start_offset;
   this.Xend_offsetX   = end_offset;
   this.len            = len;
   this.n_bytes        = n_bytes;
   this.parent         = parent;
   this.XvregX         = null;
endfunction: new


function bit [63:0] uvm_mem_region::get_start_offset();
   return this.Xstart_offsetX;
endfunction: get_start_offset


function bit [63:0] uvm_mem_region::get_end_offset();
   return this.Xend_offsetX;
endfunction: get_end_offset


function int unsigned uvm_mem_region::get_len();
   return this.len;
endfunction: get_len


function int unsigned uvm_mem_region::get_n_bytes();
   return this.n_bytes;
endfunction: get_n_bytes


function string uvm_mem_region::convert2string();
   $sformat(convert2string, "['h%h:'h%h]",
            this.Xstart_offsetX, this.Xend_offsetX);
endfunction: convert2string


function void uvm_mem_region::release_region();
   this.parent.release_region(this);
endfunction


function uvm_mem uvm_mem_region::get_memory();
   return this.parent.get_memory();
endfunction: get_memory


function uvm_vreg uvm_mem_region::get_virtual_registers();
   return this.XvregX;
endfunction: get_virtual_registers


function uvm_mem_mam::new(string      name,
                      uvm_mem_mam_cfg cfg,
                      uvm_mem mem = null);
   this.cfg           = cfg;
   this.memory        = mem;
   this.default_alloc = new;
endfunction: new


function uvm_mem_mam_cfg uvm_mem_mam::reconfigure(uvm_mem_mam_cfg cfg = null);
   uvm_root top;
   uvm_coreservice_t cs;
   if (cfg == null)
     return this.cfg;

   cs = uvm_coreservice_t::get();
   top = cs.get_root();

   // Cannot reconfigure n_bytes
   if (cfg.n_bytes !== this.cfg.n_bytes) begin
      top.uvm_report_error("uvm_mem_mam",
                 $sformatf("Cannot reconfigure Memory Allocation Manager with a different number of bytes (%0d !== %0d)",
                           cfg.n_bytes, this.cfg.n_bytes), UVM_LOW);
      return this.cfg;
   end

   // All currently allocated regions must fall within the new space
   foreach (this.in_use[i]) begin
      if (this.in_use[i].get_start_offset() < cfg.start_offset ||
          this.in_use[i].get_end_offset() > cfg.end_offset) begin
         top.uvm_report_error("uvm_mem_mam",
                    $sformatf("Cannot reconfigure Memory Allocation Manager with a currently allocated region outside of the managed address range ([%0d:%0d] outside of [%0d:%0d])",
                              this.in_use[i].get_start_offset(),
                              this.in_use[i].get_end_offset(),
                              cfg.start_offset, cfg.end_offset), UVM_LOW);
         return this.cfg;
      end
   end

   reconfigure = this.cfg;
   this.cfg = cfg;
endfunction: reconfigure


function uvm_mem_region uvm_mem_mam::reserve_region(bit [63:0]   start_offset,
                                                int unsigned n_bytes,
                                                string       fname = "",
                                                int          lineno = 0);
   bit [63:0] end_offset;
   this.fname = fname;
   this.lineno = lineno;
   if (n_bytes == 0) begin
      `uvm_error("RegModel", "Cannot reserve 0 bytes");
      return null;
   end

   if (start_offset < this.cfg.start_offset) begin
      `uvm_error("RegModel", $sformatf("Cannot reserve before start of memory space: 'h%h < 'h%h",
                                     start_offset, this.cfg.start_offset));
      return null;
   end

   end_offset = start_offset + ((n_bytes-1) / this.cfg.n_bytes);
   n_bytes = (end_offset - start_offset + 1) * this.cfg.n_bytes;

   if (end_offset > this.cfg.end_offset) begin
      `uvm_error("RegModel", $sformatf("Cannot reserve past end of memory space: 'h%h > 'h%h",
                                     end_offset, this.cfg.end_offset));
      return null;
   end
    
    `uvm_info("RegModel",$sformatf("Attempting to reserve ['h%h:'h%h]...",
          start_offset, end_offset),UVM_MEDIUM)




   foreach (this.in_use[i]) begin
      if (start_offset <= this.in_use[i].get_end_offset() &&
          end_offset >= this.in_use[i].get_start_offset()) begin
         // Overlap!
         `uvm_error("RegModel", $sformatf("Cannot reserve ['h%h:'h%h] because it overlaps with %s",
                                        start_offset, end_offset,
                                        this.in_use[i].convert2string()));
         return null;
      end

      // Regions are stored in increasing start offset
      if (start_offset > this.in_use[i].get_start_offset()) begin
         reserve_region = new(start_offset, end_offset,
                              end_offset - start_offset + 1, n_bytes, this);
         this.in_use.insert(i, reserve_region);
         return reserve_region;
      end
   end

   reserve_region = new(start_offset, end_offset,
                        end_offset - start_offset + 1, n_bytes, this);
   this.in_use.push_back(reserve_region);
endfunction: reserve_region


function uvm_mem_region uvm_mem_mam::request_region(int unsigned      n_bytes,
                                                uvm_mem_mam_policy    alloc = null,
                                                string            fname = "",
                                                int               lineno = 0);
   this.fname = fname;
   this.lineno = lineno;
   if (alloc == null) alloc = this.default_alloc;

   alloc.len        = (n_bytes-1) / this.cfg.n_bytes + 1;
   alloc.min_offset = this.cfg.start_offset;
   alloc.max_offset = this.cfg.end_offset;
   alloc.in_use     = this.in_use;

   if (!alloc.randomize()) begin
      `uvm_error("RegModel", "Unable to randomize policy");
      return null;
   end

   return reserve_region(alloc.start_offset, n_bytes);
endfunction: request_region


function void uvm_mem_mam::release_region(uvm_mem_region region);

   if (region == null) return;

   foreach (this.in_use[i]) begin
      if (this.in_use[i] == region) begin
         this.in_use.delete(i);
         return;
      end
   end
   `uvm_error("RegModel", {"Attempting to release unallocated region\n",
                      region.convert2string()});
endfunction: release_region


function void uvm_mem_mam::release_all_regions();
  in_use.delete();
endfunction: release_all_regions


function string uvm_mem_mam::convert2string();
   convert2string = "Allocated memory regions:\n";
   foreach (this.in_use[i]) begin
      $sformat(convert2string, "%s   %s\n", convert2string,
               this.in_use[i].convert2string());
   end
endfunction: convert2string


function uvm_mem_region uvm_mem_mam::for_each(bit reset = 0);
   if (reset) this.for_each_idx = -1;

   this.for_each_idx++;

   if (this.for_each_idx >= this.in_use.size()) begin
      return null;
   end

   return this.in_use[this.for_each_idx];
endfunction: for_each


function uvm_mem uvm_mem_mam::get_memory();
   return this.memory;
endfunction: get_memory


task uvm_mem_region::write(output uvm_status_e       status,
                           input  uvm_reg_addr_t     offset,
                           input  uvm_reg_data_t     value,
                           input  uvm_path_e         path = UVM_DEFAULT_PATH,
                           input  uvm_reg_map        map    = null,
                           input  uvm_sequence_base  parent = null,
                           input  int                prior = -1,
                           input  uvm_object         extension = null,
                           input  string             fname = "",
                           input  int                lineno = 0);

   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::write() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to write to an offset outside of the allocated region (%0d > %0d)",
                           offset, this.len));
      status = UVM_NOT_OK;
      return;
   end

   mem.write(status, offset + this.get_start_offset(), value,
            path, map, parent, prior, extension);
endtask: write


task uvm_mem_region::read(output uvm_status_e       status,
                          input  uvm_reg_addr_t     offset,
                          output uvm_reg_data_t     value,
                          input  uvm_path_e         path = UVM_DEFAULT_PATH,
                          input  uvm_reg_map        map    = null,
                          input  uvm_sequence_base  parent = null,
                          input  int                prior = -1,
                          input  uvm_object         extension = null,
                          input  string             fname = "",
                          input  int                lineno = 0);
   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::read() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to read from an offset outside of the allocated region (%0d > %0d)",
                           offset, this.len));
      status = UVM_NOT_OK;
      return;
   end

   mem.read(status, offset + this.get_start_offset(), value,
            path, map, parent, prior, extension);
endtask: read


task uvm_mem_region::burst_write(output uvm_status_e       status,
                                 input  uvm_reg_addr_t     offset,
                                 input  uvm_reg_data_t     value[],
                                 input  uvm_path_e         path = UVM_DEFAULT_PATH,
                                 input  uvm_reg_map        map    = null,
                                 input  uvm_sequence_base  parent = null,
                                 input  int                prior = -1,
                                 input  uvm_object         extension = null,
                                 input  string             fname = "",
                                 input  int                lineno = 0);
   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::burst_write() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset + value.size() > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to burst-write to an offset outside of the allocated region (burst to [%0d:%0d] > mem_size %0d)",
                           offset,offset+value.size(),this.len))
      status = UVM_NOT_OK;
      return;
   end

   mem.burst_write(status, offset + get_start_offset(), value,
                   path, map, parent, prior, extension);

endtask: burst_write


task uvm_mem_region::burst_read(output uvm_status_e       status,
                                input  uvm_reg_addr_t     offset,
                                output uvm_reg_data_t     value[],
                                input  uvm_path_e         path = UVM_DEFAULT_PATH,
                                input  uvm_reg_map        map    = null,
                                input  uvm_sequence_base  parent = null,
                                input  int                prior = -1,
                                input  uvm_object         extension = null,
                                input  string             fname = "",
                                input  int                lineno = 0);
   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::burst_read() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset + value.size() > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to burst-read to an offset outside of the allocated region (burst to [%0d:%0d] > mem_size %0d)",
                           offset,offset+value.size(),this.len))
      status = UVM_NOT_OK;
      return;
   end

   mem.burst_read(status, offset + get_start_offset(), value,
                  path, map, parent, prior, extension);

endtask: burst_read


task uvm_mem_region::poke(output uvm_status_e       status,
                          input  uvm_reg_addr_t     offset,
                          input  uvm_reg_data_t     value,
                          input  uvm_sequence_base  parent = null,
                          input  uvm_object         extension = null,
                          input  string             fname = "",
                          input  int                lineno = 0);
   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::poke() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to poke to an offset outside of the allocated region (%0d > %0d)",
                           offset, this.len));
      status = UVM_NOT_OK;
      return;
   end

   mem.poke(status, offset + this.get_start_offset(), value, "", parent, extension);
endtask: poke


task uvm_mem_region::peek(output uvm_status_e       status,
                          input  uvm_reg_addr_t     offset,
                          output uvm_reg_data_t     value,
                          input  uvm_sequence_base  parent = null,
                          input  uvm_object         extension = null,
                          input  string             fname = "",
                          input  int                lineno = 0);
   uvm_mem mem = this.parent.get_memory();
   this.fname = fname;
   this.lineno = lineno;

   if (mem == null) begin
      `uvm_error("RegModel", "Cannot use uvm_mem_region::peek() on a region that was allocated by a Memory Allocation Manager that was not associated with a uvm_mem instance");
      status = UVM_NOT_OK;
      return;
   end

   if (offset > this.len) begin
      `uvm_error("RegModel",
                 $sformatf("Attempting to peek from an offset outside of the allocated region (%0d > %0d)",
                           offset, this.len));
      status = UVM_NOT_OK;
      return;
   end

   mem.peek(status, offset + this.get_start_offset(), value, "", parent, extension);
endtask: peek


`endif  // UVM_MEM_MAM__SV

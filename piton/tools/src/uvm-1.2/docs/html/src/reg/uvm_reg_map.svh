// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010-2011 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
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

class uvm_reg_map_info;
   uvm_reg_addr_t         offset;
   string                 rights;
   bit                    unmapped;
   uvm_reg_addr_t         addr[];
   uvm_reg_frontdoor      frontdoor;
   uvm_reg_map_addr_range mem_range; 
   
   // if set marks the uvm_reg_map_info as initialized, prevents using an uninitialized map (for instance if the model 
   // has not been locked accidently and the maps have not been computed before)
   bit                    is_initialized;
endclass


// Class: uvm_reg_transaction_order_policy
virtual class uvm_reg_transaction_order_policy extends uvm_object;
    function new(string name = "policy");
        super.new(name);
    endfunction
    
    // Function: order
    // the order() function may reorder the sequence of bus transactions
    // produced by a single uvm_reg transaction (read/write).
    // This can be used in scenarios when the register width differs from 
    // the bus width and one register access results in a series of bus transactions.
    // the first item (0) of the queue will be the first bus transaction (the last($) 
    // will be the final transaction
    pure virtual function void order(ref uvm_reg_bus_op q[$]);
endclass

//------------------------------------------------------------------------------
//
// Class: uvm_reg_map
//
// :Address map abstraction class
//
// This class represents an address map.
// An address map is a collection of registers and memories
// accessible via a specific physical interface.
// Address maps can be composed into higher-level address maps.
//
// Address maps are created using the <uvm_reg_block::create_map()>
// method.
//------------------------------------------------------------------------------

class uvm_reg_map extends uvm_object;

   `uvm_object_utils(uvm_reg_map)
   
   // info that is valid only if top-level map
   local uvm_reg_addr_t     m_base_addr;
   local int unsigned       m_n_bytes;
   local uvm_endianness_e   m_endian;
   local bit                m_byte_addressing;
   local uvm_object_wrapper m_sequence_wrapper;
   local uvm_reg_adapter    m_adapter;
   local uvm_sequencer_base m_sequencer;
   local bit                m_auto_predict;
   local bit                m_check_on_read;

   local uvm_reg_block      m_parent;

   local int unsigned       m_system_n_bytes;

   local uvm_reg_map        m_parent_map;
   local uvm_reg_addr_t     m_parent_maps[uvm_reg_map];   // value=offset of this map at parent level
   local uvm_reg_addr_t     m_submaps[uvm_reg_map];       // value=offset of submap at this level
   local string             m_submap_rights[uvm_reg_map]; // value=rights of submap at this level

   local uvm_reg_map_info   m_regs_info[uvm_reg];
   local uvm_reg_map_info   m_mems_info[uvm_mem];

   local uvm_reg            m_regs_by_offset[uvm_reg_addr_t];
                            // Use only in addition to above if a RO and a WO
                            // register share the same address.
   local uvm_reg            m_regs_by_offset_wo[uvm_reg_addr_t]; 
   local uvm_mem            m_mems_by_offset[uvm_reg_map_addr_range];

   local uvm_reg_transaction_order_policy policy;

   extern /*local*/ function void Xinit_address_mapX();

   static local uvm_reg_map   m_backdoor;

   // Function: backdoor
   // Return the backdoor pseudo-map singleton
   //
   // This pseudo-map is used to specify or configure the backdoor
   // instead of a real address map.
   //
   static function uvm_reg_map backdoor();
      if (m_backdoor == null)
        m_backdoor = new("Backdoor");
      return m_backdoor;
   endfunction


   //----------------------
   // Group: Initialization
   //----------------------


   // Function: new
   //
   // Create a new instance
   //
   extern function new(string name="uvm_reg_map");


   // Function: configure
   //
   // Instance-specific configuration
   //
   // Configures this map with the following properties.
   //
   // parent    - the block in which this map is created and applied
   //
   // base_addr - the base address for this map. All registers, memories,
   //             and sub-blocks will be at offsets to this address
   //
   // n_bytes   - the byte-width of the bus on which this map is used 
   //
   // endian    - the endian format. See <uvm_endianness_e> for possible
   //             values
   //
   // byte_addressing - specifies whether the address increment is on a
   //             per-byte basis. For example, consecutive memory locations
   //             with ~n_bytes~=4 (32-bit bus) are 4 apart: 0, 4, 8, and
   //             so on. Default is TRUE.
   //
   extern function void configure(uvm_reg_block     parent,
                                  uvm_reg_addr_t    base_addr,
                                  int unsigned      n_bytes,
                                  uvm_endianness_e  endian,
                                  bit byte_addressing = 1);

   // Function: add_reg
   //
   // Add a register
   //
   // Add the specified register instance ~rg~ to this address map.
   //
   // The register is located at the specified address ~offset~ from
   // this maps configured base address.
   //
   // The ~rights~ specify the register's accessibility via this map.
   // Valid values are "RW", "RO", and "WO". Whether a register field
   // can be read or written depends on both the field's configured access
   // policy (see <uvm_reg_field::configure> and the register's rights in
   // the map being used to access the field. 
   //
   // The number of consecutive physical addresses occupied by the register
   // depends on the width of the register and the number of bytes in the
   // physical interface corresponding to this address map.
   //
   // If ~unmapped~ is TRUE, the register does not occupy any
   // physical addresses and the base address is ignored.
   // Unmapped registers require a user-defined ~frontdoor~ to be specified.
   //
   // A register may be added to multiple address maps
   // if it is accessible from multiple physical interfaces.
   // A register may only be added to an address map whose parent block
   // is the same as the register's parent block.
   //
   extern virtual function void add_reg (uvm_reg           rg,
                                         uvm_reg_addr_t    offset,
                                         string            rights = "RW",
                                         bit               unmapped=0,
                                         uvm_reg_frontdoor frontdoor=null);


   // Function: add_mem
   //
   // Add a memory
   //
   // Add the specified memory instance to this address map.
   // The memory is located at the specified base address and has the
   // specified access rights ("RW", "RO" or "WO").
   // The number of consecutive physical addresses occupied by the memory
   // depends on the width and size of the memory and the number of bytes in the
   // physical interface corresponding to this address map.
   //
   // If ~unmapped~ is TRUE, the memory does not occupy any
   // physical addresses and the base address is ignored.
   // Unmapped memories require a user-defined ~frontdoor~ to be specified.
   //
   // A memory may be added to multiple address maps
   // if it is accessible from multiple physical interfaces.
   // A memory may only be added to an address map whose parent block
   // is the same as the memory's parent block.
   //
   extern virtual function void add_mem (uvm_mem        mem,
                                         uvm_reg_addr_t offset,
                                         string         rights = "RW",
                                         bit            unmapped=0,
                                         uvm_reg_frontdoor frontdoor=null);

   
   // Function: add_submap
   //
   // Add an address map
   //
   // Add the specified address map instance to this address map.
   // The address map is located at the specified base address.
   // The number of consecutive physical addresses occupied by the submap
   // depends on the number of bytes in the physical interface
   // that corresponds to the submap,
   // the number of addresses used in the submap and
   // the number of bytes in the
   // physical interface corresponding to this address map.
   //
   // An address map may be added to multiple address maps
   // if it is accessible from multiple physical interfaces.
   // An address map may only be added to an address map
   // in the grand-parent block of the address submap.
   //
   extern virtual function void add_submap (uvm_reg_map    child_map,
                                            uvm_reg_addr_t offset);


   // Function: set_sequencer
   //
   // Set the sequencer and adapter associated with this map. This method
   // ~must~ be called before starting any sequences based on uvm_reg_sequence.

   extern virtual function void set_sequencer (uvm_sequencer_base sequencer,
                                               uvm_reg_adapter    adapter=null);



   // Function: set_submap_offset
   //
   // Set the offset of the given ~submap~ to ~offset~.

   extern virtual function void set_submap_offset (uvm_reg_map submap,
                                                   uvm_reg_addr_t offset);


   // Function: get_submap_offset
   //
   // Return the offset of the given ~submap~.

   extern virtual function uvm_reg_addr_t get_submap_offset (uvm_reg_map submap);


   // Function: set_base_addr
   //
   // Set the base address of this map.

   extern virtual function void   set_base_addr (uvm_reg_addr_t  offset);


   // Function: reset
   //
   // Reset the mirror for all registers in this address map.
   //
   // Sets the mirror value of all registers in this address map
   // and all of its submaps
   // to the reset value corresponding to the specified reset event.
   // See <uvm_reg_field::reset()> for more details.
   // Does not actually set the value of the registers in the design,
   // only the values mirrored in their corresponding mirror.
   //
   // Note that, unlike the other reset() method, the default
   // reset event for this method is "SOFT".
   //
   extern virtual function void reset(string kind = "SOFT");


   /*local*/ extern virtual function void add_parent_map(uvm_reg_map  parent_map,
                                                         uvm_reg_addr_t offset);

   /*local*/ extern virtual function void Xverify_map_configX();

   /*local*/ extern virtual function void m_set_reg_offset(uvm_reg   rg,
                                                           uvm_reg_addr_t offset,
                                                           bit unmapped);

   /*local*/ extern virtual function void m_set_mem_offset(uvm_mem mem,
                                                           uvm_reg_addr_t offset,
                                                           bit unmapped);


   //---------------------
   // Group: Introspection
   //---------------------

   // Function: get_name
   //
   // Get the simple name
   //
   // Return the simple object name of this address map.
   //

   // Function: get_full_name
   //
   // Get the hierarchical name
   //
   // Return the hierarchal name of this address map.
   // The base of the hierarchical name is the root block.
   //
   extern virtual function string get_full_name();


   // Function: get_root_map
   //
   // Get the externally-visible address map
   //
   // Get the top-most address map where this address map is instantiated.
   // It corresponds to the externally-visible address map that can
   // be accessed by the verification environment.
   //
   extern virtual function uvm_reg_map get_root_map();


   // Function: get_parent
   //
   // Get the parent block
   //
   // Return the block that is the parent of this address map.
   //
   extern virtual function uvm_reg_block get_parent();


   // Function: get_parent_map
   // Get the higher-level address map
   //
   // Return the address map in which this address map is mapped.
   // returns ~null~ if this is a top-level address map.
   //
   extern virtual function uvm_reg_map           get_parent_map();


   // Function: get_base_addr
   //
   // Get the base offset address for this map. If this map is the
   // root map, the base address is that set with the ~base_addr~ argument
   // to <uvm_reg_block::create_map()>. If this map is a submap of a higher-level map,
   // the base address is offset given this submap by the parent map.
   // See <set_submap_offset>.
   //
   extern virtual function uvm_reg_addr_t get_base_addr (uvm_hier_e hier=UVM_HIER);


   // Function: get_n_bytes
   //
   // Get the width in bytes of the bus associated with this map. If ~hier~
   // is ~UVM_HIER~, then gets the effective bus width relative to the system
   // level. The effective bus width is the narrowest bus width from this
   // map to the top-level root map. Each bus access will be limited to this
   // bus width.
   //
   extern virtual function int unsigned get_n_bytes (uvm_hier_e hier=UVM_HIER);


   // Function: get_addr_unit_bytes
   //
   // Get the number of bytes in the smallest addressable unit in the map.
   // Returns 1 if the address map was configured using byte-level addressing.
   // Returns <get_n_bytes()> otherwise.
   //
   extern virtual function int unsigned get_addr_unit_bytes();


   // Function: get_base_addr
   //
   // Gets the endianness of the bus associated with this map. If ~hier~ is
   // set to ~UVM_HIER~, gets the system-level endianness.
   //
   extern virtual function uvm_endianness_e get_endian (uvm_hier_e hier=UVM_HIER);


   // Function: get_sequencer
   //
   // Gets the sequencer for the bus associated with this map. If ~hier~ is
   // set to ~UVM_HIER~, gets the sequencer for the bus at the system-level.
   // See <set_sequencer>.
   //
   extern virtual function uvm_sequencer_base get_sequencer (uvm_hier_e hier=UVM_HIER);


   // Function: get_adapter
   //
   // Gets the bus adapter for the bus associated with this map. If ~hier~ is
   // set to ~UVM_HIER~, gets the adapter for the bus used at the system-level.
   // See <set_sequencer>.
   //
   extern virtual function uvm_reg_adapter get_adapter (uvm_hier_e hier=UVM_HIER);


   // Function: get_submaps
   //
   // Get the address sub-maps
   //
   // Get the address maps instantiated in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the address maps,
   // in the sub-maps.
   //
   extern virtual function void  get_submaps (ref uvm_reg_map maps[$],
                                              input uvm_hier_e hier=UVM_HIER);


   // Function: get_registers
   //
   // Get the registers
   //
   // Get the registers instantiated in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the registers
   // in the sub-maps.
   //
   extern virtual function void  get_registers (ref uvm_reg regs[$],
                                                input uvm_hier_e hier=UVM_HIER);


   // Function: get_fields
   //
   // Get the fields
   //
   // Get the fields in the registers instantiated in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the fields of the registers
   // in the sub-maps.
   //
   extern virtual function void  get_fields (ref uvm_reg_field fields[$],
                                             input uvm_hier_e hier=UVM_HIER);

   
   // Function: get_memories
   //
   // Get the memories
   //
   // Get the memories instantiated in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the memories
   // in the sub-maps.
   //
   extern virtual function void  get_memories (ref uvm_mem mems[$],
                                               input uvm_hier_e hier=UVM_HIER);


   // Function: get_virtual_registers
   //
   // Get the virtual registers
   //
   // Get the virtual registers instantiated in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the virtual registers
   // in the sub-maps.
   //
   extern virtual function void  get_virtual_registers (ref uvm_vreg regs[$],
                                                        input uvm_hier_e hier=UVM_HIER);


   // Function: get_virtual_fields
   //
   // Get the virtual fields
   //
   // Get the virtual fields from the virtual registers instantiated
   // in this address map.
   // If ~hier~ is ~UVM_HIER~, recursively includes the virtual fields
   // in the virtual registers in the sub-maps.
   //
   extern virtual function void  get_virtual_fields (ref uvm_vreg_field fields[$],
                                                     input uvm_hier_e hier=UVM_HIER);


   extern virtual function uvm_reg_map_info get_reg_map_info(uvm_reg rg,  bit error=1);
   extern virtual function uvm_reg_map_info get_mem_map_info(uvm_mem mem, bit error=1);
   extern virtual function int unsigned get_size();


   // Function: get_physical_addresses
   //
   // Translate a local address into external addresses
   //
   // Identify the sequence of addresses that must be accessed physically
   // to access the specified number of bytes at the specified address
   // within this address map.
   // Returns the number of bytes of valid data in each access.
   //
   // Returns in ~addr~ a list of address in little endian order,
   // with the granularity of the top-level address map.
   //
   // A register is specified using a base address with ~mem_offset~ as 0.
   // A location within a memory is specified using the base address
   // of the memory and the index of the location within that memory.
   //

   extern virtual function int get_physical_addresses(uvm_reg_addr_t        base_addr,
                                                      uvm_reg_addr_t        mem_offset,
                                                      int unsigned          n_bytes,
                                                      ref uvm_reg_addr_t    addr[]);
   

   // Function: get_reg_by_offset
   //
   // Get register mapped at offset
   //
   // Identify the register located at the specified offset within
   // this address map for the specified type of access.
   // Returns ~null~ if no such register is found.
   //
   // The model must be locked using <uvm_reg_block::lock_model()>
   // to enable this functionality.
   //
   extern virtual function uvm_reg get_reg_by_offset(uvm_reg_addr_t offset,
                                                     bit            read = 1);

   //
   // Function: get_mem_by_offset
   // Get memory mapped at offset
   //
   // Identify the memory located at the specified offset within
   // this address map. The offset may refer to any memory location
   // in that memory.
   // Returns ~null~ if no such memory is found.
   //
   // The model must be locked using <uvm_reg_block::lock_model()>
   // to enable this functionality.
   //
   extern virtual function uvm_mem    get_mem_by_offset(uvm_reg_addr_t offset);


   //------------------
   // Group: Bus Access
   //------------------

   // Function: set_auto_predict 
   //
   // Sets the auto-predict mode for his map.
   //
   // When ~on~ is ~TRUE~, 
   // the register model will automatically update its mirror
   // (what it thinks should be in the DUT) immediately after
   // any bus read or write operation via this map. Before a <uvm_reg::write>
   // or <uvm_reg::read> operation returns, the register's <uvm_reg::predict>
   // method is called to update the mirrored value in the register.
   //
   // When ~on~ is ~FALSE~, bus reads and writes via this map do not
   // automatically update the mirror. For real-time updates to the mirror
   // in this mode, you connect a <uvm_reg_predictor> instance to the bus
   // monitor. The predictor takes observed bus transactions from the
   // bus monitor, looks up the associated <uvm_reg> register given
   // the address, then calls that register's <uvm_reg::predict> method.
   // While more complex, this mode will capture all register read/write
   // activity, including that not directly descendant from calls to
   // <uvm_reg::write> and <uvm_reg::read>.
   //
   // By default, auto-prediction is turned off.
   // 
   function void set_auto_predict(bit on=1); m_auto_predict = on; endfunction


   // Function: get_auto_predict
   //
   // Gets the auto-predict mode setting for this map.
   // 
   function bit  get_auto_predict(); return m_auto_predict; endfunction


   // Function: set_check_on_read
   // 
   // Sets the check-on-read mode for his map
   // and all of its submaps.
   //
   // When ~on~ is ~TRUE~, 
   // the register model will automatically check any value read back from
   // a register or field against the current value in its mirror
   // and report any discrepancy.
   // This effectively combines the functionality of the
   // <uvm_reg::read()> and ~uvm_reg::mirror(UVM_CHECK)~ method.
   // This mode is useful when the register model is used passively.
   //
   // When ~on~ is ~FALSE~, no check is made against the mirrored value.
   //
   // At the end of the read operation, the mirror value is updated based
   // on the value that was read regardless of this mode setting.
   //
   // By default, auto-prediction is turned off.
   // 
   function void set_check_on_read(bit on=1);
      m_check_on_read = on;
      foreach (m_submaps[submap]) begin
         submap.set_check_on_read(on);
      end
   endfunction


   // Function: get_check_on_read
   //
   // Gets the check-on-read mode setting for this map.
   // 
   function bit  get_check_on_read(); return m_check_on_read; endfunction


   
   // Task: do_bus_write
   //
   // Perform a bus write operation.
   //
   extern virtual task do_bus_write (uvm_reg_item rw,
                                     uvm_sequencer_base sequencer,
                                     uvm_reg_adapter adapter);


   // Task: do_bus_read
   //
   // Perform a bus read operation.
   //
   extern virtual task do_bus_read (uvm_reg_item rw,
                                    uvm_sequencer_base sequencer,
                                    uvm_reg_adapter adapter);


   // Task: do_write
   //
   // Perform a write operation.
   //
   extern virtual task do_write(uvm_reg_item rw);


   // Task: do_read
   //
   // Perform a read operation.
   //
   extern virtual task do_read(uvm_reg_item rw);

   extern function void Xget_bus_infoX (uvm_reg_item rw,
                                        output uvm_reg_map_info map_info,
                                        output int size,
                                        output int lsb,
                                        output int addr_skip);

   extern virtual function string      convert2string();
   extern virtual function uvm_object  clone();
   extern virtual function void        do_print (uvm_printer printer);
   extern virtual function void        do_copy   (uvm_object rhs);
   //extern virtual function bit       do_compare (uvm_object rhs, uvm_comparer comparer);
   //extern virtual function void      do_pack (uvm_packer packer);
   //extern virtual function void      do_unpack (uvm_packer packer);


    // Function: set_transaction_order_policy
    // set the transaction order policy
    function void set_transaction_order_policy(uvm_reg_transaction_order_policy pol);
        policy = pol;
    endfunction
    
    // Function: get_transaction_order_policy
    // set the transaction order policy
    function uvm_reg_transaction_order_policy get_transaction_order_policy();
        return policy;
    endfunction    
   
endclass: uvm_reg_map
   


//---------------
// Initialization
//---------------

// new

function uvm_reg_map::new(string name = "uvm_reg_map");
   super.new((name == "") ? "default_map" : name);
   m_auto_predict = 0;
   m_check_on_read = 0;
endfunction


// configure

function void uvm_reg_map::configure(uvm_reg_block    parent,
                                     uvm_reg_addr_t   base_addr,
                                     int unsigned     n_bytes,
                                     uvm_endianness_e endian,
                                     bit              byte_addressing=1);
   m_parent     = parent;
   m_n_bytes    = n_bytes;
   m_endian     = endian;
   m_base_addr  = base_addr;
   m_byte_addressing = byte_addressing;
endfunction: configure


// add_reg

function void uvm_reg_map::add_reg(uvm_reg rg, 
                                   uvm_reg_addr_t offset,
                                   string rights = "RW",
                                   bit unmapped=0,
                                   uvm_reg_frontdoor frontdoor=null);

   if (m_regs_info.exists(rg)) begin
      `uvm_error("RegModel", {"Register '",rg.get_name(),
                 "' has already been added to map '",get_name(),"'"})
      return;
   end

   if (rg.get_parent() != get_parent()) begin
      `uvm_error("RegModel",
         {"Register '",rg.get_full_name(),"' may not be added to address map '",
          get_full_name(),"' : they are not in the same block"})
      return;
   end
   
   rg.add_map(this);

   begin
   uvm_reg_map_info info = new;
   info.offset   = offset;
   info.rights   = rights;
   info.unmapped = unmapped;
   info.frontdoor = frontdoor;
   m_regs_info[rg] = info;
   end
endfunction


// m_set_reg_offset

function void uvm_reg_map::m_set_reg_offset(uvm_reg rg, 
                                            uvm_reg_addr_t offset,
                                            bit unmapped);

   if (!m_regs_info.exists(rg)) begin
      `uvm_error("RegModel",
         {"Cannot modify offset of register '",rg.get_full_name(),
         "' in address map '",get_full_name(),
         "' : register not mapped in that address map"})
      return;
   end

   begin
      uvm_reg_map_info info    = m_regs_info[rg];
      uvm_reg_block    blk     = get_parent();
      uvm_reg_map      top_map = get_root_map();
      uvm_reg_addr_t   addrs[];

      // if block is not locked, Xinit_address_mapX will resolve map when block is locked
      if (blk.is_locked()) begin

         // remove any existing cached addresses
         if (!info.unmapped) begin
           foreach (info.addr[i]) begin

              if (!top_map.m_regs_by_offset_wo.exists(info.addr[i])) begin
                 top_map.m_regs_by_offset.delete(info.addr[i]);
              end
              else begin
                 if (top_map.m_regs_by_offset[info.addr[i]] == rg) begin
                    top_map.m_regs_by_offset[info.addr[i]] = 
                      top_map.m_regs_by_offset_wo[info.addr[i]];
                    uvm_reg_read_only_cbs::remove(rg);
                    uvm_reg_write_only_cbs::remove(top_map.m_regs_by_offset[info.addr[i]]);
                 end
                 else begin
                    uvm_reg_write_only_cbs::remove(rg);
                    uvm_reg_read_only_cbs::remove(top_map.m_regs_by_offset[info.addr[i]]);
                 end
                 top_map.m_regs_by_offset_wo.delete(info.addr[i]);
              end
           end
         end

         // if we are remapping...
         if (!unmapped) begin
            string rg_acc = rg.Xget_fields_accessX(this);
            
            // get new addresses
            void'(get_physical_addresses(offset,0,rg.get_n_bytes(),addrs));

            // make sure they do not conflict with others
            foreach (addrs[i]) begin
               uvm_reg_addr_t addr = addrs[i];
               if (top_map.m_regs_by_offset.exists(addr)) begin

                  uvm_reg rg2 = top_map.m_regs_by_offset[addr];
                  string rg2_acc = rg2.Xget_fields_accessX(this);

                  // If the register at the same address is RO or WO
                  // and this register is WO or RO, this is OK
                  if (rg_acc == "RO" && rg2_acc == "WO") begin
                     top_map.m_regs_by_offset[addr]    = rg;
                     uvm_reg_read_only_cbs::add(rg);
                     top_map.m_regs_by_offset_wo[addr] = rg2;
                     uvm_reg_write_only_cbs::add(rg2);
                  end
                  else if (rg_acc == "WO" && rg2_acc == "RO") begin
                     top_map.m_regs_by_offset_wo[addr] = rg;
                     uvm_reg_write_only_cbs::add(rg);
                     uvm_reg_read_only_cbs::add(rg2);
                  end
                  else begin
                     string a;
                     a = $sformatf("%0h",addr);
                     `uvm_warning("RegModel", {"In map '",get_full_name(),"' register '",
                                               rg.get_full_name(), "' maps to same address as register '",
                                               top_map.m_regs_by_offset[addr].get_full_name(),"': 'h",a})
                  end
               end
               else
                  top_map.m_regs_by_offset[addr] = rg;

               foreach (top_map.m_mems_by_offset[range]) begin
                  if (addrs[i] >= range.min && addrs[i] <= range.max) begin
                    string a;
                    a = $sformatf("%0h",addrs[i]);
                    `uvm_warning("RegModel", {"In map '",get_full_name(),"' register '",
                        rg.get_full_name(), "' overlaps with address range of memory '",
                        top_map.m_mems_by_offset[range].get_full_name(),"': 'h",a})
                  end
               end
            end
            info.addr = addrs; // cache it
         end
      end

      if (unmapped) begin
        info.offset   = -1;
        info.unmapped = 1;
      end
      else begin
        info.offset   = offset;
        info.unmapped = 0;
      end
      
   end
endfunction


// add_mem

function void uvm_reg_map::add_mem(uvm_mem mem,
                                   uvm_reg_addr_t offset,
                                   string rights = "RW",
                                   bit unmapped=0,
                                   uvm_reg_frontdoor frontdoor=null);
   if (m_mems_info.exists(mem)) begin
      `uvm_error("RegModel", {"Memory '",mem.get_name(),
                 "' has already been added to map '",get_name(),"'"})
      return;
   end

   if (mem.get_parent() != get_parent()) begin
      `uvm_error("RegModel",
         {"Memory '",mem.get_full_name(),"' may not be added to address map '",
          get_full_name(),"' : they are not in the same block"})
      return;
   end
   
   mem.add_map(this);

   begin
   uvm_reg_map_info info = new;
   info.offset   = offset;
   info.rights   = rights;
   info.unmapped = unmapped;
   info.frontdoor = frontdoor;
   m_mems_info[mem] = info;
   end
endfunction: add_mem



// m_set_mem_offset

function void uvm_reg_map::m_set_mem_offset(uvm_mem mem, 
                                            uvm_reg_addr_t offset,
                                            bit unmapped);

   if (!m_mems_info.exists(mem)) begin
      `uvm_error("RegModel",
         {"Cannot modify offset of memory '",mem.get_full_name(),
         "' in address map '",get_full_name(),
         "' : memory not mapped in that address map"})
      return;
   end

   begin
      uvm_reg_map_info info    = m_mems_info[mem];
      uvm_reg_block    blk     = get_parent();
      uvm_reg_map      top_map = get_root_map();
      uvm_reg_addr_t   addrs[];

      // if block is not locked, Xinit_address_mapX will resolve map when block is locked
      if (blk.is_locked()) begin

         // remove any existing cached addresses
         if (!info.unmapped) begin
           foreach (top_map.m_mems_by_offset[range]) begin
              if (top_map.m_mems_by_offset[range] == mem)
                 top_map.m_mems_by_offset.delete(range);
           end
         end

         // if we are remapping...
         if (!unmapped) begin
            uvm_reg_addr_t addrs[],addrs_max[];
            uvm_reg_addr_t min, max, min2, max2;
            int unsigned stride;

            void'(get_physical_addresses(offset,0,mem.get_n_bytes(),addrs));
            min = (addrs[0] < addrs[addrs.size()-1]) ? addrs[0] : addrs[addrs.size()-1];
            min2 = addrs[0];

            void'(get_physical_addresses(offset,(mem.get_size()-1),
                                         mem.get_n_bytes(),addrs_max));
            max = (addrs_max[0] > addrs_max[addrs_max.size()-1]) ?
               addrs_max[0] : addrs_max[addrs_max.size()-1];
            max2 = addrs_max[0];
            // address interval between consecutive mem locations
            stride = (max2 - max)/(mem.get_size()-1);

            // make sure new offset does not conflict with others
            foreach (top_map.m_regs_by_offset[reg_addr]) begin
               if (reg_addr >= min && reg_addr <= max) begin
                  string a,b;
                  a = $sformatf("[%0h:%0h]",min,max);
                  b = $sformatf("%0h",reg_addr);
                  `uvm_warning("RegModel", {"In map '",get_full_name(),"' memory '",
                      mem.get_full_name(), "' with range ",a,
                      " overlaps with address of existing register '",
                      top_map.m_regs_by_offset[reg_addr].get_full_name(),"': 'h",b})
               end
            end

            foreach (top_map.m_mems_by_offset[range]) begin
               if (min <= range.max && max >= range.max ||
                   min <= range.min && max >= range.min ||
                   min >= range.min && max <= range.max) begin
                 string a,b;
                 a = $sformatf("[%0h:%0h]",min,max);
                 b = $sformatf("[%0h:%0h]",range.min,range.max);
                 `uvm_warning("RegModel", {"In map '",get_full_name(),"' memory '",
                     mem.get_full_name(), "' with range ",a,
                     " overlaps existing memory with range '",
                     top_map.m_mems_by_offset[range].get_full_name(),"': ",b})
                 end
            end

            begin
              uvm_reg_map_addr_range range = '{ min, max, stride };
              top_map.m_mems_by_offset[range] = mem;
              info.addr  = addrs;
              info.mem_range = range;
            end

         end
      end

      if (unmapped) begin
        info.offset   = -1;
        info.unmapped = 1;
      end
      else begin
        info.offset   = offset;
        info.unmapped = 0;
      end
      
   end
endfunction


// add_submap

function void uvm_reg_map::add_submap (uvm_reg_map child_map,
                                       uvm_reg_addr_t offset);
   uvm_reg_map parent_map;

   if (child_map == null) begin
      `uvm_error("RegModel", {"Attempting to add NULL map to map '",get_full_name(),"'"})
      return;
   end

   parent_map = child_map.get_parent_map();

   // Cannot have more than one parent (currently)
   if (parent_map != null) begin
      `uvm_error("RegModel", {"Map '", child_map.get_full_name(),
                 "' is already a child of map '",
                 parent_map.get_full_name(),
                 "'. Cannot also be a child of map '",
                 get_full_name(),
                 "'"})
      return;
   end

   begin : parent_block_check
     uvm_reg_block child_blk = child_map.get_parent();
     if (child_blk == null) begin
        `uvm_error("RegModel", {"Cannot add submap '",child_map.get_full_name(),
                   "' because it does not have a parent block"})
        return;
     end
     while((child_blk!=null) && (child_blk.get_parent() != get_parent()))
	     	child_blk = child_blk.get_parent();
     
     if (child_blk==null) begin
        `uvm_error("RegModel",
          {"Submap '",child_map.get_full_name(),"' may not be added to this ",
          "address map, '", get_full_name(),"', as the submap's parent block, '",
          child_blk.get_full_name(),"', is neither this map's parent block nor a descendent of this map's parent block, '",
          m_parent.get_full_name(),"'"})
      return;
     end
   end
   
   begin : n_bytes_match_check
      if (m_n_bytes > child_map.get_n_bytes(UVM_NO_HIER)) begin
         `uvm_warning("RegModel",
             $sformatf("Adding %0d-byte submap '%s' to %0d-byte parent map '%s'",
                       child_map.get_n_bytes(UVM_NO_HIER), child_map.get_full_name(),
                       m_n_bytes, get_full_name()));
      end
   end

   child_map.add_parent_map(this,offset);

   set_submap_offset(child_map, offset);

endfunction: add_submap


// reset

function void uvm_reg_map::reset(string kind = "SOFT");
   uvm_reg regs[$];

   get_registers(regs);

   foreach (regs[i]) begin
      regs[i].reset(kind);
   end
endfunction


// add_parent_map

function void uvm_reg_map::add_parent_map(uvm_reg_map parent_map, uvm_reg_addr_t offset);

   if (parent_map == null) begin
      `uvm_error("RegModel",
          {"Attempting to add NULL parent map to map '",get_full_name(),"'"})
      return;
   end

   if (m_parent_map != null) begin
      `uvm_error("RegModel",
          $sformatf("Map \"%s\" already a submap of map \"%s\" at offset 'h%h",
                    get_full_name(), m_parent_map.get_full_name(),
                    m_parent_map.get_submap_offset(this)));
      return;
   end

   m_parent_map = parent_map;
   m_parent_maps[parent_map] = offset; // prep for multiple parents
   parent_map.m_submaps[this] = offset;

endfunction: add_parent_map


// set_sequencer

function void uvm_reg_map::set_sequencer(uvm_sequencer_base sequencer,
                                         uvm_reg_adapter adapter=null);

   if (sequencer == null) begin
      `uvm_error("REG_NULL_SQR", "Null reference specified for bus sequencer");
      return;
   end

   if (adapter == null) begin
      `uvm_info("REG_NO_ADAPT", {"Adapter not specified for map '",get_full_name(),
        "'. Accesses via this map will send abstract 'uvm_reg_item' items to sequencer '",
        sequencer.get_full_name(),"'"},UVM_MEDIUM)
   end

   m_sequencer = sequencer;
   m_adapter = adapter;
endfunction



//------------
// get methods
//------------

// get_parent

function uvm_reg_block uvm_reg_map::get_parent();
  return m_parent;
endfunction


// get_parent_map

function uvm_reg_map uvm_reg_map::get_parent_map();
  return m_parent_map;
endfunction


// get_root_map

function uvm_reg_map uvm_reg_map::get_root_map();
   return (m_parent_map == null) ? this : m_parent_map.get_root_map();
endfunction: get_root_map


// get_base_addr

function uvm_reg_addr_t  uvm_reg_map::get_base_addr(uvm_hier_e hier=UVM_HIER);
  uvm_reg_map child = this;
  if (hier == UVM_NO_HIER || m_parent_map == null)
    return m_base_addr;
  get_base_addr = m_parent_map.get_submap_offset(this);
  get_base_addr += m_parent_map.get_base_addr(UVM_HIER);
endfunction


// get_n_bytes

function int unsigned uvm_reg_map::get_n_bytes(uvm_hier_e hier=UVM_HIER);
  if (hier == UVM_NO_HIER)
    return m_n_bytes;
  return m_system_n_bytes;
endfunction


// get_addr_unit_bytes

function int unsigned uvm_reg_map::get_addr_unit_bytes();
   return (m_byte_addressing) ? 1 : m_n_bytes;
endfunction


// get_endian

function uvm_endianness_e uvm_reg_map::get_endian(uvm_hier_e hier=UVM_HIER);
  if (hier == UVM_NO_HIER || m_parent_map == null)
    return m_endian;
  return m_parent_map.get_endian(hier);
endfunction


// get_sequencer

function uvm_sequencer_base uvm_reg_map::get_sequencer(uvm_hier_e hier=UVM_HIER);
  if (hier == UVM_NO_HIER || m_parent_map == null)
    return m_sequencer;
  return m_parent_map.get_sequencer(hier);
endfunction


// get_adapter

function uvm_reg_adapter uvm_reg_map::get_adapter(uvm_hier_e hier=UVM_HIER);
  if (hier == UVM_NO_HIER || m_parent_map == null)
    return m_adapter;
  return m_parent_map.get_adapter(hier);
endfunction


// get_submaps

function void uvm_reg_map::get_submaps(ref uvm_reg_map maps[$], input uvm_hier_e hier=UVM_HIER);

   foreach (m_submaps[submap])
     maps.push_back(submap);

   
   if (hier == UVM_HIER)
     foreach (m_submaps[submap_]) begin
       uvm_reg_map submap=submap_;
       submap.get_submaps(maps);
     end
endfunction


// get_registers

function void uvm_reg_map::get_registers(ref uvm_reg regs[$], input uvm_hier_e hier=UVM_HIER);

  foreach (m_regs_info[rg])
    regs.push_back(rg);

  if (hier == UVM_HIER)
    foreach (m_submaps[submap_]) begin
      uvm_reg_map submap=submap_;
      submap.get_registers(regs);
    end

endfunction


// get_fields

function void uvm_reg_map::get_fields(ref uvm_reg_field fields[$], input uvm_hier_e hier=UVM_HIER);

   foreach (m_regs_info[rg_]) begin
     uvm_reg rg = rg_;
     rg.get_fields(fields);
   end
   
   if (hier == UVM_HIER)
     foreach (this.m_submaps[submap_]) begin
       uvm_reg_map submap=submap_;
       submap.get_fields(fields);
     end

endfunction


// get_memories

function void uvm_reg_map::get_memories(ref uvm_mem mems[$], input uvm_hier_e hier=UVM_HIER);

   foreach (m_mems_info[mem])
     mems.push_back(mem);
    
   if (hier == UVM_HIER)
     foreach (m_submaps[submap_]) begin
       uvm_reg_map submap=submap_;
       submap.get_memories(mems);
     end

endfunction


// get_virtual_registers

function void uvm_reg_map::get_virtual_registers(ref uvm_vreg regs[$], input uvm_hier_e hier=UVM_HIER);

  uvm_mem mems[$];
  get_memories(mems,hier);

  foreach (mems[i])
    mems[i].get_virtual_registers(regs);

endfunction


// get_virtual_fields

function void uvm_reg_map::get_virtual_fields(ref uvm_vreg_field fields[$], input uvm_hier_e hier=UVM_HIER);

   uvm_vreg regs[$];
   get_virtual_registers(regs,hier);

   foreach (regs[i])
       regs[i].get_fields(fields);

endfunction



// get_full_name

function string uvm_reg_map::get_full_name();

   get_full_name = get_name();

   if (m_parent == null)
     return get_full_name;

   return {m_parent.get_full_name(), ".", get_full_name};

endfunction: get_full_name


// get_mem_map_info

function uvm_reg_map_info uvm_reg_map::get_mem_map_info(uvm_mem mem, bit error=1);
  if (!m_mems_info.exists(mem)) begin
    if (error)
      `uvm_error("REG_NO_MAP",{"Memory '",mem.get_name(),"' not in map '",get_name(),"'"})
    return null;
  end
  return m_mems_info[mem];
endfunction


// get_reg_map_info

function uvm_reg_map_info uvm_reg_map::get_reg_map_info(uvm_reg rg, bit error=1);
  uvm_reg_map_info result;
  if (!m_regs_info.exists(rg)) begin
    if (error)
      `uvm_error("REG_NO_MAP",{"Register '",rg.get_name(),"' not in map '",get_name(),"'"})
    return null;
  end
  result = m_regs_info[rg];
  if(!result.is_initialized)
    `uvm_warning("RegModel",{"map '",get_name(),"' does not seem to be initialized correctly, check that the top register model is locked()"})
    
  return result;
endfunction


//----------
// Size and Overlap Detection
//---------

// set_base_addr

function void uvm_reg_map::set_base_addr(uvm_reg_addr_t offset);
   if (m_parent_map != null) begin
      m_parent_map.set_submap_offset(this, offset);
   end
   else begin
      m_base_addr = offset;
      if (m_parent.is_locked()) begin
         uvm_reg_map top_map = get_root_map();
         top_map.Xinit_address_mapX();
      end
   end
endfunction


// get_size

function int unsigned uvm_reg_map::get_size();

  int unsigned max_addr;
  int unsigned addr;

  // get max offset from registers
  foreach (m_regs_info[rg_]) begin
    uvm_reg rg = rg_;
    addr = m_regs_info[rg].offset + ((rg.get_n_bytes()-1)/m_n_bytes);
    if (addr > max_addr) max_addr = addr;
  end

  // get max offset from memories
  foreach (m_mems_info[mem_]) begin
    uvm_mem mem = mem_;
    addr = m_mems_info[mem].offset + (mem.get_size() * (((mem.get_n_bytes()-1)/m_n_bytes)+1)) -1;
    if (addr > max_addr) max_addr = addr;
  end

  // get max offset from submaps
  foreach (m_submaps[submap_]) begin
    uvm_reg_map submap=submap_;
    addr = m_submaps[submap] + submap.get_size();
    if (addr > max_addr) max_addr = addr;
  end

  return max_addr + 1;

endfunction



function void uvm_reg_map::Xverify_map_configX();
   // Make sure there is a generic payload sequence for each map
   // in the model and vice-versa if this is a root sequencer
   bit error;
   uvm_reg_map root_map = get_root_map();

   if (root_map.get_adapter() == null) begin
      `uvm_error("RegModel", {"Map '",root_map.get_full_name(),
                 "' does not have an adapter registered"})
      error++;
   end
   if (root_map.get_sequencer() == null) begin
      `uvm_error("RegModel", {"Map '",root_map.get_full_name(),
                 "' does not have a sequencer registered"})
      error++;
   end
   if (error) begin
      `uvm_fatal("RegModel", {"Must register an adapter and sequencer ",
                 "for each top-level map in RegModel model"});
      return;
   end

endfunction



// get_physical_addresses

function int uvm_reg_map::get_physical_addresses(uvm_reg_addr_t     base_addr,
                                                 uvm_reg_addr_t     mem_offset,
                                                 int unsigned       n_bytes,
                                                 ref uvm_reg_addr_t addr[]);
   int bus_width = get_n_bytes(UVM_NO_HIER);
   uvm_reg_map  up_map;
   uvm_reg_addr_t  local_addr[];
   int multiplier = m_byte_addressing ? bus_width : 1;

   addr = new [0];
   
   if (n_bytes <= 0) begin
      `uvm_fatal("RegModel", $sformatf("Cannot access %0d bytes. Must be greater than 0",
                                     n_bytes));
      return 0;
   end

   // First, identify the addresses within the block/system
   if (n_bytes <= bus_width) begin
      local_addr = new [1];
      local_addr[0] = base_addr + (mem_offset * multiplier);
   end else begin
      int n;

      n = ((n_bytes-1) / bus_width) + 1;
      local_addr = new [n];
      
      base_addr = base_addr + mem_offset * (n * multiplier);

      case (get_endian(UVM_NO_HIER))
         UVM_LITTLE_ENDIAN: begin
            foreach (local_addr[i]) begin
               local_addr[i] = base_addr + (i * multiplier);
            end
         end
         UVM_BIG_ENDIAN: begin
            foreach (local_addr[i]) begin
               n--;
               local_addr[i] = base_addr + (n * multiplier);
            end
         end
         UVM_LITTLE_FIFO: begin
            foreach (local_addr[i]) begin
               local_addr[i] = base_addr;
            end
         end
         UVM_BIG_FIFO: begin
            foreach (local_addr[i]) begin
               local_addr[i] = base_addr;
            end
         end
         default: begin
            `uvm_error("RegModel",
               {"Map has no specified endianness. ",
                $sformatf("Cannot access %0d bytes register via its %0d byte \"%s\" interface",
               n_bytes, bus_width, get_full_name())})
         end
      endcase
   end

  up_map = get_parent_map();

   // Then translate these addresses in the parent's space
   if (up_map == null) begin
      // This is the top-most system/block!
      addr = new [local_addr.size()] (local_addr);
      foreach (addr[i]) begin
         addr[i] += m_base_addr;
      end
   end else begin
      uvm_reg_addr_t  sys_addr[];
      uvm_reg_addr_t  base_addr;
      int w, k;

      // Scale the consecutive local address in the system's granularity
      if (bus_width < up_map.get_n_bytes(UVM_NO_HIER))
        k = 1;
      else
        k = ((bus_width-1) / up_map.get_n_bytes(UVM_NO_HIER)) + 1;

      base_addr = up_map.get_submap_offset(this);
      foreach (local_addr[i]) begin
         int n = addr.size();
         
         w = up_map.get_physical_addresses(base_addr + local_addr[i] * k,
                                           0,
                                           bus_width,
                                           sys_addr);

         addr = new [n + sys_addr.size()] (addr);
         foreach (sys_addr[j]) begin
            addr[n+j] = sys_addr[j];
         end
      end
      // The width of each access is the minimum of this block or the system's width
      if (w < bus_width)
         bus_width = w;
   end

   return bus_width;

endfunction: get_physical_addresses


//--------------
// Get-By-Offset
//--------------


// set_submap_offset

function void uvm_reg_map::set_submap_offset(uvm_reg_map submap, uvm_reg_addr_t offset);
  if (submap == null) begin
    `uvm_error("REG/NULL","set_submap_offset: submap handle is null")
    return;
  end
  m_submaps[submap] = offset;
  if (m_parent.is_locked()) begin
    uvm_reg_map root_map = get_root_map();
    root_map.Xinit_address_mapX();
  end
endfunction


// get_submap_offset

function uvm_reg_addr_t uvm_reg_map::get_submap_offset(uvm_reg_map submap);
  if (submap == null) begin
    `uvm_error("REG/NULL","set_submap_offset: submap handle is null")
    return -1;
  end
  if (!m_submaps.exists(submap)) begin
    `uvm_error("RegModel",{"Map '",submap.get_full_name(),
                      "' is not a submap of '",get_full_name(),"'"})
    return -1;
  end
  return m_submaps[submap];
endfunction


// get_reg_by_offset

function uvm_reg uvm_reg_map::get_reg_by_offset(uvm_reg_addr_t offset,
                                                bit            read = 1);
   if (!m_parent.is_locked()) begin
      `uvm_error("RegModel", $sformatf("Cannot get register by offset: Block %s is not locked.", m_parent.get_full_name()));
      return null;
   end

   if (!read && m_regs_by_offset_wo.exists(offset))
     return m_regs_by_offset_wo[offset];
   
   if (m_regs_by_offset.exists(offset))
     return m_regs_by_offset[offset];

   return null;
endfunction


// get_mem_by_offset

function uvm_mem uvm_reg_map::get_mem_by_offset(uvm_reg_addr_t offset);
   if (!m_parent.is_locked()) begin
      `uvm_error("RegModel", $sformatf("Cannot memory register by offset: Block %s is not locked.", m_parent.get_full_name()));
      return null;
   end

   foreach (m_mems_by_offset[range]) begin
      if (range.min <= offset && offset <= range.max) begin
         return m_mems_by_offset[range];
      end
   end
   
   return null;
endfunction


// Xinit_address_mapX

function void uvm_reg_map::Xinit_address_mapX();

   int unsigned bus_width;

   uvm_reg_map top_map = get_root_map();

   if (this == top_map) begin
     top_map.m_regs_by_offset.delete();
     top_map.m_regs_by_offset_wo.delete();
     top_map.m_mems_by_offset.delete();
   end

   foreach (m_submaps[l]) begin
     uvm_reg_map map=l;
     map.Xinit_address_mapX();
   end

   foreach (m_regs_info[rg_]) begin
     uvm_reg rg = rg_;
     m_regs_info[rg].is_initialized=1;
     if (!m_regs_info[rg].unmapped) begin
        string rg_acc = rg.Xget_fields_accessX(this);
       uvm_reg_addr_t addrs[];
        
       bus_width = get_physical_addresses(m_regs_info[rg].offset,0,rg.get_n_bytes(),addrs);
        
       foreach (addrs[i]) begin
         uvm_reg_addr_t addr = addrs[i];

         if (top_map.m_regs_by_offset.exists(addr)) begin

            uvm_reg rg2 = top_map.m_regs_by_offset[addr];
            string rg2_acc = rg2.Xget_fields_accessX(this);
            
            // If the register at the same address is RO or WO
            // and this register is WO or RO, this is OK
            if (rg_acc == "RO" && rg2_acc == "WO") begin
               top_map.m_regs_by_offset[addr]    = rg;
               uvm_reg_read_only_cbs::add(rg);
               top_map.m_regs_by_offset_wo[addr] = rg2;
               uvm_reg_write_only_cbs::add(rg2);
            end
            else if (rg_acc == "WO" && rg2_acc == "RO") begin
               top_map.m_regs_by_offset_wo[addr] = rg;
               uvm_reg_write_only_cbs::add(rg);
               uvm_reg_read_only_cbs::add(rg2);
            end
            else begin
               string a;
               a = $sformatf("%0h",addr);
               `uvm_warning("RegModel", {"In map '",get_full_name(),"' register '",
                                         rg.get_full_name(), "' maps to same address as register '",
                                         top_map.m_regs_by_offset[addr].get_full_name(),"': 'h",a})
            end
         end
         else
            top_map.m_regs_by_offset[addr] = rg;
          
         foreach (top_map.m_mems_by_offset[range]) begin
           if (addr >= range.min && addr <= range.max) begin
             string a,b;
             a = $sformatf("%0h",addr);
             b = $sformatf("[%0h:%0h]",range.min,range.max);
             `uvm_warning("RegModel", {"In map '",get_full_name(),"' register '",
                 rg.get_full_name(), "' with address ",a,
                 "maps to same address as memory '",
                 top_map.m_mems_by_offset[range].get_full_name(),"': ",b})
             end
         end
       end
       m_regs_info[rg].addr = addrs;
     end
   end

   foreach (m_mems_info[mem_]) begin
     uvm_mem mem = mem_;
     if (!m_mems_info[mem].unmapped) begin

       uvm_reg_addr_t addrs[],addrs_max[];
       uvm_reg_addr_t min, max, min2, max2;
       int unsigned stride;

       bus_width = get_physical_addresses(m_mems_info[mem].offset,0,mem.get_n_bytes(),addrs);
       min = (addrs[0] < addrs[addrs.size()-1]) ? addrs[0] : addrs[addrs.size()-1];
       min2 = addrs[0];

       void'(get_physical_addresses(m_mems_info[mem].offset,(mem.get_size()-1),mem.get_n_bytes(),addrs_max));
       max = (addrs_max[0] > addrs_max[addrs_max.size()-1]) ? addrs_max[0] : addrs_max[addrs_max.size()-1];
       max2 = addrs_max[0];
       // address interval between consecutive mem offsets
       stride = (max2 - min2)/(mem.get_size()-1);

       foreach (top_map.m_regs_by_offset[reg_addr]) begin
         if (reg_addr >= min && reg_addr <= max) begin
           string a;
           a = $sformatf("%0h",reg_addr);
           `uvm_warning("RegModel", {"In map '",get_full_name(),"' memory '",
               mem.get_full_name(), "' maps to same address as register '",
               top_map.m_regs_by_offset[reg_addr].get_full_name(),"': 'h",a})
         end
       end

       foreach (top_map.m_mems_by_offset[range]) begin
         if (min <= range.max && max >= range.max ||
             min <= range.min && max >= range.min ||
             min >= range.min && max <= range.max) begin
           string a;
           a = $sformatf("[%0h:%0h]",min,max);
           `uvm_warning("RegModel", {"In map '",get_full_name(),"' memory '",
               mem.get_full_name(), "' overlaps with address range of memory '",
               top_map.m_mems_by_offset[range].get_full_name(),"': 'h",a})
           end
       end

       begin
         uvm_reg_map_addr_range range = '{ min, max, stride };
         top_map.m_mems_by_offset[ range ] = mem;
         m_mems_info[mem].addr  = addrs;
         m_mems_info[mem].mem_range = range;
       end
     end
   end

   // If the block has no registers or memories,
   // bus_width won't be set
   if (bus_width == 0) bus_width = m_n_bytes;

   m_system_n_bytes = bus_width;
endfunction


//-----------
// Bus Access
//-----------

function void uvm_reg_map::Xget_bus_infoX(uvm_reg_item rw,
                                          output uvm_reg_map_info map_info,
                                          output int size,
                                          output int lsb,
                                          output int addr_skip);

  if (rw.element_kind == UVM_MEM) begin
    uvm_mem mem;
    if(rw.element == null || !$cast(mem,rw.element))
      `uvm_fatal("REG/CAST", {"uvm_reg_item 'element_kind' is UVM_MEM, ",
                 "but 'element' does not point to a memory: ",rw.get_name()})
    map_info = get_mem_map_info(mem);
    size = mem.get_n_bits();
  end
  else if (rw.element_kind == UVM_REG) begin
    uvm_reg rg;
    if(rw.element == null || !$cast(rg,rw.element))
      `uvm_fatal("REG/CAST", {"uvm_reg_item 'element_kind' is UVM_REG, ",
                 "but 'element' does not point to a register: ",rw.get_name()})
    map_info = get_reg_map_info(rg);
    size = rg.get_n_bits();
  end
  else if (rw.element_kind == UVM_FIELD) begin
    uvm_reg_field field;
    if(rw.element == null || !$cast(field,rw.element))
      `uvm_fatal("REG/CAST", {"uvm_reg_item 'element_kind' is UVM_FIELD, ",
                 "but 'element' does not point to a field: ",rw.get_name()})
    map_info = get_reg_map_info(field.get_parent());
    size = field.get_n_bits();
    lsb = field.get_lsb_pos();
    addr_skip = lsb/(get_n_bytes()*8);
  end
endfunction




// do_write(uvm_reg_item rw)

task uvm_reg_map::do_write(uvm_reg_item rw);

  uvm_sequence_base tmp_parent_seq;
  uvm_reg_map system_map = get_root_map();
  uvm_reg_adapter adapter = system_map.get_adapter();
  uvm_sequencer_base sequencer = system_map.get_sequencer();

  if (adapter != null && adapter.parent_sequence != null) begin
    uvm_object o;
    uvm_sequence_base seq;
    o = adapter.parent_sequence.clone();
    assert($cast(seq,o));
    seq.set_parent_sequence(rw.parent);
    rw.parent = seq;
    tmp_parent_seq = seq;
  end

  if (rw.parent == null) begin
     rw.parent = new("default_parent_seq");
     tmp_parent_seq = rw.parent;
  end

  if (adapter == null) begin
    rw.set_sequencer(sequencer);
    rw.parent.start_item(rw,rw.prior);
    rw.parent.finish_item(rw);
    rw.end_event.wait_on();
  end
  else begin
    do_bus_write(rw, sequencer, adapter);
  end

  if (tmp_parent_seq != null)
    sequencer.m_sequence_exiting(tmp_parent_seq);

endtask


// do_read(uvm_reg_item rw)

task uvm_reg_map::do_read(uvm_reg_item rw);

  uvm_sequence_base tmp_parent_seq;
  uvm_reg_map system_map = get_root_map();
  uvm_reg_adapter adapter = system_map.get_adapter();
  uvm_sequencer_base sequencer = system_map.get_sequencer();

  if (adapter != null && adapter.parent_sequence != null) begin
    uvm_object o;
    uvm_sequence_base seq;
    o = adapter.parent_sequence.clone();
    assert($cast(seq,o));
    seq.set_parent_sequence(rw.parent);
    rw.parent = seq;
    tmp_parent_seq = seq;
  end

  if (rw.parent == null) begin
    rw.parent = new("default_parent_seq");
    tmp_parent_seq = rw.parent;
  end

  if (adapter == null) begin
    rw.set_sequencer(sequencer);
    rw.parent.start_item(rw,rw.prior);
    rw.parent.finish_item(rw);
    rw.end_event.wait_on();
  end
  else begin
    do_bus_read(rw, sequencer, adapter);
  end

  if (tmp_parent_seq != null)
    sequencer.m_sequence_exiting(tmp_parent_seq);

endtask


// do_bus_write

task uvm_reg_map::do_bus_write (uvm_reg_item rw,
                                uvm_sequencer_base sequencer,
                                uvm_reg_adapter adapter);

  uvm_reg_addr_t     addrs[$];
  uvm_reg_map        system_map = get_root_map();
  int unsigned       bus_width  = get_n_bytes();
  uvm_reg_byte_en_t  byte_en    = -1;
  uvm_reg_map_info   map_info;
  int                n_bits;
  int                lsb;
  int                skip;
  int unsigned       curr_byte;
  int                n_access_extra, n_access;
  int               n_bits_init;
  uvm_reg_bus_op    accesses[$];

  Xget_bus_infoX(rw, map_info, n_bits_init, lsb, skip);
  addrs=map_info.addr;

  // if a memory, adjust addresses based on offset
  if (rw.element_kind == UVM_MEM)
    foreach (addrs[i])
      addrs[i] = addrs[i] + map_info.mem_range.stride * rw.offset;

  foreach (rw.value[val_idx]) begin: foreach_value

     uvm_reg_data_t value = rw.value[val_idx];

    /* calculate byte_enables */
    if (rw.element_kind == UVM_FIELD) begin
      int temp_be;
      int idx;
      n_access_extra = lsb%(bus_width*8);                
      n_access = n_access_extra + n_bits_init;
      temp_be = n_access_extra;
      value = value << n_access_extra;
      while(temp_be >= 8) begin
         byte_en[idx++] = 0;
         temp_be -= 8;
      end                        
      temp_be += n_bits_init;
      while(temp_be > 0) begin
         byte_en[idx++] = 1;
         temp_be -= 8;
      end
      byte_en &= (1<<idx)-1;
      for (int i=0; i<skip; i++)
        void'(addrs.pop_front());
      while (addrs.size() > (n_bits_init/(bus_width*8) + 1))
        void'(addrs.pop_back());
    end
    curr_byte=0;
    n_bits= n_bits_init;     
              
    accesses.delete();         
    foreach(addrs[i]) begin: foreach_addr
      uvm_reg_bus_op rw_access;
      uvm_reg_data_t data;

      data = (value >> (curr_byte*8)) & ((1'b1 << (bus_width * 8))-1);
       
      `uvm_info(get_type_name(),
         $sformatf("Writing 'h%0h at 'h%0h via map \"%s\"...",
              data, addrs[i], rw.map.get_full_name()), UVM_FULL);

      if (rw.element_kind == UVM_FIELD) begin
        for (int z=0;z<bus_width;z++)
          rw_access.byte_en[z] = byte_en[curr_byte+z];
      end
                
      rw_access.kind    = rw.kind;
      rw_access.addr    = addrs[i];
      rw_access.data    = data;
      rw_access.n_bits  = (n_bits > bus_width*8) ? bus_width*8 : n_bits;
      rw_access.byte_en = byte_en;

      accesses.push_back(rw_access); 

      curr_byte += bus_width;
      n_bits -= bus_width * 8;

    end: foreach_addr
    
    // if set utilizy the order policy
    if(policy!=null)
        policy.order(accesses);
    
    // perform accesses
    foreach(accesses[i]) begin     
      uvm_reg_bus_op rw_access=accesses[i];  
      uvm_sequence_item bus_req;
        
      adapter.m_set_item(rw);
      bus_req = adapter.reg2bus(rw_access);
      adapter.m_set_item(null);
      
      if (bus_req == null)
        `uvm_fatal("RegMem",{"adapter [",adapter.get_name(),"] didnt return a bus transaction"});
      
      bus_req.set_sequencer(sequencer);
      rw.parent.start_item(bus_req,rw.prior);

      if (rw.parent != null && i == 0)
        rw.parent.mid_do(rw);

      rw.parent.finish_item(bus_req);
      bus_req.end_event.wait_on();

      if (adapter.provides_responses) begin
        uvm_sequence_item bus_rsp;
        uvm_access_e op;
        // TODO: need to test for right trans type, if not put back in q
        rw.parent.get_base_response(bus_rsp);
        adapter.bus2reg(bus_rsp,rw_access);
      end
      else begin
        adapter.bus2reg(bus_req,rw_access);
      end

      if (rw.parent != null && i == addrs.size()-1)
        rw.parent.post_do(rw);

      rw.status = rw_access.status;

      `uvm_info(get_type_name(),
         $sformatf("Wrote 'h%0h at 'h%0h via map \"%s\": %s...",
            rw_access.data, addrs[i], rw.map.get_full_name(), rw.status.name()), UVM_FULL)

      if (rw.status == UVM_NOT_OK)
         break;
        
    end

    foreach (addrs[i])
      addrs[i] = addrs[i] + map_info.mem_range.stride;

  end: foreach_value

endtask: do_bus_write


// do_bus_read

task uvm_reg_map::do_bus_read (uvm_reg_item rw,
                               uvm_sequencer_base sequencer,
                               uvm_reg_adapter adapter);

  uvm_reg_addr_t addrs[$];
  uvm_reg_map        system_map = get_root_map();
  int unsigned       bus_width  = get_n_bytes();
  uvm_reg_byte_en_t  byte_en    = -1;
  uvm_reg_map_info   map_info;
  int                size, n_bits;
  int                skip;
  int                lsb;
  int unsigned       curr_byte;
  int n_access_extra, n_access;
  uvm_reg_bus_op accesses[$];

  Xget_bus_infoX(rw, map_info, n_bits, lsb, skip);
  addrs=map_info.addr;
  size = n_bits;

  // if a memory, adjust addresses based on offset
  if (rw.element_kind == UVM_MEM)
    foreach (addrs[i])
      addrs[i] = addrs[i] + map_info.mem_range.stride * rw.offset;

  foreach (rw.value[val_idx]) begin: foreach_value

    /* calculate byte_enables */
    if (rw.element_kind == UVM_FIELD) begin
      int temp_be;
      int idx;
      n_access_extra = lsb%(bus_width*8);                
      n_access = n_access_extra + n_bits;
      temp_be = n_access_extra;
      while(temp_be >= 8) begin
         byte_en[idx++] = 0;
         temp_be -= 8;
      end                        
      temp_be += n_bits;
      while(temp_be > 0) begin
         byte_en[idx++] = 1;
         temp_be -= 8;
      end
      byte_en &= (1<<idx)-1;
      for (int i=0; i<skip; i++)
        void'(addrs.pop_front());
      while (addrs.size() > (n_bits/(bus_width*8) + 1))
        void'(addrs.pop_back());
    end
    curr_byte=0;
    rw.value[val_idx] = 0;
              
    accesses.delete();
    foreach (addrs[i]) begin
      uvm_reg_bus_op rw_access;
       
      `uvm_info(get_type_name(),
         $sformatf("Reading address 'h%0h via map \"%s\"...",
                   addrs[i], get_full_name()), UVM_FULL);
                
      if (rw.element_kind == UVM_FIELD)
        for (int z=0;z<bus_width;z++)
          rw_access.byte_en[z] = byte_en[curr_byte+z];

      rw_access.kind = rw.kind;
      rw_access.addr = addrs[i];
      rw_access.data = curr_byte;
      rw_access.byte_en = byte_en;
      rw_access.n_bits = (n_bits > bus_width*8) ? bus_width*8 : n_bits;
                          
       accesses.push_back(rw_access);

      curr_byte += bus_width;
      n_bits -= bus_width * 8;
    end
    
    // if set utilize the order policy
    if(policy!=null)
        policy.order(accesses);
        
    // perform accesses
    foreach(accesses[i]) begin     
      uvm_reg_bus_op rw_access=accesses[i];  
      uvm_sequence_item bus_req;
      uvm_reg_data_logic_t data;   
      int unsigned curr_byte_;   
            
      curr_byte_=rw_access.data;
      rw_access.data='0;
      adapter.m_set_item(rw);
      bus_req = adapter.reg2bus(rw_access);
      adapter.m_set_item(null);
      if (bus_req == null)
        `uvm_fatal("RegMem",{"adapter [",adapter.get_name(),"] didnt return a bus transaction"});

      bus_req.set_sequencer(sequencer);
      rw.parent.start_item(bus_req,rw.prior);

      if (rw.parent != null && i == 0) begin
        rw.parent.mid_do(rw);
      end

      rw.parent.finish_item(bus_req);
      bus_req.end_event.wait_on();

      if (adapter.provides_responses) begin
        uvm_sequence_item bus_rsp;
        uvm_access_e op;
        // TODO: need to test for right trans type, if not put back in q
        rw.parent.get_base_response(bus_rsp);
        adapter.bus2reg(bus_rsp,rw_access);
      end
      else begin
        adapter.bus2reg(bus_req,rw_access);
      end

      data = rw_access.data & ((1<<bus_width*8)-1); // mask the upper bits

      rw.status = rw_access.status;

      if (rw.status == UVM_IS_OK && (^data) === 1'bx)
        rw.status = UVM_HAS_X;
         
      `uvm_info(get_type_name(),
         $sformatf("Read 'h%0h at 'h%0h via map \"%s\": %s...", data,
                   addrs[i], get_full_name(), rw.status.name()), UVM_FULL);

      if (rw.status == UVM_NOT_OK)
         break;

      rw.value[val_idx] |= data << curr_byte_*8;

      if (rw.parent != null && i == addrs.size()-1)
        rw.parent.post_do(rw);
    end
    

    foreach (addrs[i])
      addrs[i] = addrs[i] + map_info.mem_range.stride;

    if (rw.element_kind == UVM_FIELD)
       rw.value[val_idx] = (rw.value[val_idx] >> (n_access_extra)) & ((1<<size)-1);
  end

endtask: do_bus_read



//-------------
// Standard Ops
//-------------

// do_print

function void uvm_reg_map::do_print (uvm_printer printer);
   uvm_reg  regs[$];
   uvm_vreg vregs[$];
   uvm_mem  mems[$];
   uvm_endianness_e endian;
   uvm_reg_map maps[$];
   string prefix;
   uvm_sequencer_base sqr=get_sequencer();
  
   super.do_print(printer);
//  printer.print_generic(get_name(), get_type_name(), -1, convert2string()); 

   endian = get_endian(UVM_NO_HIER);
//   $sformat(convert2string, "%s -- %0d bytes (%s)", convert2string,
//            get_n_bytes(UVM_NO_HIER), endian.name());
   
   printer.print_generic("endian","",-2,endian.name()); 
   if(sqr!=null)
    printer.print_generic("effective sequencer",sqr.get_type_name(),-2,sqr.get_full_name());     
             
   get_registers(regs,UVM_NO_HIER);
   foreach (regs[j]) 
        printer.print_generic(regs[j].get_name(), regs[j].get_type_name(),-2,$sformatf("@%0d +'h%0x",regs[j].get_inst_id(),regs[j].get_address(this)));
   
   
   get_memories(mems);
   foreach (mems[j]) 
        printer.print_generic(mems[j].get_name(), mems[j].get_type_name(),-2,$sformatf("@%0d +'h%0x",mems[j].get_inst_id(),mems[j].get_address(0,this)));
   
   get_virtual_registers(vregs);
   foreach (vregs[j]) 
        printer.print_generic(vregs[j].get_name(), vregs[j].get_type_name(),-2,$sformatf("@%0d +'h%0x",vregs[j].get_inst_id(),vregs[j].get_address(0,this)));
    
   get_submaps(maps);
   foreach (maps[j]) 
        printer.print_object(maps[j].get_name(),maps[j]);
endfunction

// convert2string

function string uvm_reg_map::convert2string();
   uvm_reg  regs[$];
   uvm_vreg vregs[$];
   uvm_mem  mems[$];
   uvm_endianness_e endian;
   string prefix;

   $sformat(convert2string, "%sMap %s", prefix, get_full_name());
   endian = get_endian(UVM_NO_HIER);
   $sformat(convert2string, "%s -- %0d bytes (%s)", convert2string,
            get_n_bytes(UVM_NO_HIER), endian.name());
   get_registers(regs);
   foreach (regs[j]) begin
      $sformat(convert2string, "%s\n%s", convert2string,
               regs[j].convert2string());//{prefix, "   "}, this));
   end
   get_memories(mems);
   foreach (mems[j]) begin
      $sformat(convert2string, "%s\n%s", convert2string,
               mems[j].convert2string());//{prefix, "   "}, this));
   end
   get_virtual_registers(vregs);
   foreach (vregs[j]) begin
      $sformat(convert2string, "%s\n%s", convert2string,
               vregs[j].convert2string());//{prefix, "   "}, this));
   end
endfunction


// clone

function uvm_object uvm_reg_map::clone();
  //uvm_rap_map me;
  //me = new this;
  //return me;
  return null;
endfunction


// do_copy

function void uvm_reg_map::do_copy (uvm_object rhs);
  //uvm_reg_map rhs_;
  //assert($cast(rhs_,rhs));

  //rhs_.regs = regs;
  //rhs_.mems = mems;
  //rhs_.vregs = vregs;
  //rhs_.blks = blks;
  //... and so on
endfunction


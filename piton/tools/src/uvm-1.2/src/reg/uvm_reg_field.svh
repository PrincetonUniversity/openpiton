//
// -------------------------------------------------------------
//    Copyright 2004-2009 Synopsys, Inc.
//    Copyright 2010-2011 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
//    Copyright 2013 Semifore, Inc.
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

typedef class uvm_reg_cbs;


//-----------------------------------------------------------------
// CLASS: uvm_reg_field
// Field abstraction class
//
// A field represents a set of bits that behave consistently
// as a single entity.
//
// A field is contained within a single register, but may
// have different access policies depending on the address map
// use the access the register (thus the field).
//-----------------------------------------------------------------
class uvm_reg_field extends uvm_object;

   // Variable: value
   // Mirrored field value.
   // This value can be sampled in a functional coverage model
   // or constrained when randomized.
   rand  uvm_reg_data_t  value; // Mirrored after randomize()

   local uvm_reg_data_t  m_mirrored; // What we think is in the HW
   local uvm_reg_data_t  m_desired;  // Mirrored after set()
   local string          m_access;
   local uvm_reg         m_parent;
   local int unsigned    m_lsb;
   local int unsigned    m_size;
   local bit             m_volatile;
   local uvm_reg_data_t  m_reset[string];
   local bit             m_written;
   local bit             m_read_in_progress;
   local bit             m_write_in_progress;
   local string          m_fname;
   local int             m_lineno;
   local int             m_cover_on;
   local bit             m_individually_accessible;
   local uvm_check_e     m_check;

   local static int m_max_size;
   local static bit m_policy_names[string];

   constraint uvm_reg_field_valid {
      if (`UVM_REG_DATA_WIDTH > m_size) {
         value < (`UVM_REG_DATA_WIDTH'h1 << m_size);
      }
   }

   `uvm_object_utils(uvm_reg_field)

   //----------------------
   // Group: Initialization
   //----------------------

   // Function: new
   //
   // Create a new field instance
   //
   // This method should not be used directly.
   // The ~uvm_reg_field::type_id::create()~ factory method
   // should be used instead.
   //
   extern function new(string name = "uvm_reg_field");


   // Function: configure
   //
   // Instance-specific configuration
   //
   // Specify the ~parent~ register of this field, its
   // ~size~ in bits, the position of its least-significant bit
   // within the register relative to the least-significant bit
   // of the register, its ~access~ policy, volatility,
   // "HARD" ~reset~ value, 
   // whether the field value is actually reset
   // (the ~reset~ value is ignored if ~FALSE~),
   // whether the field value may be randomized and
   // whether the field is the only one to occupy a byte lane in the register.
   //
   // See <set_access> for a specification of the pre-defined
   // field access policies.
   //
   // If the field access policy is a pre-defined policy and NOT one of
   // "RW", "WRC", "WRS", "WO", "W1", or "WO1",
   // the value of ~is_rand~ is ignored and the rand_mode() for the
   // field instance is turned off since it cannot be written.
   //
   extern function void configure(uvm_reg        parent,
                                  int unsigned   size,
                                  int unsigned   lsb_pos,
                                  string         access,
                                  bit            volatile,
                                  uvm_reg_data_t reset,
                                  bit            has_reset,
                                  bit            is_rand,
                                  bit            individually_accessible); 


   //---------------------
   // Group: Introspection
   //---------------------

   // Function: get_name
   //
   // Get the simple name
   //
   // Return the simple object name of this field
   //


   // Function: get_full_name
   //
   // Get the hierarchical name
   //
   // Return the hierarchal name of this field
   // The base of the hierarchical name is the root block.
   //
   extern virtual function string get_full_name();


   // Function: get_parent
   //
   // Get the parent register
   //
   extern virtual function uvm_reg get_parent();
   extern virtual function uvm_reg get_register();


   // Function: get_lsb_pos
   //
   // Return the position of the field
   //
   // Returns the index of the least significant bit of the field
   // in the register that instantiates it.
   // An offset of 0 indicates a field that is aligned with the
   // least-significant bit of the register. 
   //
   extern virtual function int unsigned get_lsb_pos();


   // Function: get_n_bits
   //
   // Returns the width, in number of bits, of the field. 
   //
   extern virtual function int unsigned get_n_bits();

   //
   // FUNCTION: get_max_size
   // Returns the width, in number of bits, of the largest field. 
   //
   extern static function int unsigned get_max_size();


   // Function: set_access
   //
   // Modify the access policy of the field
   //
   // Modify the access policy of the field to the specified one and
   // return the previous access policy.
   //
   // The pre-defined access policies are as follows.
   // The effect of a read operation are applied after the current
   // value of the field is sampled.
   // The read operation will return the current value,
   // not the value affected by the read operation (if any).
   //
   // "RO"       - W: no effect, R: no effect
   // "RW"       - W: as-is, R: no effect
   // "RC"       - W: no effect, R: clears all bits
   // "RS"       - W: no effect, R: sets all bits
   // "WRC"      - W: as-is, R: clears all bits
   // "WRS"      - W: as-is, R: sets all bits
   // "WC"       - W: clears all bits, R: no effect
   // "WS"       - W: sets all bits, R: no effect
   // "WSRC"     - W: sets all bits, R: clears all bits
   // "WCRS"     - W: clears all bits, R: sets all bits
   // "W1C"      - W: 1/0 clears/no effect on matching bit, R: no effect
   // "W1S"      - W: 1/0 sets/no effect on matching bit, R: no effect
   // "W1T"      - W: 1/0 toggles/no effect on matching bit, R: no effect
   // "W0C"      - W: 1/0 no effect on/clears matching bit, R: no effect
   // "W0S"      - W: 1/0 no effect on/sets matching bit, R: no effect
   // "W0T"      - W: 1/0 no effect on/toggles matching bit, R: no effect
   // "W1SRC"    - W: 1/0 sets/no effect on matching bit, R: clears all bits
   // "W1CRS"    - W: 1/0 clears/no effect on matching bit, R: sets all bits
   // "W0SRC"    - W: 1/0 no effect on/sets matching bit, R: clears all bits
   // "W0CRS"    - W: 1/0 no effect on/clears matching bit, R: sets all bits
   // "WO"       - W: as-is, R: error
   // "WOC"      - W: clears all bits, R: error
   // "WOS"      - W: sets all bits, R: error
   // "W1"       - W: first one after ~HARD~ reset is as-is, other W have no effects, R: no effect
   // "WO1"      - W: first one after ~HARD~ reset is as-is, other W have no effects, R: error
   // "NOACCESS" - W: no effect, R: no effect
   //
   // It is important to remember that modifying the access of a field
   // will make the register model diverge from the specification
   // that was used to create it.
   //
   extern virtual function string set_access(string mode);


   // Function: define_access
   //
   // Define a new access policy value
   //
   // Because field access policies are specified using string values,
   // there is no way for SystemVerilog to verify if a specific access
   // value is valid or not.
   // To help catch typing errors, user-defined access values
   // must be defined using this method to avoid begin reported as an
   // invalid access policy.
   //
   // The name of field access policies are always converted to all uppercase.
   //
   // Returns TRUE if the new access policy was not previously
   // defined.
   // Returns FALSE otherwise but does not issue an error message.
   //
   extern static function bit define_access(string name);
   local static bit m_predefined = m_predefine_policies();
   extern local static function bit m_predefine_policies();
 
   // Function: get_access
   //
   // Get the access policy of the field
   //
   // Returns the current access policy of the field
   // when written and read through the specified address ~map~.
   // If the register containing the field is mapped in multiple
   // address map, an address map must be specified.
   // The access policy of a field from a specific
   // address map may be restricted by the register's access policy in that
   // address map.
   // For example, a RW field may only be writable through one of
   // the address maps and read-only through all of the other maps.
   // If the field access contradicts the map's access value
   // (field access of WO, and map access value of RO, etc), the
   // method's return value is NOACCESS.

   extern virtual function string get_access(uvm_reg_map map = null);


   // Function: is_known_access
   //
   // Check if access policy is a built-in one.
   //
   // Returns TRUE if the current access policy of the field,
   // when written and read through the specified address ~map~,
   // is a built-in access policy.
   //
   extern virtual function bit is_known_access(uvm_reg_map map = null);

   //
   // Function: set_volatility
   // Modify the volatility of the field to the specified one.
   //
   // It is important to remember that modifying the volatility of a field
   // will make the register model diverge from the specification
   // that was used to create it.
   //
   extern virtual function void set_volatility(bit volatile);

   //
   // Function: is_volatile
   // Indicates if the field value is volatile
   //
   // UVM uses the IEEE 1685-2009 IP-XACT definition of "volatility".
   // If TRUE, the value of the register is not predictable because it
   // may change between consecutive accesses.
   // This typically indicates a field whose value is updated by the DUT.
   // The nature or cause of the change is not specified.
   // If FALSE, the value of the register is not modified between
   // consecutive accesses.
   //
   extern virtual function bit is_volatile();


   //--------------
   // Group: Access
   //--------------


   // Function: set
   //
   // Set the desired value for this field
   //
   // It sets the desired value of the field to the specified ~value~
   // modified by the field access policy.
   // It does not actually set the value of the field in the design,
   // only the desired value in the abstraction class.
   // Use the <uvm_reg::update()> method to update the actual register
   // with the desired value or the <uvm_reg_field::write()> method
   // to actually write the field and update its mirrored value.
   //
   // The final desired value in the mirror is a function of the field access
   // policy and the set value, just like a normal physical write operation
   // to the corresponding bits in the hardware.
   // As such, this method (when eventually followed by a call to
   // <uvm_reg::update()>)
   // is a zero-time functional replacement for the <uvm_reg_field::write()>
   // method.
   // For example, the desired value of a read-only field is not modified
   // by this method and the desired value of a write-once field can only
   // be set if the field has not yet been
   // written to using a physical (for example, front-door) write operation.
   //
   // Use the <uvm_reg_field::predict()> to modify the mirrored value of
   // the field.
   //
   extern virtual function void set(uvm_reg_data_t  value,
                                    string          fname = "",
                                    int             lineno = 0);

   // Function: get
   //
   // Return the desired value of the field
   //
   // It does not actually read the value
   // of the field in the design, only the desired value
   // in the abstraction class. Unless set to a different value
   // using the <uvm_reg_field::set()>, the desired value
   // and the mirrored value are identical.
   //
   // Use the <uvm_reg_field::read()> or <uvm_reg_field::peek()>
   // method to get the actual field value. 
   //
   // If the field is write-only, the desired/mirrored
   // value is the value last written and assumed
   // to reside in the bits implementing it.
   // Although a physical read operation would something different,
   // the returned value is the actual content.
   //
   extern virtual function uvm_reg_data_t get(string fname = "",
                                              int    lineno = 0);


   // Function: get_mirrored_value
   //
   // Return the mirrored value of the field
   //
   // It does not actually read the value of the field in the design, only the mirrored value
   // in the abstraction class. 
   //
   // If the field is write-only, the desired/mirrored
   // value is the value last written and assumed
   // to reside in the bits implementing it.
   // Although a physical read operation would something different,
   // the returned value is the actual content.
   //
   extern virtual function uvm_reg_data_t get_mirrored_value(string fname = "",
                                              int    lineno = 0);

   // Function: reset
   //
   // Reset the desired/mirrored value for this field.
   //
   // It sets the desired and mirror value of the field
   // to the reset event specified by ~kind~.
   // If the field does not have a reset value specified for the
   // specified reset ~kind~ the field is unchanged.
   //
   // It does not actually reset the value of the field in the design,
   // only the value mirrored in the field abstraction class.
   //
   // Write-once fields can be modified after
   // a "HARD" reset operation.
   //
   extern virtual function void reset(string kind = "HARD");


   // Function: get_reset
   //
   // Get the specified reset value for this field
   //
   // Return the reset value for this field
   // for the specified reset ~kind~.
   // Returns the current field value is no reset value has been
   // specified for the specified reset event.
   //
   extern virtual function uvm_reg_data_t get_reset(string kind = "HARD");


   // Function: has_reset
   //
   // Check if the field has a reset value specified
   //
   // Return TRUE if this field has a reset value specified
   // for the specified reset ~kind~.
   // If ~delete~ is TRUE, removes the reset value, if any.
   //
   extern virtual function bit has_reset(string kind = "HARD",
                                         bit    delete = 0);


   // Function: set_reset
   //
   // Specify or modify the reset value for this field
   //
   // Specify or modify the reset value for this field corresponding
   // to the cause specified by ~kind~.
   //
   extern virtual function void set_reset(uvm_reg_data_t value,
                                          string kind = "HARD");


   // Function: needs_update
   //
   // Check if the abstract model contains different desired and mirrored values.
   //
   // If a desired field value has been modified in the abstraction class
   // without actually updating the field in the DUT,
   // the state of the DUT (more specifically what the abstraction class
   // ~thinks~ the state of the DUT is) is outdated.
   // This method returns TRUE
   // if the state of the field in the DUT needs to be updated 
   // to match the desired value.
   // The mirror values or actual content of DUT field are not modified.
   // Use the <uvm_reg::update()> to actually update the DUT field.
   //
   extern virtual function bit needs_update();


   // Task: write
   //
   // Write the specified value in this field
   //
   // Write ~value~ in the DUT field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~. 
   // If the register containing this field is mapped in more
   //  than one address map, 
   // an address ~map~ must be
   // specified if a physical access is used (front-door access).
   // If a back-door access path is used, the effect of writing
   // the field through a physical access is mimicked. For
   // example, read-only bits in the field will not be written.
   //
   // The mirrored value will be updated using the <uvm_reg_field::predict()>
   // method.
   //
   // If a front-door access is used, and
   // if the field is the only field in a byte lane and
   // if the physical interface corresponding to the address map used
   // to access the field support byte-enabling,
   // then only the field is written.
   // Otherwise, the entire register containing the field is written,
   // and the mirrored values of the other fields in the same register
   // are used in a best-effort not to modify their value.
   //
   // If a backdoor access is used, a peek-modify-poke process is used.
   // in a best-effort not to modify the value of the other fields in the
   // register.
   //
   extern virtual task write (output uvm_status_e       status,
                              input  uvm_reg_data_t     value,
                              input  uvm_path_e         path = UVM_DEFAULT_PATH,
                              input  uvm_reg_map        map = null,
                              input  uvm_sequence_base  parent = null,
                              input  int                prior = -1,
                              input  uvm_object         extension = null,
                              input  string             fname = "",
                              input  int                lineno = 0);


   // Task: read
   //
   // Read the current value from this field
   //
   // Read and return ~value~ from the DUT field that corresponds to this
   // abstraction class instance using the specified access
   // ~path~. 
   // If the register containing this field is mapped in more
   // than one address map, an address ~map~ must be
   // specified if a physical access is used (front-door access).
   // If a back-door access path is used, the effect of reading
   // the field through a physical access is mimicked. For
   // example, clear-on-read bits in the field will be set to zero.
   //
   // The mirrored value will be updated using the <uvm_reg_field::predict()>
   // method.
   //
   // If a front-door access is used, and
   // if the field is the only field in a byte lane and
   // if the physical interface corresponding to the address map used
   // to access the field support byte-enabling,
   // then only the field is read.
   // Otherwise, the entire register containing the field is read,
   // and the mirrored values of the other fields in the same register
   // are updated.
   //
   // If a backdoor access is used, the entire containing register is peeked
   // and the mirrored value of the other fields in the register is updated.
   //
   extern virtual task read  (output uvm_status_e       status,
                              output uvm_reg_data_t     value,
                              input  uvm_path_e         path = UVM_DEFAULT_PATH,
                              input  uvm_reg_map        map = null,
                              input  uvm_sequence_base  parent = null,
                              input  int                prior = -1,
                              input  uvm_object         extension = null,
                              input  string             fname = "",
                              input  int                lineno = 0);
               

   // Task: poke
   //
   // Deposit the specified value in this field
   //
   // Deposit the value in the DUT field corresponding to this
   // abstraction class instance, as-is, using a back-door access.
   // A peek-modify-poke process is used
   // in a best-effort not to modify the value of the other fields in the
   // register.
   //
   // The mirrored value will be updated using the <uvm_reg_field::predict()>
   // method.
   //
   extern virtual task poke  (output uvm_status_e       status,
                              input  uvm_reg_data_t     value,
                              input  string             kind = "",
                              input  uvm_sequence_base  parent = null,
                              input  uvm_object         extension = null,
                              input  string             fname = "",
                              input  int                lineno = 0);


   // Task: peek
   //
   // Read the current value from this field
   //
   // Sample the value in the DUT field corresponding to this
   // abstraction class instance using a back-door access.
   // The field value is sampled, not modified.
   //
   // Uses the HDL path for the design abstraction specified by ~kind~.
   //
   // The entire containing register is peeked
   // and the mirrored value of the other fields in the register
   // are updated using the <uvm_reg_field::predict()> method.
   //
   //
   extern virtual task peek  (output uvm_status_e       status,
                              output uvm_reg_data_t     value,
                              input  string             kind = "",
                              input  uvm_sequence_base  parent = null,
                              input  uvm_object         extension = null,
                              input  string             fname = "",
                              input  int                lineno = 0);
               

   // Task: mirror
   //
   // Read the field and update/check its mirror value
   //
   // Read the field and optionally compared the readback value
   // with the current mirrored value if ~check~ is <UVM_CHECK>.
   // The mirrored value will be updated using the <predict()>
   // method based on the readback value.
   //
   // The ~path~ argument specifies whether to mirror using 
   // the  <UVM_FRONTDOOR> (<read>) or 
   // <UVM_BACKDOOR> (<peek()>).
   //
   // If ~check~ is specified as <UVM_CHECK>,
   // an error message is issued if the current mirrored value
   // does not match the readback value, unless <set_compare> was used
   // disable the check.
   //
   // If the containing register is mapped in multiple address maps and physical
   // access is used (front-door access), an address ~map~ must be specified.
   // For write-only fields, their content is mirrored and optionally
   // checked only if a UVM_BACKDOOR
   // access path is used to read the field. 
   //
   extern virtual task mirror(output uvm_status_e      status,
                              input  uvm_check_e       check = UVM_NO_CHECK,
                              input  uvm_path_e        path = UVM_DEFAULT_PATH,
                              input  uvm_reg_map       map = null,
                              input  uvm_sequence_base parent = null,
                              input  int               prior = -1,
                              input  uvm_object        extension = null,
                              input  string            fname = "",
                              input  int               lineno = 0);


   // Function: set_compare
   //
   // Sets the compare policy during a mirror update. 
   // The field value is checked against its mirror only when both the
   // ~check~ argument in <uvm_reg_block::mirror>, <uvm_reg::mirror>,
   // or <uvm_reg_field::mirror> and the compare policy for the
   // field is <UVM_CHECK>.
   //
   extern function void set_compare(uvm_check_e check=UVM_CHECK);


   // Function: get_compare
   //
   // Returns the compare policy for this field.
   //
   extern function uvm_check_e get_compare();

   
   // Function: is_indv_accessible
   //
   // Check if this field can be written individually, i.e. without
   // affecting other fields in the containing register.
   //
   extern function bit is_indv_accessible (uvm_path_e  path,
                                           uvm_reg_map local_map);


   // Function: predict
   //
   // Update the mirrored and desired value for this field.
   //
   // Predict the mirror and desired value of the field based on the specified
   // observed ~value~ on a bus using the specified address ~map~.
   //
   // If ~kind~ is specified as <UVM_PREDICT_READ>, the value
   // was observed in a read transaction on the specified address ~map~ or
   // backdoor (if ~path~ is <UVM_BACKDOOR>).
   // If ~kind~ is specified as <UVM_PREDICT_WRITE>, the value
   // was observed in a write transaction on the specified address ~map~ or
   // backdoor (if ~path~ is <UVM_BACKDOOR>).
   // If ~kind~ is specified as <UVM_PREDICT_DIRECT>, the value
   // was computed and is updated as-is, without regard to any access policy.
   // For example, the mirrored value of a read-only field is modified
   // by this method if ~kind~ is specified as <UVM_PREDICT_DIRECT>.
   //
   // This method does not allow an update of the mirror (or desired)
   // when the register containing this field is busy executing
   // a transaction because the results are unpredictable and
   // indicative of a race condition in the testbench.
   //
   // Returns TRUE if the prediction was successful.
   //
   extern function bit predict (uvm_reg_data_t    value,
                                uvm_reg_byte_en_t be = -1,
                                uvm_predict_e     kind = UVM_PREDICT_DIRECT,
                                uvm_path_e        path = UVM_FRONTDOOR,
                                uvm_reg_map       map = null,
                                string            fname = "",
                                int               lineno = 0);



   /*local*/
   extern virtual function uvm_reg_data_t XpredictX (uvm_reg_data_t cur_val,
                                                     uvm_reg_data_t wr_val,
                                                     uvm_reg_map    map);

   /*local*/
   extern virtual function uvm_reg_data_t XupdateX();
  
   /*local*/
   extern function bit Xcheck_accessX (input uvm_reg_item rw,
                                       output uvm_reg_map_info map_info,
                                       input string caller);

   extern virtual task do_write(uvm_reg_item rw);
   extern virtual task do_read(uvm_reg_item rw);
   extern virtual function void do_predict 
                                  (uvm_reg_item rw,
                                   uvm_predict_e kind=UVM_PREDICT_DIRECT,
                                   uvm_reg_byte_en_t be = -1);


   extern function void pre_randomize();
   extern function void post_randomize();


   //-----------------
   // Group: Callbacks
   //-----------------

   `uvm_register_cb(uvm_reg_field, uvm_reg_cbs)


   // Task: pre_write
   //
   // Called before field write.
   //
   // If the specified data value, access ~path~ or address ~map~ are modified,
   // the updated data value, access path or address map will be used
   // to perform the register operation.
   // If the ~status~ is modified to anything other than <UVM_IS_OK>,
   // the operation is aborted.
   //
   // The field callback methods are invoked after the callback methods
   // on the containing register.
   // The registered callback methods are invoked after the invocation
   // of this method.
   //
   virtual task pre_write  (uvm_reg_item rw); endtask


   // Task: post_write
   //
   // Called after field write.
   //
   // If the specified ~status~ is modified,
   // the updated status will be
   // returned by the register operation.
   //
   // The field callback methods are invoked after the callback methods
   // on the containing register.
   // The registered callback methods are invoked before the invocation
   // of this method.
   //
   virtual task post_write (uvm_reg_item rw); endtask


   // Task: pre_read
   //
   // Called before field read.
   //
   // If the access ~path~ or address ~map~ in the ~rw~ argument are modified,
   // the updated access path or address map will be used to perform
   // the register operation.
   // If the ~status~ is modified to anything other than <UVM_IS_OK>,
   // the operation is aborted.
   //
   // The field callback methods are invoked after the callback methods
   // on the containing register.
   // The registered callback methods are invoked after the invocation
   // of this method.
   //
   virtual task pre_read (uvm_reg_item rw); endtask


   // Task: post_read
   //
   // Called after field read.
   //
   // If the specified readback data or~status~ in the ~rw~ argument is
   // modified, the updated readback data or status will be
   // returned by the register operation.
   //
   // The field callback methods are invoked after the callback methods
   // on the containing register.
   // The registered callback methods are invoked before the invocation
   // of this method.
   //
   virtual task post_read  (uvm_reg_item rw); endtask


   extern virtual function void do_print (uvm_printer printer);
   extern virtual function string convert2string;
   extern virtual function uvm_object clone();
   extern virtual function void do_copy   (uvm_object rhs);
   extern virtual function bit  do_compare (uvm_object  rhs,
                                            uvm_comparer comparer);
   extern virtual function void do_pack (uvm_packer packer);
   extern virtual function void do_unpack (uvm_packer packer);

endclass: uvm_reg_field


//------------------------------------------------------------------------------
// IMPLEMENTATION
//------------------------------------------------------------------------------

// new

function uvm_reg_field::new(string name = "uvm_reg_field");
   super.new(name);
endfunction: new


// configure

function void uvm_reg_field::configure(uvm_reg        parent,
                                       int unsigned   size,
                                       int unsigned   lsb_pos,
                                       string         access,
                                       bit            volatile,
                                       uvm_reg_data_t reset,
                                       bit            has_reset,
                                       bit            is_rand,
                                       bit            individually_accessible); 
   m_parent = parent;
   if (size == 0) begin
      `uvm_error("RegModel",
         $sformatf("Field \"%s\" cannot have 0 bits", get_full_name()));
      size = 1;
   end

   m_size      = size;
   m_volatile  = volatile;
   m_access    = access.toupper();
   m_lsb       = lsb_pos;
   m_cover_on  = UVM_NO_COVERAGE;
   m_written   = 0;
   m_check     = volatile ? UVM_NO_CHECK : UVM_CHECK;
   m_individually_accessible = individually_accessible;

   if (has_reset)
      set_reset(reset);
   else
      uvm_resource_db#(bit)::set({"REG::", get_full_name()},
                                 "NO_REG_HW_RESET_TEST", 1);

   m_parent.add_field(this);

   if (!m_policy_names.exists(m_access)) begin
      `uvm_error("RegModel", {"Access policy '",access,
       "' for field '",get_full_name(),"' is not defined. Setting to RW"})
      m_access = "RW";
   end

   if (size > m_max_size)
      m_max_size = size;
   
   // Ignore is_rand if the field is known not to be writeable
   // i.e. not "RW", "WRC", "WRS", "WO", "W1", "WO1"
   case (access)
    "RO", "RC", "RS", "WC", "WS",
      "W1C", "W1S", "W1T", "W0C", "W0S", "W0T",
      "W1SRC", "W1CRS", "W0SRC", "W0CRS", "WSRC", "WCRS",
      "WOC", "WOS": is_rand = 0;
   endcase

   if (!is_rand)
     value.rand_mode(0);

endfunction: configure


// get_parent

function uvm_reg uvm_reg_field::get_parent();
   return m_parent;
endfunction: get_parent


// get_full_name

function string uvm_reg_field::get_full_name();
   return {m_parent.get_full_name(), ".", get_name()};
endfunction: get_full_name


// get_register

function uvm_reg uvm_reg_field::get_register();
   return m_parent;
endfunction: get_register


// get_lsb_pos

function int unsigned uvm_reg_field::get_lsb_pos();
   return m_lsb;
endfunction: get_lsb_pos


// get_n_bits

function int unsigned uvm_reg_field::get_n_bits();
   return m_size;
endfunction: get_n_bits


// get_max_size

function int unsigned uvm_reg_field::get_max_size();
   return m_max_size;
endfunction: get_max_size


// is_known_access

function bit uvm_reg_field::is_known_access(uvm_reg_map map = null);
   string acc = get_access(map);
   case (acc)
    "RO", "RW", "RC", "RS", "WC", "WS",
      "W1C", "W1S", "W1T", "W0C", "W0S", "W0T",
      "WRC", "WRS", "W1SRC", "W1CRS", "W0SRC", "W0CRS", "WSRC", "WCRS",
      "WO", "WOC", "WOS", "W1", "WO1" : return 1;
   endcase
   return 0;
endfunction


// get_access

function string uvm_reg_field::get_access(uvm_reg_map map = null);
   string field_access = m_access;

   if (map == uvm_reg_map::backdoor())
     return field_access;

   // Is the register restricted in this map?
   case (m_parent.get_rights(map))
     "RW":
       // No restrictions
       return field_access;

     "RO":
       case (field_access)
        "RW", "RO", "WC", "WS",
          "W1C", "W1S", "W1T", "W0C", "W0S", "W0T",
          "W1"
        : field_access = "RO";
        
        "RC", "WRC", "W1SRC", "W0SRC", "WSRC"
        : field_access = "RC";
        
        "RS", "WRS", "W1CRS", "W0CRS", "WCRS"
        : field_access = "RS";
        
         "WO", "WOC", "WOS", "WO1": begin
            field_access = "NOACCESS";
         end

         // No change for the other modes
       endcase

     "WO":
       case (field_access)
         "RW",
         "WO": field_access = "WO";
         default: begin
            field_access = "NOACCESS";
         end

         // No change for the other modes
       endcase

     default:
       begin
         field_access = "NOACCESS";
         `uvm_warning("RegModel", {"Register '",m_parent.get_full_name(),
                      "' containing field '",get_name(),"' is mapped in map '",
                      map.get_full_name(),"' with unknown access right '", m_parent.get_rights(map), "'"})
       end
   endcase
   return field_access;
endfunction: get_access


// set_access

function string uvm_reg_field::set_access(string mode);
   set_access = m_access;
   m_access = mode.toupper();
   if (!m_policy_names.exists(m_access)) begin
      `uvm_error("RegModel", {"Access policy '",m_access,
                              "' is not a defined field access policy"})
      m_access = set_access;
   end
endfunction: set_access


// define_access

function bit uvm_reg_field::define_access(string name);
   if (!m_predefined) m_predefined = m_predefine_policies();

   name = name.toupper();

   if (m_policy_names.exists(name)) return 0;

   m_policy_names[name] = 1;
   return 1;
endfunction


// m_predefined_policies

function bit uvm_reg_field::m_predefine_policies();
   if (m_predefined) return 1;

   m_predefined = 1;
   
   void'(define_access("RO"));
   void'(define_access("RW"));
   void'(define_access("RC"));
   void'(define_access("RS"));
   void'(define_access("WRC"));
   void'(define_access("WRS"));
   void'(define_access("WC"));
   void'(define_access("WS"));
   void'(define_access("WSRC"));
   void'(define_access("WCRS"));
   void'(define_access("W1C"));
   void'(define_access("W1S"));
   void'(define_access("W1T"));
   void'(define_access("W0C"));
   void'(define_access("W0S"));
   void'(define_access("W0T"));
   void'(define_access("W1SRC"));
   void'(define_access("W1CRS"));
   void'(define_access("W0SRC"));
   void'(define_access("W0CRS"));
   void'(define_access("WO"));
   void'(define_access("WOC"));
   void'(define_access("WOS"));
   void'(define_access("W1"));
   void'(define_access("WO1"));
   return 1;
endfunction


// set_volatility

function void uvm_reg_field::set_volatility(bit volatile);
   m_volatile = volatile;
endfunction


// is_volatile

function bit uvm_reg_field::is_volatile();
   return m_volatile;
endfunction


// XpredictX

function uvm_reg_data_t uvm_reg_field::XpredictX (uvm_reg_data_t cur_val,
                                                  uvm_reg_data_t wr_val,
                                                  uvm_reg_map    map);
   uvm_reg_data_t mask = ('b1 << m_size)-1;
   
   case (get_access(map))
     "RO":    return cur_val;
     "RW":    return wr_val;
     "RC":    return cur_val;
     "RS":    return cur_val;
     "WC":    return '0;
     "WS":    return mask;
     "WRC":   return wr_val;
     "WRS":   return wr_val;
     "WSRC":  return mask;
     "WCRS":  return '0;
     "W1C":   return cur_val & (~wr_val);
     "W1S":   return cur_val | wr_val;
     "W1T":   return cur_val ^ wr_val;
     "W0C":   return cur_val & wr_val;
     "W0S":   return cur_val | (~wr_val & mask);
     "W0T":   return cur_val ^ (~wr_val & mask);
     "W1SRC": return cur_val | wr_val;
     "W1CRS": return cur_val & (~wr_val);
     "W0SRC": return cur_val | (~wr_val & mask);
     "W0CRS": return cur_val & wr_val;
     "WO":    return wr_val;
     "WOC":   return '0;
     "WOS":   return mask;
     "W1":    return (m_written) ? cur_val : wr_val;
     "WO1":   return (m_written) ? cur_val : wr_val;
     "NOACCESS": return cur_val;
     default: return wr_val;
   endcase

   `uvm_fatal("RegModel", "uvm_reg_field::XpredictX(): Internal error");
   return 0;
endfunction: XpredictX



// predict

function bit uvm_reg_field::predict (uvm_reg_data_t    value,
                                     uvm_reg_byte_en_t be = -1,
                                     uvm_predict_e     kind = UVM_PREDICT_DIRECT,
                                     uvm_path_e        path = UVM_FRONTDOOR,
                                     uvm_reg_map       map = null,
                                     string            fname = "",
                                     int               lineno = 0);
  uvm_reg_item rw = new;
  rw.value[0] = value;
  rw.path = path;
  rw.map = map;
  rw.fname = fname;
  rw.lineno = lineno;
  do_predict(rw, kind, be);
  predict = (rw.status == UVM_NOT_OK) ? 0 : 1;
endfunction: predict


// do_predict

function void uvm_reg_field::do_predict(uvm_reg_item      rw,
                                        uvm_predict_e     kind = UVM_PREDICT_DIRECT,
                                        uvm_reg_byte_en_t be = -1);
   
   uvm_reg_data_t field_val = rw.value[0] & ((1 << m_size)-1);

   if (rw.status != UVM_NOT_OK)
     rw.status = UVM_IS_OK;

   // Assume that the entire field is enabled
   if (!be[0])
     return;

   m_fname = rw.fname;
   m_lineno = rw.lineno;

   case (kind)

     UVM_PREDICT_WRITE:
       begin
         uvm_reg_field_cb_iter cbs = new(this);

         if (rw.path == UVM_FRONTDOOR || rw.path == UVM_PREDICT)
            field_val = XpredictX(m_mirrored, field_val, rw.map);

         m_written = 1;

         for (uvm_reg_cbs cb = cbs.first(); cb != null; cb = cbs.next())
            cb.post_predict(this, m_mirrored, field_val, 
                            UVM_PREDICT_WRITE, rw.path, rw.map);

         field_val &= ('b1 << m_size)-1;

       end

     UVM_PREDICT_READ:
       begin
         uvm_reg_field_cb_iter cbs = new(this);

         if (rw.path == UVM_FRONTDOOR || rw.path == UVM_PREDICT) begin

            string acc = get_access(rw.map);

            if (acc == "RC" ||
                acc == "WRC" ||
                acc == "WSRC" ||
                acc == "W1SRC" ||
                acc == "W0SRC")
              field_val = 0;  // (clear)

            else if (acc == "RS" ||
                     acc == "WRS" ||
                     acc == "WCRS" ||
                     acc == "W1CRS" ||
                     acc == "W0CRS")
              field_val = ('b1 << m_size)-1; // all 1's (set)

            else if (acc == "WO" ||
                     acc == "WOC" ||
                     acc == "WOS" ||
                     acc == "WO1" ||
                     acc == "NOACCESS")
              return;
         end

         for (uvm_reg_cbs cb = cbs.first(); cb != null; cb = cbs.next())
            cb.post_predict(this, m_mirrored, field_val,
                            UVM_PREDICT_READ, rw.path, rw.map);

         field_val &= ('b1 << m_size)-1;

       end

     UVM_PREDICT_DIRECT:
       begin
         if (m_parent.is_busy()) begin
           `uvm_warning("RegModel", {"Trying to predict value of field '",
              get_name(),"' while register '",m_parent.get_full_name(),
              "' is being accessed"})
           rw.status = UVM_NOT_OK;
         end
       end
   endcase

   // update the mirror with predicted value
   m_mirrored = field_val;
   m_desired  = field_val;
   this.value = field_val;

endfunction: do_predict


// XupdateX

function uvm_reg_data_t  uvm_reg_field::XupdateX();
   // Figure out which value must be written to get the desired value
   // given what we think is the current value in the hardware
   XupdateX = 0;

   case (m_access)
      "RO":    XupdateX = m_desired;
      "RW":    XupdateX = m_desired;
      "RC":    XupdateX = m_desired;
      "RS":    XupdateX = m_desired;
      "WRC":   XupdateX = m_desired;
      "WRS":   XupdateX = m_desired;
      "WC":    XupdateX = m_desired;  // Warn if != 0
      "WS":    XupdateX = m_desired;  // Warn if != 1
      "WSRC":  XupdateX = m_desired;  // Warn if != 1
      "WCRS":  XupdateX = m_desired;  // Warn if != 0
      "W1C":   XupdateX = ~m_desired;
      "W1S":   XupdateX = m_desired;
      "W1T":   XupdateX = m_desired ^ m_mirrored;
      "W0C":   XupdateX = m_desired;
      "W0S":   XupdateX = ~m_desired;
      "W0T":   XupdateX = ~(m_desired ^ m_mirrored);
      "W1SRC": XupdateX = m_desired;
      "W1CRS": XupdateX = ~m_desired;
      "W0SRC": XupdateX = ~m_desired;
      "W0CRS": XupdateX = m_desired;
      "WO":    XupdateX = m_desired;
      "WOC":   XupdateX = m_desired;  // Warn if != 0
      "WOS":   XupdateX = m_desired;  // Warn if != 1
      "W1":    XupdateX = m_desired;
      "WO1":   XupdateX = m_desired;
      default: XupdateX = m_desired;      
   endcase
   XupdateX &= (1 << m_size) - 1;
   
endfunction: XupdateX


// set

function void uvm_reg_field::set(uvm_reg_data_t  value,
                                 string          fname = "",
                                 int             lineno = 0);
   uvm_reg_data_t mask = ('b1 << m_size)-1;

   m_fname = fname;
   m_lineno = lineno;
   if (value >> m_size) begin
      `uvm_warning("RegModel",
         $sformatf("Specified value (0x%h) greater than field \"%s\" size (%0d bits)",
             value, get_name(), m_size));
      value &= mask;
   end

   if (m_parent.is_busy()) begin
      `uvm_warning("UVM/FLD/SET/BSY",
                   $sformatf("Setting the value of field \"%s\" while containing register \"%s\" is being accessed may result in loss of desired field value. A race condition between threads concurrently accessing the register model is the likely cause of the problem.",
                             get_name(), m_parent.get_full_name()))
   end

   case (m_access)
      "RO":    m_desired = m_desired;
      "RW":    m_desired = value;
      "RC":    m_desired = m_desired;
      "RS":    m_desired = m_desired;
      "WC":    m_desired = '0;
      "WS":    m_desired = mask;
      "WRC":   m_desired = value;
      "WRS":   m_desired = value;
      "WSRC":  m_desired = mask;
      "WCRS":  m_desired = '0;
      "W1C":   m_desired = m_desired & (~value);
      "W1S":   m_desired = m_desired | value;
      "W1T":   m_desired = m_desired ^ value;
      "W0C":   m_desired = m_desired & value;
      "W0S":   m_desired = m_desired | (~value & mask);
      "W0T":   m_desired = m_desired ^ (~value & mask);
      "W1SRC": m_desired = m_desired | value;
      "W1CRS": m_desired = m_desired & (~value);
      "W0SRC": m_desired = m_desired | (~value & mask);
      "W0CRS": m_desired = m_desired & value;
      "WO":    m_desired = value;
      "WOC":   m_desired = '0;
      "WOS":   m_desired = mask;
      "W1":    m_desired = (m_written) ? m_desired : value;
      "WO1":   m_desired = (m_written) ? m_desired : value;
      default: m_desired = value;
   endcase
   this.value = m_desired;
endfunction: set

 
// get

function uvm_reg_data_t  uvm_reg_field::get(string  fname = "",
                                            int     lineno = 0);
   m_fname = fname;
   m_lineno = lineno;
   get = m_desired;
endfunction: get

 
// get_mirrored_value

function uvm_reg_data_t  uvm_reg_field::get_mirrored_value(string  fname = "",
                                            int     lineno = 0);
   m_fname = fname;
   m_lineno = lineno;
   get_mirrored_value = m_mirrored;
endfunction: get_mirrored_value


// reset

function void uvm_reg_field::reset(string kind = "HARD");

   if (!m_reset.exists(kind))
      return;
   
   m_mirrored = m_reset[kind];
   m_desired  = m_mirrored;
   value      = m_mirrored;

   if (kind == "HARD")
      m_written  = 0;

endfunction: reset


// has_reset

function bit uvm_reg_field::has_reset(string kind = "HARD",
                                      bit    delete = 0);

   if (!m_reset.exists(kind)) return 0;

   if (delete) m_reset.delete(kind);

   return 1;
endfunction: has_reset


// get_reset

function uvm_reg_data_t
   uvm_reg_field::get_reset(string kind = "HARD");

   if (!m_reset.exists(kind))
      return m_desired;

   return m_reset[kind];

endfunction: get_reset


// set_reset

function void uvm_reg_field::set_reset(uvm_reg_data_t value,
                                       string kind = "HARD");
   m_reset[kind] = value & ((1<<m_size) - 1);
endfunction: set_reset


// needs_update

function bit uvm_reg_field::needs_update();
   needs_update = (m_mirrored != m_desired) | m_volatile;
endfunction: needs_update


typedef class uvm_reg_map_info;


// Xcheck_accessX

function bit uvm_reg_field::Xcheck_accessX(input uvm_reg_item rw,
                                           output uvm_reg_map_info map_info,
                                           input string caller);

                        
   if (rw.path == UVM_DEFAULT_PATH) begin
     uvm_reg_block blk = m_parent.get_block();
     rw.path = blk.get_default_path();
   end

   if (rw.path == UVM_BACKDOOR) begin
      if (m_parent.get_backdoor() == null && !m_parent.has_hdl_path()) begin
         `uvm_warning("RegModel",
            {"No backdoor access available for field '",get_full_name(),
            "' . Using frontdoor instead."})
         rw.path = UVM_FRONTDOOR;
      end
      else
        rw.map = uvm_reg_map::backdoor();
   end

   if (rw.path != UVM_BACKDOOR) begin

     rw.local_map = m_parent.get_local_map(rw.map,caller);

     if (rw.local_map == null) begin
        `uvm_error(get_type_name(), 
           {"No transactor available to physically access memory from map '",
            rw.map.get_full_name(),"'"})
        rw.status = UVM_NOT_OK;
        return 0;
     end

     map_info = rw.local_map.get_reg_map_info(m_parent);

     if (map_info.frontdoor == null && map_info.unmapped) begin
        `uvm_error("RegModel", {"Field '",get_full_name(),
                   "' in register that is unmapped in map '",
                   rw.map.get_full_name(),
                   "' and does not have a user-defined frontdoor"})
        rw.status = UVM_NOT_OK;
        return 0;
     end

     if (rw.map == null)
       rw.map = rw.local_map;
   end

   return 1;
endfunction


// write

task uvm_reg_field::write(output uvm_status_e       status,
                          input  uvm_reg_data_t     value,
                          input  uvm_path_e         path = UVM_DEFAULT_PATH,
                          input  uvm_reg_map        map = null,
                          input  uvm_sequence_base  parent = null,
                          input  int                prior = -1,
                          input  uvm_object         extension = null,
                          input  string             fname = "",
                          input  int                lineno = 0);

   uvm_reg_item rw;
   rw = uvm_reg_item::type_id::create("field_write_item",,get_full_name());
   rw.element      = this;
   rw.element_kind = UVM_FIELD;
   rw.kind         = UVM_WRITE;
   rw.value[0]     = value;
   rw.path         = path;
   rw.map          = map;
   rw.parent       = parent;
   rw.prior        = prior;
   rw.extension    = extension;
   rw.fname        = fname;
   rw.lineno       = lineno;

   do_write(rw);

   status = rw.status;

endtask


// do_write

task uvm_reg_field::do_write(uvm_reg_item rw);

   uvm_reg_data_t   value_adjust;
   uvm_reg_map_info map_info;
   uvm_reg_field    fields[$];
   bit bad_side_effect;

   m_parent.XatomicX(1);
   m_fname  = rw.fname;
   m_lineno = rw.lineno;

   if (!Xcheck_accessX(rw,map_info,"write()"))
     return;

   m_write_in_progress = 1'b1;

   if (rw.value[0] >> m_size) begin
      `uvm_warning("RegModel", {"uvm_reg_field::write(): Value greater than field '",
                          get_full_name(),"'"})
      rw.value[0] &= ((1<<m_size)-1);
   end

   // Get values to write to the other fields in register
   m_parent.get_fields(fields);
   foreach (fields[i]) begin

      if (fields[i] == this) begin
         value_adjust |= rw.value[0] << m_lsb;
         continue;
      end

      // It depends on what kind of bits they are made of...
      case (fields[i].get_access(rw.local_map))
        // These...
        "RO", "RC", "RS", "W1C", "W1S", "W1T", "W1SRC", "W1CRC":
          // Use all 0's
          value_adjust |= 0;

        // These...
        "W0C", "W0S", "W0T", "W0SRC", "W0CRS":
          // Use all 1's
          value_adjust |= ((1<<fields[i].get_n_bits())-1) << fields[i].get_lsb_pos();

        // These might have side effects! Bad!
        "WC", "WS", "WCRS", "WSRC", "WOC", "WOS":
           bad_side_effect = 1;

        default:
           value_adjust |= fields[i].m_mirrored << fields[i].get_lsb_pos();

      endcase
   end

`ifdef UVM_REG_NO_INDIVIDUAL_FIELD_ACCESS
   rw.element_kind = UVM_REG;
   rw.element = m_parent;
   rw.value[0] = value_adjust;
   m_parent.do_write(rw);   
`else        

   if (!is_indv_accessible(rw.path,rw.local_map)) begin
      rw.element_kind = UVM_REG;
      rw.element = m_parent;
      rw.value[0] = value_adjust;
      m_parent.do_write(rw);

      if (bad_side_effect) begin
         `uvm_warning("RegModel", $sformatf("Writing field \"%s\" will cause unintended side effects in adjoining Write-to-Clear or Write-to-Set fields in the same register", this.get_full_name()));
      end
   end
   else begin

     uvm_reg_map system_map = rw.local_map.get_root_map();
     uvm_reg_field_cb_iter cbs = new(this);

     m_parent.Xset_busyX(1);

     rw.status = UVM_IS_OK;
      
     pre_write(rw);
     for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
        cb.pre_write(rw);

     if (rw.status != UVM_IS_OK) begin
        m_write_in_progress = 1'b0;
        m_parent.Xset_busyX(0);
        m_parent.XatomicX(0);
        
        return;
     end
            
     rw.local_map.do_write(rw);

     if (system_map.get_auto_predict())
        // ToDo: Call parent.XsampleX();
        do_predict(rw, UVM_PREDICT_WRITE);

     post_write(rw);
     for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
        cb.post_write(rw);

     m_parent.Xset_busyX(0);
      
   end

`endif

   m_write_in_progress = 1'b0;
   m_parent.XatomicX(0);

endtask: do_write


// read

task uvm_reg_field::read(output uvm_status_e       status,
                         output uvm_reg_data_t     value,
                         input  uvm_path_e         path = UVM_DEFAULT_PATH,
                         input  uvm_reg_map        map = null,
                         input  uvm_sequence_base  parent = null,
                         input  int                prior = -1,
                         input  uvm_object         extension = null,
                         input  string             fname = "",
                         input  int                lineno = 0);

   uvm_reg_item rw;
   rw = uvm_reg_item::type_id::create("field_read_item",,get_full_name());
   rw.element      = this;
   rw.element_kind = UVM_FIELD;
   rw.kind         = UVM_READ;
   rw.value[0]     = 0;
   rw.path         = path;
   rw.map          = map;
   rw.parent       = parent;
   rw.prior        = prior;
   rw.extension    = extension;
   rw.fname        = fname;
   rw.lineno       = lineno;

   do_read(rw);

   value = rw.value[0];
   status = rw.status;

endtask: read


// do_read

task uvm_reg_field::do_read(uvm_reg_item rw);

   uvm_reg_map_info map_info;
   bit bad_side_effect;

   m_parent.XatomicX(1);
   m_fname  = rw.fname;
   m_lineno = rw.lineno;
   m_read_in_progress = 1'b1;
  
   if (!Xcheck_accessX(rw,map_info,"read()"))
     return;

`ifdef UVM_REG_NO_INDIVIDUAL_FIELD_ACCESS
   rw.element_kind = UVM_REG;
   rw.element = m_parent;
   m_parent.do_read(rw);
   rw.value[0] = (rw.value[0] >> m_lsb) & ((1<<m_size))-1;
   bad_side_effect = 1;
`else

   if (!is_indv_accessible(rw.path,rw.local_map)) begin
      rw.element_kind = UVM_REG;
      rw.element = m_parent;
      bad_side_effect = 1;
      m_parent.do_read(rw);
      rw.value[0] = (rw.value[0] >> m_lsb) & ((1<<m_size))-1;
   end
   else begin

     uvm_reg_map system_map = rw.local_map.get_root_map();
     uvm_reg_field_cb_iter cbs = new(this);

     m_parent.Xset_busyX(1);

     rw.status = UVM_IS_OK;
      
     pre_read(rw);
     for (uvm_reg_cbs cb = cbs.first(); cb != null; cb = cbs.next())
        cb.pre_read(rw);

     if (rw.status != UVM_IS_OK) begin
        m_read_in_progress = 1'b0;
        m_parent.Xset_busyX(0);
        m_parent.XatomicX(0);

        return;
     end
            
     rw.local_map.do_read(rw);


     if (system_map.get_auto_predict())
        // ToDo: Call parent.XsampleX();
        do_predict(rw, UVM_PREDICT_READ);

     post_read(rw);
     for (uvm_reg_cbs cb=cbs.first(); cb!=null; cb=cbs.next())
        cb.post_read(rw);

     m_parent.Xset_busyX(0);
      
   end

`endif

   m_read_in_progress = 1'b0;
   m_parent.XatomicX(0);

   if (bad_side_effect) begin
      uvm_reg_field fields[$];
      m_parent.get_fields(fields);
      foreach (fields[i]) begin
         string mode;
         if (fields[i] == this)
            continue;
         mode = fields[i].get_access();
         if (mode == "RC" ||
             mode == "RS" ||
             mode == "WRC" ||
             mode == "WRS" ||
             mode == "WSRC" ||
             mode == "WCRS" ||
             mode == "W1SRC" ||
             mode == "W1CRS" ||
             mode == "W0SRC" ||
             mode == "W0CRS") begin
            `uvm_warning("RegModel", {"Reading field '",get_full_name(),
                "' will cause unintended side effects in adjoining ",
                "Read-to-Clear or Read-to-Set fields in the same register"})
         end
      end
   end

endtask: do_read
               

// is_indv_accessible

function bit uvm_reg_field::is_indv_accessible(uvm_path_e  path,
                                               uvm_reg_map local_map);
   if (path == UVM_BACKDOOR) begin
      `uvm_warning("RegModel",
         {"Individual BACKDOOR field access not available for field '",
         get_full_name(), "'. Accessing complete register instead."})
      return 0;
   end

   if (!m_individually_accessible) begin
         `uvm_warning("RegModel",
            {"Individual field access not available for field '",
            get_full_name(), "'. Accessing complete register instead."})
      return 0;
   end

   // Cannot access individual fields if the container register
   // has a user-defined front-door
   if (m_parent.get_frontdoor(local_map) != null) begin
      `uvm_warning("RegModel",
                   {"Individual field access not available for field '",
                    get_name(), "' because register '", m_parent.get_full_name(), "' has a user-defined front-door. Accessing complete register instead."})
      return 0;
   end
   
   begin
     uvm_reg_map system_map = local_map.get_root_map();
     uvm_reg_adapter adapter = system_map.get_adapter();
     if (adapter.supports_byte_enable)
       return 1;
   end

   begin
     int fld_idx;
     int bus_width = local_map.get_n_bytes();
     uvm_reg_field fields[$];
     bit sole_field;

     m_parent.get_fields(fields);

     if (fields.size() == 1) begin
        sole_field = 1;
     end
     else begin
        int prev_lsb,this_lsb,next_lsb; 
        int prev_sz,this_sz,next_sz; 
        int bus_sz = bus_width*8;

        foreach (fields[i]) begin
           if (fields[i] == this) begin
              fld_idx = i;
              break;
           end
        end

        this_lsb = fields[fld_idx].get_lsb_pos();
        this_sz  = fields[fld_idx].get_n_bits();

        if (fld_idx>0) begin
          prev_lsb = fields[fld_idx-1].get_lsb_pos();
          prev_sz  = fields[fld_idx-1].get_n_bits();
        end

        if (fld_idx < fields.size()-1) begin
          next_lsb = fields[fld_idx+1].get_lsb_pos();
          next_sz  = fields[fld_idx+1].get_n_bits();
        end

        // if first field in register
        if (fld_idx == 0 &&
           ((next_lsb % bus_sz) == 0 ||
            (next_lsb - this_sz) > (next_lsb % bus_sz)))
           return 1;

        // if last field in register
        else if (fld_idx == (fields.size()-1) &&
            ((this_lsb % bus_sz) == 0 ||
             (this_lsb - (prev_lsb + prev_sz)) >= (this_lsb % bus_sz)))
           return 1;

        // if somewhere in between
        else begin
           if ((this_lsb % bus_sz) == 0) begin
              if ((next_lsb % bus_sz) == 0 ||
                  (next_lsb - (this_lsb + this_sz)) >= (next_lsb % bus_sz))
                 return 1;
           end 
           else begin
              if ( (next_lsb - (this_lsb + this_sz)) >= (next_lsb % bus_sz) &&
                  ((this_lsb - (prev_lsb + prev_sz)) >= (this_lsb % bus_sz)) )
                 return 1;
           end
        end
     end
   end
   
   `uvm_warning("RegModel", 
       {"Target bus does not support byte enabling, and the field '",
       get_full_name(),"' is not the only field within the entire bus width. ",
       "Individual field access will not be available. ",
       "Accessing complete register instead."})

   return 0;

endfunction


// poke

task uvm_reg_field::poke(output uvm_status_e      status,
                         input  uvm_reg_data_t    value,
                         input  string            kind = "",
                         input  uvm_sequence_base parent = null,
                         input  uvm_object        extension = null,
                         input  string            fname = "",
                         input  int               lineno = 0);
   uvm_reg_data_t  tmp;

   m_fname = fname;
   m_lineno = lineno;

   if (value >> m_size) begin
      `uvm_warning("RegModel",
         {"uvm_reg_field::poke(): Value exceeds size of field '",
          get_name(),"'"})
      value &= value & ((1<<m_size)-1);
   end


   m_parent.XatomicX(1);
   m_parent.m_is_locked_by_field = 1'b1;

   tmp = 0;

   // What is the current values of the other fields???
   m_parent.peek(status, tmp, kind, parent, extension, fname, lineno);

   if (status == UVM_NOT_OK) begin
      `uvm_error("RegModel", {"uvm_reg_field::poke(): Peek of register '",
         m_parent.get_full_name(),"' returned status ",status.name()})
      m_parent.XatomicX(0);
      m_parent.m_is_locked_by_field = 1'b0;
      return;
   end

   // Force the value for this field then poke the resulting value
   tmp &= ~(((1<<m_size)-1) << m_lsb);
   tmp |= value << m_lsb;
   m_parent.poke(status, tmp, kind, parent, extension, fname, lineno);

   m_parent.XatomicX(0);
   m_parent.m_is_locked_by_field = 1'b0;
endtask: poke


// peek

task uvm_reg_field::peek(output uvm_status_e      status,
                         output uvm_reg_data_t    value,
                         input  string            kind = "",
                         input  uvm_sequence_base parent = null,
                         input  uvm_object        extension = null,
                         input  string            fname = "",
                         input  int               lineno = 0);
   uvm_reg_data_t  reg_value;

   m_fname = fname;
   m_lineno = lineno;

   m_parent.peek(status, reg_value, kind, parent, extension, fname, lineno);
   value = (reg_value >> m_lsb) & ((1<<m_size))-1;

endtask: peek
               

// mirror

task uvm_reg_field::mirror(output uvm_status_e      status,
                           input  uvm_check_e       check = UVM_NO_CHECK,
                           input  uvm_path_e        path = UVM_DEFAULT_PATH,
                           input  uvm_reg_map       map = null,
                           input  uvm_sequence_base parent = null,
                           input  int               prior = -1,
                           input  uvm_object        extension = null,
                           input  string            fname = "",
                           input  int               lineno = 0);
   m_fname = fname;
   m_lineno = lineno;
   m_parent.mirror(status, check, path, map, parent, prior, extension,
                      fname, lineno);
endtask: mirror


// set_compare

function void uvm_reg_field::set_compare(uvm_check_e check=UVM_CHECK);
  m_check = check;
endfunction


// get_compare

function uvm_check_e uvm_reg_field::get_compare();
  return m_check;
endfunction

// pre_randomize

function void uvm_reg_field::pre_randomize();
   // Update the only publicly known property with the current
   // desired value so it can be used as a state variable should
   // the rand_mode of the field be turned off.
   value = m_desired;
endfunction: pre_randomize


// post_randomize

function void uvm_reg_field::post_randomize();
   m_desired = value;
endfunction: post_randomize


// do_print

function void uvm_reg_field::do_print (uvm_printer printer);
  printer.print_generic(get_name(), get_type_name(), -1, convert2string());
endfunction


// convert2string

function string uvm_reg_field::convert2string();
   string fmt;
   string res_str;
   string t_str;
   bit with_debug_info;
   string prefix;
   uvm_reg reg_=get_register();

   $sformat(fmt, "%0d'h%%%0dh", get_n_bits(),
            (get_n_bits()-1)/4 + 1);
   $sformat(convert2string, {"%s %s %s[%0d:%0d]=",fmt,"%s"}, prefix,
            get_access(),
            reg_.get_name(),
            get_lsb_pos() + get_n_bits() - 1,
            get_lsb_pos(), m_desired,
            (m_desired != m_mirrored) ? $sformatf({" (Mirror: ",fmt,")"},
               m_mirrored) : ""); 

   if (m_read_in_progress == 1'b1) begin
      if (m_fname != "" && m_lineno != 0)
         $sformat(res_str, " from %s:%0d",m_fname, m_lineno);
      convert2string = {convert2string, "\n", "currently being read", res_str}; 
   end
   if (m_write_in_progress == 1'b1) begin
      if (m_fname != "" && m_lineno != 0)
         $sformat(res_str, " from %s:%0d",m_fname, m_lineno);
      convert2string = {convert2string, "\n", res_str, "currently being written"}; 
   end
endfunction: convert2string


// clone

function uvm_object uvm_reg_field::clone();
  `uvm_fatal("RegModel","RegModel field cannot be cloned")
  return null;
endfunction

// do_copy

function void uvm_reg_field::do_copy(uvm_object rhs);
  `uvm_warning("RegModel","RegModel field copy not yet implemented")
  // just a set(rhs.get()) ?
endfunction


// do_compare

function bit uvm_reg_field::do_compare (uvm_object  rhs,
                                        uvm_comparer comparer);
  `uvm_warning("RegModel","RegModel field compare not yet implemented")
  // just a return (get() == rhs.get()) ?
  return 0;
endfunction


// do_pack

function void uvm_reg_field::do_pack (uvm_packer packer);
  `uvm_warning("RegModel","RegModel field cannot be packed")
endfunction


// do_unpack

function void uvm_reg_field::do_unpack (uvm_packer packer);
  `uvm_warning("RegModel","RegModel field cannot be unpacked")
endfunction


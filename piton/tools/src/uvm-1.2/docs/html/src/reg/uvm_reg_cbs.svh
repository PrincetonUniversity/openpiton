//
// -------------------------------------------------------------
//    Copyright 2004-2009 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
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

typedef class uvm_reg;
typedef class uvm_mem;
typedef class uvm_reg_backdoor;

//------------------------------------------------------------------------------
// Title: Register Callbacks
//
// This section defines the base class used for all register callback
// extensions. It also includes pre-defined callback extensions for use on
// read-only and write-only registers.
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Class: uvm_reg_cbs
//
// Facade class for field, register, memory and backdoor
// access callback methods. 
//------------------------------------------------------------------------------

virtual class uvm_reg_cbs extends uvm_callback;

   function new(string name = "uvm_reg_cbs");
      super.new(name);
   endfunction


   // Task: pre_write
   //
   // Called before a write operation.
   //
   // All registered ~pre_write~ callback methods are invoked after the
   // invocation of the ~pre_write~ method of associated object (<uvm_reg>,
   // <uvm_reg_field>, <uvm_mem>, or <uvm_reg_backdoor>). If the element being
   // written is a <uvm_reg>, all ~pre_write~ callback methods are invoked
   // before the contained <uvm_reg_fields>. 
   //
   // Backdoor - <uvm_reg_backdoor::pre_write>,
   //            <uvm_reg_cbs::pre_write> cbs for backdoor.
   //
   // Register - <uvm_reg::pre_write>,
   //            <uvm_reg_cbs::pre_write> cbs for reg,
   //            then foreach field:
   //              <uvm_reg_field::pre_write>, 
   //              <uvm_reg_cbs::pre_write> cbs for field
   //
   // RegField - <uvm_reg_field::pre_write>,
   //            <uvm_reg_cbs::pre_write> cbs for field
   //
   // Memory   - <uvm_mem::pre_write>,
   //            <uvm_reg_cbs::pre_write> cbs for mem
   //
   // The ~rw~ argument holds information about the operation.
   //
   // - Modifying the ~value~ modifies the actual value written.
   //
   // - For memories, modifying the ~offset~ modifies the offset
   //   used in the operation.
   //
   // - For non-backdoor operations, modifying the access ~path~ or
   //   address ~map~ modifies the actual path or map used in the
   //   operation.
   //
   // If the ~rw.status~ is modified to anything other than <UVM_IS_OK>,
   // the operation is aborted.
   //
   // See <uvm_reg_item> for details on ~rw~ information.
   //
   virtual task pre_write(uvm_reg_item rw); endtask


   // Task: post_write
   //
   // Called after a write operation.
   //
   // All registered ~post_write~ callback methods are invoked before the
   // invocation of the ~post_write~ method of the associated object (<uvm_reg>,
   // <uvm_reg_field>, <uvm_mem>, or <uvm_reg_backdoor>). If the element being
   // written is a <uvm_reg>, all ~post_write~ callback methods are invoked
   // before the contained <uvm_reg_fields>. 
   //
   // Summary of callback order:
   //
   // Backdoor - <uvm_reg_cbs::post_write> cbs for backdoor,
   //            <uvm_reg_backdoor::post_write>
   //
   // Register - <uvm_reg_cbs::post_write> cbs for reg,
   //            <uvm_reg::post_write>,
   //            then foreach field:
   //              <uvm_reg_cbs::post_write> cbs for field,
   //              <uvm_reg_field::post_read>
   //
   // RegField - <uvm_reg_cbs::post_write> cbs for field,
   //            <uvm_reg_field::post_write>
   //
   // Memory   - <uvm_reg_cbs::post_write> cbs for mem,
   //            <uvm_mem::post_write>
   //
   // The ~rw~ argument holds information about the operation.
   //
   // - Modifying the ~status~ member modifies the returned status.
   //
   // - Modifying the ~value~ or ~offset~ members has no effect, as
   //   the operation has already completed.
   //
   // See <uvm_reg_item> for details on ~rw~ information.
   //
   virtual task post_write(uvm_reg_item rw); endtask


   // Task: pre_read
   //
   // Callback called before a read operation.
   //
   // All registered ~pre_read~ callback methods are invoked after the
   // invocation of the ~pre_read~ method of associated object (<uvm_reg>,
   // <uvm_reg_field>, <uvm_mem>, or <uvm_reg_backdoor>). If the element being
   // read is a <uvm_reg>, all ~pre_read~ callback methods are invoked before
   // the contained <uvm_reg_fields>. 
   //
   // Backdoor - <uvm_reg_backdoor::pre_read>,
   //            <uvm_reg_cbs::pre_read> cbs for backdoor
   //
   // Register - <uvm_reg::pre_read>,
   //            <uvm_reg_cbs::pre_read> cbs for reg,
   //            then foreach field:
   //              <uvm_reg_field::pre_read>,
   //              <uvm_reg_cbs::pre_read> cbs for field
   //
   // RegField - <uvm_reg_field::pre_read>,
   //            <uvm_reg_cbs::pre_read> cbs for field
   //
   // Memory   - <uvm_mem::pre_read>,
   //            <uvm_reg_cbs::pre_read> cbs for mem
   //
   // The ~rw~ argument holds information about the operation.
   //
   // - The ~value~ member of ~rw~ is not used has no effect if modified.
   //
   // - For memories, modifying the ~offset~ modifies the offset
   //   used in the operation.
   //
   // - For non-backdoor operations, modifying the access ~path~ or
   //   address ~map~ modifies the actual path or map used in the
   //   operation.
   //
   // If the ~rw.status~ is modified to anything other than <UVM_IS_OK>,
   // the operation is aborted.
   //
   // See <uvm_reg_item> for details on ~rw~ information.
   //
   virtual task pre_read(uvm_reg_item rw); endtask


   // Task: post_read
   //
   // Callback called after a read operation.
   //
   // All registered ~post_read~ callback methods are invoked before the
   // invocation of the ~post_read~ method of the associated object (<uvm_reg>,
   // <uvm_reg_field>, <uvm_mem>, or <uvm_reg_backdoor>). If the element being read
   // is a <uvm_reg>, all ~post_read~ callback methods are invoked before the
   // contained <uvm_reg_fields>. 
   //
   // Backdoor - <uvm_reg_cbs::post_read> cbs for backdoor,
   //            <uvm_reg_backdoor::post_read>
   //
   // Register - <uvm_reg_cbs::post_read> cbs for reg,
   //            <uvm_reg::post_read>,
   //            then foreach field:
   //              <uvm_reg_cbs::post_read> cbs for field,
   //              <uvm_reg_field::post_read>
   //
   // RegField - <uvm_reg_cbs::post_read> cbs for field,
   //            <uvm_reg_field::post_read>
   //
   // Memory   - <uvm_reg_cbs::post_read> cbs for mem,
   //            <uvm_mem::post_read>
   //
   // The ~rw~ argument holds information about the operation.
   //
   // - Modifying the readback ~value~ or ~status~ modifies the actual
   //   returned value and status.
   //
   // - Modifying the ~value~ or ~offset~ members has no effect, as
   //   the operation has already completed.
   //
   // See <uvm_reg_item> for details on ~rw~ information.
   //
   virtual task post_read(uvm_reg_item rw); endtask


   // Task: post_predict
   //
   // Called by the <uvm_reg_field::predict()> method
   // after a successful UVM_PREDICT_READ or UVM_PREDICT_WRITE prediction.
   //
   // ~previous~ is the previous value in the mirror and
   // ~value~ is the latest predicted value. Any change to ~value~ will
   // modify the predicted mirror value.
   //
   virtual function void post_predict(input uvm_reg_field  fld,
                                      input uvm_reg_data_t previous,
                                      inout uvm_reg_data_t value,
                                      input uvm_predict_e  kind,
                                      input uvm_path_e     path,
                                      input uvm_reg_map    map);
   endfunction


   // Function: encode
   //
   // Data encoder
   //
   // The registered callback methods are invoked in order of registration
   // after all the ~pre_write~ methods have been called.
   // The encoded data is passed through each invocation in sequence.
   // This allows the ~pre_write~ methods to deal with clear-text data.
   //
   // By default, the data is not modified.
   //
   virtual function void encode(ref uvm_reg_data_t data[]);
   endfunction


   // Function: decode
   //
   // Data decode
   //
   // The registered callback methods are invoked in ~reverse order~
   // of registration before all the ~post_read~ methods are called.
   // The decoded data is passed through each invocation in sequence.
   // This allows the ~post_read~ methods to deal with clear-text data.
   //
   // The reversal of the invocation order is to allow the decoding
   // of the data to be performed in the opposite order of the encoding
   // with both operations specified in the same callback extension.
   // 
   // By default, the data is not modified.
   //
   virtual function void decode(ref uvm_reg_data_t data[]);
   endfunction



endclass


//------------------
// Section: Typedefs
//------------------


// Type: uvm_reg_cb
//
// Convenience callback type declaration for registers
//
// Use this declaration to register the register callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_reg, uvm_reg_cbs) uvm_reg_cb;


// Type: uvm_reg_cb_iter
//
// Convenience callback iterator type declaration for registers
//
// Use this declaration to iterate over registered register callbacks
// rather than the more verbose parameterized class
//
typedef uvm_callback_iter#(uvm_reg, uvm_reg_cbs) uvm_reg_cb_iter;


// Type: uvm_reg_bd_cb
//
// Convenience callback type declaration for backdoor
//
// Use this declaration to register register backdoor callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_reg_backdoor, uvm_reg_cbs) uvm_reg_bd_cb;


// Type: uvm_reg_bd_cb_iter
// Convenience callback iterator type declaration for backdoor
//
// Use this declaration to iterate over registered register backdoor callbacks
// rather than the more verbose parameterized class
//

typedef uvm_callback_iter#(uvm_reg_backdoor, uvm_reg_cbs) uvm_reg_bd_cb_iter;


// Type: uvm_mem_cb
//
// Convenience callback type declaration for memories
//
// Use this declaration to register memory callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_mem, uvm_reg_cbs) uvm_mem_cb;


// Type: uvm_mem_cb_iter
//
// Convenience callback iterator type declaration for memories
//
// Use this declaration to iterate over registered memory callbacks
// rather than the more verbose parameterized class
//
typedef uvm_callback_iter#(uvm_mem, uvm_reg_cbs) uvm_mem_cb_iter;


// Type: uvm_reg_field_cb
//
// Convenience callback type declaration for fields
//
// Use this declaration to register field callbacks rather than
// the more verbose parameterized class
//
typedef uvm_callbacks#(uvm_reg_field, uvm_reg_cbs) uvm_reg_field_cb;


// Type: uvm_reg_field_cb_iter
//
// Convenience callback iterator type declaration for fields
//
// Use this declaration to iterate over registered field callbacks
// rather than the more verbose parameterized class
//
typedef uvm_callback_iter#(uvm_reg_field, uvm_reg_cbs) uvm_reg_field_cb_iter;


//-----------------------------
// Group: Predefined Extensions
//-----------------------------

//------------------------------------------------------------------------------
// Class: uvm_reg_read_only_cbs
//
// Pre-defined register callback method for read-only registers
// that will issue an error if a write() operation is attempted.
//
//------------------------------------------------------------------------------

class uvm_reg_read_only_cbs extends uvm_reg_cbs;

   function new(string name = "uvm_reg_read_only_cbs");
      super.new(name);
   endfunction

   `uvm_object_utils(uvm_reg_read_only_cbs)

   
   // Function: pre_write
   //
   // Produces an error message and sets status to <UVM_NOT_OK>.
   //
   virtual task pre_write(uvm_reg_item rw);
      string name = rw.element.get_full_name();
      
      if (rw.status != UVM_IS_OK)
         return;

      if (rw.element_kind == UVM_FIELD) begin
         uvm_reg_field fld;
         uvm_reg rg;
         $cast(fld, rw.element);
         rg = fld.get_parent();
         name = rg.get_full_name();
      end
      
      `uvm_error("UVM/REG/READONLY",
                 {name, " is read-only. Cannot call write() method."});

      rw.status = UVM_NOT_OK;
   endtask

   local static uvm_reg_read_only_cbs m_me;
   local static function uvm_reg_read_only_cbs get();
      if (m_me == null) m_me = new;
      return m_me;
   endfunction


   // Function: add
   //
   // Add this callback to the specified register and its contained fields.
   //
   static function void add(uvm_reg rg);
      uvm_reg_field flds[$];
      
      uvm_reg_cb::add(rg, get());
      rg.get_fields(flds);
      foreach (flds[i]) begin
         uvm_reg_field_cb::add(flds[i], get());
      end
   endfunction


   // Function: remove
   //
   // Remove this callback from the specified register and its contained fields.
   //
   static function void remove(uvm_reg rg);
      uvm_reg_cb_iter cbs = new(rg);
      uvm_reg_field flds[$];

      void'(cbs.first());
      while (cbs.get_cb() != get()) begin
         if (cbs.get_cb() == null)
            return;
         void'(cbs.next());
      end
      uvm_reg_cb::delete(rg, get());
      rg.get_fields(flds);
      foreach (flds[i]) begin
         uvm_reg_field_cb::delete(flds[i], get());
      end
   endfunction
endclass


//------------------------------------------------------------------------------
// Class: uvm_reg_write_only_cbs
//
// Pre-defined register callback method for write-only registers
// that will issue an error if a read() operation is attempted.
//
//------------------------------------------------------------------------------

class uvm_reg_write_only_cbs extends uvm_reg_cbs;

   function new(string name = "uvm_reg_write_only_cbs");
      super.new(name);
   endfunction

   `uvm_object_utils(uvm_reg_write_only_cbs)
   
   // Function: pre_read
   //
   // Produces an error message and sets status to <UVM_NOT_OK>.
   //
   virtual task pre_read(uvm_reg_item rw);
      string name = rw.element.get_full_name();
      
      if (rw.status != UVM_IS_OK)
         return;

      if (rw.element_kind == UVM_FIELD) begin
         uvm_reg_field fld;
         uvm_reg rg;
         $cast(fld, rw.element);
         rg = fld.get_parent();
         name = rg.get_full_name();
      end
      
      `uvm_error("UVM/REG/WRTEONLY",
                 {name, " is write-only. Cannot call read() method."});

      rw.status = UVM_NOT_OK;
   endtask

   local static uvm_reg_write_only_cbs m_me;
   local static function uvm_reg_write_only_cbs get();
      if (m_me == null) m_me = new;
      return m_me;
   endfunction


   // Function: add
   //
   // Add this callback to the specified register and its contained fields.
   //
   static function void add(uvm_reg rg);
      uvm_reg_field flds[$];
      
      uvm_reg_cb::add(rg, get());
      rg.get_fields(flds);
      foreach (flds[i]) begin
         uvm_reg_field_cb::add(flds[i], get());
      end
   endfunction


   // Function: remove
   //
   // Remove this callback from the specified register and its contained fields.
   //
   static function void remove(uvm_reg rg);
      uvm_reg_cb_iter cbs = new(rg);
      uvm_reg_field flds[$];

      void'(cbs.first());
      while (cbs.get_cb() != get()) begin
         if (cbs.get_cb() == null)
            return;
         void'(cbs.next());
      end
      uvm_reg_cb::delete(rg, get());
      rg.get_fields(flds);
      foreach (flds[i]) begin
         uvm_reg_field_cb::delete(flds[i], get());
      end
   endfunction
endclass

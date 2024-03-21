//
//-----------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2013 NVIDIA Corporation
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
//-----------------------------------------------------------------------------

// File: UVM Links
//
// The <uvm_link_base> class, and its extensions, are provided as a mechanism
// to allow for compile-time safety when trying to establish links between
// records within a <uvm_tr_database>.
//
// 

//------------------------------------------------------------------------------
//
// CLASS: uvm_link_base
//
// The ~uvm_link_base~ class presents a simple API for defining a link between
// any two objects.
//
// Using extensions of this class, a <uvm_tr_database> can determine the
// type of links being passed, without relying on "magic" string names.
//
// For example:
// |
// | virtual function void do_establish_link(uvm_link_base link);
// |   uvm_parent_child_link pc_link;
// |   uvm_cause_effect_link ce_link;
// |
// |   if ($cast(pc_link, link)) begin
// |      // Record the parent-child relationship
// |   end
// |   else if ($cast(ce_link, link)) begin
// |      // Record the cause-effect relationship
// |   end
// |   else begin
// |      // Unsupported relationship!
// |   end
// | endfunction : do_establish_link
//
virtual class uvm_link_base extends uvm_object;

   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_link_base");
      super.new(name);
   endfunction : new

   // Group:  Accessors

   // Function: set_lhs
   // Sets the left-hand-side of the link
   //
   // Triggers the <do_set_lhs> callback.
   function void set_lhs(uvm_object lhs);
      do_set_lhs(lhs);
   endfunction : set_lhs

   // Function: get_lhs
   // Gets the left-hand-side of the link
   //
   // Triggers the <do_get_lhs> callback
   function uvm_object get_lhs();
      return do_get_lhs();
   endfunction : get_lhs

   // Function: set_rhs
   // Sets the right-hand-side of the link
   //
   // Triggers the <do_set_rhs> callback.
   function void set_rhs(uvm_object rhs);
      do_set_rhs(rhs);
   endfunction : set_rhs

   // Function: get_rhs
   // Gets the right-hand-side of the link
   //
   // Triggers the <do_get_rhs> callback
   function uvm_object get_rhs();
      return do_get_rhs();
   endfunction : get_rhs

   // Function: set
   // Convenience method for setting both sides in one call.
   //
   // Triggers both the <do_set_rhs> and <do_set_lhs> callbacks.
   function void set(uvm_object lhs, rhs);
      do_set_lhs(lhs);
      do_set_rhs(rhs);
   endfunction : set

   // Group: Implementation Callbacks

   // Function: do_set_lhs
   // Callback for setting the left-hand-side
   pure virtual function void do_set_lhs(uvm_object lhs);

   // Function: do_get_lhs
   // Callback for retrieving the left-hand-side
   pure virtual function uvm_object do_get_lhs();

   // Function: do_set_rhs
   // Callback for setting the right-hand-side
   pure virtual function void do_set_rhs(uvm_object rhs);

   // Function: do_get_rhs
   // Callback for retrieving the right-hand-side
   pure virtual function uvm_object do_get_rhs();

endclass : uvm_link_base

//------------------------------------------------------------------------------
//
// CLASS: uvm_parent_child_link
//
// The ~uvm_parent_child_link~ is used to represent a Parent/Child relationship
// between two objects.
//

class uvm_parent_child_link extends uvm_link_base;

   // Variable- m_lhs,m_rhs
   // Implementation details
   local uvm_object m_lhs;
   local uvm_object m_rhs;

   // Object utils
   `uvm_object_utils_begin(uvm_parent_child_link)
   `uvm_object_utils_end

   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_parent_child_link");
      super.new(name);
   endfunction : new

   // Function: get_link
   // Constructs a pre-filled link
   //
   // This allows for simple one-line link creations.
   // | my_db.establish_link(uvm_parent_child_link::get_link(record1, record2));
   //
   // Parameters:
   // lhs - Left hand side reference
   // rhs - Right hand side reference
   // name - Optional name for the link object
   //
   static function uvm_parent_child_link get_link(uvm_object lhs,
                                                  uvm_object rhs,
                                                  string name="pc_link");
      uvm_parent_child_link pc_link = new(name);
      pc_link.set(lhs, rhs);
      return pc_link;
   endfunction : get_link
   
   // Group: Implementation Callbacks

   // Function: do_set_lhs
   // Sets the left-hand-side (Parent)
   //
   virtual function void do_set_lhs(uvm_object lhs);
      m_lhs = lhs;
   endfunction : do_set_lhs

   // Function: do_get_lhs
   // Retrieves the left-hand-side (Parent)
   //
   virtual function uvm_object do_get_lhs();
      return m_lhs;
   endfunction : do_get_lhs

   // Function: do_set_rhs
   // Sets the right-hand-side (Child)
   //
   virtual function void do_set_rhs(uvm_object rhs);
      m_rhs = rhs;
   endfunction : do_set_rhs

   // Function: do_get_rhs
   // Retrieves the right-hand-side (Child)
   //
   virtual function uvm_object do_get_rhs();
      return m_rhs;
   endfunction : do_get_rhs

endclass : uvm_parent_child_link

//------------------------------------------------------------------------------
//
// CLASS: uvm_cause_effect_link
//
// The ~uvm_cause_effect_link~ is used to represent a Cause/Effect relationship
// between two objects.
//

class uvm_cause_effect_link extends uvm_link_base;

   // Variable- m_lhs,m_rhs
   // Implementation details
   local uvm_object m_lhs;
   local uvm_object m_rhs;

   // Object utils
   `uvm_object_utils_begin(uvm_cause_effect_link)
   `uvm_object_utils_end

   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_cause_effect_link");
      super.new(name);
   endfunction : new

   // Function: get_link
   // Constructs a pre-filled link
   //
   // This allows for simple one-line link creations.
   // | my_db.establish_link(uvm_cause_effect_link::get_link(record1, record2));
   //
   // Parameters:
   // lhs - Left hand side reference
   // rhs - Right hand side reference
   // name - Optional name for the link object
   //
   static function uvm_cause_effect_link get_link(uvm_object lhs,
                                                 uvm_object rhs,
                                                 string name="ce_link");
      uvm_cause_effect_link ce_link = new(name);
      ce_link.set(lhs, rhs);
      return ce_link;
   endfunction : get_link
   
   // Group: Implementation Callbacks

   // Function: do_set_lhs
   // Sets the left-hand-side (Cause)
   //
   virtual function void do_set_lhs(uvm_object lhs);
      m_lhs = lhs;
   endfunction : do_set_lhs

   // Function: do_get_lhs
   // Retrieves the left-hand-side (Cause)
   //
   virtual function uvm_object do_get_lhs();
      return m_lhs;
   endfunction : do_get_lhs

   // Function: do_set_rhs
   // Sets the right-hand-side (Effect)
   //
   virtual function void do_set_rhs(uvm_object rhs);
      m_rhs = rhs;
   endfunction : do_set_rhs

   // Function: do_get_rhs
   // Retrieves the right-hand-side (Effect)
   //
   virtual function uvm_object do_get_rhs();
      return m_rhs;
   endfunction : do_get_rhs

endclass : uvm_cause_effect_link

//------------------------------------------------------------------------------
//
// CLASS: uvm_related_link
//
// The ~uvm_related_link~ is used to represent a generic "is related" link
// between two objects.
//

class uvm_related_link extends uvm_link_base;

   // Variable- m_lhs,m_rhs
   // Implementation details
   local uvm_object m_lhs;
   local uvm_object m_rhs;

   // Object utils
   `uvm_object_utils_begin(uvm_related_link)
   `uvm_object_utils_end

   // Function: new
   // Constructor
   //
   // Parameters:
   // name - Instance name
   function new(string name="unnamed-uvm_related_link");
      super.new(name);
   endfunction : new

   // Function: get_link
   // Constructs a pre-filled link
   //
   // This allows for simple one-line link creations.
   // | my_db.establish_link(uvm_related_link::get_link(record1, record2));
   //
   // Parameters:
   // lhs - Left hand side reference
   // rhs - Right hand side reference
   // name - Optional name for the link object
   //
   static function uvm_related_link get_link(uvm_object lhs,
                                                 uvm_object rhs,
                                                 string name="ce_link");
      uvm_related_link ce_link = new(name);
      ce_link.set(lhs, rhs);
      return ce_link;
   endfunction : get_link
   
   // Group: Implementation Callbacks

   // Function: do_set_lhs
   // Sets the left-hand-side
   //
   virtual function void do_set_lhs(uvm_object lhs);
      m_lhs = lhs;
   endfunction : do_set_lhs

   // Function: do_get_lhs
   // Retrieves the left-hand-side
   //
   virtual function uvm_object do_get_lhs();
      return m_lhs;
   endfunction : do_get_lhs

   // Function: do_set_rhs
   // Sets the right-hand-side
   //
   virtual function void do_set_rhs(uvm_object rhs);
      m_rhs = rhs;
   endfunction : do_set_rhs

   // Function: do_get_rhs
   // Retrieves the right-hand-side
   //
   virtual function uvm_object do_get_rhs();
      return m_rhs;
   endfunction : do_get_rhs

endclass : uvm_related_link



//----------------------------------------------------------------------
//   Copyright 2010 Mentor Graphics Corporation
//   Copyright 2011 Cadence Design Systems, Inc. 
//   Copyright 2011 Synopsys, Inc.
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
//----------------------------------------------------------------------


//------------------------------------------------------------------------------
//
// CLASS- uvm_resource_converter#(T)
//
// The uvm_resource_converter class provides a policy object for doing
// convertion from resource value to string.
//
//------------------------------------------------------------------------------
class m_uvm_resource_converter #(type T=int);

   // Function- convert2string
   // Convert a value of type ~T~ to a string that can be displayed.
   //
   // By default, returns the name of the type
   //
   virtual function string convert2string(T val);
        return {"(", `uvm_typename(val), ") ?"};
   endfunction
endclass

//----------------------------------------------------------------------
//
// CLASS- uvm_resource_default_converter
// Define a default resource value converter using '%p'.
//
// May be used for almost all types, except virtual interfaces.
// Default resource converters are already defined for the
// built-in singular types using the <uvm_resource_default_converters>
// class.
//
//----------------------------------------------------------------------

class m_uvm_resource_default_converter#(type T=int) extends m_uvm_resource_converter#(T);
   local static m_uvm_resource_default_converter#(T) m_singleton;
   local string m_name;
   
   virtual function string convert2string(T val);
      return $sformatf("(%s) %0p", (m_name=="")? `uvm_typename(val):m_name, val);
   endfunction

   local function new();
   endfunction
   
   // Function- register
   // Register this policy class as the resource value conversion function
   // for this resource type.
   //
   //| uvm_resource_default_converter#(bit[7:0])::register();
   //
   // If a ~typename~ is specified, it will be used as the name of the type
   // instead of the name returned by the <uvm_resource_converter#(T)::typename()> method.
   //

   static function bit register(string typename = "");
      if (m_singleton == null) begin
         m_singleton = new();
         m_singleton.m_name = typename;
      end
      uvm_resource#(T)::m_set_converter(m_singleton);
      return 1;
   endfunction
endclass


//----------------------------------------------------------------------
//
// CLASS- uvm_resource_convert2string_converter
// Define a default resource value converter using convert2string() method
//
// May be used for all class types that contain a ~convert2string()~ method,
// such as <uvm_object>.
//
//----------------------------------------------------------------------

class m_uvm_resource_convert2string_converter#(type T=int) extends m_uvm_resource_converter#(T);
   local static m_uvm_resource_convert2string_converter #(T) m_singleton;
 
   virtual function string convert2string(T val);   
      return $sformatf("(%s) %0s", `uvm_typename(val),
                       (val == null) ? "(null)" : val.convert2string());
   endfunction

   local function new();
   endfunction

   // Function- register
   // Register this policy class as the resource value conversion function
   // for this resource type.
   //
   //| uvm_resource_convert2string_converter#(my_obj)::register();
   //
   static function bit register();
      if (m_singleton == null) m_singleton = new();
      uvm_resource#(T)::m_set_converter(m_singleton);
      return 1;
   endfunction
endclass
    
//----------------------------------------------------------------------
//
// CLASS- uvm_resource_sprint_converter
// Define a default resource value converter using sprint() method
//
// May be used for all class types that contain a ~sprint()~ method,
// such as <uvm_object>.
//
//----------------------------------------------------------------------

class m_uvm_resource_sprint_converter#(type T=int) extends m_uvm_resource_converter#(T);
   local static m_uvm_resource_sprint_converter #(T) m_singleton;

   virtual function string convert2string(T val);
      return $sformatf("(%s) %0s", `uvm_typename(val),
                       (val == null) ? "(null)" : {"\n",val.sprint()});
   endfunction
   
   local function new();
   endfunction

   // Function- register
   // Register this policy class as the resource value conversion function
   // for this resource type.
   //
   //| void'(uvm_resource_sprint_converter#(my_obj)::register());
   //
   static function bit register();
      if (m_singleton == null) m_singleton = new();
      uvm_resource#(T)::m_set_converter(m_singleton);
      return 1;
   endfunction
endclass


//
// CLASS- m_uvm_resource_default_converters
// Singleton used to register default resource value converters
// for the built-in singular types.
//
class m_uvm_resource_default_converters;
   
   local static bit m_singleton = register();
   local function new();
   endfunction

   // Function- register
   // Explicitly initialize the singleton to eliminate race conditions
   //
   static function bit register();
      if (!m_singleton) begin

         `define __built_in(T) void'(m_uvm_resource_default_converter#(T)::register(`"T`"))
            
         `__built_in(shortint);
         `__built_in(int);
         `__built_in(longint);
         `__built_in(byte);
         `__built_in(bit);
         `__built_in(logic);
         `__built_in(reg);
         `__built_in(integer);
         `__built_in(time);
         `__built_in(real);
         `__built_in(realtime);
         `__built_in(string);
         `__built_in(uvm_bitstream_t);
         `__built_in(bit[7:0]);
         `__built_in(bit[15:0]);
         `__built_in(bit[31:0]);

         `undef __built_in

         m_singleton = 1;
      end
      return 1;
   endfunction
endclass


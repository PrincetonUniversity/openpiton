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

`ifndef UVM_REGISTRY_SVH
`define UVM_REGISTRY_SVH

//------------------------------------------------------------------------------
// Title: Factory Component and Object Wrappers
//
// Topic: Intro
//
// This section defines the proxy component and object classes used by the
// factory. To avoid the overhead of creating an instance of every component
// and object that get registered, the factory holds lightweight wrappers,
// or proxies. When a request for a new object is made, the factory calls upon
// the proxy to create the object it represents. 
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: uvm_component_registry #(T,Tname)
//
// The uvm_component_registry serves as a lightweight proxy for a component of
// type ~T~ and type name ~Tname~, a string. The proxy enables efficient
// registration with the <uvm_factory>. Without it, registration would
// require an instance of the component itself.
//
// See <Usage> section below for information on using uvm_component_registry.
//
//------------------------------------------------------------------------------

class uvm_component_registry #(type T=uvm_component, string Tname="<unknown>")
                                           extends uvm_object_wrapper;
  typedef uvm_component_registry #(T,Tname) this_type;


  // Function: create_component
  //
  // Creates a component of type T having the provided ~name~ and ~parent~.
  // This is an override of the method in <uvm_object_wrapper>. It is
  // called by the factory after determining the type of object to create.
  // You should not call this method directly. Call <create> instead.

  virtual function uvm_component create_component (string name,
                                                   uvm_component parent);
    T obj;
    obj = new(name, parent);
    return obj;
  endfunction


  const static string type_name = Tname;

  // Function: get_type_name
  //
  // Returns the value given by the string parameter, ~Tname~. This method
  // overrides the method in <uvm_object_wrapper>.

  virtual function string get_type_name();
    return type_name;
  endfunction

  local static this_type me = get();


  // Function: get
  //
  // Returns the singleton instance of this type. Type-based factory operation
  // depends on there being a single proxy instance for each registered type. 

  static function this_type get();
    if (me == null) begin
  	  uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
  	  uvm_factory factory=cs.get_factory();
      me = new;
      factory.register(me);
    end
    return me;
  endfunction


  // Function: create
  //
  // Returns an instance of the component type, ~T~, represented by this proxy,
  // subject to any factory overrides based on the context provided by the
  // ~parent~'s full name. The ~contxt~ argument, if supplied, supersedes the
  // ~parent~'s context. The new instance will have the given leaf ~name~
  // and ~parent~.

  static function T create(string name, uvm_component parent, string contxt="");
    uvm_object obj;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    if (contxt == "" && parent != null)
      contxt = parent.get_full_name();
    obj = factory.create_component_by_type(get(),contxt,name,parent);
    if (!$cast(create, obj)) begin
      string msg;
      msg = {"Factory did not return a component of type '",type_name,
        "'. A component of type '",obj == null ? "null" : obj.get_type_name(),
        "' was returned instead. Name=",name," Parent=",
        parent==null?"null":parent.get_type_name()," contxt=",contxt};
      uvm_report_fatal("FCTTYP", msg, UVM_NONE);
    end
  endfunction


  // Function: set_type_override
  //
  // Configures the factory to create an object of the type represented by
  // ~override_type~ whenever a request is made to create an object of the type,
  // ~T~, represented by this proxy, provided no instance override applies. The
  // original type, ~T~, is typically a super class of the override type. 

  static function void set_type_override (uvm_object_wrapper override_type,
                                          bit replace=1);
    uvm_coreservice_t cs = uvm_coreservice_t::get();
    uvm_factory factory=cs.get_factory();                                          
    factory.set_type_override_by_type(get(),override_type,replace);
  endfunction


  // Function: set_inst_override
  //
  // Configures the factory to create a component of the type represented by
  // ~override_type~ whenever a request is made to create an object of the type,
  // ~T~, represented by this proxy,  with matching instance paths. The original
  // type, ~T~, is typically a super class of the override type.
  //
  // If ~parent~ is not specified, ~inst_path~ is interpreted as an absolute
  // instance path, which enables instance overrides to be set from outside
  // component classes. If ~parent~ is specified, ~inst_path~ is interpreted
  // as being relative to the ~parent~'s hierarchical instance path, i.e.
  // ~{parent.get_full_name(),".",inst_path}~ is the instance path that is
  // registered with the override. The ~inst_path~ may contain wildcards for
  // matching against multiple contexts.

  static function void set_inst_override(uvm_object_wrapper override_type,
                                         string inst_path,
                                         uvm_component parent=null);
    string full_inst_path;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    
    if (parent != null) begin
      if (inst_path == "")
        inst_path = parent.get_full_name();
      else
        inst_path = {parent.get_full_name(),".",inst_path};
    end
    factory.set_inst_override_by_type(get(),override_type,inst_path);
  endfunction

endclass


//------------------------------------------------------------------------------
//
// CLASS: uvm_object_registry #(T,Tname)
//
// The uvm_object_registry serves as a lightweight proxy for a <uvm_object> of
// type ~T~ and type name ~Tname~, a string. The proxy enables efficient
// registration with the <uvm_factory>. Without it, registration would
// require an instance of the object itself.
//
// See <Usage> section below for information on using uvm_component_registry.
//
//------------------------------------------------------------------------------

class uvm_object_registry #(type T=uvm_object, string Tname="<unknown>")
                                        extends uvm_object_wrapper;
  typedef uvm_object_registry #(T,Tname) this_type;

  // Function: create_object
  //
  // Creates an object of type ~T~ and returns it as a handle to a
  // <uvm_object>. This is an override of the method in <uvm_object_wrapper>.
  // It is called by the factory after determining the type of object to create.
  // You should not call this method directly. Call <create> instead.

  virtual function uvm_object create_object(string name="");
    T obj;
`ifdef UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR
    obj = new();
    if (name!="")
      obj.set_name(name);
`else
    if (name=="") obj = new();
    else obj = new(name);
`endif
    return obj;
  endfunction

  const static string type_name = Tname;

  // Function: get_type_name
  //
  // Returns the value given by the string parameter, ~Tname~. This method
  // overrides the method in <uvm_object_wrapper>.

  virtual function string get_type_name();
    return type_name;
  endfunction

  local static this_type me = get();

  // Function: get
  //
  // Returns the singleton instance of this type. Type-based factory operation
  // depends on there being a single proxy instance for each registered type. 

  static function this_type get();
    if (me == null) begin
      uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
      uvm_factory factory=cs.get_factory();
      me = new;
      factory.register(me);
    end
    return me;
  endfunction


  // Function: create
  //
  // Returns an instance of the object type, ~T~, represented by this proxy,
  // subject to any factory overrides based on the context provided by the
  // ~parent~'s full name. The ~contxt~ argument, if supplied, supersedes the
  // ~parent~'s context. The new instance will have the given leaf ~name~,
  // if provided.

  static function T create (string name="", uvm_component parent=null,
                            string contxt="");
    uvm_object obj;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
  
    if (contxt == "" && parent != null)
      contxt = parent.get_full_name();
    obj = factory.create_object_by_type(get(),contxt,name);
    if (!$cast(create, obj)) begin
      string msg;
      msg = {"Factory did not return an object of type '",type_name,
        "'. A component of type '",obj == null ? "null" : obj.get_type_name(),
        "' was returned instead. Name=",name," Parent=",
        parent==null?"null":parent.get_type_name()," contxt=",contxt};
      uvm_report_fatal("FCTTYP", msg, UVM_NONE);
    end
  endfunction


  // Function: set_type_override
  //
  // Configures the factory to create an object of the type represented by
  // ~override_type~ whenever a request is made to create an object of the type
  // represented by this proxy, provided no instance override applies. The
  // original type, ~T~, is typically a super class of the override type. 

  static function void set_type_override (uvm_object_wrapper override_type,
                                          bit replace=1);
    uvm_coreservice_t cs = uvm_coreservice_t::get();
    uvm_factory factory=cs.get_factory();
    factory.set_type_override_by_type(get(),override_type,replace);
  endfunction


  // Function: set_inst_override
  //
  // Configures the factory to create an object of the type represented by
  // ~override_type~ whenever a request is made to create an object of the type
  // represented by this proxy, with matching instance paths. The original
  // type, ~T~, is typically a super class of the override type.
  //
  // If ~parent~ is not specified, ~inst_path~ is interpreted as an absolute
  // instance path, which enables instance overrides to be set from outside
  // component classes. If ~parent~ is specified, ~inst_path~ is interpreted
  // as being relative to the ~parent~'s hierarchical instance path, i.e.
  // ~{parent.get_full_name(),".",inst_path}~ is the instance path that is
  // registered with the override. The ~inst_path~ may contain wildcards for
  // matching against multiple contexts.

  static function void set_inst_override(uvm_object_wrapper override_type,
                                         string inst_path,
                                         uvm_component parent=null);
    string full_inst_path;
    uvm_coreservice_t cs = uvm_coreservice_t::get();                                                     
    uvm_factory factory=cs.get_factory();
    
    if (parent != null) begin
      if (inst_path == "")
        inst_path = parent.get_full_name();
      else
        inst_path = {parent.get_full_name(),".",inst_path};
    end
    factory.set_inst_override_by_type(get(),override_type,inst_path);
  endfunction

endclass


// Group: Usage
//
// This section describes usage for the uvm_*_registry classes.
//
// The wrapper classes are used to register lightweight proxies of objects and
// components.
//
// To register a particular component type, you need only typedef a
// specialization of its proxy class, which is typically done inside the class.
//
// For example, to register a UVM component of type ~mycomp~
//
//|  class mycomp extends uvm_component;
//|    typedef uvm_component_registry #(mycomp,"mycomp") type_id;
//|  endclass
//
// However, because of differences between simulators, it is necessary to use a
// macro to ensure vendor interoperability with factory registration. To
// register a UVM component of type ~mycomp~ in a vendor-independent way, you
// would write instead:
//
//|  class mycomp extends uvm_component;
//|    `uvm_component_utils(mycomp);
//|    ...
//|  endclass
//
// The <`uvm_component_utils> macro is for non-parameterized classes. In this
// example, the typedef underlying the macro specifies the ~Tname~
// parameter as "mycomp", and ~mycomp~'s get_type_name() is defined to return 
// the same. With ~Tname~ defined, you can use the factory's name-based methods to
// set overrides and create objects and components of non-parameterized types.
//
// For parameterized types, the type name changes with each specialization, so
// you cannot specify a ~Tname~ inside a parameterized class and get the behavior
// you want; the same type name string would be registered for all
// specializations of the class! (The factory would produce warnings for each
// specialization beyond the first.) To avoid the warnings and simulator
// interoperability issues with parameterized classes, you must register
// parameterized classes with a different macro.
//
// For example, to register a UVM component of type driver #(T), you
// would write:
//
//|  class driver #(type T=int) extends uvm_component;
//|    `uvm_component_param_utils(driver #(T));
//|    ...
//|  endclass
//
// The <`uvm_component_param_utils> and <`uvm_object_param_utils> macros are used
// to register parameterized classes with the factory. Unlike the non-param
// versions, these macros do not specify the ~Tname~ parameter in the underlying
// uvm_component_registry typedef, and they do not define the get_type_name
// method for the user class. Consequently, you will not be able to use the
// factory's name-based methods for parameterized classes.
//
// The primary purpose for adding the factory's type-based methods was to
// accommodate registration of parameterized types and eliminate the many sources
// of errors associated with string-based factory usage. Thus, use of name-based
// lookup in <uvm_factory> is no longer recommended.

`endif // UVM_REGISTRY_SVH


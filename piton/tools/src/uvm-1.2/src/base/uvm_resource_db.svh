//----------------------------------------------------------------------
//   Copyright 2011 Cypress Semiconductor
//   Copyright 2010 Mentor Graphics Corporation
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

//----------------------------------------------------------------------
// Title: UVM Resource Database
//
// Topic: Intro
//
// The <uvm_resource_db> class provides a convenience interface for
// the resources facility.  In many cases basic operations such as
// creating and setting a resource or getting a resource could take
// multiple lines of code using the interfaces in <uvm_resource_base> or
// <uvm_resource#(T)>.  The convenience layer in <uvm_resource_db>
// reduces many of those operations to a single line of code.
//
// If the run-time ~+UVM_RESOURCE_DB_TRACE~ command line option is
// specified, all resource DB accesses (read and write) are displayed.
//----------------------------------------------------------------------

typedef class uvm_resource_db_options;
typedef class uvm_cmdline_processor;

//----------------------------------------------------------------------
// class: uvm_resource_db
//
// All of the functions in uvm_resource_db#(T) are static, so they
// must be called using the :: operator.  For example:
//
//|  uvm_resource_db#(int)::set("A", "*", 17, this);
//
// The parameter value "int" identifies the resource type as
// uvm_resource#(int).  Thus, the type of the object in the resource
// container is int. This maintains the type-safety characteristics of
// resource operations.
//
//----------------------------------------------------------------------
class uvm_resource_db #(type T=uvm_object);

  typedef uvm_resource #(T) rsrc_t;

  protected function new();
  endfunction

  // function: get_by_type
  //
  // Get a resource by type.  The type is specified in the db
  // class parameter so the only argument to this function is the
  // ~scope~.

  static function rsrc_t get_by_type(string scope);
    return rsrc_t::get_by_type(scope, rsrc_t::get_type());
  endfunction

  // function: get_by_name
  //
  // Imports a resource by ~name~.  The first argument is the current 
  // ~scope~ of the resource to be retrieved and the second argument is
  // the ~name~. The ~rpterr~ flag indicates whether or not to generate
  // a warning if no matching resource is found.

  static function rsrc_t get_by_name(string scope,
                                     string name,
                                     bit rpterr=1);

    return rsrc_t::get_by_name(scope, name, rpterr);
  endfunction

  // function: set_default
  //
  // add a new item into the resources database.  The item will not be
  // written to so it will have its default value. The resource is
  // created using ~name~ and ~scope~ as the lookup parameters.

  static function rsrc_t set_default(string scope, string name);

    rsrc_t r;
    
    r = new(name, scope);
    r.set();
    return r;
  endfunction

  // function- show_msg

  // internal helper function to print resource accesses

  protected static function void m_show_msg(
          input string id,
          input string rtype,
          input string action,
          input string scope,
          input string name,
          input uvm_object accessor,
          input rsrc_t rsrc);

          T foo;
          string msg=`uvm_typename(foo);

          $sformat(msg, "%s '%s%s' (type %s) %s by %s = %s",
              rtype,scope, name=="" ? "" : {".",name}, msg,action,
              (accessor != null) ? accessor.get_full_name() : "<unknown>",
              rsrc==null?"null (failed lookup)":rsrc.convert2string());

          `uvm_info(id, msg, UVM_LOW)
  endfunction

  // function: set
  //
  // Create a new resource, write a ~val~ to it, and set it into the
  // database using ~name~ and ~scope~ as the lookup parameters. The
  // ~accessor~ is used for auditing.
  static function void set(input string scope, input string name,
                           T val, input uvm_object accessor = null);

    rsrc_t rsrc = new(name, scope);
    rsrc.write(val, accessor);
    rsrc.set();

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/SET", "Resource","set", scope, name, accessor, rsrc);
  endfunction

  // function: set_anonymous
  //
  // Create a new resource, write a ~val~ to it, and set it into the
  // database.  The resource has no name and therefore will not be
  // entered into the name map. But is does have a ~scope~ for lookup
  // purposes. The ~accessor~ is used for auditing.
  static function void set_anonymous(input string scope,
                                     T val, input uvm_object accessor = null);

    rsrc_t rsrc = new("", scope);
    rsrc.write(val, accessor);
    rsrc.set();

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/SETANON","Resource", "set", scope, "", accessor, rsrc);
  endfunction

  // function set_override
  //
  // Create a new resource, write ~val~ to it, and set it into the
  // database.  Set it at the beginning of the queue in the type map and
  // the name map so that it will be (currently) the highest priority
  // resource with the specified name and type.

  static function void set_override(input string scope, input string name,
                                    T val, uvm_object accessor = null);
    rsrc_t rsrc = new(name, scope);
    rsrc.write(val, accessor);
    rsrc.set_override();

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/SETOVRD", "Resource","set", scope, name, accessor, rsrc);
  endfunction


    
  // function set_override_type
  //
  // Create a new resource, write ~val~ to it, and set it into the
  // database.  Set it at the beginning of the queue in the type map so
  // that it will be (currently) the highest priority resource with the
  // specified type. It will be normal priority (i.e. at the end of the
  // queue) in the name map.

  static function void set_override_type(input string scope, input string name,
                                         T val, uvm_object accessor = null);
    rsrc_t rsrc = new(name, scope);
    rsrc.write(val, accessor);
    rsrc.set_override(uvm_resource_types::TYPE_OVERRIDE);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/SETOVRDTYP","Resource", "set", scope, name, accessor, rsrc);
  endfunction

  // function set_override_name
  //
  // Create a new resource, write ~val~ to it, and set it into the
  // database.  Set it at the beginning of the queue in the name map so
  // that it will be (currently) the highest priority resource with the
  // specified name. It will be normal priority (i.e. at the end of the
  // queue) in the type map.

  static function void set_override_name(input string scope, input string name,
                                  T val, uvm_object accessor = null);
    rsrc_t rsrc = new(name, scope);
    rsrc.write(val, accessor);
    rsrc.set_override(uvm_resource_types::NAME_OVERRIDE);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/SETOVRDNAM","Resource", "set", scope, name, accessor, rsrc);
  endfunction

  // function: read_by_name
  //
  // locate a resource by ~name~ and ~scope~ and read its value. The value 
  // is returned through the output argument ~val~.  The return value is a bit 
  // that indicates whether or not the read was successful. The ~accessor~
  // is used for auditing.
  static function bit read_by_name(input string scope,
                                   input string name,
                                   inout T val, input uvm_object accessor = null);

    rsrc_t rsrc = get_by_name(scope, name);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/RDBYNAM","Resource", "read", scope, name, accessor, rsrc);

    if(rsrc == null)
      return 0;

    val = rsrc.read(accessor);

    return 1;
  
  endfunction

  // function: read_by_type
  //
  // Read a value by type.  The value is returned through the output
  // argument ~val~.  The ~scope~ is used for the lookup. The return
  // value is a bit that indicates whether or not the read is successful.
  // The ~accessor~ is used for auditing.
  static function bit read_by_type(input string scope,
                                   inout T val,
                                   input uvm_object accessor = null);
    
    rsrc_t rsrc = get_by_type(scope);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/RDBYTYP", "Resource","read", scope, "", accessor, rsrc);

    if(rsrc == null)
      return 0;

    val = rsrc.read(accessor);

    return 1;

  endfunction

  // function: write_by_name
  //
  // write a ~val~ into the resources database.  First, look up the
  // resource by ~name~ and ~scope~.  If it is not located then add a new 
  // resource to the database and then write its value.
  //
  // Because the ~scope~ is matched to a resource which may be a
  // regular expression, and consequently may target other scopes beyond
  // the ~scope~ argument. Care must be taken with this function. If
  // a <get_by_name> match is found for ~name~ and ~scope~ then ~val~
  // will be written to that matching resource and thus may impact
  // other scopes which also match the resource.
  static function bit write_by_name(input string scope, input string name,
                                    input T val, input uvm_object accessor = null);

    rsrc_t rsrc = get_by_name(scope, name);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/WR","Resource", "written", scope, name, accessor, rsrc);

    if(rsrc == null)
      return 0;

    rsrc.write(val, accessor);

    return 1;

  endfunction

  // function: write_by_type
  //
  // write a ~val~ into the resources database.  First, look up the
  // resource by type.  If it is not located then add a new resource to
  // the database and then write its value.
  //
  // Because the ~scope~ is matched to a resource which may be a
  // regular expression, and consequently may target other scopes beyond
  // the ~scope~ argument. Care must be taken with this function. If
  // a <get_by_name> match is found for ~name~ and ~scope~ then ~val~
  // will be written to that matching resource and thus may impact
  // other scopes which also match the resource.
  static function bit write_by_type(input string scope,
                                    input T val, input uvm_object accessor = null);

    rsrc_t rsrc = get_by_type(scope);

    if(uvm_resource_db_options::is_tracing())
      m_show_msg("RSRCDB/WRTYP", "Resource","written", scope, "", accessor, rsrc);

    if(rsrc == null)
      return 0;

    rsrc.write(val, accessor);

    return 1;
  endfunction

  // function: dump
  //
  // Dump all the resources in the resource pool. This is useful for
  // debugging purposes.  This function does not use the parameter T, so
  // it will dump the same thing -- the entire database -- no matter the
  // value of the parameter.

  static function void dump();
    uvm_resource_pool rp = uvm_resource_pool::get();
    rp.dump();
  endfunction

endclass


//----------------------------------------------------------------------
// Class: uvm_resource_db_options
//
// Provides a namespace for managing options for the
// resources DB facility.  The only thing allowed in this class is static
// local data members and static functions for manipulating and
// retrieving the value of the data members.  The static local data
// members represent options and settings that control the behavior of
// the resources DB facility.

// Options include:
//
//  * tracing:  on/off
//
//    The default for tracing is off.
//
//----------------------------------------------------------------------
class uvm_resource_db_options;
   
  static local bit ready;
  static local bit tracing;

  // Function: turn_on_tracing
  //
  // Turn tracing on for the resource database. This causes all
  // reads and writes to the database to display information about
  // the accesses. Tracing is off by default.
  //
  // This method is implicitly called by the ~+UVM_RESOURCE_DB_TRACE~.

  static function void turn_on_tracing();
     if (!ready) init();
    tracing = 1;
  endfunction

  // Function: turn_off_tracing
  //
  // Turn tracing off for the resource database.

  static function void turn_off_tracing();
     if (!ready) init();
    tracing = 0;
  endfunction

  // Function: is_tracing
  //
  // Returns 1 if the tracing facility is on and 0 if it is off.

  static function bit is_tracing();
    if (!ready) init();
    return tracing;
  endfunction


  static local function void init();
     uvm_cmdline_processor clp;
     string trace_args[$];
     
     clp = uvm_cmdline_processor::get_inst();

     if (clp.get_arg_matches("+UVM_RESOURCE_DB_TRACE", trace_args)) begin
        tracing = 1;
     end

     ready = 1;
  endfunction

endclass

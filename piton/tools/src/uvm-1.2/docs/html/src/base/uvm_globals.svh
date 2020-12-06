// 
//------------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010-2011 Synopsys, Inc.
//   Copyright 2013-2014 NVIDIA Corporation
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


// Title: Globals

//------------------------------------------------------------------------------
//
// Group: Simulation Control
//
//------------------------------------------------------------------------------

// Task: run_test
//
// Convenience function for uvm_top.run_test(). See <uvm_root> for more
// information.

task run_test (string test_name="");
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.run_test(test_name);
endtask


`ifndef UVM_NO_DEPRECATED
// Variable- uvm_test_done - DEPRECATED
//
// An instance of the <uvm_test_done_objection> class, this object is
// used by components to coordinate when to end the currently running
// task-based phase. When all participating components have dropped their
// raised objections, an implicit call to <global_stop_request> is issued
// to end the run phase (or any other task-based phase).

const uvm_test_done_objection uvm_test_done = uvm_test_done_objection::get();


// Method- global_stop_request  - DEPRECATED
//
// Convenience function for uvm_test_done.stop_request(). See 
// <uvm_test_done_objection::stop_request> for more information.

function void global_stop_request();
  uvm_test_done_objection tdo;
  tdo = uvm_test_done_objection::get();
  tdo.stop_request();
endfunction


// Method- set_global_timeout  - DEPRECATED
//
// Convenience function for uvm_top.set_timeout(). See 
// <uvm_root::set_timeout> for more information.  The overridable bit 
// controls whether subsequent settings will be honored.


function void set_global_timeout(time timeout, bit overridable = 1);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.set_timeout(timeout,overridable);
endfunction


// Function- set_global_stop_timeout - DEPRECATED
//
// Convenience function for uvm_test_done.stop_timeout = timeout.
// See <uvm_uvm_test_done::stop_timeout> for more information.

function void set_global_stop_timeout(time timeout);
  uvm_test_done_objection tdo;
  tdo = uvm_test_done_objection::get();
  tdo.stop_timeout = timeout;
endfunction
`endif


//----------------------------------------------------------------------------
//
// Group: Reporting
//
//----------------------------------------------------------------------------


// Function: uvm_get_report_object
//
// Returns the nearest uvm_report_object when called.  
// For the global version, it returns uvm_root.
//
function uvm_report_object uvm_get_report_object();
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  return top;
endfunction


// Function: uvm_report_enabled
//
// Returns 1 if the configured verbosity in ~uvm_top~ for this 
// severity/id is greater than or equal to ~verbosity~ else returns 0.
// 
// See also <uvm_report_object::uvm_report_enabled>.
//
// Static methods of an extension of uvm_report_object, e.g. uvm_component-based
// objects, cannot call ~uvm_report_enabled~ because the call will resolve to
// the <uvm_report_object::uvm_report_enabled>, which is non-static.
// Static methods cannot call non-static methods of the same class. 

function int uvm_report_enabled (int verbosity,
                                 uvm_severity severity=UVM_INFO, string id="");
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  return top.uvm_report_enabled(verbosity,severity,id);
endfunction

// Function: uvm_report

function void uvm_report( uvm_severity severity,
                          string id,
                          string message,
                          int verbosity = (severity == uvm_severity'(UVM_ERROR)) ? UVM_LOW :
                                          (severity == uvm_severity'(UVM_FATAL)) ? UVM_NONE : UVM_MEDIUM,
                          string filename = "",
                          int line = 0,
                          string context_name = "",
                          bit report_enabled_checked = 0);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_report(severity, id, message, verbosity, filename, line, context_name, report_enabled_checked);
endfunction 

// Undocumented DPI available version of uvm_report
export "DPI-C" function m__uvm_report_dpi;
function void m__uvm_report_dpi(int severity,
                                string id,
                                string message,
                                int    verbosity,
                                string filename,
                                int    line);
   uvm_report(uvm_severity'(severity), id, message, verbosity, filename, line);
endfunction : m__uvm_report_dpi

// Function: uvm_report_info

function void uvm_report_info(string id,
			      string message,
                              int verbosity = UVM_MEDIUM,
			      string filename = "",
			      int line = 0,
                              string context_name = "",
                              bit report_enabled_checked = 0);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_report_info(id, message, verbosity, filename, line, context_name,
    report_enabled_checked);
endfunction


// Function: uvm_report_warning

function void uvm_report_warning(string id,
                                 string message,
                                 int verbosity = UVM_MEDIUM,
				 string filename = "",
				 int line = 0,
                                 string context_name = "",
                                 bit report_enabled_checked = 0);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_report_warning(id, message, verbosity, filename, line, context_name,
    report_enabled_checked);
endfunction


// Function: uvm_report_error

function void uvm_report_error(string id,
                               string message,
                               int verbosity = UVM_LOW,
			       string filename = "",
			       int line = 0,
                               string context_name = "",
                               bit report_enabled_checked = 0);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_report_error(id, message, verbosity, filename, line, context_name,
    report_enabled_checked);
endfunction


// Function: uvm_report_fatal
//
// These methods, defined in package scope, are convenience functions that
// delegate to the corresponding component methods in ~uvm_top~. They can be
// used in module-based code to use the same reporting mechanism as class-based
// components. See <uvm_report_object> for details on the reporting mechanism. 
//
// *Note:* Verbosity is ignored for warnings, errors, and fatals to ensure users
// do not inadvertently filter them out. It remains in the methods for backward
// compatibility.

function void uvm_report_fatal(string id,
	                       string message,
                               int verbosity = UVM_NONE,
			       string filename = "",
			       int line = 0,
                               string context_name = "",
                               bit report_enabled_checked = 0);
  uvm_root top;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_report_fatal(id, message, verbosity, filename, line, context_name,
    report_enabled_checked);
endfunction


// Function: uvm_process_report_message
//
// This method, defined in package scope, is a convenience function that
// delegate to the corresponding component method in ~uvm_top~. It can be
// used in module-based code to use the same reporting mechanism as class-based
// components. See <uvm_report_object> for details on the reporting mechanism.

function void uvm_process_report_message(uvm_report_message report_message);
  uvm_root top;
  uvm_coreservice_t cs;
  process p;
  p = process::self();
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.uvm_process_report_message(report_message);
endfunction


// TODO merge with uvm_enum_wrapper#(uvm_severity)
function bit uvm_string_to_severity (string sev_str, output uvm_severity sev);
  case (sev_str)
    "UVM_INFO": sev = UVM_INFO;
    "UVM_WARNING": sev = UVM_WARNING;
    "UVM_ERROR": sev = UVM_ERROR;
    "UVM_FATAL": sev = UVM_FATAL;
    default: return 0;
  endcase
  return 1;
endfunction


function automatic bit uvm_string_to_action (string action_str, output uvm_action action);
  string actions[$];
  uvm_split_string(action_str,"|",actions);
  uvm_string_to_action = 1;
  action = 0;
  foreach(actions[i]) begin
    case (actions[i])
      "UVM_NO_ACTION": action |= UVM_NO_ACTION;
      "UVM_DISPLAY":   action |= UVM_DISPLAY;
      "UVM_LOG":       action |= UVM_LOG;
      "UVM_COUNT":     action |= UVM_COUNT;
      "UVM_EXIT":      action |= UVM_EXIT;
      "UVM_CALL_HOOK": action |= UVM_CALL_HOOK;
      "UVM_STOP":      action |= UVM_STOP;
      "UVM_RM_RECORD": action |= UVM_RM_RECORD;
      default: uvm_string_to_action = 0;
    endcase
  end
endfunction

  
`ifndef UVM_NO_DEPRECATED
//------------------------------------------------------------------------------
//
// Group- Configuration
//
//------------------------------------------------------------------------------

// Function- set_config_int
//
// This is the global version of set_config_int in <uvm_component>. This
// function places the configuration setting for an integral field in a
// global override table, which has highest precedence over any
// component-level setting.  See <uvm_component::set_config_int> for
// details on setting configuration.

function void  set_config_int  (string inst_name,
                                string field_name,
                                uvm_bitstream_t value);
  uvm_root top;
  uvm_coreservice_t cs;
  if (!uvm_component::m_config_deprecated_warned) begin
     `uvm_warning("UVM/CFG/SET/DPR", "get/set_config_* API has been deprecated. Use uvm_config_db instead.")
     uvm_component::m_config_deprecated_warned = 1;
  end
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.set_config_int(inst_name, field_name, value);
endfunction


// Function- set_config_object
//
// This is the global version of set_config_object in <uvm_component>. This
// function places the configuration setting for an object field in a
// global override table, which has highest precedence over any
// component-level setting.  See <uvm_component::set_config_object> for
// details on setting configuration.

function void set_config_object (string inst_name,
                                 string field_name,
                                 uvm_object value,
                                 bit clone=1);
  uvm_root top;
  uvm_coreservice_t cs;
  if (!uvm_component::m_config_deprecated_warned) begin
     `uvm_warning("UVM/CFG/SET/DPR", "get/set_config_* API has been deprecated. Use uvm_config_db instead.")
     uvm_component::m_config_deprecated_warned = 1;
  end
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.set_config_object(inst_name, field_name, value, clone);
endfunction


// Function- set_config_string
//
// This is the global version of set_config_string in <uvm_component>. This
// function places the configuration setting for an string field in a
// global override table, which has highest precedence over any
// component-level setting.  See <uvm_component::set_config_string> for
// details on setting configuration.

function void set_config_string (string inst_name,  
                                 string field_name,
                                 string value);
  uvm_root top;
  uvm_coreservice_t cs;
  if (!uvm_component::m_config_deprecated_warned) begin
     `uvm_warning("UVM/CFG/SET/DPR", "get/set_config_* API has been deprecated. Use uvm_config_db instead.")
     uvm_component::m_config_deprecated_warned = 1;
  end
  cs = uvm_coreservice_t::get();
  top = cs.get_root();
  top.set_config_string(inst_name, field_name, value);
endfunction
`endif


//----------------------------------------------------------------------------
//
// Group: Miscellaneous
//
//----------------------------------------------------------------------------


// Function: uvm_is_match
//
// Returns 1 if the two strings match, 0 otherwise.
//
// The first string, ~expr~, is a string that may contain '*' and '?'
// characters. A * matches zero or more characters, and ? matches any single
// character. The 2nd argument, ~str~, is the string begin matched against.
// It must not contain any wildcards.
//
//----------------------------------------------------------------------------

function bit uvm_is_match (string expr, string str);
  string s;
  s = uvm_glob_to_re(expr);
  return (uvm_re_match(s, str) == 0);
endfunction


parameter UVM_LINE_WIDTH = `UVM_LINE_WIDTH;
parameter UVM_NUM_LINES = `UVM_NUM_LINES;
parameter UVM_SMALL_STRING = UVM_LINE_WIDTH*8-1;
parameter UVM_LARGE_STRING = UVM_LINE_WIDTH*UVM_NUM_LINES*8-1;


//----------------------------------------------------------------------------
//
// Function: uvm_string_to_bits
//
// Converts an input string to its bit-vector equivalent. Max bit-vector
// length is approximately 14000 characters.
//----------------------------------------------------------------------------

function logic[UVM_LARGE_STRING:0] uvm_string_to_bits(string str);
  $swrite(uvm_string_to_bits, "%0s", str);
endfunction


//----------------------------------------------------------------------------
//
// Function: uvm_bits_to_string
//
// Converts an input bit-vector to its string equivalent. Max bit-vector
// length is approximately 14000 characters.
//----------------------------------------------------------------------------

function string uvm_bits_to_string(logic [UVM_LARGE_STRING:0] str);
  $swrite(uvm_bits_to_string, "%0s", str);
endfunction


//----------------------------------------------------------------------------
//
// Task: uvm_wait_for_nba_region
//
// Callers of this task will not return until the NBA region, thus allowing
// other processes any number of delta cycles (#0) to settle out before
// continuing. See <uvm_sequencer_base::wait_for_sequences> for example usage.
//
//----------------------------------------------------------------------------

task uvm_wait_for_nba_region;

  string s;

  int nba;
  int next_nba;

  //If `included directly in a program block, can't use a non-blocking assign,
  //but it isn't needed since program blocks are in a separate region.
`ifndef UVM_NO_WAIT_FOR_NBA
  next_nba++;
  nba <= next_nba;
  @(nba);
`else
  repeat(`UVM_POUND_ZERO_COUNT) #0;
`endif


endtask


//----------------------------------------------------------------------------
//
// Function: uvm_split_string
//
// Returns a queue of strings, ~values~, that is the result of the ~str~ split
// based on the ~sep~.  For example:
//
//| uvm_split_string("1,on,false", ",", splits);
//
// Results in the 'splits' queue containing the three elements: 1, on and 
// false.
//----------------------------------------------------------------------------

function automatic void uvm_split_string (string str, byte sep, ref string values[$]);
  int s = 0, e = 0;
  values.delete();
  while(e < str.len()) begin
    for(s=e; e<str.len(); ++e)
      if(str[e] == sep) break;
    if(s != e)
      values.push_back(str.substr(s,e-1));
    e++;
  end
endfunction

// Class: uvm_enum_wrapper#(T)
//
// The ~uvm_enum_wrapper#(T)~ class is a utility mechanism provided
// as a convenience to the end user.  It provides a <from_name>
// method which is the logical inverse of the System Verilog ~name~ 
// method which is built into all enumerations.

class uvm_enum_wrapper#(type T=uvm_active_passive_enum);

    protected static T map[string];

    // Function: from_name
    // Attempts to convert a string ~name~ to an enumerated value.
    //
    // If the conversion is successful, the method will return
    // 1, otherwise 0.
    //
    // Note that the ~name~ passed in to the method must exactly
    // match the value which would be produced by ~enum::name~, and
    // is case sensitive.
    //
    // For example:
    //| typedef uvm_enum_wrapper#(uvm_radix_enum) radix_wrapper;
    //| uvm_radix_enum r_v;
    //|
    //| // The following would return '0', as "foo" isn't a value
    //| // in uvm_radix_enum:
    //| radix_wrapper::from_name("foo", r_v);
    //|
    //| // The following would return '0', as "uvm_bin" isn't a value
    //| // in uvm_radix_enum (although the upper case "UVM_BIN" is):
    //| radix_wrapper::from_name("uvm_bin", r_v);
    //|
    //| // The following would return '1', and r_v would be set to
    //| // the value of UVM_BIN
    //| radix_wrapper::from_name("UVM_BIN", r_v);
    //
    static function bit from_name(string name, ref T value);
        if (map.size() == 0)
          m_init_map();

        if (map.exists(name)) begin
            value = map[name];
            return 1;
        end
        else begin
            return 0;
        end
    endfunction : from_name

    // Function- m_init_map
    // Initializes the name map, only needs to be performed once
    protected static function void m_init_map();
        T e = e.first();
        do 
          begin
            map[e.name()] = e;
            e = e.next();
          end
        while (e != e.first());
    endfunction : m_init_map

    // Function- new
    // Prevents accidental instantiations
    protected function new();
    endfunction : new

endclass : uvm_enum_wrapper



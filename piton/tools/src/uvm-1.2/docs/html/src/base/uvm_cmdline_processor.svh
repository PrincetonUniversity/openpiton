//
//------------------------------------------------------------------------------
//   Copyright 2011 Mentor Graphics Corporation
//   Copyright 2011 Cadence Design Systems, Inc. 
//   Copyright 2011 Synopsys, Inc.
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
//------------------------------------------------------------------------------

`ifndef UVM_CMDLINE_PROCESSOR_SV
`define UVM_CMDLINE_PROCESSOR_SV

class uvm_cmd_line_verb;
  string comp_path;
  string id;
  uvm_verbosity verb;
  int exec_time;
endclass

// Class: uvm_cmdline_processor
//
// This class provides an interface to the command line arguments that 
// were provided for the given simulation.  The class is intended to be
// used as a singleton, but that isn't required.  The generation of the
// data structures which hold the command line argument information 
// happens during construction of the class object.  A global variable 
// called ~uvm_cmdline_proc~ is created at initialization time and may 
// be used to access command line information.
//
// The uvm_cmdline_processor class also provides support for setting various UVM
// variables from the command line such as components' verbosities and configuration
// settings for integral types and strings.  Each of these capabilities is described 
// in the Built-in UVM Aware Command Line Arguments section.
//

class uvm_cmdline_processor extends uvm_report_object;

  static local uvm_cmdline_processor m_inst;

  // Group: Singleton 

  // Function: get_inst
  //
  // Returns the singleton instance of the UVM command line processor.

  static function uvm_cmdline_processor get_inst();
    if(m_inst == null) 
      m_inst = new("uvm_cmdline_proc");
    return m_inst;
  endfunction

  protected string m_argv[$]; 
  protected string m_plus_argv[$];
  protected string m_uvm_argv[$];

  // Group: Basic Arguments
  
  // Function: get_args
  //
  // This function returns a queue with all of the command line
  // arguments that were used to start the simulation. Note that
  // element 0 of the array will always be the name of the 
  // executable which started the simulation.

  function void get_args (output string args[$]);
    args = m_argv;
  endfunction

  // Function: get_plusargs
  //
  // This function returns a queue with all of the plus arguments
  // that were used to start the simulation. Plusarguments may be
  // used by the simulator vendor, or may be specific to a company
  // or individual user. Plusargs never have extra arguments
  // (i.e. if there is a plusarg as the second argument on the
  // command line, the third argument is unrelated); this is not
  // necessarily the case with vendor specific dash arguments.

  function void get_plusargs (output string args[$]);
    args = m_plus_argv;
  endfunction

  // Function: get_uvmargs
  //
  // This function returns a queue with all of the uvm arguments
  // that were used to start the simulation. A UVM argument is
  // taken to be any argument that starts with a - or + and uses
  // the keyword UVM (case insensitive) as the first three
  // letters of the argument.

  function void get_uvm_args (output string args[$]);
    args = m_uvm_argv;
  endfunction

  // Function: get_arg_matches
  //
  // This function loads a queue with all of the arguments that
  // match the input expression and returns the number of items
  // that matched. If the input expression is bracketed
  // with //, then it is taken as an extended regular expression 
  // otherwise, it is taken as the beginning of an argument to match.
  // For example:
  //
  //| string myargs[$]
  //| initial begin
  //|    void'(uvm_cmdline_proc.get_arg_matches("+foo",myargs)); //matches +foo, +foobar
  //|                                                            //doesn't match +barfoo
  //|    void'(uvm_cmdline_proc.get_arg_matches("/foo/",myargs)); //matches +foo, +foobar,
  //|                                                             //foo.sv, barfoo, etc.
  //|    void'(uvm_cmdline_proc.get_arg_matches("/^foo.*\.sv",myargs)); //matches foo.sv
  //|                                                                   //and foo123.sv,
  //|                                                                   //not barfoo.sv.

  function int get_arg_matches (string match, ref string args[$]);

   `ifndef UVM_CMDLINE_NO_DPI
    chandle exp_h = null;
    int len = match.len();
    args.delete();
    if((match.len() > 2) && (match[0] == "/") && (match[match.len()-1] == "/")) begin
       match = match.substr(1,match.len()-2);
       exp_h = uvm_dpi_regcomp(match);
       if(exp_h == null) begin
         uvm_report_error("UVM_CMDLINE_PROC", {"Unable to compile the regular expression: ", match}, UVM_NONE);
         return 0;
       end
    end
    foreach (m_argv[i]) begin
      if(exp_h != null) begin
        if(!uvm_dpi_regexec(exp_h, m_argv[i]))
           args.push_back(m_argv[i]);
      end
      else if((m_argv[i].len() >= len) && (m_argv[i].substr(0,len - 1) == match))
        args.push_back(m_argv[i]);
    end

    if(exp_h != null)
      uvm_dpi_regfree(exp_h);
    `endif

    return args.size();
  endfunction


  // Group: Argument Values

  // Function: get_arg_value
  //
  // This function finds the first argument which matches the ~match~ arg and
  // returns the suffix of the argument. This is similar to the $value$plusargs
  // system task, but does not take a formatting string. The return value is
  // the number of command line arguments that match the ~match~ string, and
  // ~value~ is the value of the first match.
  
  function int get_arg_value (string match, ref string value);
    int chars = match.len();
    get_arg_value = 0;
    foreach (m_argv[i]) begin
      if(m_argv[i].len() >= chars) begin
        if(m_argv[i].substr(0,chars-1) == match) begin
          get_arg_value++;
          if(get_arg_value == 1)
            value = m_argv[i].substr(chars,m_argv[i].len()-1);
        end
      end
    end
  endfunction

  // Function: get_arg_values
  //
  // This function finds all the arguments which matches the ~match~ arg and
  // returns the suffix of the arguments in a list of values. The return
  // value is the number of matches that were found (it is the same as
  // values.size() ).
  // For example if '+foo=1,yes,on +foo=5,no,off' was provided on the command
  // line and the following code was executed:
  //
  //| string foo_values[$]
  //| initial begin
  //|    void'(uvm_cmdline_proc.get_arg_values("+foo=",foo_values));
  //|
  //
  // The foo_values queue would contain two entries.  These entries are shown
  // here:
  //
  //   0 - "1,yes,on"
  //   1 - "5,no,off"
  //
  // Splitting the resultant string is left to user but using the
  // uvm_split_string() function is recommended.

  function int get_arg_values (string match, ref string values[$]);
    int chars = match.len();

    values.delete();
    foreach (m_argv[i]) begin
      if(m_argv[i].len() >= chars) begin
        if(m_argv[i].substr(0,chars-1) == match)
          values.push_back(m_argv[i].substr(chars,m_argv[i].len()-1));
      end
    end
    return values.size();
  endfunction

  // Group: Tool information

  // Function: get_tool_name
  //
  // Returns the simulation tool that is executing the simulation.
  // This is a vendor specific string.

  function string get_tool_name ();
    return uvm_dpi_get_tool_name();
  endfunction

  // Function: get_tool_version
  //
  // Returns the version of the simulation tool that is executing the simulation.
  // This is a vendor specific string.

  function string  get_tool_version ();
    return uvm_dpi_get_tool_version();
  endfunction

  // constructor

  function new(string name = "");
    string s;
    string sub;
    int doInit=1;
    super.new(name);
    do begin
      s = uvm_dpi_get_next_arg(doInit);
      doInit=0;
      if(s!="") begin
        m_argv.push_back(s);
        if(s[0] == "+") begin
          m_plus_argv.push_back(s);
        end 
        if(s.len() >= 4 && (s[0]=="-" || s[0]=="+")) begin
          sub = s.substr(1,3);
          sub = sub.toupper();
          if(sub == "UVM")
            m_uvm_argv.push_back(s);
        end 
      end
    end while(s!=""); 

    // Group: Command Line Debug

    // Variable: +UVM_DUMP_CMDLINE_ARGS
    //
    // ~+UVM_DUMP_CMDLINE_ARGS~ allows the user to dump all command line arguments to the
    // reporting mechanism.  The output in is tree format.

    // The implementation of this is in uvm_root.

    // Group: Built-in UVM Aware Command Line Arguments

    // Variable: +UVM_TESTNAME
    //
    // ~+UVM_TESTNAME=<class name>~ allows the user to specify which uvm_test (or
    // uvm_component) should be created via the factory and cycled through the UVM phases.
    // If multiple of these settings are provided, the first occurrence is used and a warning
    // is issued for subsequent settings.  For example:
    //
    //| <sim command> +UVM_TESTNAME=read_modify_write_test
    //

    // The implementation of this is in uvm_root since this is procedurally invoked via
    // ovm_root::run_test().

    // Variable: +UVM_VERBOSITY
    //
    // ~+UVM_VERBOSITY=<verbosity>~ allows the user to specify the initial verbosity 
    // for all components.  If multiple of these settings are provided, the first occurrence
    // is used and a warning is issued for subsequent settings.  For example:
    //
    //| <sim command> +UVM_VERBOSITY=UVM_HIGH
    //

    // The implementation of this is in uvm_root since this is procedurally invoked via
    // ovm_root::new().

    // Variable: +uvm_set_verbosity
    //
    // ~+uvm_set_verbosity=<comp>,<id>,<verbosity>,<phase>~ and
    // ~+uvm_set_verbosity=<comp>,<id>,<verbosity>,time,<time>~ allow the users to manipulate the
    // verbosity of specific components at specific phases (and times during the "run" phases)
    // of the simulation.  The ~id~ argument can be either ~_ALL_~ for all IDs or a
    // specific message id.  Wildcarding is not supported for ~id~ due to performance concerns.
    // Settings for non-"run" phases are executed in order of occurrence on the command line.  
    // Settings for "run" phases (times) are sorted by time and then executed in order of 
    // occurrence for settings of the same time.  For example:
    //
    //| <sim command> +uvm_set_verbosity=uvm_test_top.env0.agent1.*,_ALL_,UVM_FULL,time,800
    //

    // Variable: +uvm_set_action
    //
    // ~+uvm_set_action=<comp>,<id>,<severity>,<action>~ provides the equivalent of
    // various uvm_report_object's set_report_*_action APIs.  The special keyword, 
    // ~_ALL_~, can be provided for both/either the ~id~ and/or ~severity~ arguments.  The
    // action can be UVM_NO_ACTION or a | separated list of the other UVM message
    // actions.  For example:
    //
    //| <sim command> +uvm_set_action=uvm_test_top.env0.*,_ALL_,UVM_ERROR,UVM_NO_ACTION
    //

    // Variable: +uvm_set_severity
    //
    // ~+uvm_set_severity=<comp>,<id>,<current severity>,<new severity>~ provides the
    // equivalent of the various uvm_report_object's set_report_*_severity_override APIs. The
    // special keyword, ~_ALL_~, can be provided for both/either the ~id~ and/or
    // ~current severity~ arguments.  For example:
    //
    //| <sim command> +uvm_set_severity=uvm_test_top.env0.*,BAD_CRC,UVM_ERROR,UVM_WARNING
    //

    // Variable: +UVM_TIMEOUT
    //
    // ~+UVM_TIMEOUT=<timeout>,<overridable>~ allows users to change the global timeout of the UVM
    // framework.  The <overridable> argument ('YES' or 'NO') specifies whether user code can subsequently
    // change this value.  If set to 'NO' and the user code tries to change the global timeout value, an
    // warning message will be generated.
    //
    //| <sim command> +UVM_TIMEOUT=200000,NO
    //

    // The implementation of this is in uvm_root.

    // Variable: +UVM_MAX_QUIT_COUNT
    //
    // ~+UVM_MAX_QUIT_COUNT=<count>,<overridable>~ allows users to change max quit count for the report
    // server.  The <overridable> argument ('YES' or 'NO') specifies whether user code can subsequently
    // change this value.  If set to 'NO' and the user code tries to change the max quit count value, an
    // warning message will be generated.
    //
    //| <sim command> +UVM_MAX_QUIT_COUNT=5,NO
    //


    // Variable: +UVM_PHASE_TRACE
    //
    // ~+UVM_PHASE_TRACE~ turns on tracing of phase executions.  Users simply need to put the
    // argument on the command line.

    // Variable: +UVM_OBJECTION_TRACE
    //
    // ~+UVM_OBJECTION_TRACE~ turns on tracing of objection activity.  Users simply need to put the
    // argument on the command line.

    // Variable: +UVM_RESOURCE_DB_TRACE
    //
    // ~+UVM_RESOURCE_DB_TRACE~ turns on tracing of resource DB access.
    // Users simply need to put the argument on the command line.

    // Variable: +UVM_CONFIG_DB_TRACE
    //
    // ~+UVM_CONFIG_DB_TRACE~ turns on tracing of configuration DB access.
    // Users simply need to put the argument on the command line.

    // Variable: +uvm_set_inst_override
     
    // Variable: +uvm_set_type_override
    //
    // ~+uvm_set_inst_override=<req_type>,<override_type>,<full_inst_path>~ and
    // ~+uvm_set_type_override=<req_type>,<override_type>[,<replace>]~ work
    // like the name based overrides in the factory--factory.set_inst_override_by_name()
    //  and factory.set_type_override_by_name().
    // For uvm_set_type_override, the third argument is 0 or 1 (the default is
    // 1 if this argument is left off); this argument specifies whether previous
    // type overrides for the type should be replaced.  For example:
    //
    //| <sim command> +uvm_set_type_override=eth_packet,short_eth_packet
    //

    // The implementation of this is in uvm_root.

    // Variable: +uvm_set_config_int
      
    // Variable: +uvm_set_config_string
    //
    // ~+uvm_set_config_int=<comp>,<field>,<value>~ and
    // ~+uvm_set_config_string=<comp>,<field>,<value>~ work like their
    // procedural counterparts: set_config_int() and set_config_string(). For
    // the value of int config settings, 'b (0b), 'o, 'd, 'h ('x or 0x) 
    // as the first two characters of the value are treated as base specifiers
    // for interpreting the base of the number. Size specifiers are not used
    // since SystemVerilog does not allow size specifiers in string to
    // value conversions.  For example:
    //
    //| <sim command> +uvm_set_config_int=uvm_test_top.soc_env,mode,5
    //
    // No equivalent of set_config_object() exists since no way exists to pass a
    // uvm_object into the simulation via the command line.
    //

    // The implementation of this is in uvm_root.

    // Variable: +uvm_set_default_sequence
    //
    // The ~+uvm_set_default_sequence=<seqr>,<phase>,<type>~ plusarg allows
    // the user to define a default sequence from the command line, using the
    // ~typename~ of that sequence.  For example:
    //
    //| <sim command> +uvm_set_default_sequence=path.to.sequencer,main_phase,seq_type
    //  
    // This is functionally equivalent to calling the following in your 
    // test:
    //
    //| uvm_coreservice_t cs = uvm_coreservice_t::get();
    //| uvm_factory f = cs.get_factory();
    //| uvm_config_db#(uvm_object_wrapper)::set(this,
    //|                                         "path.to.sequencer.main_phase",
    //|                                         "default_sequence",
    //|                                         f.find_wrapper_by_name("seq_type"));
    //
     

    // The implementation of this is in uvm_root.
  endfunction

  function bit m_convert_verb(string verb_str, output uvm_verbosity verb_enum);
    case (verb_str)
      "NONE"       : begin verb_enum = UVM_NONE;   return 1; end
      "UVM_NONE"   : begin verb_enum = UVM_NONE;   return 1; end
      "LOW"        : begin verb_enum = UVM_LOW;    return 1; end
      "UVM_LOW"    : begin verb_enum = UVM_LOW;    return 1; end
      "MEDIUM"     : begin verb_enum = UVM_MEDIUM; return 1; end
      "UVM_MEDIUM" : begin verb_enum = UVM_MEDIUM; return 1; end
      "HIGH"       : begin verb_enum = UVM_HIGH;   return 1; end
      "UVM_HIGH"   : begin verb_enum = UVM_HIGH;   return 1; end
      "FULL"       : begin verb_enum = UVM_FULL;   return 1; end
      "UVM_FULL"   : begin verb_enum = UVM_FULL;   return 1; end
      "DEBUG"      : begin verb_enum = UVM_DEBUG;  return 1; end
      "UVM_DEBUG"  : begin verb_enum = UVM_DEBUG;  return 1; end
      default      : begin                         return 0; end
    endcase
  endfunction

endclass

const uvm_cmdline_processor uvm_cmdline_proc = uvm_cmdline_processor::get_inst();

`endif //UVM_CMDLINE_PROC_PKG_SV


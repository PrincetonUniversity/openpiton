//----------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
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
//----------------------------------------------------------------------

`ifndef UVM_MESSAGE_DEFINES_SVH
`define UVM_MESSAGE_DEFINES_SVH

`ifndef UVM_LINE_WIDTH
  `define UVM_LINE_WIDTH 120
`endif 

`ifndef UVM_NUM_LINES
  `define UVM_NUM_LINES 120
`endif

//`ifndef UVM_USE_FILE_LINE
//`define UVM_REPORT_DISABLE_FILE_LINE
//`endif

`ifdef UVM_REPORT_DISABLE_FILE_LINE
`define UVM_REPORT_DISABLE_FILE
`define UVM_REPORT_DISABLE_LINE
`endif

`ifdef UVM_REPORT_DISABLE_FILE
`define uvm_file ""
`else
`define uvm_file `__FILE__
`endif

`ifdef UVM_REPORT_DISABLE_LINE
`define uvm_line 0
`else
`define uvm_line `__LINE__
`endif


//------------------------------------------------------------------------------
//
// Title: Report Macros 
//
// This set of macros provides wrappers around the uvm_report_* <Reporting> 
// functions. The macros serve two essential purposes:
//
// - To reduce the processing overhead associated with filtered out messages,
//   a check is made against the report's verbosity setting and the action
//   for the id/severity pair before any string formatting is performed. This 
//   affects only `uvm_info reports.
//
// - The `__FILE__ and `__LINE__ information is automatically provided to the
//   underlying uvm_report_* call. Having the file and line number from where
//   a report was issued aides in debug. You can disable display of file and
//   line information in reports by defining UVM_REPORT_DISABLE_FILE_LINE on
//   the command line.
//
// The macros also enforce a verbosity setting of UVM_NONE for warnings, errors
// and fatals so that they cannot be mistakenly turned off by setting the
// verbosity level too low (warning and errors can still be turned off by 
// setting the actions appropriately).
//
// To use the macros, replace the previous call to uvm_report_* with the
// corresponding macro.
//
//| //Previous calls to uvm_report_*
//| uvm_report_info("MYINFO1", $sformatf("val: %0d", val), UVM_LOW);
//| uvm_report_warning("MYWARN1", "This is a warning");
//| uvm_report_error("MYERR", "This is an error");
//| uvm_report_fatal("MYFATAL", "A fatal error has occurred");
//
// The above code is replaced by
//
//| //New calls to `uvm_*
//| `uvm_info("MYINFO1", $sformatf("val: %0d", val), UVM_LOW)
//| `uvm_warning("MYWARN1", "This is a warning")
//| `uvm_error("MYERR", "This is an error")
//| `uvm_fatal("MYFATAL", "A fatal error has occurred")
//
// Macros represent text substitutions, not statements, so they should not be
// terminated with semi-colons.


//----------------------------------------------------------------------------
// Group:  Basic Messaging Macros
//----------------------------------------------------------------------------


// MACRO: `uvm_info
//
// Calls uvm_report_info if ~VERBOSITY~ is lower than the configured verbosity of
// the associated reporter. ~ID~ is given as the message tag and ~MSG~ is given as
// the message text. The file and line are also sent to the uvm_report_info call.
//
// |`uvm_info(ID, MSG, VERBOSITY)

`define uvm_info(ID, MSG, VERBOSITY) \
   begin \
     if (uvm_report_enabled(VERBOSITY,UVM_INFO,ID)) \
       uvm_report_info (ID, MSG, VERBOSITY, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_warning
//
// Calls uvm_report_warning with a verbosity of UVM_NONE. The message cannot
// be turned off using the reporter's verbosity setting, but can be turned off
// by setting the action for the message.  ~ID~ is given as the message tag and 
// ~MSG~ is given as the message text. The file and line are also sent to the 
// uvm_report_warning call.
//
// |`uvm_warning(ID, MSG)

`define uvm_warning(ID, MSG) \
   begin \
     if (uvm_report_enabled(UVM_NONE,UVM_WARNING,ID)) \
       uvm_report_warning (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_error
//
// Calls uvm_report_error with a verbosity of UVM_NONE. The message cannot
// be turned off using the reporter's verbosity setting, but can be turned off
// by setting the action for the message.  ~ID~ is given as the message tag and 
// ~MSG~ is given as the message text. The file and line are also sent to the 
// uvm_report_error call.
//
// |`uvm_error(ID, MSG)

`define uvm_error(ID, MSG) \
   begin \
     if (uvm_report_enabled(UVM_NONE,UVM_ERROR,ID)) \
       uvm_report_error (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_fatal
//
// Calls uvm_report_fatal with a verbosity of UVM_NONE. The message cannot
// be turned off using the reporter's verbosity setting, but can be turned off
// by setting the action for the message.  ~ID~ is given as the message tag and 
// ~MSG~ is given as the message text. The file and line are also sent to the 
// uvm_report_fatal call.
//
// |`uvm_fatal(ID, MSG)

`define uvm_fatal(ID, MSG) \
   begin \
     if (uvm_report_enabled(UVM_NONE,UVM_FATAL,ID)) \
       uvm_report_fatal (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end



// MACRO: `uvm_info_context
//
//| `uvm_info_context(ID, MSG, VERBOSITY, RO)
//
// Operates identically to `uvm_info but requires that the
// context, or <uvm_report_object>, in which the message is printed be 
// explicitly supplied as a macro argument.

`define uvm_info_context(ID, MSG, VERBOSITY, RO) \
   begin \
     if (RO.uvm_report_enabled(VERBOSITY,UVM_INFO,ID)) \
       RO.uvm_report_info (ID, MSG, VERBOSITY, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_warning_context
//
//| `uvm_warning_context(ID, MSG, RO)
//
// Operates identically to `uvm_warning but requires that the
// context, or <uvm_report_object>, in which the message is printed be
// explicitly supplied as a macro argument.

`define uvm_warning_context(ID, MSG, RO) \
   begin \
     if (RO.uvm_report_enabled(UVM_NONE,UVM_WARNING,ID)) \
       RO.uvm_report_warning (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_error_context
//
//| `uvm_error_context(ID, MSG, RO)
//
// Operates identically to `uvm_error but requires that the
// context, or <uvm_report_object> in which the message is printed be 
// explicitly supplied as a macro argument.

`define uvm_error_context(ID, MSG, RO) \
   begin \
     if (RO.uvm_report_enabled(UVM_NONE,UVM_ERROR,ID)) \
       RO.uvm_report_error (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end


// MACRO: `uvm_fatal_context
//
//| `uvm_fatal_context(ID, MSG, RO)
//
// Operates identically to `uvm_fatal but requires that the
// context, or <uvm_report_object>, in which the message is printed be 
// explicitly supplied as a macro argument.

`define uvm_fatal_context(ID, MSG, RO) \
   begin \
     if (RO.uvm_report_enabled(UVM_NONE,UVM_FATAL,ID)) \
       RO.uvm_report_fatal (ID, MSG, UVM_NONE, `uvm_file, `uvm_line, "", 1); \
   end




//----------------------------------------------------------------------------
// Group:  Message Trace Macros
//----------------------------------------------------------------------------

// MACRO- `uvm_message_begin
//
// Undocumented. Library internal use.
//

`define uvm_message_begin(SEVERITY, ID, MSG, VERBOSITY, FILE, LINE, RM) \
   begin \
     if (uvm_report_enabled(VERBOSITY,SEVERITY,ID)) begin \
       uvm_report_message __uvm_msg; \
       if (RM == null) RM = uvm_report_message::new_report_message(); \
       __uvm_msg = RM; \
       __uvm_msg.set_report_message(SEVERITY, ID, MSG, VERBOSITY, FILE, LINE, "");


// MACRO- `uvm_message_end
//
// Undocumented. Library internal use.
//
//

`define uvm_message_end \
       uvm_process_report_message(__uvm_msg); \
     end \
   end

// MACRO- `uvm_message_context_begin
//
// Undocumented. Library internal use.
//

`define uvm_message_context_begin(SEVERITY, ID, MSG, VERBOSITY, FILE, LINE, RO, RM) \
   begin \
     uvm_report_object __report_object; \
     __report_object = RO; \
     if (__report_object.uvm_report_enabled(VERBOSITY,SEVERITY,ID)) begin \
       uvm_report_message __uvm_msg; \
       if (RM == null) RM = uvm_report_message::new_report_message(); \
       __uvm_msg = RM; \
       __uvm_msg.set_report_message(SEVERITY, ID, MSG, VERBOSITY, FILE, LINE, "");


// MACRO- `uvm_message_context_end
//
// Undocumented. Library internal use.
//
//

`define uvm_message_context_end \
       __report_object.uvm_process_report_message(__uvm_msg); \
     end \
   end


// MACRO: `uvm_info_begin
//
// |`uvm_info_begin(ID, MSG, VERBOSITY, RM = __uvm_msg)
//

`define uvm_info_begin(ID, MSG, VERBOSITY, RM = __uvm_msg) \
   `uvm_message_begin(UVM_INFO, ID, MSG, VERBOSITY, `uvm_file, `uvm_line, RM)

// MACRO: `uvm_info_end
//
// This macro pair provides the ability to add elements to messages.
//
// |`uvm_info_end
//
// Example usage is shown here.
//
// |...
// |task my_task();
// |   ...
// |   `uvm_info_begin("MY_ID", "This is my message...", UVM_LOW)
// |     `uvm_message_add_tag("my_color", "red")
// |     `uvm_message_add_int(my_int, UVM_DEC)
// |     `uvm_message_add_string(my_string)
// |     `uvm_message_add_object(my_obj)
// |   `uvm_info_end
// |   ...
// |endtask
//

`define uvm_info_end \
   `uvm_message_end

 
// MACRO: `uvm_warning_begin
//
// |`uvm_warning_begin(ID, MSG, RM = __uvm_msg)
//

`define uvm_warning_begin(ID, MSG, RM = __uvm_msg) \
   `uvm_message_begin(UVM_WARNING, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RM)

// MACRO: `uvm_warning_end
//
// This macro pair operates identically to <`uvm_info_begin>/<`uvm_info_end> with
// exception that the message severity is <UVM_WARNING> and has no verbosity threshold.
//
// |`uvm_warning_end
//
// The usage shown in <`uvm_info_end> works identically for this pair.
//

`define uvm_warning_end \
   `uvm_message_end


// MACRO: `uvm_error_begin
//
// |`uvm_error_begin(ID, MSG, RM = __uvm_msg)
//

`define uvm_error_begin(ID, MSG, RM = __uvm_msg) \
   `uvm_message_begin(UVM_ERROR, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RM)


// MACRO: `uvm_error_end
//
// This macro pair operates identically to <`uvm_info_begin>/<`uvm_info_end> with
// exception that the message severity is <UVM_ERROR> and has no verbosity threshold.
//
// |`uvm_error_end
//
// The usage shown in <`uvm_info_end> works identically for this pair.
//

`define uvm_error_end \
   `uvm_message_end


// MACRO: `uvm_fatal_begin
//
// |`uvm_fatal_begin(ID, MSG, RM = __uvm_msg)
//

`define uvm_fatal_begin(ID, MSG, RM = __uvm_msg) \
   `uvm_message_begin(UVM_FATAL, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RM)


// MACRO: `uvm_fatal_end
//
// This macro pair operates identically to <`uvm_info_begin>/<`uvm_info_end> with
// exception that the message severity is <UVM_FATAL> and has no verbosity threshold.
//
// |`uvm_fatal_end
//
// The usage shown in <`uvm_info_end> works identically for this pair.
//

`define uvm_fatal_end \
   `uvm_message_end


// MACRO: `uvm_info_context_begin
//
// |`uvm_info_context_begin(ID, MSG, UVM_NONE, RO, RM = __uvm_msg)
//

`define uvm_info_context_begin(ID, MSG, VERBOSITY, RO, RM = __uvm_msg) \
   `uvm_message_context_begin(UVM_INFO, ID, MSG, VERBOSITY, `uvm_file, `uvm_line, RO, RM)


// MACRO: `uvm_info_context_end
//
// |`uvm_info_context_end
//
// This macro pair operates identically to <`uvm_info_begin>/<`uvm_info_end>, but 
// requires that the context, or <uvm_report_object> in which the message is printed
// be explicitly supplied as a macro argument.
//

`define uvm_info_context_end \
   `uvm_message_context_end

 
// MACRO: `uvm_warning_context_begin
//
// |`uvm_warning_context_begin(ID, MSG, RO, RM = __uvm_msg)
//

`define uvm_warning_context_begin(ID, MSG, RO, RM = __uvm_msg) \
   `uvm_message_context_begin(UVM_WARNING, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RO, RM)

// MACRO: `uvm_warning_context_end
//
// |`uvm_warning_context_end
//
// This macro pair operates identically to <`uvm_warning_begin>/<`uvm_warning_end>, but 
// requires that the context, or <uvm_report_object> in which the message is printed
// be explicitly supplied as a macro argument.
//

`define uvm_warning_context_end \
   `uvm_message_context_end


// MACRO: `uvm_error_context_begin
//
// |`uvm_error_context_begin(ID, MSG, RO, RM = __uvm_msg)
//

`define uvm_error_context_begin(ID, MSG, RO, RM = __uvm_msg) \
   `uvm_message_context_begin(UVM_ERROR, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RO, RM)


// MACRO: `uvm_error_context_end
//
// |`uvm_error_context_end
//
// This macro pair operates identically to <`uvm_error_begin>/<`uvm_error_end>, but 
// requires that the context, or <uvm_report_object> in which the message is printed
// be explicitly supplied as a macro argument.
//

`define uvm_error_context_end \
   `uvm_message_context_end


// MACRO: `uvm_fatal_context_begin
//
// |`uvm_fatal_context_begin(ID, MSG, RO, RM = __uvm_msg)
//

`define uvm_fatal_context_begin(ID, MSG, RO, RM = __uvm_msg) \
   `uvm_message_context_begin(UVM_FATAL, ID, MSG, UVM_NONE, `uvm_file, `uvm_line, RO, RM)


// MACRO: `uvm_fatal_context_end
//
// |`uvm_fatal_context_end
//
// This macro pair operates identically to <`uvm_fatal_begin>/<`uvm_fatal_end>, but 
// requires that the context, or <uvm_report_object> in which the message is printed
// be explicitly supplied as a macro argument.
//

`define uvm_fatal_context_end \
   `uvm_message_context_end


//----------------------------------------------------------------------------
// Group:  Message Element Macros
//----------------------------------------------------------------------------


// MACRO: `uvm_message_add_tag
//
// |`uvm_message_add_tag(NAME, VALUE, ACTION=(UVM_LOG|UVM_RM_RECORD))
//

`define uvm_message_add_tag(NAME, VALUE, ACTION=(UVM_LOG|UVM_RM_RECORD)) \
    __uvm_msg.add_string(NAME, VALUE, ACTION);


// MACRO: `uvm_message_add_int
//
// |`uvm_message_add_int(VAR, RADIX, LABEL = "", ACTION=(UVM_LOG|UVM_RM_RECORD))
//

`define uvm_message_add_int(VAR, RADIX, LABEL="", ACTION=(UVM_LOG|UVM_RM_RECORD)) \
    if (LABEL == "") \
      __uvm_msg.add_int(`"VAR`", VAR, $bits(VAR), RADIX, ACTION); \
    else \
      __uvm_msg.add_int(LABEL, VAR, $bits(VAR), RADIX, ACTION);


// MACRO: `uvm_message_add_string
//
// |`uvm_message_add_string(VAR, LABEL = "", ACTION=(UVM_LOG|UVM_RM_RECORD))
//

`define uvm_message_add_string(VAR, LABEL="", ACTION=(UVM_LOG|UVM_RM_RECORD)) \
    if (LABEL == "") \
      __uvm_msg.add_string(`"VAR`", VAR, ACTION); \
    else \
      __uvm_msg.add_string(LABEL, VAR, ACTION);


// MACRO: `uvm_message_add_object
//
// These macros allow the user to provide elements that are associated with
// <uvm_report_message>s.  Separate macros are provided such that the
// user can supply arbitrary string/string pairs using <`uvm_message_add_tag>,
// integral types along with a radix using <`uvm_message_add_int>, string 
// using <`uvm_message_add_string> and <uvm_object>s using 
// <`uvm_message_add_object>.
//
// |`uvm_message_add_object(VAR, LABEL = "", ACTION=(UVM_LOG|UVM_RM_RECORD))
//
// Example usage is shown in <`uvm_info_end>.
//

`define uvm_message_add_object(VAR, LABEL="", ACTION=(UVM_LOG|UVM_RM_RECORD)) \
    if (LABEL == "") \
      __uvm_msg.add_object(`"VAR`", VAR, ACTION); \
    else \
      __uvm_msg.add_object(LABEL, VAR, ACTION);


`endif //UVM_MESSAGE_DEFINES_SVH

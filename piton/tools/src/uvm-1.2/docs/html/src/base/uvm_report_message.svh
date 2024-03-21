//
//------------------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc. 
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

`ifndef UVM_REPORT_MESSAGE_SVH
`define UVM_REPORT_MESSAGE_SVH


typedef class uvm_report_server;
typedef class uvm_report_handler;
typedef class uvm_root;
 

//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message_element_base
//
// Base class for report message element. Defines common interface.
//
//------------------------------------------------------------------------------

virtual class uvm_report_message_element_base;
   protected uvm_action _action;
   protected string          _name;


   // Function: get_name
   // 

   virtual function string get_name();
     return _name;
   endfunction

   // Function: set_name
   // 
   // Get or set the name of the element
   //

   virtual function void set_name(string name);
     _name = name;
   endfunction
     

   // Function: get_action
   // 

   virtual function uvm_action get_action();
     return _action;
   endfunction

   // Function: set_action
   // 
   // Get or set the authorized action for the element
   //

   virtual function void set_action(uvm_action action);
     _action = action;
   endfunction
     
     
   function void print(uvm_printer printer);
      if (_action & (UVM_LOG | UVM_DISPLAY))
        do_print(printer);
   endfunction : print
   function void record(uvm_recorder recorder);
      if (_action & UVM_RM_RECORD)
        do_record(recorder);
   endfunction : record
   function void copy(uvm_report_message_element_base rhs);
      do_copy(rhs);
   endfunction : copy
   function uvm_report_message_element_base clone();
      return do_clone();
   endfunction : clone

   pure virtual function void do_print(uvm_printer printer);
   pure virtual function void do_record(uvm_recorder recorder);
   pure virtual function void do_copy(uvm_report_message_element_base rhs);
   pure virtual function uvm_report_message_element_base do_clone();
   
endclass : uvm_report_message_element_base


//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message_int_element
//
// Message element class for integral type
//
//------------------------------------------------------------------------------

class uvm_report_message_int_element extends uvm_report_message_element_base;
   typedef uvm_report_message_int_element this_type;
   
   protected uvm_bitstream_t _val;
   protected int             _size;
   protected uvm_radix_enum  _radix;

   // Function: get_value
   //

   virtual function uvm_bitstream_t get_value(output int size, 
                                              output uvm_radix_enum radix);
     size = _size;
     radix = _radix;
     return _val;
   endfunction


   // Function: set_value
   //
   // Get or set the value (integral type) of the element, with size and radix
   //

   virtual function void set_value(uvm_bitstream_t value,
                              int size, 
                              uvm_radix_enum radix);
     _size = size;
     _radix = radix;
     _val = value;
   endfunction


   virtual function void do_print(uvm_printer printer);
      printer.print_int(_name, _val, _size, _radix);
   endfunction : do_print

   virtual function void do_record(uvm_recorder recorder);
      recorder.record_field(_name, _val, _size, _radix);
   endfunction : do_record

   virtual function void do_copy(uvm_report_message_element_base rhs);
      this_type _rhs;
      $cast(_rhs, rhs);
      _name = _rhs._name;
      _val = _rhs._val;
      _size = _rhs._size;
      _radix = _rhs._radix;
      _action = rhs._action;
   endfunction : do_copy

   virtual function uvm_report_message_element_base do_clone(); 
     this_type tmp = new; 
     tmp.copy(this); 
     return tmp; 
   endfunction : do_clone
endclass : uvm_report_message_int_element


//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message_string_element
//
// Message element class for string type
//
//------------------------------------------------------------------------------

class uvm_report_message_string_element extends uvm_report_message_element_base;
   typedef uvm_report_message_string_element this_type;
   protected string  _val;


   // Function: get_value
   //

   virtual function string get_value();
     return _val;
   endfunction

   // Function: set_value
   //
   // Get or set the value (string type) of the element
   //

   virtual function void set_value(string value);
     _val = value;
   endfunction


   virtual function void do_print(uvm_printer printer);
      printer.print_string(_name, _val);
   endfunction : do_print

   virtual function void do_record(uvm_recorder recorder);
      recorder.record_string(_name, _val);
   endfunction : do_record

   virtual function void do_copy(uvm_report_message_element_base rhs);
      this_type _rhs;
      $cast(_rhs, rhs);
      _name = _rhs._name;
      _val = _rhs._val;
      _action = rhs._action;
   endfunction : do_copy
   
   virtual function uvm_report_message_element_base do_clone(); 
     this_type tmp = new; 
     tmp.copy(this); 
     return tmp; 
   endfunction : do_clone
endclass : uvm_report_message_string_element


//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message_object_element
//
// Message element class for object type
//
//------------------------------------------------------------------------------

class uvm_report_message_object_element extends uvm_report_message_element_base;
   typedef uvm_report_message_object_element this_type;
   protected uvm_object _val;


   // Function: get_value
   //
   // Get the value (object reference) of the element
   //

   virtual function uvm_object get_value();
     return _val;
   endfunction

   // Function: set_value
   //
   // Get or set the value (object reference) of the element
   //

   virtual function void set_value(uvm_object value);
     _val = value;
   endfunction


   virtual function void do_print(uvm_printer printer);
      printer.print_object(_name, _val);
   endfunction : do_print

   virtual function void do_record(uvm_recorder recorder);
      recorder.record_object(_name, _val);
   endfunction : do_record

   virtual function void do_copy(uvm_report_message_element_base rhs);
      this_type _rhs;
      $cast(_rhs, rhs);
      _name = _rhs._name;
      _val = _rhs._val;
      _action = rhs._action;
   endfunction : do_copy
   
   virtual function uvm_report_message_element_base do_clone(); 
     this_type tmp = new; 
     tmp.copy(this); 
     return tmp; 
   endfunction : do_clone
endclass : uvm_report_message_object_element

//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message_element_container
//
// A container used by report message to contain the dynamically added elements,
// with APIs to add and delete the elements.
//
//------------------------------------------------------------------------------

class uvm_report_message_element_container extends uvm_object;

  protected uvm_report_message_element_base elements[$];

  `uvm_object_utils(uvm_report_message_element_container)

  // Function: new
  //
  // Create a new uvm_report_message_element_container object
  //

  function new(string name = "element_container");
    super.new(name);
  endfunction


  // Function: size
  //
  // Returns the size of the container, i.e. the number of elements
  //

  virtual function int size();
    return elements.size();
  endfunction


  // Function: delete
  //
  // Delete the ~index~-th element in the container
  //

  virtual function void delete(int index);
    elements.delete(index);
  endfunction


  // Function: delete_elements
  //
  // Delete all the elements in the container
  //

  virtual function void delete_elements();
    elements.delete();
  endfunction


  // Function: get_elements
  //
  // Get all the elements from the container and put them in a queue
  //

  typedef uvm_report_message_element_base queue_of_element[$];
  virtual function queue_of_element get_elements();
    return elements;
  endfunction


  // Function: add_int
  // 
  // This method adds an integral type of the name ~name~ and value ~value~ to
  // the container.  The required ~size~ field indicates the size of ~value~. 
  // The required ~radix~ field determines how to display and 
  // record the field. The optional print/record bit is to specify whether 
  // the element will be printed/recorded.
  //

  virtual function void add_int(string name, uvm_bitstream_t value, 
                                int size, uvm_radix_enum radix,
			        uvm_action action = (UVM_LOG|UVM_RM_RECORD));
     process p;
     string rand_state;
     uvm_report_message_int_element urme;

     p = process::self();
     if (p != null)
       rand_state = p.get_randstate();
     urme = new();
     if (p != null)
       p.set_randstate(rand_state);

     urme.set_name(name);
     urme.set_value(value, size, radix);
     urme.set_action(action);
     elements.push_back(urme);
  endfunction


  // Function: add_string
  // 
  // This method adds a string of the name ~name~ and value ~value~ to the 
  // message. The optional print/record bit is to specify whether 
  // the element will be printed/recorded.
  //

  virtual function void add_string(string name, string value, 
                                   uvm_action action = (UVM_LOG|UVM_RM_RECORD));
     process p;
     string rand_state;
     uvm_report_message_string_element urme;

     p = process::self();
     if (p != null)
       rand_state = p.get_randstate();
     urme = new();
     if (p != null)
       p.set_randstate(rand_state);

     urme.set_name(name);
     urme.set_value(value);
     urme.set_action(action);
     elements.push_back(urme);
  endfunction


  // Function: add_object
  // 
  // This method adds a uvm_object of the name ~name~ and reference ~obj~ to
  // the message. The optional print/record bit is to specify whether 
  // the element will be printed/recorded. 
  //

  virtual function void add_object(string name, uvm_object obj, 
                                   uvm_action action = (UVM_LOG|UVM_RM_RECORD));
     process p;
     string rand_state;
     uvm_report_message_object_element urme;

     p = process::self();
     if (p != null)
       rand_state = p.get_randstate();
     urme = new();
     if (p != null)
       p.set_randstate(rand_state);

     urme.set_name(name);
     urme.set_value(obj);
     urme.set_action(action);
     elements.push_back(urme);
  endfunction

  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    for(int i = 0; i < elements.size(); i++) begin
       elements[i].print(printer);
    end 
  endfunction

  virtual function void do_record(uvm_recorder recorder);
    super.do_record(recorder);
    for(int i = 0; i < elements.size(); i++) begin
       elements[i].record(recorder);
    end
  endfunction

  virtual function void do_copy(uvm_object rhs);
    uvm_report_message_element_container urme_container;

    super.do_copy(rhs);

    if(!$cast(urme_container, rhs) || (rhs==null))
      return;

    delete_elements();
    foreach (urme_container.elements[i])
      elements.push_back(urme_container.elements[i].clone());

  endfunction

endclass



//------------------------------------------------------------------------------
//
// CLASS: uvm_report_message
//
// The uvm_report_message is the basic UVM object message class.  It provides 
// the fields that are common to all messages.  It also has a message element 
// container and provides the APIs necessary to add integral types, strings and
// uvm_objects to the container. The report message object can be initialized
// with the common fields, and passes through the whole reporting system (i.e. 
// report object, report handler, report server, report catcher, etc) as an
// object. The additional elements can be added/deleted to/from the message 
// object anywhere in the reporting system, and can be printed or recorded
// along with the common fields.
//
//------------------------------------------------------------------------------

class uvm_report_message extends uvm_object;

  protected uvm_report_object _report_object;
  protected uvm_report_handler _report_handler;
  protected uvm_report_server _report_server;

  protected uvm_severity _severity; 
  protected string _id;
  protected string _message;
  protected int _verbosity;
  protected string _filename;
  protected int _line;
  protected string _context_name;
  protected uvm_action _action; 
  protected UVM_FILE _file;

  // Not documented.
  protected uvm_report_message_element_container _report_message_element_container;


  // Function: new
  // 
  // Creates a new uvm_report_message object.
  //

  function new(string name = "uvm_report_message");
    super.new(name);
    _report_message_element_container = new();
  endfunction


  // Function: new_report_message
  // 
  // Creates a new uvm_report_message object.
  // This function is the same as new(), but keeps the random stability.
  //

  static function uvm_report_message new_report_message(string name = "uvm_report_message");
    process p;
    string rand_state;

    p = process::self();

    if (p != null)
      rand_state = p.get_randstate();
    new_report_message = new(name);
    if (p != null)
      p.set_randstate(rand_state);

  endfunction


  // Function: print
  //
  // The uvm_report_message implements <uvm_object::do_print()> such that
  // ~print~ method provides UVM printer formatted output
  // of the message.  A snippet of example output is shown here:
  //
  //| --------------------------------------------------------
  //| Name                Type               Size  Value
  //| --------------------------------------------------------
  //| uvm_report_message  uvm_report_message  -     @532
  //|   severity          uvm_severity        2     UVM_INFO
  //|   id                string              10    TEST_ID
  //|   message           string              12    A message...
  //|   verbosity         uvm_verbosity       32    UVM_LOW
  //|   filename          string              7     test.sv
  //|   line              integral            32    'd58
  //|   context_name      string              0     ""
  //|   color             string              3     red
  //|   my_int            integral            32    'd5
  //|   my_string         string              3     foo
  //|   my_obj            my_class            -     @531
  //|     foo             integral            32    'd3
  //|     bar             string              8     hi there


  virtual function void do_print(uvm_printer printer);
    uvm_verbosity l_verbosity;

    super.do_print(printer);

    printer.print_generic("severity", "uvm_severity", 
                          $bits(_severity), _severity.name());
    printer.print_string("id", _id);
    printer.print_string("message",_message);
    if ($cast(l_verbosity, _verbosity))
      printer.print_generic("verbosity", "uvm_verbosity", 
                            $bits(l_verbosity), l_verbosity.name());
    else
      printer.print_int("verbosity", _verbosity, $bits(_verbosity), UVM_HEX);
    printer.print_string("filename", _filename);
    printer.print_int("line", _line, $bits(_line), UVM_UNSIGNED);
    printer.print_string("context_name", _context_name);

    if (_report_message_element_container.size() != 0)
      _report_message_element_container.print(printer);
  endfunction


  `uvm_object_utils(uvm_report_message)



  // do_pack() not needed
  // do_unpack() not needed
  // do_compare() not needed


  // Not documented.
  virtual function void do_copy (uvm_object rhs);
    uvm_report_message report_message;

    super.do_copy(rhs);

    if(!$cast(report_message, rhs) || (rhs==null))
      return;

    _report_object = report_message.get_report_object();
    _report_handler = report_message.get_report_handler();
    _report_server = report_message.get_report_server();
    _context_name = report_message.get_context();
    _file = report_message.get_file();
    _filename = report_message.get_filename();
    _line = report_message.get_line();
    _action = report_message.get_action();
    _severity = report_message.get_severity();
    _id = report_message.get_id();
    _message = report_message.get_message();
    _verbosity = report_message.get_verbosity();

    _report_message_element_container.copy(report_message._report_message_element_container);
  endfunction


  //----------------------------------------------------------------------------
  // Group:  Infrastructure References
  //----------------------------------------------------------------------------


  // Function: get_report_object

  virtual function uvm_report_object get_report_object();
    return _report_object;
  endfunction

  // Function: set_report_object
  //
  // Get or set the uvm_report_object that originated the message.

  virtual function void set_report_object(uvm_report_object ro);
    _report_object = ro;
  endfunction


  // Function: get_report_handler

  virtual function uvm_report_handler get_report_handler();
    return _report_handler;
  endfunction

  // Function: set_report_handler
  //
  // Get or set the uvm_report_handler that is responsible for checking
  // whether the message is enabled, should be upgraded/downgraded, etc.

  virtual function void set_report_handler(uvm_report_handler rh);
    _report_handler = rh;
  endfunction

  
  // Function: get_report_server

  virtual function uvm_report_server get_report_server();
    return _report_server;
  endfunction

  // Function: set_report_server
  //
  // Get or set the uvm_report_server that is responsible for servicing
  // the message's actions.  

  virtual function void set_report_server(uvm_report_server rs);
    _report_server = rs;
  endfunction


  //----------------------------------------------------------------------------
  // Group:  Message Fields
  //----------------------------------------------------------------------------


  // Function: get_severity

  virtual function uvm_severity get_severity();
    return _severity;
  endfunction

  // Function: set_severity
  //
  // Get or set the severity (UVM_INFO, UVM_WARNING, UVM_ERROR or 
  // UVM_FATAL) of the message.  The value of this field is determined via
  // the API used (`uvm_info(), `uvm_waring(), etc.) and populated for the user.

  virtual function void set_severity(uvm_severity sev);
    _severity = sev;
  endfunction


  // Function: get_id

  virtual function string get_id();
    return _id;
  endfunction

  // Function: set_id
  //
  // Get or set the id of the message.  The value of this field is 
  // completely under user discretion.  Users are recommended to follow a
  // consistent convention.  Settings in the uvm_report_handler allow various
  // messaging controls based on this field.  See <uvm_report_handler>.

  virtual function void set_id(string id);
    _id = id;
  endfunction


  // Function: get_message

  virtual function string get_message();
    return _message;
  endfunction

  // Function: set_message
  //
  // Get or set the user message content string.

  virtual function void set_message(string msg);
    _message = msg;
  endfunction


  // Function: get_verbosity

  virtual function int get_verbosity();
    return _verbosity;
  endfunction

  // Function: set_verbosity
  //
  // Get or set the message threshold value.  This value is compared
  // against settings in the <uvm_report_handler> to determine whether this
  // message should be executed.

  virtual function void set_verbosity(int ver);
    _verbosity = ver;
  endfunction


  // Function: get_filename

  virtual function string get_filename();
    return _filename;
  endfunction

  // Function: set_filename
  //
  // Get or set the file from which the message originates.  This value
  // is automatically populated by the messaging macros.

  virtual function void set_filename(string fname);
    _filename = fname;
  endfunction


  // Function: get_line

  virtual function int get_line();
    return _line;
  endfunction

  // Function: set_line
  //
  // Get or set the line in the ~file~ from which the message originates.
  // This value is automatically populate by the messaging macros.

  virtual function void set_line(int ln);
    _line = ln;
  endfunction


  // Function: get_context

  virtual function string get_context();
    return _context_name;
  endfunction

  // Function: set_context
  //
  // Get or set the optional user-supplied string that is meant to convey
  // the context of the message.  It can be useful in scopes that are not
  // inherently UVM like modules, interfaces, etc.

  virtual function void set_context(string cn);
    _context_name = cn;
  endfunction
 

  // Function: get_action

  virtual function uvm_action get_action();
    return _action;
  endfunction

  // Function: set_action
  //
  // Get or set the action(s) that the uvm_report_server should perform
  // for this message.  This field is populated by the uvm_report_handler during
  // message execution flow.

  virtual function void set_action(uvm_action act);
    _action = act;
  endfunction


  // Function: get_file

  virtual function UVM_FILE get_file();
    return _file;
  endfunction

  // Function: set_file
  //
  // Get or set the file that the message is to be written to when the 
  // message's action is UVM_LOG.  This field is populated by the 
  // uvm_report_handler during message execution flow.

  virtual function void set_file(UVM_FILE fl);
    _file = fl;
  endfunction


  // Function: get_element_container
  //
  // Get the element_container of the message

  virtual function uvm_report_message_element_container get_element_container();
    return _report_message_element_container;
  endfunction


  // Function: set_report_message
  //
  // Set all the common fields of the report message in one shot.
  //

  virtual function void set_report_message(uvm_severity severity, 
    					   string id,
					   string message,
					   int verbosity, 
    					   string filename,
					   int line,
					   string context_name);
    this._context_name = context_name;
    this._filename = filename;
    this._line = line;
    this._severity = severity;
    this._id = id;
    this._message = message;
    this._verbosity = verbosity;
  endfunction


  //----------------------------------------------------------------------------
  // Group-  Message Recording
  //----------------------------------------------------------------------------

  // Not documented.
  virtual function void m_record_message(uvm_recorder recorder);
    recorder.record_string("message", _message);
  endfunction


  // Not documented.
  virtual function void m_record_core_properties(uvm_recorder recorder);

    string l_string;
    uvm_verbosity l_verbosity;

    if (_context_name != "")
      recorder.record_string("context_name", _context_name);
    recorder.record_string("filename", _filename);
    recorder.record_field("line", _line, $bits(_line), UVM_UNSIGNED);
    recorder.record_string("severity", _severity.name());
    if ($cast(l_verbosity, _verbosity))
      recorder.record_string("verbosity", l_verbosity.name());
    else begin
      l_string.itoa(_verbosity);
      recorder.record_string("verbosity", l_string);
    end

    recorder.record_string("id", _id);
    m_record_message(recorder);
  endfunction

  // Not documented.
  virtual function void do_record(uvm_recorder recorder);

    super.do_record(recorder);

    m_record_core_properties(recorder);
    _report_message_element_container.record(recorder);

  endfunction


  //----------------------------------------------------------------------------
  // Group:  Message Element APIs
  //----------------------------------------------------------------------------


  // Function: add_int
  // 
  // This method adds an integral type of the name ~name~ and value ~value~ to
  // the message.  The required ~size~ field indicates the size of ~value~. 
  // The required ~radix~ field determines how to display and 
  // record the field. The optional print/record bit is to specify whether 
  // the element will be printed/recorded.
  //

  virtual function void add_int(string name, uvm_bitstream_t value, 
                                int size, uvm_radix_enum radix, 
                                uvm_action action = (UVM_LOG|UVM_RM_RECORD));
    _report_message_element_container.add_int(name, value, size, radix, action);
  endfunction


  // Function: add_string
  // 
  // This method adds a string of the name ~name~ and value ~value~ to the 
  // message. The optional print/record bit is to specify whether 
  // the element will be printed/recorded.
  //

  virtual function void add_string(string name, string value,
                                   uvm_action action = (UVM_LOG|UVM_RM_RECORD));
    _report_message_element_container.add_string(name, value, action);
  endfunction


  // Function: add_object
  // 
  // This method adds a uvm_object of the name ~name~ and reference ~obj~ to
  // the message. The optional print/record bit is to specify whether 
  // the element will be printed/recorded. 
  //

  virtual function void add_object(string name, uvm_object obj,
                                   uvm_action action = (UVM_LOG|UVM_RM_RECORD));
    _report_message_element_container.add_object(name, obj, action);
  endfunction

endclass


`endif

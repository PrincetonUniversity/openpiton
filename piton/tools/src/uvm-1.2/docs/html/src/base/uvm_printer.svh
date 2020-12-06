//
//------------------------------------------------------------------------------
//   Copyright 2007-2011 Mentor Graphics Corporation
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
//   the License or the specific language governing
//   permissions and limitations under the License.
//------------------------------------------------------------------------------


typedef class uvm_printer_knobs;

parameter UVM_STDOUT = 1;  // Writes to standard out and logfile

typedef struct {
  int    level;
  string name;
  string type_name;
  string size;
  string val;
} uvm_printer_row_info;


//------------------------------------------------------------------------------
//
// Class: uvm_printer
//
// The uvm_printer class provides an interface for printing <uvm_objects> in
// various formats. Subtypes of uvm_printer implement different print formats,
// or policies.
//
// A user-defined printer format can be created, or one of the following four
// built-in printers can be used:
//
// - <uvm_printer> - provides base printer functionality; must be overridden.
//
// - <uvm_table_printer> - prints the object in a tabular form. 
//
// - <uvm_tree_printer> - prints the object in a tree form. 
//
// - <uvm_line_printer> - prints the information on a single line, but uses the
//   same object separators as the tree printer.
//
// Printers have knobs that you use to control what and how information is printed.
// These knobs are contained in a separate knob class:
//
// - <uvm_printer_knobs> - common printer settings
//
// For convenience, global instances of each printer type are available for
// direct reference in your testbenches.
//
//  -  <uvm_default_tree_printer>
//  -  <uvm_default_line_printer>
//  -  <uvm_default_table_printer>
//  -  <uvm_default_printer> (set to default_table_printer by default)
//
// When <uvm_object::print> and <uvm_object::sprint> are called without 
// specifying a printer, the <uvm_default_printer> is used.
//
//------------------------------------------------------------------------------
virtual class uvm_printer;

  // Variable: knobs
  //
  // The knob object provides access to the variety of knobs associated with a
  // specific printer instance. 
  //
  uvm_printer_knobs knobs = new;


  // Group: Methods for printer usage

  // These functions are called from <uvm_object::print>, or they are called
  // directly on any data to get formatted printing.

  // Function: print_field
  //
  // Prints an integral field (up to 4096 bits).
  //
  // name  - The name of the field. 
  // value - The value of the field.
  // size  - The number of bits of the field (maximum is 4096). 
  // radix - The radix to use for printing. The printer knob for radix is used
  //           if no radix is specified. 
  // scope_separator - is used to find the leaf name since many printers only
  //           print the leaf name of a field.  Typical values for the separator
  //           are . (dot) or [ (open bracket).

  extern virtual function void print_field (string          name, 
                                            uvm_bitstream_t value, 
                                            int    size, 
                                            uvm_radix_enum radix=UVM_NORADIX,
                                            byte   scope_separator=".",
                                            string type_name="");

  // backward compatibility
  virtual function void print_int (string          name, 
                                   uvm_bitstream_t value, 
                                   int    size, 
                                   uvm_radix_enum radix=UVM_NORADIX,
                                   byte   scope_separator=".",
                                   string type_name="");
    print_field (name, value, size, radix, scope_separator, type_name);
  endfunction

  // Function: print_field_int
  //
  // Prints an integral field (up to 64 bits).
  //
  // name  - The name of the field. 
  // value - The value of the field.
  // size  - The number of bits of the field (maximum is 64). 
  // radix - The radix to use for printing. The printer knob for radix is used
  //           if no radix is specified. 
  // scope_separator - is used to find the leaf name since many printers only
  //           print the leaf name of a field.  Typical values for the separator
  //           are . (dot) or [ (open bracket).
  extern virtual function void print_field_int (string name,
                                                uvm_integral_t value, 
                                                int    size, 
                                                uvm_radix_enum radix=UVM_NORADIX,
                                                byte   scope_separator=".",
                                                string type_name="");

  // Function: print_object
  //
  // Prints an object. Whether the object is recursed depends on a variety of
  // knobs, such as the depth knob; if the current depth is at or below the
  // depth setting, then the object is not recursed. 
  //
  // By default, the children of <uvm_components> are printed. To turn this
  // behavior off, you must set the <uvm_component::print_enabled> bit to 0 for
  // the specific children you do not want automatically printed.

  extern virtual function void print_object (string     name,
                                             uvm_object value, 
                                             byte       scope_separator=".");


  extern virtual function void print_object_header (string name,
                                                    uvm_object value,
                                                    byte scope_separator=".");


  // Function: print_string
  //
  // Prints a string field.

  extern virtual function void print_string (string name,
                                             string value, 
                                             byte   scope_separator=".");


  // Function: print_time
  //
  // Prints a time value. name is the name of the field, and value is the
  // value to print. 
  //
  // The print is subject to the ~$timeformat~ system task for formatting time
  // values.

  extern virtual function void print_time (string name,
                                           time   value, 
                                           byte   scope_separator=".");


  // Function: print_real
  //
  // Prints a real field.
   
  extern virtual function void print_real (string  name, 
                                           real    value,
                                           byte    scope_separator=".");

  // Function: print_generic
  //
  // Prints a field having the given ~name~, ~type_name~, ~size~, and ~value~.

  extern virtual function void print_generic (string  name, 
                                              string  type_name, 
                                              int     size, 
                                              string  value,
                                              byte    scope_separator=".");

  // Group: Methods for printer subtyping

  // Function: emit
  //
  // Emits a string representing the contents of an object
  // in a format defined by an extension of this object.
  //
  extern virtual function string emit (); 


  // Function: format_row
  //
  // Hook for producing custom output of a single field (row).
  //
  extern virtual function string format_row (uvm_printer_row_info row);


  // Function: format_header
  //
  // Hook to override base header with a custom header. 
  virtual function string format_header();
    return "";
  endfunction


  // Function: format_footer
  //
  // Hook to override base footer with a custom footer. 
  virtual function string format_footer();
    return "";
  endfunction


  // Function: adjust_name
  //
  // Prints a field's name, or ~id~, which is the full instance name.
  //
  // The intent of the separator is to mark where the leaf name starts if the
  // printer if configured to print only the leaf name of the identifier. 

  extern virtual protected function string adjust_name (string id, 
                                                   byte scope_separator=".");

  // Function: print_array_header
  //
  // Prints the header of an array. This function is called before each
  // individual element is printed. <print_array_footer> is called to mark the
  // completion of array printing.

  extern virtual  function void print_array_header(string name,
                                                   int    size,     
                                                   string arraytype="array",
                                                   byte   scope_separator=".");

  // Function: print_array_range
  //
  // Prints a range using ellipses for values. This method is used when honoring
  // the array knobs for partial printing of large arrays, 
  // <uvm_printer_knobs::begin_elements> and <uvm_printer_knobs::end_elements>. 
  //
  // This function should be called after begin_elements have been printed
  // and before end_elements have been printed.

  extern virtual function void print_array_range (int min, int max);


  // Function: print_array_footer
  //
  // Prints the header of a footer. This function marks the end of an array
  // print. Generally, there is no output associated with the array footer, but
  // this method let's the printer know that the array printing is complete.

  extern virtual  function void print_array_footer (int size = 0);



  // Utility methods
  extern  function bit istop ();
  extern  function string index_string (int index, string name="");

  protected bit m_array_stack[$];
  uvm_scope_stack m_scope = new;
  string m_string;

  // holds each cell entry
  protected uvm_printer_row_info m_rows[$];

endclass


//------------------------------------------------------------------------------
//
// Class: uvm_table_printer
//
// The table printer prints output in a tabular format.
//
// The following shows sample output from the table printer.
//
//|  ---------------------------------------------------
//|  Name        Type            Size        Value
//|  ---------------------------------------------------
//|  c1          container       -           @1013
//|  d1          mydata          -           @1022
//|  v1          integral        32          'hcb8f1c97
//|  e1          enum            32          THREE
//|  str         string          2           hi
//|  value       integral        12          'h2d
//|  ---------------------------------------------------
//
//------------------------------------------------------------------------------

class uvm_table_printer extends uvm_printer;

  // Variable: new
  //
  // Creates a new instance of ~uvm_table_printer~.
  //
  extern function new(); 

  // Function: emit
  //
  // Formats the collected information from prior calls to ~print_*~
  // into table format.
  //
  extern virtual function string emit();

  // Variables- m_max_*
  //
  // holds max size of each column, so table columns can be resized dynamically

  protected int m_max_name;
  protected int m_max_type;
  protected int m_max_size;
  protected int m_max_value;

  extern function void calculate_max_widths();

endclass


//------------------------------------------------------------------------------
//
// Class: uvm_tree_printer
//
// By overriding various methods of the <uvm_printer> super class,
// the tree printer prints output in a tree format.
//
// The following shows sample output from the tree printer.
//
//|  c1: (container@1013) {
//|    d1: (mydata@1022) {
//|         v1: 'hcb8f1c97
//|         e1: THREE
//|         str: hi
//|    }  
//|    value: 'h2d
//|  }
//
//------------------------------------------------------------------------------

class uvm_tree_printer extends uvm_printer;

  string newline = "\n";

  // Variable: new
  //
  // Creates a new instance of ~uvm_tree_printer~.

  extern function new();

  // Function: emit
  //
  // Formats the collected information from prior calls to ~print_*~
  // into hierarchical tree format.
  //
  extern virtual function string emit();

endclass



//------------------------------------------------------------------------------
//
// Class: uvm_line_printer
//
// The line printer prints output in a line format.
//
// The following shows sample output from the line printer.
//
//| c1: (container@1013) { d1: (mydata@1022) { v1: 'hcb8f1c97 e1: THREE str: hi } value: 'h2d } 
//------------------------------------------------------------------------------

class uvm_line_printer extends uvm_tree_printer;

  // Variable: new
  //
  // Creates a new instance of ~uvm_line_printer~. It differs from the
  // <uvm_tree_printer> only in that the output contains no line-feeds
  // and indentation.

  function new(); 
    newline = " ";
    knobs.indent = 0;
  endfunction

endclass



//------------------------------------------------------------------------------
//
// Class: uvm_printer_knobs
//
// The ~uvm_printer_knobs~ class defines the printer settings available to all
// printer subtypes. 
//
//------------------------------------------------------------------------------

class uvm_printer_knobs;

  // Variable: header
  //
  // Indicates whether the <uvm_printer::format_header> function should be called when
  // printing an object.

  bit header = 1;


  // Variable: footer
  //
  // Indicates whether the <uvm_printer::format_footer> function should be called when
  // printing an object. 

  bit footer = 1;


  // Variable: full_name
  //
  // Indicates whether <uvm_printer::adjust_name> should print the full name of an identifier
  // or just the leaf name.

  bit full_name = 0;


  // Variable: identifier
  //
  // Indicates whether <uvm_printer::adjust_name> should print the identifier. This is useful
  // in cases where you just want the values of an object, but no identifiers.

  bit identifier = 1;


  // Variable: type_name
  //
  // Controls whether to print a field's type name. 

  bit type_name = 1;


  // Variable: size
  //
  // Controls whether to print a field's size. 

  bit size = 1;


  // Variable: depth
  //
  // Indicates how deep to recurse when printing objects. 
  // A depth of -1 means to print everything.

  int depth = -1;
  

  // Variable: reference
  //
  // Controls whether to print a unique reference ID for object handles.
  // The behavior of this knob is simulator-dependent.

  bit reference = 1;


  // Variable: begin_elements
  //
  // Defines the number of elements at the head of a list to print.
  // Use -1 for no max.

  int begin_elements = 5;


  // Variable: end_elements
  //
  // This defines the number of elements at the end of a list that
  // should be printed.
  
  int end_elements = 5;


  // Variable: prefix
  //
  // Specifies the string prepended to each output line
  
  string prefix = ""; 


  // Variable: indent
  //
  // This knob specifies the number of spaces to use for level indentation. 
  // The default level indentation is two spaces.

  int indent = 2;


  // Variable: show_root
  //
  // This setting indicates whether or not the initial object that is printed
  // (when current depth is 0) prints the full path name. By default, the first
  // object is treated like all other objects and only the leaf name is printed.

  bit show_root = 0;


  // Variable: mcd
  //
  // This is a file descriptor, or multi-channel descriptor, that specifies
  // where the print output should be directed. 
  //
  // By default, the output goes to the standard output of the simulator.

  int mcd = UVM_STDOUT; 


  // Variable: separator
  //
  // For tree printers only, determines the opening and closing
  // separators used for nested objects.

  string separator = "{}";


  // Variable: show_radix
  //
  // Indicates whether the radix string ('h, and so on) should be prepended to
  // an integral value when one is printed.

  bit show_radix = 1;


  // Variable: default_radix
  //
  // This knob sets the default radix to use for integral values when no radix
  // enum is explicitly supplied to the <uvm_printer::print_field> or 
  // <uvm_printer::print_field_int> methods.

  uvm_radix_enum default_radix = UVM_HEX;

  
  // Variable: dec_radix
  //
  // This string should be prepended to the value of an integral type when a
  // radix of <UVM_DEC> is used for the radix of the integral object. 
  //
  // When a negative number is printed, the radix is not printed since only
  // signed decimal values can print as negative.

  string dec_radix = "'d";


  // Variable: bin_radix
  //
  // This string should be prepended to the value of an integral type when a
  // radix of <UVM_BIN> is used for the radix of the integral object.

  string bin_radix = "'b";


  // Variable: oct_radix
  //
  // This string should be prepended to the value of an integral type when a
  // radix of <UVM_OCT> is used for the radix of the integral object.

  string oct_radix = "'o";


  // Variable: unsigned_radix
  //
  // This is the string which should be prepended to the value of an integral
  // type when a radix of <UVM_UNSIGNED> is used for the radix of the integral
  // object. 

  string unsigned_radix = "'d";


  // Variable: hex_radix
  //
  // This string should be prepended to the value of an integral type when a
  // radix of <UVM_HEX> is used for the radix of the integral object.

  string hex_radix = "'h";


  // Function: get_radix_str
  //
  // Converts the radix from an enumerated to a printable radix according to
  // the radix printing knobs (bin_radix, and so on).

  function string get_radix_str(uvm_radix_enum radix);
    if(show_radix == 0)
      return "";
    if(radix == UVM_NORADIX)
      radix = default_radix;
    case(radix)
      UVM_BIN: return bin_radix;
      UVM_OCT: return oct_radix;
      UVM_DEC: return dec_radix;
      UVM_HEX: return hex_radix;
      UVM_UNSIGNED: return unsigned_radix;
      default: return "";
    endcase
  endfunction

  // Deprecated knobs, hereafter ignored
  int max_width = 999;
  string truncation = "+"; 
  int name_width = -1;
  int type_width = -1;
  int size_width = -1;
  int value_width = -1;
  bit sprint = 1;

endclass


typedef uvm_printer_knobs uvm_table_printer_knobs;
typedef uvm_printer_knobs uvm_tree_printer_knobs;


//------------------------------------------------------------------------------
// IMPLEMENTATION
//------------------------------------------------------------------------------

// emit
// ----

function string uvm_printer::emit (); 
  `uvm_error("NO_OVERRIDE","emit() method not overridden in printer subtype")
  return "";
endfunction


// format_row
// ----------

function string uvm_printer::format_row (uvm_printer_row_info row);
  return "";
endfunction


// print_array_header
// ------------------

function void uvm_printer::print_array_header (string name,
                                               int size,
                                               string arraytype="array",
                                               byte scope_separator=".");
  uvm_printer_row_info row_info;

  if(name != "")
    m_scope.set_arg(name);

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(m_scope.get(),scope_separator);
  row_info.type_name = arraytype;
  row_info.size = $sformatf("%0d",size);
  row_info.val = "-";

  m_rows.push_back(row_info);

  m_scope.down(name);
  m_array_stack.push_back(1);
endfunction


// print_array_footer
// ------------------

function void  uvm_printer::print_array_footer (int size=0);
  if(m_array_stack.size()) begin
    m_scope.up();
    void'(m_array_stack.pop_front());
  end
endfunction


// print_array_range
// -----------------

function void uvm_printer::print_array_range(int min, int max);
  string tmpstr;
  if(min == -1 && max == -1)
     return;
  if(min == -1)
     min = max;
  if(max == -1)
     max = min;
  if(max < min)
     return;
  print_generic("...", "...", -2, "...");
endfunction


// print_object_header
// -------------------

function void uvm_printer::print_object_header (string name,
                                                uvm_object value,
                                                byte scope_separator=".");
  uvm_printer_row_info row_info;
  uvm_component comp;

  if(name == "") begin
    if(value!=null) begin
      if((m_scope.depth()==0) && $cast(comp, value)) begin
        name = comp.get_full_name();
      end
      else begin
        name=value.get_name();
      end
    end
  end
        
  if(name == "")
    name = "<unnamed>";

  m_scope.set_arg(name);

  row_info.level = m_scope.depth();

  if(row_info.level == 0 && knobs.show_root==1)
	row_info.name = value.get_full_name();
  else
	row_info.name = adjust_name(m_scope.get(),scope_separator);

  row_info.type_name = (value != null) ?  value.get_type_name() : "object";
  row_info.size = "-";
  row_info.val = knobs.reference ? uvm_object_value_str(value) : "-";

  m_rows.push_back(row_info);

endfunction


// print_object
// ------------

function void uvm_printer::print_object (string name, uvm_object value,
                                         byte scope_separator=".");
  uvm_component comp, child_comp;

  print_object_header(name,value,scope_separator);

  if(value != null)  begin
    if((knobs.depth == -1 || (knobs.depth > m_scope.depth())) &&
          !value.__m_uvm_status_container.cycle_check.exists(value)) begin

      value.__m_uvm_status_container.cycle_check[value] = 1;
      if(name=="" && value!=null) 
        m_scope.down(value.get_name());
      else
        m_scope.down(name);

      //Handle children of the comp
      if($cast(comp, value)) begin
        string name;
        if (comp.get_first_child(name))
          do begin
            child_comp = comp.get_child(name);
            if(child_comp.print_enabled)
              this.print_object("",child_comp);
          end while (comp.get_next_child(name));
      end

      // print members of object
      void'(value.sprint(this));

      if(name != "" && name[0] == "[")
        m_scope.up("[");
      else
        m_scope.up(".");
      value.__m_uvm_status_container.cycle_check.delete(value);
    end
  end

endfunction


// istop
// -----

function bit uvm_printer::istop ();
  return (m_scope.depth() == 0);
endfunction


// adjust_name
// -----------

function string uvm_printer::adjust_name(string id, byte scope_separator=".");
  if (knobs.show_root && m_scope.depth()==0 || knobs.full_name || id == "...")
    return id;
  return uvm_leaf_scope(id, scope_separator);
endfunction


// print_generic
// -------------

function void uvm_printer::print_generic (string name,
                                          string type_name,        
                                          int size,
                                          string value,
                                          byte scope_separator=".");

  uvm_printer_row_info row_info;

  if (name != "" && name != "...") begin
    m_scope.set_arg(name);
    name = m_scope.get();
  end

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(name,scope_separator);
  row_info.type_name = type_name;
  row_info.size = (size == -2 ? "..." : $sformatf("%0d",size));
  row_info.val = (value == "" ? "\"\"" : value);

  m_rows.push_back(row_info);

endfunction


// print_field
// ---------

function void uvm_printer::print_field (string name,
                                      uvm_bitstream_t value, 
                                      int size, 
                                      uvm_radix_enum radix=UVM_NORADIX,
                                      byte scope_separator=".",
                                      string type_name="");
  
  uvm_printer_row_info row_info;
  string sz_str, val_str;

  if(name != "") begin
    m_scope.set_arg(name);
    name = m_scope.get();
  end

  if(type_name == "") begin
    if(radix == UVM_TIME)
      type_name ="time";
    else if(radix == UVM_STRING)
      type_name ="string";
    else
      type_name ="integral";
  end

  sz_str.itoa(size);

  if(radix == UVM_NORADIX)
    radix = knobs.default_radix;

  val_str = uvm_bitstream_to_string (value, size, radix,
                                     knobs.get_radix_str(radix));

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(name,scope_separator);
  row_info.type_name = type_name;
  row_info.size = sz_str;
  row_info.val = val_str;

  m_rows.push_back(row_info);

endfunction
  
// print_field_int
// ---------

function void uvm_printer::print_field_int (string name,
                                            uvm_integral_t value, 
                                            int          size, 
                                            uvm_radix_enum radix=UVM_NORADIX,
                                            byte         scope_separator=".",
                                            string       type_name="");
  
  uvm_printer_row_info row_info;
  string sz_str, val_str;

  if(name != "") begin
    m_scope.set_arg(name);
    name = m_scope.get();
  end

  if(type_name == "") begin
    if(radix == UVM_TIME)
      type_name ="time";
    else if(radix == UVM_STRING)
      type_name ="string";
    else
      type_name ="integral";
  end

  sz_str.itoa(size);

  if(radix == UVM_NORADIX)
    radix = knobs.default_radix;

  val_str = uvm_integral_to_string (value, size, radix,
                                    knobs.get_radix_str(radix));

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(name,scope_separator);
  row_info.type_name = type_name;
  row_info.size = sz_str;
  row_info.val = val_str;

  m_rows.push_back(row_info);

endfunction
  

// print_time
// ----------

function void uvm_printer::print_time (string name,
                                       time value,
                                       byte scope_separator=".");
  print_field_int(name, value, 64, UVM_TIME, scope_separator);
endfunction


// print_string
// ------------

function void uvm_printer::print_string (string name,
                                         string value,
                                         byte scope_separator=".");

  uvm_printer_row_info row_info;

  if(name != "")
    m_scope.set_arg(name);

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(m_scope.get(),scope_separator);
  row_info.type_name = "string";
  row_info.size = $sformatf("%0d",value.len());
  row_info.val = (value == "" ? "\"\"" : value);

  m_rows.push_back(row_info);

endfunction


// print_real
// ----------

function void uvm_printer::print_real (string name,
                                       real value,
                                       byte scope_separator=".");

  uvm_printer_row_info row_info;

  if (name != "" && name != "...") begin
    m_scope.set_arg(name);
    name = m_scope.get();
  end

  row_info.level = m_scope.depth();
  row_info.name = adjust_name(m_scope.get(),scope_separator);
  row_info.type_name = "real";
  row_info.size = "64";
  row_info.val = $sformatf("%f",value);

  m_rows.push_back(row_info);

endfunction


// index_string
// ------------

function string uvm_printer::index_string(int index, string name="");
  index_string.itoa(index);
  index_string = { name, "[", index_string, "]" }; 
endfunction



//------------------------------------------------------------------------------
// Class- uvm_table_printer
//------------------------------------------------------------------------------

// new
// ---

function uvm_table_printer::new(); 
  super.new();
endfunction


// calculate_max_widths
// --------------------

function void uvm_table_printer::calculate_max_widths();
   m_max_name=4;
   m_max_type=4;
   m_max_size = 4;
   m_max_value= 5;
   foreach(m_rows[j]) begin
      int name_len;
      uvm_printer_row_info row = m_rows[j];
      name_len = knobs.indent*row.level + row.name.len();
      if (name_len > m_max_name)
        m_max_name = name_len;
      if (row.type_name.len() > m_max_type)
        m_max_type = row.type_name.len();
      if (row.size.len() > m_max_size)
        m_max_size = row.size.len();
      if (row.val.len() > m_max_value)
        m_max_value = row.val.len();
   end
endfunction

// emit
// ----

function string uvm_table_printer::emit();

  string s;
  string user_format;
  static string dash; // = "---------------------------------------------------------------------------------------------------";
  static string space; //= "                                                                                                   ";
  string dashes;

  string linefeed = {"\n", knobs.prefix};

  calculate_max_widths(); 

   begin
      int q[5];
      int m;
      int qq[$];
      
      q = '{m_max_name,m_max_type,m_max_size,m_max_value,100};
      qq = q.max;
      m = qq[0];
  	if(dash.len()<m) begin
  		dash = {m{"-"}};
  		space = {m{" "}};
  	end
  end
  
  if (knobs.header) begin
    string header;
    user_format = format_header();
    if (user_format == "") begin
      string dash_id, dash_typ, dash_sz;
      string head_id, head_typ, head_sz;
      if (knobs.identifier) begin
        dashes = {dash.substr(1,m_max_name+2)};
        header = {"Name",space.substr(1,m_max_name-2)};
      end
      if (knobs.type_name) begin
        dashes = {dashes, dash.substr(1,m_max_type+2)};
        header = {header, "Type",space.substr(1,m_max_type-2)};
      end
      if (knobs.size) begin
        dashes = {dashes, dash.substr(1,m_max_size+2)};
        header = {header, "Size",space.substr(1,m_max_size-2)};
      end
      dashes = {dashes, dash.substr(1,m_max_value), linefeed};
      header = {header, "Value", space.substr(1,m_max_value-5), linefeed};

      s = {s, dashes, header, dashes};
    end
    else begin
      s = {s, user_format, linefeed};
    end
  end

  foreach (m_rows[i]) begin
    uvm_printer_row_info row = m_rows[i];
    user_format = format_row(row);
    if (user_format == "") begin
      string row_str;
      if (knobs.identifier)
        row_str = {space.substr(1,row.level * knobs.indent), row.name,
                   space.substr(1,m_max_name-row.name.len()-(row.level*knobs.indent)+2)};
      if (knobs.type_name)
        row_str = {row_str, row.type_name, space.substr(1,m_max_type-row.type_name.len()+2)};
      if (knobs.size)
        row_str = {row_str, row.size, space.substr(1,m_max_size-row.size.len()+2)};
      s = {s, row_str, row.val, space.substr(1,m_max_value-row.val.len()), linefeed};
    end
    else
      s = {s, user_format, linefeed};
  end
 
  if (knobs.footer) begin
    user_format = format_footer();
    if (user_format == "")
      s = {s, dashes};
    else
      s = {s, user_format, linefeed};
  end

  emit = {knobs.prefix, s};
  m_rows.delete();
endfunction



//------------------------------------------------------------------------------
// Class- uvm_tree_printer
//------------------------------------------------------------------------------


// new
// ---

function uvm_tree_printer::new();
  super.new();
  knobs.size = 0;
  knobs.type_name = 0;
  knobs.header = 0;
  knobs.footer = 0;
endfunction


// emit
// ----

function string uvm_tree_printer::emit();

  string s = knobs.prefix;
  string space= "                                                                                                   ";
  string user_format;

  string linefeed = newline == "" || newline == " " ? newline : {newline, knobs.prefix};

  // Header
  if (knobs.header) begin
    user_format = format_header();
    if (user_format != "")
      s = {s, user_format, linefeed};
  end

  foreach (m_rows[i]) begin
    uvm_printer_row_info row = m_rows[i];
    user_format = format_row(row);
    if (user_format == "") begin
      string indent_str;
      indent_str = space.substr(1,row.level * knobs.indent); 

      // Name (id)
      if (knobs.identifier) begin
        s = {s,indent_str, row.name};
        if (row.name != "" && row.name != "...")
          s = {s, ": "};
      end

      // Type Name
      if (row.val[0] == "@") // is an object w/ knobs.reference on
        s = {s,"(",row.type_name,row.val,") "};
      else
        if (knobs.type_name &&
             (row.type_name != "" ||
              row.type_name != "-" ||
              row.type_name != "..."))
          s = {s,"(",row.type_name,") "};
        
      // Size
      if (knobs.size) begin
        if (row.size != "" || row.size != "-")
            s = {s,"(",row.size,") "};
      end

      if (i < m_rows.size()-1) begin
        if (m_rows[i+1].level > row.level) begin
          s = {s, string'(knobs.separator[0]), linefeed};
          continue;
        end
      end

      // Value (unconditional)
      s = {s, row.val, " ", linefeed};

      // Scope handling...
      if (i <= m_rows.size()-1) begin
        int end_level;
        if (i == m_rows.size()-1)
          end_level = 0;
        else
          end_level = m_rows[i+1].level;
        if (end_level < row.level) begin
          string indent_str;
          for (int l=row.level-1; l >= end_level; l--) begin
            indent_str = space.substr(1,l * knobs.indent); 
            s = {s, indent_str, string'(knobs.separator[1]), linefeed};
          end
        end
      end

    end
    else
      s = {s, user_format};
  end
 
  // Footer
  if (knobs.footer) begin
    user_format = format_footer();
    if (user_format != "")
      s = {s, user_format, linefeed};
  end

  if (newline == "" || newline == " ")
    s = {s, "\n"};

  emit = s;
  m_rows.delete();
endfunction


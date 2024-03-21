//-----------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// CLASS: uvm_comparer
//
// The uvm_comparer class provides a policy object for doing comparisons. The
// policies determine how miscompares are treated and counted. Results of a
// comparison are stored in the comparer object. The <uvm_object::compare>
// and <uvm_object::do_compare> methods are passed a uvm_comparer policy
// object.
//
//------------------------------------------------------------------------------

class uvm_comparer;

  // Variable: policy
  //
  // Determines whether comparison is UVM_DEEP, UVM_REFERENCE, or UVM_SHALLOW.

  uvm_recursion_policy_enum policy = UVM_DEFAULT_POLICY;


  // Variable: show_max
  //
  // Sets the maximum number of messages to send to the printer for miscompares
  // of an object. 

  int unsigned show_max = 1;


  // Variable: verbosity
  //
  // Sets the verbosity for printed messages. 
  //
  // The verbosity setting is used by the messaging mechanism to determine
  // whether messages should be suppressed or shown.

  int unsigned verbosity = UVM_LOW;


  // Variable: sev
  //
  // Sets the severity for printed messages. 
  //
  // The severity setting is used by the messaging mechanism for printing and
  // filtering messages.

  uvm_severity sev = UVM_INFO;


  // Variable: miscompares
  //
  // This string is reset to an empty string when a comparison is started. 
  //
  // The string holds the last set of miscompares that occurred during a
  // comparison.

  string miscompares = "";


  // Variable: physical
  //
  // This bit provides a filtering mechanism for fields. 
  //
  // The abstract and physical settings allow an object to distinguish between
  // two different classes of fields.
  //
  // It is up to you, in the <uvm_object::do_compare> method, to test the
  // setting of this field if you want to use the physical trait as a filter.

  bit physical = 1;


  // Variable: abstract
  //
  // This bit provides a filtering mechanism for fields. 
  //
  // The abstract and physical settings allow an object to distinguish between
  // two different classes of fields.
  //
  // It is up to you, in the <uvm_object::do_compare> method, to test the
  // setting of this field if you want to use the abstract trait as a filter.

  bit abstract = 1;


  // Variable: check_type
  //
  // This bit determines whether the type, given by <uvm_object::get_type_name>,
  // is used to verify that the types of two objects are the same. 
  //
  // This bit is used by the <compare_object> method. In some cases it is useful
  // to set this to 0 when the two operands are related by inheritance but are
  // different types.

  bit check_type = 1;


  // Variable: result
  // 
  // This bit stores the number of miscompares for a given compare operation.
  // You can use the result to determine the number of miscompares that
  // were found.

  int unsigned result = 0;


  // Function: compare_field
  //
  // Compares two integral values. 
  //
  // The ~name~ input is used for purposes of storing and printing a miscompare.
  //
  // The left-hand-side ~lhs~ and right-hand-side ~rhs~ objects are the two
  // objects used for comparison. 
  //
  // The size variable indicates the number of bits to compare; size must be
  // less than or equal to 4096. 
  //
  // The radix is used for reporting purposes, the default radix is hex.

  virtual function bit compare_field (string name, 
                                      uvm_bitstream_t lhs, 
                                      uvm_bitstream_t rhs, 
                                      int size,
                                      uvm_radix_enum radix=UVM_NORADIX); 
    uvm_bitstream_t mask;
    string msg;
  
    if(size <= 64)
      return compare_field_int(name, lhs, rhs, size, radix);
  
    mask = -1;
    mask >>= (UVM_STREAMBITS-size);
    if((lhs & mask) !== (rhs & mask)) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      case (radix)
        UVM_BIN: begin
              $swrite(msg, "lhs = 'b%0b : rhs = 'b%0b", 
                       lhs&mask, rhs&mask);
             end
        UVM_OCT: begin
              $swrite(msg, "lhs = 'o%0o : rhs = 'o%0o", 
                       lhs&mask, rhs&mask);
             end
        UVM_DEC: begin
              $swrite(msg, "lhs = %0d : rhs = %0d", 
                       lhs&mask, rhs&mask);
             end
        UVM_TIME: begin
            $swrite(msg, "lhs = %0t : rhs = %0t", 
               lhs&mask, rhs&mask);
        end
        UVM_STRING: begin
              $swrite(msg, "lhs = %0s : rhs = %0s", 
                       lhs&mask, rhs&mask);
             end
        UVM_ENUM: begin
              //Printed as decimal, user should cuse compare string for enum val
              $swrite(msg, "lhs = %0d : rhs = %0d", 
                       lhs&mask, rhs&mask);
              end
        default: begin
              $swrite(msg, "lhs = 'h%0x : rhs = 'h%0x", 
                       lhs&mask, rhs&mask);
             end
      endcase
      print_msg(msg);
      return 0;
    end
    return 1;
  endfunction

  
  
  // Function: compare_field_int
  //
  // This method is the same as <compare_field> except that the arguments are
  // small integers, less than or equal to 64 bits. It is automatically called
  // by <compare_field> if the operand size is less than or equal to 64.

  virtual function bit compare_field_int (string name, 
                                          uvm_integral_t lhs, 
                                          uvm_integral_t rhs, 
                                          int size,
                                          uvm_radix_enum radix=UVM_NORADIX); 
    logic [63:0] mask;
    string msg;
  
    mask = -1;
    mask >>= (64-size);
    if((lhs & mask) !== (rhs & mask)) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      case (radix)
        UVM_BIN: begin
              $swrite(msg, "lhs = 'b%0b : rhs = 'b%0b", 
                       lhs&mask, rhs&mask);
             end
        UVM_OCT: begin
              $swrite(msg, "lhs = 'o%0o : rhs = 'o%0o", 
                       lhs&mask, rhs&mask);
             end
        UVM_DEC: begin
              $swrite(msg, "lhs = %0d : rhs = %0d", 
                       lhs&mask, rhs&mask);
             end
        UVM_TIME: begin
            $swrite(msg, "lhs = %0t : rhs = %0t", 
               lhs&mask, rhs&mask);
        end
        UVM_STRING: begin
              $swrite(msg, "lhs = %0s : rhs = %0s", 
                       lhs&mask, rhs&mask);
             end
        UVM_ENUM: begin
              //Printed as decimal, user should cuse compare string for enum val
              $swrite(msg, "lhs = %0d : rhs = %0d", 
                       lhs&mask, rhs&mask);
              end
        default: begin
              $swrite(msg, "lhs = 'h%0x : rhs = 'h%0x", 
                       lhs&mask, rhs&mask);
             end
      endcase
      print_msg(msg);
      return 0;
    end
    return 1;
  endfunction


  // Function: compare_field_real
  //
  // This method is the same as <compare_field> except that the arguments are
  // real numbers.

  virtual function bit compare_field_real (string name, 
                                          real lhs, 
                                          real rhs);
    string msg;
  
    if(lhs != rhs) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      $swrite(msg, "lhs = ", lhs, " : rhs = ", rhs);
      print_msg(msg);
      return 0;
    end
    return 1;
  endfunction


  // Function: compare_object
  //
  // Compares two class objects using the <policy> knob to determine whether the
  // comparison should be deep, shallow, or reference. 
  //
  // The name input is used for purposes of storing and printing a miscompare. 
  //
  // The ~lhs~ and ~rhs~ objects are the two objects used for comparison. 
  //
  // The ~check_type~ determines whether or not to verify the object
  // types match (the return from ~lhs.get_type_name()~ matches
  // ~rhs.get_type_name()~).

  virtual function bit compare_object (string name,
                                       uvm_object lhs,
                                       uvm_object rhs);
    if (rhs == lhs)
      return 1;

    if (policy == UVM_REFERENCE && lhs != rhs) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      print_msg_object(lhs, rhs);
      return 0;
    end

    if (rhs == null || lhs == null) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      print_msg_object(lhs, rhs);
      return 0;  //miscompare
    end

    uvm_object::__m_uvm_status_container.scope.down(name);
    compare_object = lhs.compare(rhs, this);
    uvm_object::__m_uvm_status_container.scope.up();

  endfunction
  
  
  // Function: compare_string
  //
  // Compares two string variables. 
  //
  // The ~name~ input is used for purposes of storing and printing a miscompare. 
  //
  // The ~lhs~ and ~rhs~ objects are the two objects used for comparison.

  virtual function bit compare_string (string name,
                                       string lhs,
                                       string rhs);
    string msg;
    if(lhs != rhs) begin
      uvm_object::__m_uvm_status_container.scope.set_arg(name);
      msg = { "lhs = \"", lhs, "\" : rhs = \"", rhs, "\""};
      print_msg(msg);
      return 0;
    end
    return 1;
  endfunction


  // Function: print_msg
  //
  // Causes the error count to be incremented and the message, ~msg~, to be
  // appended to the <miscompares> string (a newline is used to separate
  // messages). 
  //
  // If the message count is less than the <show_max> setting, then the message
  // is printed to standard-out using the current verbosity and severity
  // settings. See the <verbosity> and <sev> variables for more information.

  function void print_msg (string msg);
    uvm_root root;
    uvm_coreservice_t cs;
    cs = uvm_coreservice_t::get();
    root = cs.get_root();
     
    result++;
    if(result <= show_max) begin
       msg = {"Miscompare for ", uvm_object::__m_uvm_status_container.scope.get(), ": ", msg};
       root.uvm_report(sev, "MISCMP", msg, verbosity, `uvm_file, `uvm_line);
    end
    miscompares = { miscompares, uvm_object::__m_uvm_status_container.scope.get(), ": ", msg, "\n" };
  endfunction



  // Internal methods - do not call directly

  // print_rollup
  // ------------

  //Need this function because sformat doesn't support objects
  function void print_rollup(uvm_object rhs, uvm_object lhs);
    uvm_root root;
    uvm_coreservice_t cs;

    string msg;
    cs = uvm_coreservice_t::get();
    root = cs.get_root();
    if(uvm_object::__m_uvm_status_container.scope.depth() == 0) begin
      if(result && (show_max || (uvm_severity'(sev) != UVM_INFO))) begin
        if(show_max < result) 
           $swrite(msg, "%0d Miscompare(s) (%0d shown) for object ",
             result, show_max);
        else begin
           $swrite(msg, "%0d Miscompare(s) for object ", result);
        end

        root.uvm_report(sev, "MISCMP", $sformatf("%s%s@%0d vs. %s@%0d", msg,
                        lhs.get_name(), lhs.get_inst_id(), rhs.get_name(), rhs.get_inst_id()),
			verbosity, `uvm_file, `uvm_line);
      end
    end
  endfunction


  // print_msg_object
  // ----------------

  function void print_msg_object(uvm_object lhs, uvm_object rhs);
      uvm_root root;
  uvm_coreservice_t cs;
  cs = uvm_coreservice_t::get();
  root = cs.get_root();

    result++;
    if(result <= show_max) begin
       root.uvm_report(sev, "MISCMP",
         $sformatf("Miscompare for %0s: lhs = @%0d : rhs = @%0d",
         uvm_object::__m_uvm_status_container.scope.get(), (lhs!=null ? lhs.get_inst_id() : 0), 	(rhs != null ? rhs.get_inst_id() : 0)), verbosity, `uvm_file, `uvm_line);
    end
    $swrite(miscompares, "%s%s: lhs = @%0d : rhs = @%0d",
        miscompares, uvm_object::__m_uvm_status_container.scope.get(), (lhs != null ? lhs.get_inst_id() : 0), (rhs != null ? rhs.get_inst_id() : 0));
  endfunction



  // init ??

  static function uvm_comparer init();
    if(uvm_default_comparer==null) uvm_default_comparer=new;
    return uvm_default_comparer;
  endfunction

 
  int depth;                      //current depth of objects
  uvm_object compare_map[uvm_object];
  uvm_scope_stack scope    = new;

endclass


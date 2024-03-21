//
// -------------------------------------------------------------
//    Copyright 2010 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010 Cadence Design Systems, Inc.
//    All Rights Reserved Worldwide
//
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
//


//
// CLASS: uvm_reg_file
// Register file abstraction base class
//
// A register file is a collection of register files and registers
// used to create regular repeated structures.
//
// Register files are usually instantiated as arrays.
//
virtual class uvm_reg_file extends uvm_object;

   local uvm_reg_block     parent;
   local uvm_reg_file   m_rf;
   local string            default_hdl_path = "RTL";
   local uvm_object_string_pool #(uvm_queue #(string)) hdl_paths_pool;


   //----------------------
   // Group: Initialization
   //----------------------

   //
   // Function: new
   //
   // Create a new instance
   //
   // Creates an instance of a register file abstraction class
   // with the specified name.
   //
   extern function                  new        (string name="");

   //
   // Function: configure
   // Configure a register file instance
   //
   // Specify the parent block and register file of the register file
   // instance.
   // If the register file is instantiated in a block,
   // ~regfile_parent~ is specified as ~null~.
   // If the register file is instantiated in a register file,
   // ~blk_parent~ must be the block parent of that register file and
   // ~regfile_parent~ is specified as that register file.
   //
   // If the register file corresponds to a hierarchical RTL structure,
   // its contribution to the HDL path is specified as the ~hdl_path~.
   // Otherwise, the register file does not correspond to a hierarchical RTL
   // structure (e.g. it is physically flattened) and does not contribute
   // to the hierarchical HDL path of any contained registers.
   //
   extern function void     configure  (uvm_reg_block blk_parent,
                                        uvm_reg_file regfile_parent,
                                        string hdl_path = "");
 
   //---------------------
   // Group: Introspection
   //---------------------

   //
   // Function: get_name
   // Get the simple name
   //
   // Return the simple object name of this register file.
   //

   //
   // Function: get_full_name
   // Get the hierarchical name
   //
   // Return the hierarchal name of this register file.
   // The base of the hierarchical name is the root block.
   //
   extern virtual function string        get_full_name();

   //
   // Function: get_parent
   // Get the parent block
   //
   extern virtual function uvm_reg_block get_parent ();
   extern virtual function uvm_reg_block get_block  ();

   //
   // Function: get_regfile
   // Get the parent register file
   //
   // Returns ~null~ if this register file is instantiated in a block.
   //
   extern virtual function uvm_reg_file  get_regfile     ();


   //----------------
   // Group: Backdoor
   //----------------

   //
   // Function:  clear_hdl_path
   // Delete HDL paths
   //
   // Remove any previously specified HDL path to the register file instance
   // for the specified design abstraction.
   //
   extern function void clear_hdl_path    (string kind = "RTL");

   //
   // Function:  add_hdl_path
   // Add an HDL path
   //
   // Add the specified HDL path to the register file instance for the specified
   // design abstraction. This method may be called more than once for the
   // same design abstraction if the register file is physically duplicated
   // in the design abstraction
   //
   extern function void add_hdl_path      (string path, string kind = "RTL");

   //
   // Function:   has_hdl_path
   // Check if a HDL path is specified
   //
   // Returns TRUE if the register file instance has a HDL path defined for the
   // specified design abstraction. If no design abstraction is specified,
   // uses the default design abstraction specified for the nearest
   // enclosing register file or block
   //
   // If no design abstraction is specified, the default design abstraction
   // for this register file is used.
   //
   extern function bit  has_hdl_path      (string kind = "");

   //
   // Function:  get_hdl_path
   // Get the incremental HDL path(s)
   //
   // Returns the HDL path(s) defined for the specified design abstraction
   // in the register file instance. If no design abstraction is specified, uses
   // the default design abstraction specified for the nearest enclosing
   // register file or block.
   // Returns only the component of the HDL paths that corresponds to
   // the register file, not a full hierarchical path
   //
   // If no design abstraction is specified, the default design abstraction
   // for this register file is used.
   //
   extern function void get_hdl_path      (ref string paths[$], input string kind = "");

   //
   // Function:  get_full_hdl_path
   // Get the full hierarchical HDL path(s)
   //
   // Returns the full hierarchical HDL path(s) defined for the specified
   // design abstraction in the register file instance. If no design abstraction
   // is specified, uses the default design abstraction specified for the
   // nearest enclosing register file or block.
   // There may be more than one path returned even
   // if only one path was defined for the register file instance, if any of the
   // parent components have more than one path defined for the same design
   // abstraction
   //
   // If no design abstraction is specified, the default design abstraction
   // for each ancestor register file or block is used to get each
   // incremental path.
   //
   extern function void get_full_hdl_path (ref string paths[$],
                                           input string kind = "",
                                           input string separator = ".");

   //
   // Function:    set_default_hdl_path
   // Set the default design abstraction
   //
   // Set the default design abstraction for this register file instance.
   //
   extern function void   set_default_hdl_path (string kind);

   //
   // Function:  get_default_hdl_path
   // Get the default design abstraction
   //
   // Returns the default design abstraction for this register file instance.
   // If a default design abstraction has not been explicitly set for this
   // register file instance, returns the default design abstraction for the
   // nearest register file or block ancestor.
   // Returns "" if no default design abstraction has been specified.
   //
   extern function string get_default_hdl_path ();


   extern virtual function void          do_print (uvm_printer printer);
   extern virtual function string        convert2string();
   extern virtual function uvm_object    clone      ();
   extern virtual function void          do_copy    (uvm_object rhs);
   extern virtual function bit           do_compare (uvm_object  rhs,
                                                     uvm_comparer comparer);
   extern virtual function void          do_pack    (uvm_packer packer);
   extern virtual function void          do_unpack  (uvm_packer packer);

endclass: uvm_reg_file


//------------------------------------------------------------------------------
// IMPLEMENTATION
//------------------------------------------------------------------------------

// new

function uvm_reg_file::new(string name="");
   super.new(name);
   hdl_paths_pool = new("hdl_paths");
endfunction: new


// configure

function void uvm_reg_file::configure(uvm_reg_block blk_parent, uvm_reg_file regfile_parent, string hdl_path = "");
   if (blk_parent == null) begin
     `uvm_error("UVM/RFILE/CFG/NOBLK", {"uvm_reg_file::configure() called without a parent block for instance \"", get_name(), "\" of register file type \"", get_type_name(), "\"."})
     return;
   end

   this.parent = blk_parent;
   this.m_rf = regfile_parent;
   this.add_hdl_path(hdl_path);
endfunction: configure


// get_block

function uvm_reg_block uvm_reg_file::get_block();
   get_block = this.parent;
endfunction: get_block


// get_regfile

function uvm_reg_file uvm_reg_file::get_regfile();
   return m_rf;
endfunction


// clear_hdl_path

function void uvm_reg_file::clear_hdl_path(string kind = "RTL");
  if (kind == "ALL") begin
    hdl_paths_pool = new("hdl_paths");
    return;
  end

  if (kind == "") begin
     if (m_rf != null)
        kind = m_rf.get_default_hdl_path();
     else
        kind = parent.get_default_hdl_path();
  end

  if (!hdl_paths_pool.exists(kind)) begin
    `uvm_warning("RegModel",{"Unknown HDL Abstraction '",kind,"'"})
    return;
  end

  hdl_paths_pool.delete(kind);
endfunction


// add_hdl_path

function void uvm_reg_file::add_hdl_path(string path, string kind = "RTL");

  uvm_queue #(string) paths;

  paths = hdl_paths_pool.get(kind);

  paths.push_back(path);

endfunction


// has_hdl_path

function bit  uvm_reg_file::has_hdl_path(string kind = "");
  if (kind == "") begin
     if (m_rf != null)
        kind = m_rf.get_default_hdl_path();
     else
        kind = parent.get_default_hdl_path();
  end
  
  return hdl_paths_pool.exists(kind);
endfunction


// get_hdl_path

function void uvm_reg_file::get_hdl_path(ref string paths[$], input string kind = "");

  uvm_queue #(string) hdl_paths;

  if (kind == "") begin
     if (m_rf != null)
        kind = m_rf.get_default_hdl_path();
     else
        kind = parent.get_default_hdl_path();
  end

  if (!has_hdl_path(kind)) begin
    `uvm_error("RegModel",{"Register does not have hdl path defined for abstraction '",kind,"'"})
    return;
  end

  hdl_paths = hdl_paths_pool.get(kind);

  for (int i=0; i<hdl_paths.size();i++)
    paths.push_back(hdl_paths.get(i));

endfunction


// get_full_hdl_path

function void uvm_reg_file::get_full_hdl_path(ref string paths[$],
                                              input string kind = "",
                                              input string separator = ".");
   if (kind == "")
      kind = get_default_hdl_path();

   if (!has_hdl_path(kind)) begin
      `uvm_error("RegModel",{"Register file does not have hdl path defined for abstraction '",kind,"'"})
      return;
   end
   
   paths.delete();

   begin
      uvm_queue #(string) hdl_paths = hdl_paths_pool.get(kind);
      string parent_paths[$];

      if (m_rf != null)
         m_rf.get_full_hdl_path(parent_paths, kind, separator);
      else if (parent != null)
         parent.get_full_hdl_path(parent_paths, kind, separator);

      for (int i=0; i<hdl_paths.size();i++) begin
         string hdl_path = hdl_paths.get(i);

         if (parent_paths.size() == 0) begin
            if (hdl_path != "")
               paths.push_back(hdl_path);

            continue;
         end
         
         foreach (parent_paths[j])  begin
            if (hdl_path == "")
               paths.push_back(parent_paths[j]);
            else
               paths.push_back({ parent_paths[j], separator, hdl_path });
         end
      end
   end

endfunction


// get_default_hdl_path

function string uvm_reg_file::get_default_hdl_path();
  if (default_hdl_path == "") begin
     if (m_rf != null)
        return m_rf.get_default_hdl_path();
     else
        return parent.get_default_hdl_path();
  end
  return default_hdl_path;
endfunction


// set_default_hdl_path

function void uvm_reg_file::set_default_hdl_path(string kind);

  if (kind == "") begin
    if (m_rf != null)
       kind = m_rf.get_default_hdl_path();
    else if (parent == null)
       kind = parent.get_default_hdl_path();
    else begin
      `uvm_error("RegModel",{"Register file has no parent. ",
           "Must specify a valid HDL abstraction (kind)"})
      return;
    end
  end

  default_hdl_path = kind;

endfunction


// get_parent

function uvm_reg_block uvm_reg_file::get_parent();
  return get_block();
endfunction


// get_full_name

function string uvm_reg_file::get_full_name();
   uvm_reg_block blk;

   get_full_name = this.get_name();

   // Is there a parent register file?
   if (m_rf != null)
      return {m_rf.get_full_name(), ".", get_full_name};

   // No: then prepend the full name of the parent block (if any)
   if (this.parent == null)
      return get_full_name;
   get_full_name = {this.parent.get_full_name(), ".", get_full_name};
endfunction: get_full_name


//-------------
// STANDARD OPS
//-------------

// convert2string

function string uvm_reg_file::convert2string();
  `uvm_fatal("RegModel","RegModel register files cannot be converted to strings")
   return "";
endfunction: convert2string


// do_print

function void uvm_reg_file::do_print (uvm_printer printer);
  super.do_print(printer);
endfunction



// clone

function uvm_object uvm_reg_file::clone();
  `uvm_fatal("RegModel","RegModel register files cannot be cloned")
  return null;
endfunction

// do_copy

function void uvm_reg_file::do_copy(uvm_object rhs);
  `uvm_fatal("RegModel","RegModel register files cannot be copied")
endfunction


// do_compare

function bit uvm_reg_file::do_compare (uvm_object  rhs,
                                        uvm_comparer comparer);
  `uvm_warning("RegModel","RegModel register files cannot be compared")
  return 0;
endfunction


// do_pack

function void uvm_reg_file::do_pack (uvm_packer packer);
  `uvm_warning("RegModel","RegModel register files cannot be packed")
endfunction


// do_unpack

function void uvm_reg_file::do_unpack (uvm_packer packer);
  `uvm_warning("RegModel","RegModel register files cannot be unpacked")
endfunction



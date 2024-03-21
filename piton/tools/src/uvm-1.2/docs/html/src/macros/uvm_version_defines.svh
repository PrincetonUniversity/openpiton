//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2010 Cadence Design Systems, Inc. 
//   Copyright 2010-2011 Synopsys, Inc.
//   Copyright 2014      NVIDIA Corporation
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

`ifndef UVM_VERSION_DEFINES_SVH
`define UVM_VERSION_DEFINES_SVH

// Title: UVM Version Defines

// Group: UVM Revision Values
// These macros provide the current values for the ~MAJOR~, ~MINOR~,
// and optionally the ~FIX~ revision.
//
// Example with UVM version 1.2:
//  UVM_MAJOR_REV - '1'
//  UVM_MINOR_REV - '2'
//  UVM_FIX_REV - 'undefined'
//
// Example with UVM version 1.1a:
//  UVM_MAJOR_REV - '1'
//  UVM_MINOR_REV - '1'
//  UVM_FIX_REV - 'a'
//

// Macro: UVM_MAJOR_REV
// Defines the MAJOR revision number.
//
// For UVM version 1.2, the MAJOR revision number is '1'
//
// | `define UVM_MAJOR_REV 1
`define UVM_MAJOR_REV 1

// Macro: UVM_MINOR_REV
// Defines the MINOR revision number.
//
// For UVM version 1.2, the MINOR revision number is '2'
//
// | `define UVM_MINOR_REV 2
`define UVM_MINOR_REV 2

// Macro: UVM_FIX_REV
// (Optionally) Defines the FIX revision letter.
//
// For the first "X.Y" release of the UVM, there is no
// FIX revision letter.  In these cases, the UVM_FIX_REV
// is left undefined.
//
// For any subsequent "X.Y" fix releases, the UVM_FIX_REV
// value is set to the appropriate fix release letter.
//
// Example:
// 1.1 - First release, UVM_FIX_REV is undefined
// 1.1a - Fix release, UVM_FIX_REV is 'a'

// Include this in the comment when the FIX rev is present:
// | `define UVM_FIX_REV a

//`define UVM_FIX_REV a

// Macro: UVM_NAME
// The name used by the library when displaying the name of
// the library.
//
// | `define UVM_NAME UVM
`define UVM_NAME UVM

// Macro: UVM_VERSION_STRING
// Provides a string-ized version of the UVM Library version number.
//
// When there is a FIX_REV, the string is "<name>-<major>.<minor><fix>" (such as "UVM-1.1d").
// When there is NO FIX_REV, the string is "<name>-<major>.<minor>" (such as "UVM-1.2").

`ifdef UVM_FIX_REV
 `define UVM_VERSION_STRING `"`UVM_NAME``-```UVM_MAJOR_REV``.```UVM_MINOR_REV`UVM_FIX_REV`"
`else
 `define UVM_VERSION_STRING `"`UVM_NAME``-```UVM_MAJOR_REV``.```UVM_MINOR_REV```"
`endif

// Group: Conditional Compilation
// These macros provide the ability to conditionally compile based on the
// revision of the library which is being used.
//
// These macros are required for conditional compilation, as SystemVerilog does
// not support conditionals with `ifdefs.
//
// For example:
// |  // Illegal:
// | `if (UVM_MAJOR_REV == 1)
// |
// | // Legal:
// | `ifdef UVM_MAJOR_REV_1
// 


// Macro: UVM_MAJOR_REV_1
// Indicates that the MAJOR version of this release is '1'.
//
// | `define UVM_MAJOR_REV_1
//
`define UVM_MAJOR_REV_1

// Macro: UVM_MINOR_REV_2
// Indicates that the MINOR version of this release is '2'.
//
// | `define UVM_MINOR_REV_2
//
`define UVM_MINOR_REV_2

// Macro: UVM_VERSION_1_2
// Indicates that the version of this release is '1.2'.
//
// | `define UVM_VERSION_1_2
`define UVM_VERSION_1_2

// Undocumented, same thing as UVM_VERSION_1_2
`define UVM_MAJOR_VERSION_1_2

// Group: UVM Version Ladder

// Macro: UVM_POST_VERSION_1_1
// Indicates that this version of the UVM came after the
// 1.1 versions, including the various 1.1 fix revisions.  
//
// The first UVM version wherein this macro is defined is
// 1.2, and the macro will continue to be defined
// for all future revisions of the UVM library.
//
// | `define UVM_POST_VERSION_1_1
`define UVM_POST_VERSION_1_1

`endif // UVM_VERSION_DEFINES_SVH

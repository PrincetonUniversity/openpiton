//----------------------------------------------------------------------
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2011 Mentor Graphics Corporation
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

//
// Top-level file that includes all of the C/C++ files required
// by UVM
//
// The C code may be compiled by compiling this top file only,
// or by compiling individual files then linking them together.
//

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include "uvm_dpi.h"
#include "uvm_common.c"
#include "uvm_regex.cc"
#include "uvm_hdl.c"
#include "uvm_svcmd_dpi.c"

#ifdef __cplusplus
}
#endif


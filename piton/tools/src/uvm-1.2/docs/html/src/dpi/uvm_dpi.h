//----------------------------------------------------------------------
//   Copyright 2010 Synopsys, Inc.
//   Copyright 2011 Mentor Graphics Corporation
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
//----------------------------------------------------------------------

//
// Top level header filke that wraps all requirements which
// are common to the various C/C++ files in UVM.
//

#ifndef UVM_DPI__H
#define UVM_DPI__H

#include <stdlib.h>
#include "vpi_user.h"
#include "veriuser.h"
#include "svdpi.h"
#include <malloc.h>
#include <string.h>
#include <stdio.h>
#include <regex.h>
#include <limits.h>

// The following consts and method call are for
// internal usage by the UVM DPI implementation,
// and are not intended for public use.
static const int M_UVM_INFO = 0;
static const int M_UVM_WARNING = 1;
static const int M_UVM_ERROR = 2;
static const int M_UVM_FATAL = 3;

static const int M_UVM_NONE = 0;
static const int M_UVM_LOW = 100;
static const int M_UVM_MEDIUM = 200;
static const int M_UVM_HIGH = 300;
static const int M_UVM_FULL = 400;
static const int M_UVM_DEBUG = 500;

void m_uvm_report_dpi(int severity,
                      char* id,
                      char* message,
                      int verbosity,
                      char* file,
                      int linenum);

int int_str_max( int );


#endif

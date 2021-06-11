// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: global.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
#ifndef _G_GLOBAL_H_
#define _G_GLOBAL_H_
#ifndef PITON_DPI
#include "veriuser.h"
#include "acc_user.h"
#else
#ifdef VERILATOR
#include "verilated_vpi.h"
#endif
#endif
extern "C" {
#include "b_ary.h"
}
#include <stdlib.h>
#include <string.h>

#define BUFFER 1024
#define CPX_LOC 1
#define PC_EVENT CPX_LOC+1

//global define
#ifndef RIVIERA
#ifndef __ICARUS__
#ifndef PITON_DPI
extern "C" void io_printf(char*, ...);
#else // ifndef PITON_DPI
#define io_printf printf
#endif // ifndef PITON_DPI
#endif // ifndef __ICARUS__
#else
#define io_printf printf
#endif  // ifndef RIVIERA
#define KeyType unsigned long long
//define event record.
typedef struct event_record{
  int   kind;
  //who trig the event.
  int  type;
  int  thrid;
  int  cpu_id;
  int  true_id;
  int  reg;
  int  wait, src;
  int  num;
  char ch;
  //define vectors
  int vec;
} *event_record_ptr;

#endif

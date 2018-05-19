// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pli_signal.h
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
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)pli_signal.h
***
***  Version Date:  11/16/99
***
****************************************************************************
****************************************************************************/
#ifndef PLISIGNAL_H
#define PLISIGNAL_H

// #include "pci.h"
// Standard libraries that we need
//--------------------------------

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <ctype.h>

#ifdef LINUX
extern void dprintf(const char *, ...);
#else
extern void dprintf(...);
#endif

#include "veriuser.h"

#define DISPMON_STRING "stub_pli"
#define DISPMON_DEBUG_DEBUG_TAG 25
#define DISPMON_DEBUG_TAG 9
#define DISPMON_INFO_TAG  11
#define SIGNAL_ACTIVE_HI 1
#define SIGNAL_ACTIVE_LO 0

typedef struct t_acc_vecval {
  int aval;        /* bit-coding for each bit of vector: */
  int bval;        /* ab: 00=0, 10=1, 11=X, 01=Z */
} s_acc_vecval, *p_acc_vecval;
enum display_levels {CHECK_NONE, CHECK_UNKNOWN, CHECK_TRISTATE, CHECK_ALL};
typedef unsigned long long int BITS;

class Signal {
private:
  int arg_num;
  char sig_name[100];
  int expr_ngroups;
  int expr_vec_size;
  int name_valid;
  enum display_levels display_mode;
  p_acc_vecval prev;
  p_acc_vecval curr;
  p_acc_vecval next;
  char active;
  int valid;

public:
  Signal();
  Signal(int arg_n);                          //scalar init
  Signal(int arg_n, int active_state);        //scalar
  Signal(int arg_n, int top, int bot);        //bus init
  int Update(char *ascii_value);                //used by general code - 4 state update using 0,1,x or z
  int Update(BITS bit_value);                 //used by general code - scalar or small bus
  int Update(BITS bit_value, int top, int bot); //used by general code - bus
  BITS Value();
  char Value_c();
  BITS Value(int top, int bottom);
  int Rising();               //scalar only
  int Falling();              //scalar only
  int Active();               //scalar only
  int Valid();
  int Tristated();
  void set_display_mode(enum display_levels level);
  Signal *copy(Signal *);
  int sample_input(); //used by PLI
  int drive_output(); //used by PLI
};

#endif

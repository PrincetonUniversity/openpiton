// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: globals.h
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
//------------------------------------------------------------------------------
//
// Description:  Definitions and routines common to all SJM's modules.
//
//------------------------------------------------------------------------------

#ifndef GLOBALS_H
#define GLOBALS_H

#include "veriuser.h"
#include "acc_user.h"

typedef unsigned int uint;
typedef unsigned long long ull;
typedef long long ll;
typedef unsigned char byte;

// #define TRUE 1
// #define FALSE 0

#ifdef LINUX
extern void dprintf(const char *,...);
#else
extern void dprintf(...);
#endif

#endif //GLOBALS_H

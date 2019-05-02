// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bw_lib.h
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
#ifndef _BW_LIB_H_
#define _BW_LIB_H_
#include "b_ary.h"
#include <stdlib.h>
#ifndef PITON_DPI
#include "veriuser.h"
#include "acc_user.h"
#else // ifndef PITON_DPI
#include "global.h"
#endif // ifndef PITON_DPI
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif // ifdef __ICARUS__
//general
#define BUFFER 1024

#ifdef  __cplusplus
extern "C" {
#endif
  int     rmSpace(char* buf, int index, int max);
  unsigned long long getEight(char *buf, int idx);
  int     getAddr(char *buf, unsigned long long *addr, int idx);
  void    a2h(char* buf,int idx,  char* cbuf, int* cidx);
  int     align_buf(char* cbuf, int cidx);
  KeyType mask_addr (KeyType addr);
  void    read_mem(char* str, b_tree_node_ptr* root);
  void    set_random();
#ifdef  __cplusplus
}
#endif
#endif

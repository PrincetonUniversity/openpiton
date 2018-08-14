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
#include "list.h"
#include "veriuser.h"
#include "acc_user.h"
#ifdef __ICARUS__
#include "icarus-compat.h"
#endif
//width of jbus signals
#define J_AD_WIDTH   128
#define J_ADTYPE_WIDTH 8
#define J_PACK_WIDTH   3
//argument list of jbus_model task
#define J_ID         1
#define J_REQ_IN_L   J_ID         + 1
#define J_AD         J_REQ_IN_L   + 1
#define J_ADTYPE     J_AD         + 1
#define J_PACK0      J_ADTYPE     + 1
#define J_PACK1      J_PACK0      + 1
#define J_PACK2      J_PACK1      + 1
#define J_PACK3      J_PACK2      + 1
#define J_PACK4      J_PACK3      + 1
#define J_PACK5      J_PACK4      + 1
#define J_PACK6      J_PACK5      + 1
//output
#define J_AD_R       J_PACK6      + 1
#define	J_ADTYPE_R   J_AD_R       + 1
#define	J_PACK0_R    J_ADTYPE_R   + 1
#define	J_PACK1_R    J_PACK0_R    + 1

#define	J_PACK2_R    J_PACK1_R    + 1
#define	J_PACK3_R    J_PACK2_R    + 1
#define	J_PACK4_R    J_PACK3_R    + 1
#define	J_PACK5_R    J_PACK4_R    + 1
#define	J_PACK6_R    J_PACK5_R    + 1
#define	J_REQ_OUT_R  J_PACK6_R    + 1
#define PCX_PACKET   1
#define CPX_PACKET   2
//Transaction Set
#define RDS          0x04
#define RDSA         0x05
#define WRI          0x0e
#define WRIS         0x0f
#define NCRD         0x10
#define NCBRD        0x11
#define NCWR         0x12
#define NCBWR        0x13
#define INT          0x14
#define IDLE         0x1f

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

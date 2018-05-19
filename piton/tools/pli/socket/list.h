// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: list.h
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
#ifndef _LIST_C_H_
#define _LIST_C_H_
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "veriuser.h"
#include "acc_user.h"
#define FLOAT_X                        154
#define FLOAT_I                        153
#define PC                             32
#define REG_WRITE_BACK 152
#define NODE_SIZE      1024
#define RESET_COMMAND 500
//list node

typedef struct list_node{
  long long time;
  int which_sign;  // what is request
  int spc;         // which sparc
  int thread, inst;      // thread number
  int win  ;       // window
  int reg_num;     // register number
  int aval[2];    // data
  int bval[2];    // data
  char type, send;
  int  cond;
  int  wait;
  int  bound;
  long long val, phy_pc, vir_pc;
  struct list_node *next;
  int sright;
} *list_node_ptr;
//head node for this list.
typedef struct list_head_node{
  list_node_ptr head_ptr, tail_ptr;
  int num;
  list_node_ptr hhead_ptr, htail_ptr, htail_prev;
  list_node_ptr dhead_ptr, dtail_ptr;
  int bound[32];
}*list_head_ptr;
//
typedef struct committed{
  long long val [FLOAT_I];
  long long local_val[8];
  long long third_val[32];
  int vld[FLOAT_I];
  int local_vld[8];
  int third_vld[32];
  int win[FLOAT_I];
  int local_win[8];
  int third_win[32];
  int fp[64];
  int fvld[64];
  int num;
  int more;
  int win_switch;

}*committed_ptr;
//list node for socket buffer
typedef struct buf_node{
  int  start, count, thrid;
  char data[NODE_SIZE];
  struct buf_node *next;
} *buf_node_ptr;

typedef struct buf_head_node{
  buf_node_ptr head_ptr, tail_ptr;
  int vld[32];
}*buf_head_ptr;
//prototype 
list_node_ptr pop(list_head_ptr handle);
int push(list_head_ptr handle, list_node_ptr* item);
int front(list_head_ptr handle, list_node_ptr* item);
list_node_ptr frontQ(list_head_ptr handle);
list_node_ptr hpop(list_head_ptr handle);
int list_empty(list_head_ptr handle);
list_node_ptr search(int thread, list_head_ptr handle);
extern void drop_data(int val1, int val0, int reg, int thread);
#endif

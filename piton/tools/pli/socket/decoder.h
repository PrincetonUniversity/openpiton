// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: decoder.h
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
#ifndef _DECODER_H_
#define _DECODER_H_
#include "list.h"
#include "veriuser.h"
#include "acc_user.h"
#define DECODER_REQ                     1
#define DECODER_HANDLE DECODER_REQ    + 1
#define DECODER_THRID  DECODER_HANDLE + 1
#define DECODER_MASK   DECODER_HANDLE + 1
#define DECODER_PC     DECODER_THRID  + 1
#define DECODER_ASI    DECODER_PC     + 1
#define DECODER_VA     DECODER_ASI    + 1
#define DECODER_IVLD   DECODER_VA     + 1
#define DECODER_DVLD   DECODER_IVLD   + 1
#define DECODER_LIST   8 //access the handle of list
#define DECODER_STEP   4
#define DECODER_WIN    5
#define DECODER_ADDR   6
#define DECODER_CCR    7
#define STEPPING       300
#define PC             32
#define PLI_SSTEP               2
#define PLI_READ_TH_REG         3
#define PLI_READ_TH_CTL_REG     4
#define PLI_READ_TH_FP_REG_I    5
#define PLI_READ_TH_FP_REG_X    6
#define PLI_WRITE_TH_XCC_REG    9
#define PLI_WRITE_TH_REG_HI     10
#define PLI_WRITE_TH_REG        11
#define PLI_WRITE_TH_CTL_REG    12 
#define PLI_FORCE_TRAP_TYPE     15
#define PLI_RESET_TLB_ENTRY     16
#define PLI_INST_TTE            17
#define PLI_DATA_TTE            18
#define WAIT_CYCLE              100
#define  RESET_COMMAND 500
//struct for tlb.
typedef struct next_dec_node{
  long long pc;
  int       which_tlb;
} *next_dec_node_ptr;

typedef struct dec_node{
  struct next_dec_node next[32][12];
  int rd[32], wr[32], counter[32];
  
  list_head_ptr heap;
  list_head_ptr pending_list[32], dtlb[32], itlb[32];

  int lock[32];
  long long pc[32];
  //circular Queue to keep pcs in the pipe.
  //hold e & m and w stage
  long long stage_pc[32][8];
  char *mra_name[8];
  int on_going[32];//there is asi of tlb.
  int which_tlb[32];
  int locked[32][4], cond[32][4];
} *dec_node_ptr;

//decode the d-stage instruction.
void  bw_instruction_decoder_call();
void  decoder();
void  push_data();
void  push_send();
long long get_long(int loc);
int   dec_data();
void  check_pending();
void  check_list();
void  tlb_error();
int   mra_entry();
void  reset();
#endif

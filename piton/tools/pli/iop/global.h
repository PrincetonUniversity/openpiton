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
#include "veriuser.h"
#include "acc_user.h"
#include "b_ary.h"
#include "avl.h"
#include <stdlib.h>
#include <string.h>
//define mnemonic for event
#define WARMRST         4
#define EXTINT          5
#define TEMPTRIG        6
#define CPX_STALL       7
#define PCX_STALL       8
#define CLK_STRETCH     9

#define PCXSTALL_ARG    3
#define PCXFREE_ARG     4

#define WARMRST_ARG     2
#define EXTINT_ARG      3
#define TEMPTRIG_ARG    4
#define CLKSTRETCH_ARG  5

#define LOAD_RQ         0x00
#define IMISS_RQ        0x10
#define STORE_RQ        0x01
#define CAS1_RQ         0x02
#define CAS2_RQ         0x03
#define SWAP_RQ         0x06
#define STRLOAD_RQ      0x04
#define STRST_RQ        0x05
#define STQ_RQ          0x07
#define INT_RQ          0x09
#define FWD_RQ          0x0d
#define FWD_RPY         0x0e
#define RSVD_RQ         0x1f

#define LOAD_RET        0x0
#define INV_RET         0x3
#define ST_ACK          0x4
#define AT_ACK          0x3
#define INT_RET         0x7
#define TEST_RET        0x5
#define FP_RET          0x8
#define IFILL_RET       0x1
#define EVICT_REQ       0x3
#define ERR_RET         0xc
#define STRLOAD_RET     0x2
#define STRST_ACK       0x6
#define FWD_RQ_RET      0xa
#define FWD_RPY_RET     0xb
#define RSVD_RET        0xf
#define UCB_READ_REQ    0x4
#define UCB_WRITE_REQ   0x5
#define UCB_IFILL_REQ   0x6

#define BUFFER 1024
#define PCX_LOC 1
#define CPX_REQ 2
#define CPX_LOC 3
#define GRANT_LOC 4
#define PC_EVENT GRANT_LOC+1
#define JBUS_LOC 1
#define  DRAM_IOB02_STALL 3
#define  DRAM_IOB13_STALL 6

#define  DRAM_IOB02_VLD 9
#define  DRAM_IOB13_VLD 11

#define  JBI_PIO_VLD    13
#define  PIO_SIZE       12

//system
#define  SSI_MOSI 1
#define  SSI_MISO SSI_MOSI + 1
#define  SSI_NUM  95
#define  SSO_NUM  65
#define  EXT_INT  1
#define  STALE_CALL 1
#define  SAVE_POINTER_TYPE 1
#define  PC_TRIG_TY   1
#define  PC_TRIG_PC   2
#define  PC_TRIG_TH   3
#define  PC_TRIG_WD   4
#define  PC_TRIG_CP   5
#define  PC_TRIG_ST   6
#define  PC_TRIG_AT   7
//invalid signals
#define  INVLD_TYPE   1
#define  INVLD_ST     2
#define  INVLD_MB0    3
#define  INVLD_MB1    4
#define  INVLD_MB2    5
#define  INVLD_MB3    6
#define  INVLD_STB    7
#define  INVLD_STB_NEXT    3

//event type
#define INT_TYPE 1
//global define
extern "C" void io_printf(char*, ...);
extern "C" void write_dram_call(long long* addr, ...);
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
  int  bank;
  char ch;
  char* comment;
  //define vectors
  int vec;
  int event_type;
} *event_record_ptr;

//define SSO record
typedef struct sso_record{
  char serial[SSO_NUM];
  int  num, idx;
  int wait;
} *sso_record_ptr;
typedef struct addr_record{
  KeyType addr;
}  *addr_record_ptr;
#endif

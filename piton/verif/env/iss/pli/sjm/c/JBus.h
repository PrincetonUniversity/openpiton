// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: JBus.h
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
// Description:  Contains definitions global to SJM.
//
//------------------------------------------------------------------------------

#ifndef JBUS_H
#define JBUS_H
#include <ctype.h>
#include <dirent.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <unistd.h>


#include "sync_int.h"

#include "BinaryKeyValueTree.h"
#include "BinaryNumTree.h"
#include "ByteString.h"
#include "Enumeration.h"
#include "Queue.h"
#include "PlusArg.h"
#include "Range.h"
#include "Transaction.h"

//------------------------------------------------------------------------------
// Definitions for the bus.

// The size of a "word" in bytes.
#define DEFAULT_WORD_SIZE 4

// Cache definitions are in bytes. Default cache is 8k, 64 bytes wide.
#define DEFAULT_CACHE_SIZE 4096
#define DEFAULT_CACHE_LINE_SIZE 64

#define G_MAXPORTS 7
#define G_MAX_MASTERS 7

#define J_TIMEOUT 1000
#define J_READBUFF_TIMEOUT 5000
#define J_INTERRUPT_TIMEOUT 100000

// Cycle definitions.
#define J_MIN_RST_CYCLES 10  //???
#define J_RST_AFTER_POR 5    //???
#define J_POST_RST_CYCLES 40 //???
#define J_POST_RST_STABLE_CYCLES 8
#define J_CHANGE_INITIATE 4
#define J_CHANGE_WAIT 32

// Definitions for the queues.
#define G_READBUFFER_SIZE_MAX 16
#define G_READBUFFER_SIZE_PORT 4
#define G_MEMQ_DEPTH 36     // 32 entries plus 4 overflow
#define G_DATAQ_DEPTH 63    // 14 64-bit sets (56 quadwords) plus 7 overflow
#define G_PACKQ_DEPTH 36    // 32 entries plus 4 overflow
#define G_OUTQ_DEPTH 512
#define G_PACKOUTQ_DEPTH 4  // Doesn't ever stall, so doesn't have to be big.
#define G_SNOOPQ_DEPTH 36   // 32 entries plus 4 overflow

#define G_ADDR_OVERFLOW_LIMIT 4
#define G_DATA_OVERFLOW_LIMIT 7

// Encodings of the bus transactions.
#define T_RD        0x02
#define T_RDD       0x03
#define T_RDS       0x04
#define T_RDSA      0x05
#define T_RDO       0x06
#define T_OWN       0x07
#define T_INV       0x08
#define T_NCWRC     0x0a
//#define T_CWR       0x09   /*for Niagara support*/
#define T_WRM       0x0b   /*for Niagara support*/
#define T_WRB       0x0c
#define T_WRBC      0x0d
#define T_WRI       0x0e
#define T_WRIS      0x0f
#define T_NCRD      0x10
#define T_NCBRD     0x11
#define T_NCWR      0x12
#define T_NCBWR     0x13
#define T_INT       0x14
#define T_INTACK    0x15
#define T_INTNACK   0x16
#define T_XIR       0x17
#define T_CHANGE    0x1a
#define T_IDLE      0x1f

// Special internal transaction encodings.
#define J_DATARET16 0x100
#define J_DATARET64 0x101
#define J_READERR   0x102

// Transaction groups.
#define TYPE_READ      0x04
#define TYPE_WRITE     0x0c
#define TYPE_NCREAD    0x10
#define TYPE_NCWRITE   0x14
#define TYPE_INTERRUPT 0x1c
#define TYPE_DATARET   0x20

// Encodings for j_packs.
#define P_IDLE       0x0
#define P_COHACK     0x1
#define P_COHACKS    0x2
#define P_COHACKD    0x3
#define P_AOK_OFF    0x4
#define P_AOK_ON     0x5
#define P_DOK_OFF    0x6
#define P_DOK_ON     0x7

// Read error types.
#define READERR_TIMEOUT  0x0
#define READERR_BUSERR   0x1
#define READERR_UNMAPPED 0x2

// Address space definitions.
// Niagara: The address space should only be defined by
// the upper two bits of the address (bits [42:41])
//#define ADDR_CCHE 0x0
//#define ADDR_CONF 0x4
//#define ADDR_NONC 0x6
#define ADDR_CCHE 0x0
#define ADDR_CONF 0x2
#define ADDR_NONC 0x3

// Cycle types.
#define C_ADDR  0x3
#define C_RET16 0x2
#define C_RET64 0x1
#define C_ERR   0x0

// Agent ID mappings.
#define AGENT_CPU0 0x0
#define AGENT_CPU1 0x1
#define AGENT_CPU2 0x2
#define AGENT_CPU3 0x3
#define AGENT_TOM0 0xc
#define AGENT_TOM1 0xe
#define AGENT_ZULU 0x8

// ECC encodings.
#define ECC_CORRECT 1
#define ECC_UNCORRECT 2

// Estar clock ratios.
#define ESTAR_SPEED1 1
#define ESTAR_SPEED2 2
#define ESTAR_SPEED32 32

// Mask to remove invalid bits from an address.
#define AD_MASK4 0xfffffffffffffff0
// Mask to remove invalid bits and word ordering.
#define AD_MASK6 0xffffffffffffffc0

// The default names of the memdat files.
#define MEMDAT_NAME "memdat.ram1.state"
#define MEMDAT_DEFAULT "memdat.default"

// Configuration space offsets.
#define CONF_TOM_CSR 0x410000
#define CONF_ESTAR_CTRL 0x410050
#define CONF_CHANGE_INIT 0x410058

// Port that drives resets and change.
#define BUS_MASTER 5

// Rotating 4-bit pattern for error generation.
#define BIT4_PATTERN_H 0xfea8fd94fb52f7c1
#define BIT4_PATTERN_L 0xfea8fd64fb52f731


//------------------------------------------------------------------------------
char *get_trans_string(int);
int get_trans_type(int);
int find_agent_id(ull);
int find_port_id(int);
int find_range(ull);
int get_device_info(int *, int *, char **);


#include "ReadOutBuffer.h"
#include "SnoopControl.h"

#endif // JBUS_H

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_defines.h
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
/***********************************************************************
 * Name:   iob_defines.h
 *
 *  Description: Definitons used in iob diags.
 *
 **********************************************************************/

#define IOB_END_MAP                           0x0123456789abcdef
#define IOB_INV_ADDR                          0x00000098000008f0
#define IOB_INT_IOB_VEC                       0x0
#define IOB_INT_IOB_PENDING                   0x0000000000000001
#define IOB_INT_ERR_VEC                       0x1
#define IOB_INT_ERR_PENDING                   0x0000000000000002
#define IOB_INT_SSI_VEC                       0x2
#define IOB_INT_SSI_PENDING                   0x0000000000000004
#define IOB_INT_JBI_VEC                       0x3
#define IOB_INT_JBI_PENDING                   0x0000000000000008

#define ERR_TRAP_EXECUTED                     0x1234dead
#define EXC_TRAP_EXECUTED                     0x5678dead

#define THRFSM_DEAD                           0x0
#define THRFSM_IDLE                           0x0
#define THRFSM_HALT                           0x2
#define THRFSM_RDY                            0x19
#define THRFSM_SPEC_RDY                       0x13
#define THRFSM_RUN                            0x5
#define THRFSM_SPEC_RUN                       0x7
#define THRFSM_WAIT                           0x1

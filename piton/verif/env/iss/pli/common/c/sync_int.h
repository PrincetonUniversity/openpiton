// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sync_int.h
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
// Description:  Integer-based synchroniziation interface.
//
//------------------------------------------------------------------------------

#ifndef SYNCINT_H
#define SYNCINT_H

// Device status definitions.
#define SYNC_STATE_UNKNOWN 0x0000
#define SYNC_STATE_WAIT    0x0010
#define SYNC_STATE_DONE    0x0100
#define SYNC_STATE_NOSYNC  0x1000

int sync_register(int, int *);
int sync_initiate(int, int, int *);
int sync_check_status(int);
int sync_clear(int);

#endif // SYNCINT_H

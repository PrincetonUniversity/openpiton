// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_diag.h
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

#define SPU_ASI 0x40

#define REG_SRC_ADDR 0x08
#define REG_DEST_ADDR 0x10
#define REG_CTL_ADDR 0x00
#define REG_DATA_ADDR 0x18
#define REG_IV1_ADDR 0x20
#define REG_KEY1_ADDR 0x28
#define REG_KEY2_ADDR 0x30
#define REG_KEY3_ADDR 0x38
#define REG_CPOLY_ADDR 0x58
#define REG_CRC_ADDR 0x60
#define REG_MPA_ADDR 0x88
#define REG_MA_ADDR_ADDR 0x90
#define REG_NP_ADDR 0x98
#define REG_MA_CTL_ADDR 0x80
#define STA_KSXY_ADDR 0xff
#define STA_HASH_ADDR 0x40
#define STA_MAMEM_ADDR 0xff
#define StreamSync_ADDR 0x68
#define MASync_ADDR 0xa0

#if defined(MAIN_PAGE_HV_ALSO)
#define setpa(data, rtmp, rtmp1, rdest)	set	data, rdest;
#else
#define setpa(data, rtmp, rtmp1, rdest)	set	data, rdest;\
					set	MAIN_BASE_DATA_VA, rtmp;\
					sub	rdest, rtmp, rdest;\
					setx	MAIN_BASE_DATA_PA, rtmp1, rtmp;\
					add	rtmp, rdest, rdest;
#endif

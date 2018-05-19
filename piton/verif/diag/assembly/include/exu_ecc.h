// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_ecc.h
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
!defines for ASI_SPARC_ERROR_STATUS_REG
#define	IRF_ERROR_STATUS_CE	0x10020000
#define	IRF_ERROR_STATUS_UE	0x10010000
#define	IRF_ERROR_STATUS_CE_PRIV 0x30020000
#define	IRF_ERROR_STATUS_UE_PRIV 0x30010000

#define IRF_ERROR_STATUS_UE_MIX  	0x10010000
#define IRF_ERROR_STATUS_UE_MIX_PRIV	0x30010000

! defines for ASI_SPARC_ERROR_ADDRESS_REG
#define IRF_CE_BIT_SHIFT 16

! IRF syndrome values
#define IRF_CE_BIT_0	0x83
#define IRF_CE_BIT_1	0x85
#define IRF_CE_BIT_2	0x86
#define IRF_CE_BIT_3	0x87
#define IRF_CE_BIT_4	0x89
#define IRF_CE_BIT_5	0x8a
#define IRF_CE_BIT_6	0x8b
#define IRF_CE_BIT_7	0x8c
#define IRF_CE_BIT_8	0x8d
#define IRF_CE_BIT_9	0x8e
#define IRF_CE_BIT_10	0x8f
#define IRF_CE_BIT_11	0x91
#define IRF_CE_BIT_12	0x92
#define IRF_CE_BIT_13	0x93
#define IRF_CE_BIT_14	0x94
#define IRF_CE_BIT_15	0x95
#define IRF_CE_BIT_16	0x96
#define IRF_CE_BIT_17	0x97
#define IRF_CE_BIT_18	0x98
#define IRF_CE_BIT_19	0x99
#define IRF_CE_BIT_20	0x9a
#define IRF_CE_BIT_21	0x9b
#define IRF_CE_BIT_22	0x9c
#define IRF_CE_BIT_23	0x9d
#define IRF_CE_BIT_24	0x9e
#define IRF_CE_BIT_25	0x9f
#define IRF_CE_BIT_26	0xa1
#define IRF_CE_BIT_27	0xa2
#define IRF_CE_BIT_28	0xa3
#define IRF_CE_BIT_29	0xa4
#define IRF_CE_BIT_30	0xa5
#define IRF_CE_BIT_31	0xa6
#define IRF_CE_BIT_32	0xa7
#define IRF_CE_BIT_33	0xa8
#define IRF_CE_BIT_34	0xa9
#define IRF_CE_BIT_35	0xaa
#define IRF_CE_BIT_36	0xab
#define IRF_CE_BIT_37	0xac
#define IRF_CE_BIT_38	0xad
#define IRF_CE_BIT_39	0xae
#define IRF_CE_BIT_40	0xaf
#define IRF_CE_BIT_41	0xb0
#define IRF_CE_BIT_42	0xb1
#define IRF_CE_BIT_43	0xb2
#define IRF_CE_BIT_44	0xb3
#define IRF_CE_BIT_45	0xb4
#define IRF_CE_BIT_46	0xb5
#define IRF_CE_BIT_47	0xb6
#define IRF_CE_BIT_48	0xb7
#define IRF_CE_BIT_49	0xb8
#define IRF_CE_BIT_50	0xb9
#define IRF_CE_BIT_51	0xba
#define IRF_CE_BIT_52	0xbb
#define IRF_CE_BIT_53	0xbc
#define IRF_CE_BIT_54	0xbd
#define IRF_CE_BIT_55	0xbe
#define IRF_CE_BIT_56	0xbf
#define IRF_CE_BIT_57	0xc1
#define IRF_CE_BIT_58	0xc2
#define IRF_CE_BIT_59	0xc3
#define IRF_CE_BIT_60	0xc4
#define IRF_CE_BIT_61	0xc5
#define IRF_CE_BIT_62	0xc6
#define IRF_CE_BIT_63	0xc7
#define IRF_CE_BIT_64   0x81
#define IRF_CE_BIT_65   0x82
#define IRF_CE_BIT_66   0x84
#define IRF_CE_BIT_67   0x88
#define IRF_CE_BIT_68   0x90
#define IRF_CE_BIT_69   0xa0
#define IRF_CE_BIT_70   0xc0
#define IRF_CE_BIT_71   0x80

! Because there are only 3 bits for register window or global level, 
! five bits for reg number. Bits 3:0 are reserved.
#define IRF_CE_GL0_G1	0x010
#define IRF_CE_GL0_G2	0x020
#define IRF_CE_GL0_G3	0x030
#define IRF_CE_GL0_G4	0x040
#define IRF_CE_GL0_G5	0x050
#define IRF_CE_GL0_G6	0x060
#define IRF_CE_GL0_G7	0x070
#define IRF_CE_W0_O0	0x080
#define IRF_CE_W0_O1	0x090
#define IRF_CE_W0_O2	0x0a0
#define IRF_CE_W0_O3	0x0b0
#define IRF_CE_W0_L0	0x100
#define IRF_CE_W0_L1	0x110
#define IRF_CE_W0_L2	0x120
#define IRF_CE_W0_L3	0x130
#define IRF_CE_W0_L4	0x140
#define IRF_CE_W0_L5	0x150
#define IRF_CE_W0_L6	0x160
#define IRF_CE_W0_L7	0x170
#define IRF_CE_W0_I1	0x190
#define IRF_CE_W0_I2	0x1a0
#define IRF_CE_W0_I3	0x1b0
#define IRF_CE_W0_I4	0x1c0



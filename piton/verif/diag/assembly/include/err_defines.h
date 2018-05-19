// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_defines.h
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
#define  ASI_SCRATCHPAD         0x20
#define  ASI_NUCLEUS_QUAD_LDD   0x24
#define  ASI_LSU_DIAG           0x42
#define  ASI_SEI                0x43
#define  ASI_LSU_CONTROL        0x45
#define  ASI_DCACHE_DATA        0x46
#define  ASI_DCACHE_TAG         0x47
#define  ASI_SEE                0x4B
#define  ASI_SES                0x4C
#define  ASI_SEA                0x4D
#define  ASI_IMMU               0x50
#define  ASI_ITLB_DATA_ACCESS   0x55
#define  ASI_ITLB_TAG_READ      0x56
#define  ASI_DMMU               0x58
#define  ASI_DTLB_DATA_ACCESS   0x5D
#define  ASI_DTLB_TAG_READ      0x5E
#define  ASI_ICACHE_INSTR       0x66
#define  ASI_ICACHE_TAG         0x67
#define  ASI_SWVR_UDB_INTR_R    0x74
#define  ASI_PRIMARY            0x80
#define  ASI_BLK_P              0xF0

#define  VA_ASI_ITLB_TAG_ACCESS 0x30
#define  VA_ASI_DTLB_TAG_ACCESS 0x30

#define  SEI_EN                 31
#define  SEI_SSHOT              30
#define  SEI_IMD                29
#define  SEI_IMT                28
#define  SEI_DMD                27
#define  SEI_DMT                26
#define  SEI_IRF                25
#define  SEI_FRF                24

#define  SEE_NCEEN               1
#define  SEE_CEEN                0

#define  SES_INIT_VALUE         0x10000000
#define  SES_MEU                31
#define  SES_MEC                30
#define  SES_IMDU               25
#define  SES_IMTU               24
#define  SES_DMDU               23
#define  SES_DMTU               22
#define  SES_IDC                21
#define  SES_ITC                20
#define  SES_DDC                19
#define  SES_DTC                18
#define  SES_IRC                17
#define  SES_IRU                16
#define  SES_FRC                15
#define  SES_FRU                14
#define  SES_LDAU               13
#define  SES_NCU                12
#define  SES_DMSU               11
#define  SES_MAU                 9

#define  TT_Instruction_Access_Error    0xa
#define  TT_FP_Exception_Other          0x22
#define  TT_Internal_Processor_Error    0x29
#define  TT_Data_Access_Error           0x32
#define  TT_Corrected_ECC               0x63
#define  TT_Fast_IMMU_Miss              0x64
#define  TT_MA_Interrupt                0x74
#define  TT_Data_Error                  0x78

#define  EXECUTED               0xeeced

#define  L2CS_PA0               0xA900000000
#define  L2CS_PA1               0xB900000000

#define  L2EE_PA0               0xAA00000000
#define  L2EE_PA1               0xBA00000000
#define  L2ES_PA0               0xAB00000000
#define  L2ES_PA1               0xBB00000000
#define  L2EA_PA0               0xAC00000000
#define  L2EA_PA1               0xBC00000000
#define  L2EI_PA0               0xAD00000000
#define  L2EI_PA1               0xBD00000000

#define  L2ES_MEU               63
#define  L2ES_MEC               62
#define  L2ES_RW                61
#define  L2ES_ASYN              59
#define  L2ES_TID               54
#define  L2ES_LDAC              53
#define  L2ES_LDAU              52
#define  L2ES_LDWC              51
#define  L2ES_LDWU              50
#define  L2ES_LDRC              49
#define  L2ES_LDRU              48
#define  L2ES_LDSC              47
#define  L2ES_LDSU              46
#define  L2ES_LTC               45
#define  L2ES_LRU               44
#define  L2ES_LVU               43
#define  L2ES_DAC               42
#define  L2ES_DAU               41
#define  L2ES_DRC               40
#define  L2ES_DRU               39
#define  L2ES_DSC               38
#define  L2ES_DSU               37
#define  L2ES_VEC               36
#define  L2ES_VEU               35

#define  DRAM_ES_PA             0x9700000280
#define  DRAM_EI_PA             0x9700000290

#define  DRAM_EI_ENB            31
#define  DRAM_EI_SSHOT          30

#define  DRAM_ES_MEU            63
#define  DRAM_ES_MEC            62
#define  DRAM_ES_DAC            61
#define  DRAM_ES_DAU            60
#define  DRAM_ES_DSC            59
#define  DRAM_ES_DSU            58
#define  DRAM_ES_DBU            57

#define  JBI_ERR_INJECT         0x8000004800
#define  JBI_ERR_CONFIG         0x8000010000
#define  JBI_ERROR_LOG          0x8000010020
#define  JBI_ERROR_OVF          0x8000010028
#define  JBI_LOG_ENB            0x8000010030
#define  JBI_SIG_ENB            0x8000010038
#define  JBI_TRANS_TIMEOUT      0x8000010090

#define  IOB_INT_MAN_ERR        0x9800000008
#define  IOB_INT_CTL_ERR        0x9800000408
#define  IOB_RESET_STATUS       0x9800000810

#define  JBI_ERR_APAR           28
#define  JBI_ERR_DPAR_WR        15
#define  JBI_ERR_DPAR_RD        14
#define  JBI_ERR_REP_UE         12
#define  JBI_ERR_NONEX_RD       8
#define  JBI_ERR_READ_TO        5

#define  SSI_TIMEOUT            0xff00010088
#define  SSI_LOG                0xff00000018


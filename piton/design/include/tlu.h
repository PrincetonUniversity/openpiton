// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu.h
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
// ifu trap types
`define INST_ACC_EXC    9'h008
`define INST_ACC_MMU_MS 9'h009
`define INST_ACC_ERR    9'h00a
`define ILL_INST        9'h010
`define PRIV_OPC        9'h011
`define FP_DISABLED     9'h020
`define DATA_ACC_EXC    9'h030

`define         MRA_CSM_PS0_HI      95
`define         MRA_CSM_PS0_LO      48
`define         MRA_CSM_PS1_HI      47
`define         MRA_CSM_PS1_LO      0

`define         MRA_TSB_PS0_HI      155
`define         MRA_TSB_PS0_LO      108
`define         MRA_TSB_PS1_HI      107
`define         MRA_TSB_PS1_LO      60
`define         MRA_TACCESS_HI  59
`define         MRA_TACCESS_LO  12
`define         MRA_CTXTCFG_HI    11
`define         MRA_CTXTCFG_LO    6
//
// modified for hypervisor support
//
`define TLU_THRD_NUM     4
`define	TLU_TT_LO	     0
`define	TLU_TT_HI	     8
`define	TLU_CWP_LO	     9
`define	TLU_CWP_HI	    11
`define	TLU_PSTATE_LO	12
`define	TLU_PSTATE_HI	19
`define	TLU_ASI_LO	    20
`define	TLU_ASI_HI	    27
`define	TLU_CCR_LO	    28
`define	TLU_CCR_HI	    35
`define	TLU_GL_LO	    36 
`define	TLU_GL_HI	    37 
`define	TLU_NPC_LO	    38
`define	TLU_NPC_HI	    84
`define	TLU_PC_LO	    85
`define	TLU_PC_HI	   131
`define	TLU_HTSTATE_LO 132
`define	TLU_HTSTATE_HI 135
`define	TLU_RD_NPC_HI	83
`define	TLU_RD_PC_LO	84
`define	TLU_RD_PC_HI   129
`define	TLU_RD_HTSTATE_LO 130
`define	TLU_RD_HTSTATE_HI 133
//
`define	TSA_PSTATE_VRANGE1_LO 12
`define	TSA_PSTATE_VRANGE1_HI 15
// modified due to bug 2588
// `define	TSA_PSTATE_VRANGE2_LO 16 
`define	TSA_PSTATE_VRANGE2_LO 18 
`define	TSA_PSTATE_VRANGE2_HI 19
//
`define	TLU_TSA_WIDTH     136 
`define	TLU_TDP_TSA_WIDTH 134 
`define	TSA_HTSTATE_WIDTH   4 
`define	TSA_GLOBAL_WIDTH    2 
`define	TSA_CCR_WIDTH       8 
`define	TSA_ASI_WIDTH       8 
`define	TSA_PSTATE_WIDTH    8 
`define	TSA_CWP_WIDTH       3 
`define	TSA_TTYPE_WIDTH     9 
`define	TLU_GLOBAL_WIDTH    4 
`define	TLU_HPSTATE_WIDTH   5 
//
// added due to Niagara SRAMs methodology
// The following defines have been replaced due
// the memory macro replacement from:
// bw_r_rf32x144 -> 2x bw_r_rf32x80
/*
`define	TSA_MEM_WIDTH     144 
`define	TSA_HTSTATE_HI    142 //  3 bits 
`define	TSA_HTSTATE_LO    140 
`define	TSA_TPC_HI        138 // 47 bits 
`define	TSA_TPC_LO         92
`define	TSA_TNPC_HI        90 // 47 bits
`define	TSA_TNPC_LO        44 
`define	TSA_TSTATE_HI      40 // 29 bits 
`define	TSA_TSTATE_LO      12 
`define	TSA_TTYPE_HI        8 //  9 bits
`define	TSA_TTYPE_LO        0
`define	TSA_MEM_CWP_LO	   12
`define	TSA_MEM_CWP_HI	   14
`define	TSA_MEM_PSTATE_LO  15
`define	TSA_MEM_PSTATE_HI  22
`define	TSA_MEM_ASI_LO	   23
`define	TSA_MEM_ASI_HI	   30
`define	TSA_MEM_CCR_LO	   31
`define	TSA_MEM_CCR_HI	   38
`define	TSA_MEM_GL_LO	   39 
`define	TSA_MEM_GL_HI	   40 
*/
`define	TSA_MEM_WIDTH   80 
`define	TSA1_HTSTATE_HI 63 //  4 bits 
`define	TSA1_HTSTATE_LO 60 
`define	TSA1_TNPC_HI    58 // 47 bits
`define	TSA1_TNPC_LO    12
`define	TSA1_TTYPE_HI    8 //  9 bits
`define	TSA1_TTYPE_LO    0
`define	TSA0_TPC_HI     78 // 47 bits 
`define	TSA0_TPC_LO     32
`define	TSA0_TSTATE_HI  28 // 29 bits 
`define	TSA0_TSTATE_LO   0 
//
`define	TSA0_MEM_CWP_LO	    0 
`define	TSA0_MEM_CWP_HI	    2
`define	TSA0_MEM_PSTATE_LO  3 
`define	TSA0_MEM_PSTATE_HI 10
`define	TSA0_MEM_ASI_LO	   11
`define	TSA0_MEM_ASI_HI	   18
`define	TSA0_MEM_CCR_LO	   19
`define	TSA0_MEM_CCR_HI	   26
`define	TSA0_MEM_GL_LO	   27
`define	TSA0_MEM_GL_HI	   28

// HPSTATE position definitions within wsr
`define	WSR_HPSTATE_ENB  11 
`define	WSR_HPSTATE_IBE  10 
`define	WSR_HPSTATE_RED   5 
`define	WSR_HPSTATE_PRIV  2 
`define	WSR_HPSTATE_TLZ   0 

// TSTATE postition definitions within wsr
`define	WSR_TSTATE_GL_HI  41 // 2b
`define	WSR_TSTATE_GL_LO  40 
`define	WSR_TSTATE_CCR_HI 39 // 8b
`define	WSR_TSTATE_CCR_LO 32 
`define	WSR_TSTATE_ASI_HI 31 // 8b
`define	WSR_TSTATE_ASI_LO 24 
`define	WSR_TSTATE_PS2_HI 17 // 4b
// modified due to bug 2588
`define	WSR_TSTATE_PS2_LO  16 
`define	WSR_TSTATE_PS1_HI  12 // 4b
// added for bug 2584 
`define	WSR_TSTATE_PS_PRIV 10 // 4b
`define	WSR_TSTATE_PS1_LO   9
`define	WSR_TSTATE_CWP_HI   2 // 3b
`define	WSR_TSTATE_CWP_LO   0 
//
`define	WSR_TSTATE_WIDTH   29 
`define	RDSR_TSTATE_WIDTH  48 
`define	RDSR_HPSTATE_WIDTH 12 
`define	TLU_ASR_DATA_WIDTH 64 
`define	TLU_ASR_ADDR_WIDTH  7 

`define SFTINT_WIDTH     17 
//
// tick_cmp and stick_cmp definitions
`define TICKCMP_RANGE_HI 60
`define TICKCMP_RANGE_LO  0
`define TICKCMP_INTDIS   63 
`define SFTINT_TICK_CMP   0 
`define SFTINT_STICK_CMP 16 
//
// PIB WRAP
`define SFTINT_PIB_WRAP 15 
`define PIB_OVERFLOW_TTYPE 7'h4f 

// HPSTATE postition definitions
`define	HPSTATE_IBE  4 
`define	HPSTATE_ENB  3 
`define	HPSTATE_RED  2 
`define	HPSTATE_PRIV 1 
`define	HPSTATE_TLZ  0 

// HTBA definitions
`define	TLU_HTBA_WIDTH  34 // supported physical width 
`define	TLU_HTBA_HI     47 
`define	TLU_HTBA_LO     14 

// TBA definitions
`define	TLU_TBA_WIDTH  33 // supported physical width 
`define	TLU_TBA_HI     47 
`define	TLU_TBA_LO     15 

`define	TPC		 5'h0 	
`define	TNPC	 5'h1 	
`define	TSTATE	 5'h2 	
`define	TT		 5'h3 	
`define	TICK	 5'h4 	
`define	TBA		 5'h5 	
`define	PSTATE	 5'h6 	
`define	TL		 5'h7 	
`define	PIL		 5'h8 
`define	HPSTATE	 5'h0 
`define	HTSTATE	 5'h1 
`define	HINTP	 5'h3 
`define	HTBA	 5'h5 
`define	HTICKCMP 5'h1f 
`define	STICKCMP 5'h19 
`define	TICKCMP  5'h17 
//
// added for the hypervisor support
`define	PSTATE_VRANGE1_LO	1
`define	PSTATE_VRANGE1_HI   4	
// modified due to bug 2588
`define	PSTATE_VRANGE2_LO	8
`define	PSTATE_VRANGE2_HI   9
`define	PSTATE_TRUE_WIDTH  12 

`define PSTATE_AG 	 0
`define PSTATE_IE 	 1
`define PSTATE_PRIV  2
`define PSTATE_AM 	 3
`define PSTATE_PEF 	 4
`define PSTATE_RED 	 5
`define PSTATE_MM_LO 6
`define PSTATE_MM_HI 7
`define PSTATE_TLE 	 8
`define PSTATE_CLE 	 9
`define PSTATE_MG 	10
`define PSTATE_IG 	11
//
// compressed PSTATE WSR definitions
`define	WSR_PSTATE_VRANGE1_LO	0
`define	WSR_PSTATE_VR_PRIV      1
`define	WSR_PSTATE_VRANGE1_HI   3	
`define	WSR_PSTATE_VRANGE2_LO	4
`define	WSR_PSTATE_VRANGE2_HI   5
`define	WSR_PSTATE_VR_WIDTH     6

`define MAXTL  3'b110
`define MAXTL_LESSONE 3'b101
`define MAXSTL 3'b010		 
`define MAXSTL_TL 3'b010 // Saturation point for GL and TL (supervisor) 
`define MAXSTL_GL 2'b10  // Saturation point for GL and TL (supervisor) 
`define MAXGL  4'b0011	 // Saturation point for GL (hypervisor)	
`define MAXGL_GL  2'b11	 // Saturation point for GL (hypervisor)	
//
// ASI_QUEUE for hypervisor
// Queues are: CPU_MONODO
//             DEV_MONODO
//             RESUMABLE_ERROR
//             NON_RESUMABLE_ERROR
//
`define        ASI_VA_WIDTH       48 
`define        TLU_ASI_QUE_HI     13
`define        TLU_ASI_QUE_LO      6
`define        TLU_ASI_QUE_WIDTH   8
`define        TLU_ASI_VA_WIDTH   10 
`define        TLU_ASI_STATE_WIDTH 8 

// for address range checking
`define        TLU_ASI_QUE_VA_HI   9
`define        TLU_ASI_QUE_VA_LO   3 

`define        TLU_ASI_QUE_ASI   8'h25 
`define        CPU_MONDO_HEAD   10'h3c0
`define        CPU_MONDO_TAIL   10'h3c8
`define        DEV_MONDO_HEAD   10'h3d0
`define        DEV_MONDO_TAIL   10'h3d8
`define        RESUM_ERR_HEAD   10'h3e0
`define        RESUM_ERR_TAIL   10'h3e8
`define        NRESUM_ERR_HEAD  10'h3f0
`define        NRESUM_ERR_TAIL  10'h3f8
`define        CPU_MONDO_TRAP   7'h7c // only 7 bits are defined; upper two are 2'b00
`define        DEV_MONDO_TRAP   7'h7d // only 7 bits are defined; upper two are 2'b00 
`define        TLZ_TRAP         7'h5f // only 7 bits are defined; upper two are 2'b00 
`define        HWINT_INT        7'h60 // only 7 bits are defined; upper two are 2'b00 
//
// Niagara scratch-pads
// VA address of 0x20 and 0x28 are exclusive to hypervisor
// 
`define        TLU_SCPD_DATA_WIDTH  64
`define        SCPD_RW_ADDR_WIDTH     5 
`define        SCPD_ASI_VA_ADDR_WIDTH 3  

`define        PRI_SCPD_ASI_STATE     8'h20
`define        SCPD_ASI_VA_ADDR_LO   10'h000
`define        SCPD_ASI_VA_ADDR_HI   10'h038
//
// range checking 
`define        TLU_ASI_SCPD_VA_HI  5   
`define        TLU_ASI_SCPD_VA_LO  3   

`define        HPRI_SCPD_ASI_STATE    8'h4f
`define        HSCPD_ASI_VA_ADDR_LO   3'h4
`define        HSCPD_ASI_VA_ADDR_HI   3'h5

// PIB related definitions
// Bit definition for events
`define        PIB_INSTR_COUNT   3'bxxx
`define        PIB_SB_FULL_CNT   3'b000
`define        PIB_FP_INST_CNT   3'b001
`define        PIB_IC_MISS_CNT   3'b010
`define        PIB_DC_MISS_CNT   3'b011
`define        PIB_ITLB_MISS_CNT 3'b100
`define        PIB_DTLB_MISS_CNT 3'b101
`define        PIB_L2_IMISS_CNT  3'b110
`define        PIB_L2_DMISS_CNT  3'b111
// 
// PIB related definitions
// PCR and PIC address definitions
`define        PCR_ASR_ADDR		  7'b0010000
`define        PIC_ASR_PRIV_ADDR  7'b0110001
`define        PIC_ASR_NPRIV_ADDR 7'b0010001
// 
// PCR bit definitions
`define        WSR_PCR_PRIV   0 // PIC privilege 
`define        WSR_PCR_ST     1 // supervior trace 
`define        WSR_PCR_UT     2 // user trace 
`define        WSR_PCR_SL_LO  4 // PICL event mask 
`define        WSR_PCR_SL_HI  6 // 
`define        WSR_PCR_CL_OVF 8 // 
`define        WSR_PCR_CH_OVF 9 // 
//
`define        PIB_PCR_WIDTH  8 
`define        PIB_PCR_PRIV   0 // PIC privilege 
`define        PIB_PCR_ST     1 // privilege event trace 
`define        PIB_PCR_UT     2 // user event trace 
`define        PIB_PCR_SL_LO  3 // PICL event encode 
`define        PIB_PCR_SL_HI  5 // 
`define        PIB_PCR_CL_OVF 6 // 
`define        PIB_PCR_CH_OVF 7 // 

// PIC definitions
`define        PIB_PIC_FULL_WIDTH 64
`define        PIB_PIC_CNT_WIDTH  33
`define        PIB_PIC_CNT_WRAP   32
`define        PIB_PICH_CNT_HI    63
`define        PIB_PICH_CNT_LO    32
`define        PIB_PICL_CNT_HI    31
`define        PIB_PICL_CNT_LO     0
`define        PIB_EVQ_CNT_WIDTH   3
// PIC  mask bit position definitions
`define        PICL_MASK_WIDTH     8
`define        PICL_MASK_SB_FULL   0 
`define        PICL_MASK_FP_INST   1 
`define        PICL_MASK_IC_MISS   2
`define        PICL_MASK_DC_MISS   3
`define        PICL_MASK_ITLB_MISS 4
`define        PICL_MASK_DTLB_MISS 5
`define        PICL_MASK_L2_IMISS  6
`define        PICL_MASK_L2_DMISS  7

// added define from sparc_tlu_int.v 
`define INT_THR_HI  12
`define INT_VEC_HI 5
`define INT_VEC_LO 0
`define INT_THR_HI  12
`define INT_THR_LO   8
`define INT_TYPE_HI 17
`define INT_TYPE_LO 16
`define TLU_INRR_ASI 8'h72
`define TLU_INDR_ASI 8'h73
`define TLU_INVR_ASI 8'h74
//
// shadow scan related definitions 
`define TLU_SSCAN_WIDTH 63 
// modified due to logic redistribution
// `define TCL_SSCAN_WIDTH 12 
`define TCL_SSCAN_WIDTH 3 
`define MISCTL_SSCAN_WIDTH 9 
`define TDP_SSCAN_WIDTH 51 
`define TDP_SSCAN_LO  0 
`define TDP_SSCAN_HI 50 
// `define TCL_SSCAN_LO 51 
`define MISCTL_SSCAN_LO 51 
`define MISCTL_SSCAN_HI 59 
`define TCL_SSCAN_LO 60 
`define TCL_SSCAN_HI 62 
// 
// position definitions - TDP
`define TDP_SSCAN_PC_LO    0 
`define TDP_SSCAN_PC_HI   45 
`define TDP_SSCAN_PS_IE   46 
`define TDP_SSCAN_PS_PRIV 47 
`define TDP_SSCAN_HPS_LO  48
`define TDP_SSCAN_HPS_HI  50  
// 
// position definitions - TCL
`define TCL_SSCAN_TT_LO    0 
`define TCL_SSCAN_TT_HI    8 
`define TCL_SSCAN_TL_LO    9
`define TCL_SSCAN_TL_HI   11
// 
// To speedup POR for verification purposes
`define RSTVADDR_BASE 34'h3_ffff_c000 

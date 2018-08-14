// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot_dramctl_init.s
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
! This file contains init that is required to
! clear out xs and valid bits in various structures
! to make silicon work.

.global dramctl_init
dramctl_init:
#ifndef DISABLE_SELF_REFRESH
#define DISABLE_SELF_REFRESH 0
#endif

#ifndef VARY_CAS_LATENCY
#define CAS_LATENCY 3
#define RCD_REG     3 
#define RP_REG      3 
#define RC_REG      12
#endif

#if (VARY_CAS_LATENCY == 2)
#define CAS_LATENCY VARY_CAS_LATENCY
#define RCD_REG     3 
#define RP_REG      3 
#define RC_REG      12
#elif (VARY_CAS_LATENCY == 4)
#define CAS_LATENCY VARY_CAS_LATENCY
#define RCD_REG     4 
#define RP_REG      4 
#define RC_REG      13
#elif (VARY_CAS_LATENCY == 5)
#define CAS_LATENCY VARY_CAS_LATENCY
#define RCD_REG     4 
#define RP_REG      4 
#define RC_REG      13
#else
#define CAS_LATENCY  0x3
#define RCD_REG     3 
#define RP_REG      3 
#define RC_REG      12
#endif



#ifndef VARY_REFRSH_FREQ
#define REFRSH_FREQ 0x514
#else
#define REFRSH_FREQ VARY_REFRSH_FREQ
#endif

#ifdef VARY_SCRUB_FREQ
#define SCRUB_ENABLE 1
#define SCRUB_FREQ  VARY_SCRUB_FREQ
#endif

#ifdef VARY_MAX_OPNBNK
#define MAX_OPNBNK VARY_MAX_OPNBNK
#endif

#ifdef VARY_MAX_OPNBNK_TIME
#define MAX_OPNBNK_TIME VARY_MAX_OPNBNK_TIME
#endif

#ifdef VARY_RRD_REG
#if (VARY_RRD_REG >= 0xf )
#define RRD_REG 0xf
#elif (VARY_RRD_REG >= 2)
#define RRD_REG VARY_RRD_REG
#elif (VARY_RRD_REG < 2)
#define RRD_REG 2
#endif
#endif

#ifdef VARY_MRD_REG
#if (VARY_MRD_REG >= 3 )
#define MRD_REG 0x3
#elif (VARY_MRD_REG >= 2)
#define MRD_REG VARY_MRD_REG
#elif (VARY_MRD_REG < 2)
#define MRD_REG 2
#endif
#endif

#ifdef VARY_RTP_REG
#if (VARY_RTP_REG >= 7 )
#define RTP_REG 0x7
#elif (VARY_RTP_REG >= 2)
#define RTP_REG VARY_RTP_REG
#elif (VARY_RTP_REG < 2)
#define RTP_REG 2
#endif
#endif

#ifdef VARY_WR_REG
#if (VARY_WR_REG >= 6 )
#define WR_REG 0x6
#elif (VARY_WR_REG >= 2)
#define WR_REG VARY_WR_REG
#elif (VARY_WR_REG < 2)
#define WR_REG 2
#endif
#endif


#ifndef TESTER_WMR
        mov      DISABLE_SELF_REFRESH,%g1
        brnz     %g1, continue_dram_init
	nop

        setx    0x9600000000, %g1, %g2
        setx    0x2000000000000000, %g1, %g3

        ! Set DRAM self-refresh bit
        ldx     [%g2 + 0x08], %g1
        and     %g1, %g3, %g4

        brnz    %g4, skip_dramctl_init
	nop


        or      %g1, %g3, %g3
        stx     %g3, [%g2 + 0x08]
#endif

continue_dram_init:

        ! Determine if this is the bootstrap thread
        ! if not, skip dram init
        setx    0x9800000830, %g1, %g2
        ldx     [%g2], %g3                  ! %g3 has coreavail
        rd      %asr26, %l1
        set     0x1f00, %g1
        and     %l1, %g1, %l1
        srlx    %l1, 8, %l1                 ! %l1 has thread ID
        mov     63, %g1
        sub     %g1, %l1, %g1
        sllx    %g3, %g1, %g3
        sllx    %g3, 1, %g3                 ! Total shift of (64-thread ID) bits
        brnz    %g3, skip_dramctl_init
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! DRAM init 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! STACK RANK 
        setx    0x9700000000, %l7, %l6
        sethi   %hi(0x00001000), %g1
        sethi   %hi(0x00002000), %g2
        sethi   %hi(0x00003000), %g3

        add     %l6, 0x130, %l0
        mov     0x1, %l3        
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x108, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x218, %l0
        mov     0xf, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]


#ifdef VARY_CAS_LATENCY
        add     %l6, 0x010, %l0
        mov     CAS_LATENCY,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x090, %l0
        mov     RCD_REG,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x0b8, %l0
        mov     RP_REG,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x088, %l0
        mov     RC_REG,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#endif

#ifdef VARY_REFRSH_FREQ
        add     %l6, 0x020, %l0
        setx    REFRSH_FREQ, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_SCRUB_FREQ
        add     %l6, 0x040, %l0
        setx    SCRUB_ENABLE, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x018, %l0
        setx    SCRUB_FREQ, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_MAX_OPNBNK
        add     %l6, 0x028, %l0
        setx    MAX_OPNBNK, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_MAX_OPNBNK_TIME
        add     %l6, 0x048, %l0
        setx    MAX_OPNBNK_TIME, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_RRD_REG
        add     %l6, 0x080, %l0
        setx    RRD_REG, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_MRD_REG
        add     %l6, 0x0d0, %l0
        setx    MRD_REG, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_RTP_REG
        add     %l6, 0x0a8, %l0
        setx    RTP_REG, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

#ifdef VARY_WR_REG
        add     %l6, 0x0c0, %l0
        setx    WR_REG, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif


        add     %l6, 0x1a0, %l0
        setx    0x4, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#ifdef SW_WAIT_200US
        setx    0x15, %l7, %l4
wait_200us :
        deccc   %l4
        bne     wait_200us           ! repeat till all ch done
        nop
#endif

        setx    0x6, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        setx    0x7, %l7, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]



skip_dramctl_init:
	! Jump back to the rest of the reset code
	setx hboot_pton_init, %g1, %g2
        jmp %g2
        nop


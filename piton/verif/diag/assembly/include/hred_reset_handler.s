// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hred_reset_handler.s
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
! slam init now works for MT diags
#ifdef NO_SLAM_INIT_CMP
#include "hboot_init.s"
#endif


#ifdef USE_SCANDUMP_L2TRIG
#include "scandump.s"
#endif

#ifdef ENABLE_DEBUG_PORT
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Turn on Debug Port A
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	! set IOB_VIS_SELECT to 0.  IOB raw
	setx	0x9800001000, %g1, %g2
	stx     %g0, [%g2]

	! set DB_ENET_IDLEVAL to 0x82deadbeef
	setx	0x9800002008,  %g1, %g2
	setx	0x082deadbeef, %g1, %g3
	stx     %g3, [%g2]

	! set DB_ENET_CONTROL to enable and select IOB raw
	setx	0x9800002000, %g1, %g2
	mov	0x102, %g3
        stx     %g3, [%g2]
#endif
#ifdef TESTER_DEBUG
        !/ set L2 visability mask a & b to 0
        setx    0x9800001820, %g1, %g2
        stx     %g0, [%g2]
        add     0x8,%g2,%g2
        stx     %g0, [%g2]

        !/ set L2 compare a & b to 0
        setx    0x9800001830, %g1, %g2
        stx     %g0, [%g2]
        add     0x8,%g2,%g2
        stx     %g0, [%g2]

        !/ set trigger delay
        setx    0x9800001840, %g1, %g2
        setx    0xffffffffff, %g1, %g3
        stx     %g3, [%g2]

        !/set L2 visability control (0x0000-1800)
        setx    0x9800001800, %g1, %g2
        or      0x9, %g0, %g1
        stx     %g1, [%g2]

        !/ set IO bridbg visability select
        setx    0x9800001000, %g1, %g2
        stx     %g0, [%g2]

        !/ ENET control
        setx    0x9800002000, %g1, %g2
        mov     0x101, %g3
        stx     %g3, [%g2]

        !/ ENET idleval
        setx    0x9800002008, %g1, %g2
        setx    0x0123456789abcdef, %g1, %g3
        stx     %g3, [%g2]

        !/ JBUS control
        setx    0x9800002100, %g1, %g2
        setx    0x0000, %g1, %g3
        stx     %g3, [%g2]

        !/ JBUS mask
        setx    0x9800002140, %g1, %g2
        setx    0x200000000000, %g1, %g3
        stx     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]

        !/ JBUS compare
        setx    0x9800002148, %g1, %g2
        stx     %g0, [%g2]
        add     0x20, %g2, %g2
        stx     %g0, [%g2]
        add     0x20, %g2, %g2
        stx     %g0, [%g2]
        add     0x20, %g2, %g2
        stx     %g0, [%g2]

        !/ JBUS count
        setx    0x9800002150, %g1, %g2
        mov     0x100, %g3
        STX     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]
        add     0x20, %g2, %g2
        stx     %g3, [%g2]

        !/ JBUS ARB control
        setx    0x9800004100, %g1, %g2
        setx    0x7ff, %g1, %g3
        stx     %g3, [%g2]

        !/ JBUS confi
        setx    0x9800004000, %g1, %g2
        mov     0x1, %g3
        stx     %g3, [%g2]
#endif


#ifndef CUSTOM_THREAD_START
	start_threads
#endif

#ifdef NO_SLAM_INIT_CMP
	! need to do a sync thread here to make sure cache init is
	! done before we turn on the cache.
	sync_threads
#endif

	! set lsu diagnostic reg. use all ways for dcache, icache
	setx	cregs_lsu_diag_reg_r64, %g1, %l1
	mov	0x10, %g1
	stxa	%l1, [%g1] ASI_LSU_DIAG_REG

	! set lsu control reg. enable dcache, icache
 	setx	(CREGS_LSU_CTL_REG_IC | (CREGS_LSU_CTL_REG_DC << 1)), %g1, %l1
	stxa	%l1, [%g0] ASI_LSU_CTL_REG

#if defined SYNC_THREADS && !defined NO_SLAM_INIT_CMP
	sync_threads
#endif

	! set hpstate.red = 0 and hpstate.enb = 1
	rdhpr	%hpstate, %l1 
	wrhpr	%l1, 0x820, %hpstate

#ifdef JBI_CONFIG
#define ENABLE_JBI_CONFIG
#endif

#ifdef ENABLE_JBI_CONFIG
	! begin config jbi
	! JBI_CONFIG
	setx CREGS_JBI_CONFIG1, %g1, %g2
	setx 0x8000000000, %g1, %g3
	stx %g2, [%g3]

	! JBI_CONFIG2
	setx 0x000000007033fe0f, %g1, %g2
	setx 0x8000000008, %g1, %g3
	stx %g2, [%g3]

	! JBI_DEBUG_ARB
	setx 0x00000000006101ff, %g1, %g2
	setx 0x8000004100, %g1, %g3
	stx %g2, [%g3]

	! JBI_MEMSIZE
	setx 0x0000002000000000, %g1, %g2
	setx 0x80000100a0, %g1, %g3
	stx %g2, [%g3]

	! JBI_L2_TIMEOUT  
	setx CREGS_JBI_L2_TIMEOUT, %g1, %g2
	setx 0x8000010080, %g1, %g3
	stx %g2, [%g3]

	! JBI_ARB_TIMEOUT
	setx CREGS_JBI_ARB_TIMEOUT, %g1, %g2
	setx 0x8000010088, %g1, %g3
	stx %g2, [%g3]

	! JBI_TRANS_TIMEOUT
	setx CREGS_JBI_TRANS_TIMEOUT, %g1, %g2
	setx 0x8000010090, %g1, %g3
	stx %g2, [%g3]

	! JBI_INTR_TIMEOUT
	setx CREGS_JBI_INTR_TIMEOUT, %g1, %g2
	setx 0x8000010098, %g1, %g3
	stx %g2, [%g3]

	! JBI_ERROR_LOG
	setx 0xffffffff, %g1, %g2
	setx 0x8000010020, %g1, %g3
	stx %g2, [%g3]

	! JBI_ERROR_OVF
	setx 0xffffffff, %g1, %g2
	setx 0x8000010028, %g1, %g3
	stx %g2, [%g3]

	! JBI_LOG_NACK
	setx 0xffffffff, %g1, %g2
	setx 0x8000010070, %g1, %g3
	stx %g2, [%g3]

	! JBI_LOG_ENB
	setx 0x01f03ff37, %g1, %g2
	setx 0x8000010030, %g1, %g3
	stx %g2, [%g3]

	! JBI_SIG_ENB
	setx 0x01f03ff37, %g1, %g2
	setx 0x8000010038, %g1, %g3
	stx %g2, [%g3]

	! JBI_ERR_CONFIG
	setx 0x0000001c, %g1, %g2
	setx 0x8000010000, %g1, %g3
	stx %g2, [%g3]
	! end config jbi
#endif

	! initialize queue registers
	wr %g0, 0x25, %asi
	stxa %g0, [0x3c0] %asi
	stxa %g0, [0x3c8] %asi
	stxa %g0, [0x3d0] %asi
	stxa %g0, [0x3d8] %asi
	stxa %g0, [0x3e0] %asi
	stxa %g0, [0x3e8] %asi
	stxa %g0, [0x3f0] %asi
	stxa %g0, [0x3f8] %asi
	wrpr	0, %tl
	wrpr	0, %g0, %gl
!	wrhpr	cregs_hpstate_imm, %hpstate
	wr	%g0, cregs_fprs_imm, %fprs
	wr	%g0, cregs_ccr_imm, %ccr
	wr	%g0, cregs_asi_imm, %asi
	setx	cregs_tick_r64, %g1, %g2
	! FIXME set other ticks also
	wrpr	%g2, %tick
	setx	cregs_stick_r64, %g1, %g2
	wr	%g2, %g0, %sys_tick
	mov     0x1, %g2
	sllx    %g2, 63, %g2
	wr	%g2, %g0, %tick_cmpr
	wr	%g2, %g0, %sys_tick_cmpr
	wrhpr	%g2, %g0, %hsys_tick_cmpr
	mov	%g0, %y
	wrpr	cregs_pil_imm, %pil
	wrpr	cregs_cwp_imm, %cwp
	wrpr	cregs_cansave_imm, %cansave
	wrpr	cregs_canrestore_imm, %canrestore
	wrpr	cregs_otherwin_imm, %otherwin
	wrpr	cregs_cleanwin_imm, %cleanwin
	wrpr	cregs_wstate_imm, %wstate
	! Clear I and D SFSR
	mov 	0x18, %g1
	stxa	%g0, [%g0 + %g1] 0x50
	stxa	%g0, [%g0 + %g1] 0x58
	! enable sparc error trap
	setx	cregs_sparc_error_en_reg_r64, %g1, %l1
	stxa	%l1, [%g0] ASI_SPARC_ERROR_EN_REG

    !Yaosheng: l2 config regs have been modified
	! enable l2 error trap
	!setx	cregs_l2_error_en_reg_r64, %g1, %l1 
	!mov	0xaa, %g1
	!sllx	%g1, 32, %g1
	!stx	%l1, [%g1 + 0x00]
	!stx	%l1, [%g1 + 0x40]
	!stx	%l1, [%g1 + 0x80]
	!stx	%l1, [%g1 + 0xc0]

	! load partition id

    setx     0xba00000000, %l1, %g1
    ldx     [%g1], %g1            ! has coreid


    srlx    %g1, 8, %l1
    mulx    %l1, PTON_X_TILES, %l1
    and     %g1, 0xff, %g1
    add     %g1, %l1, %g1    

    !srlx    %g1, 5, %l1
    !add     %l1, %g1, %g1        ! translate from x,y coordinates to coreid
    !set     0x3f, %l1           ! get the lowest 6 bits
    !and     %g1, %l1, %g1
    
    sllx    %g1, 1, %g1

	rd	%asr26, %l1
    srlx    %l1, 8, %l1
    add     %l1, %g1, %l1
#ifdef PORTABLE_CORE
        set     0x0001, %g1
#else
        set     0x007f, %g1
#endif
    and     %l1, %g1, %l1     ! %l1 has thread ID

	setx	part_id_list, %g1, %g2
        sllx    %l1, 3, %l1             ! offset - partition list
        ldx     [%g2 + %l1], %g2	! %g2 contains partition ID
	mov	0x80, %g1
	stxa	%g2, [%g1] 0x58

#ifndef HPV_NONSPLIT_MODE		
	! set hyper trap base addr
	setx HV_TRAP_BASE_PA, %l0, %l7
#else
	! set supervisor trap base addr
	setx TRAP_BASE_VA, %l0, %l7
#endif
	wrhpr %l7, %g0, %htba

	! load tsb config/base from memory
	! and write to corresponding ASIs
	! set tsb-reg (4 at present) for one partition
	! 2 i-config, 2-dconfig
	setx	tsb_config_base_list, %l0, %g1
	sllx	%g2, 7, %g2		! %g2 contains offset to tsb_config_base_list
	add	%g1, %g2, %g1		! %g1 contains pointer to tsb_config_base_list

	! IMMU_CXT_Z_CONFIG   (0x37, VA=0x00)
	ldx	[%g1], %l1
	stxa	%l1, [%g0] 0x37

	! IMMU_CXT_NZ_CONFIG  (0x3f, VA=0x00)
	ldx	[%g1+8], %l1
	stxa	%l1, [%g0] 0x3f

	! old:	 IMMU_CXT_Z_PS0_TSB  (0x50, VA=0x60)
	! IMMU_CXT_Z_PS0_TSB  (0x35, VA=0x0)
	! IMMU_CXT_Z_PS1_TSB  (0x36, VA=0x0)
	ldx	[%g1+16], %l1
	stxa	%l1, [%g0] 0x35
	ldx	[%g1+32], %l1
	stxa	%l1, [%g0] 0x36

	! old:	 IMMU_CXT_NZ_PS0_TSB (0x50, VA=0x70)
	! IMMU_CXT_NZ_PS0_TSB (0x3d, VA=0x00)
	! IMMU_CXT_NZ_PS1_TSB (0x3e, VA=0x00)
	ldx	[%g1+24], %l1
	stxa	%l1, [%g0] 0x3d
	ldx	[%g1+40], %l1
	stxa	%l1, [%g0] 0x3e
		
	! DMMU_CXT_Z_CONFIG   (0x33, VA=0x00)
	ldx	[%g1+64], %l1
	stxa	%l1, [%g0] 0x33

	! DMMU_CXT_NZ_CONFIG  (0x3b, VA=0x00)
	ldx	[%g1+72], %l1
	stxa	%l1, [%g0] 0x3b

	! old:	DMMU_CXT_Z_PS0_TSB  (0x58, VA=0x60)
	! DMMU_CXT_Z_PS0_TSB  (0x31, VA=0x00)
	! DMMU_CXT_Z_PS1_TSB  (0x32, VA=0x00)
	ldx	[%g1+80], %l1
	stxa	%l1, [%g0] 0x31
	ldx	[%g1+96], %l1
	stxa	%l1, [%g0] 0x32
	
	! old:	DMMU_CXT_NZ_PS0_TSB (0x58, VA=0x70)
	! DMMU_CXT_NZ_PS0_TSB (0x39, VA=0x00)
	! DMMU_CXT_NZ_PS0_TSB (0x3a, VA=0x00)
	ldx	[%g1+88], %l1
	stxa	%l1, [%g0] 0x39
	ldx	[%g1+104], %l1
	stxa	%l1, [%g0] 0x3a

	! demap all itlb and dtlb
	mov	0x80, %o2
	stxa	%g0, [ %o2 ] 0x57
	stxa	%g0, [ %o2 ] 0x5f

	! zero out all itlb and dtlb tag/data
	! entries if needed by diag
#ifdef  CLEAR_ALL_TLBS
#include "hboot_tlb_init.s"
#endif
	! init primary context reg 
	mov 0x8, %l1
	stxa %g0, [%l1] 0x21
	! init sec context reg						
	mov 0x10, %l1
	stxa %g0, [%l1] 0x21	

#ifdef	HPV_NONSPLIT_MODE
        ! init itlb entry for the trap handlers
        ! l5 tag                ;  l6 data
        setx 0xa000000000000066, %g1, %l6 ! L CP W P
        setx ra2pa(TRAP_BASE_RA,0), %g1, %l1
        srlx  %l1, 13, %l1
        sllx  %l1, 13, %l1
        or    %l6, %l1, %l6
        mov  0x30, %o2
        setx TRAP_BASE_VA, %g1, %l5		! PA=VA, for HV trap handler page
        srlx  %l5, 13, %l5
        sllx  %l5, 13, %l5
        stxa  %l5, [ %o2 ] 0x50

#ifdef CSM_ENABLE
        mov     0x10, %g7
        ldxa    [%g7] 0x1a, %g7 ! load from itlb config reg
        stxa %g7, [%g0] 0x0e
#endif
        stxa  %l6, [ %g0 ] 0x54
    

	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
        setx ra2pa(TRAP_DATA_RA,0), %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
        setx TRAP_DATA_VA, %g1, %l5		! PA=VA, for HV trap handler page
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58
    
#ifdef CSM_ENABLE
    mov     0x18, %g7
    ldxa    [%g7] 0x1a, %g7 ! load from dtlb config reg
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx HV_RED_DATA_PA, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx HV_RED_DATA_PA, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c

#ifdef CSM_ENABLE
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx 0xba00000000, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx 0xba00000000, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx 0xa900000000, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx 0xa900000000, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx 0x8150040000, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx 0x8150040000, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


#endif



	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_z_ps0_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx part_0_i_z_ps0_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb entry for i context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_nz_ps0_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_i_nz_ps0_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb entry for d context zero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_z_ps0_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_z_ps0_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb entry for d context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_nz_ps0_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_nz_ps0_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_z_ps1_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx part_0_i_z_ps1_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb entry for i context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_nz_ps1_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_i_nz_ps1_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb entry for d context zero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_z_ps1_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_z_ps1_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb entry for d context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_nz_ps1_tsb, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_nz_ps1_tsb, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb entry for link area
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx PART_0_LINK_AREA_BASE_ADDR, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx PART_0_LINK_AREA_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

#ifdef CSM_ENABLE
    stxa %g7, [%g0] 0x0f
#endif

	stxa  %l6, [ %g0 ] 0x5c


!!preload tlb entries for tsb_csm sections

#ifdef CSM_ENABLE
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_z_ps0_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx part_0_i_z_ps0_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb_csm entry for i context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_nz_ps0_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_i_nz_ps0_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb_csm entry for d context zero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_z_ps0_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_z_ps0_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb_csm entry for d context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_nz_ps0_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_nz_ps0_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_z_ps1_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	mov  0x30, %o2
	setx part_0_i_z_ps1_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb_csm entry for i context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_i_nz_ps1_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_i_nz_ps1_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb_csm entry for d context zero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_z_ps1_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_z_ps1_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c



	! init dtsb_csm entry for d context nonzero ps0, ps1
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx part_0_d_nz_ps1_tsb_csm, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx part_0_d_nz_ps1_tsb_csm, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c


	! init dtsb_csm entry for link area
	setx 0xa00000000000006e, %g1, %l6 ! L CP W P E L
	setx PART_0_CSM_LINK_AREA_BASE_ADDR, %g1, %l1
 	srlx  %l1, 13, %l1
	sllx  %l1, 13, %l1
	or    %l6, %l1, %l6
	setx PART_0_CSM_LINK_AREA_BASE_ADDR, %g1, %l5
	srlx  %l5, 13, %l5
	sllx  %l5, 13, %l5
	stxa  %l5, [ %o2 ] 0x58

    stxa %g7, [%g0] 0x0f

	stxa  %l6, [ %g0 ] 0x5c

#endif



#endif
	
	! init dtsb entry for i context zero ps0, ps1
	! set lsu control reg. enable dcache, icache, immu, dmmu
#ifdef ENABLE_L1_PER_THREAD
        rd      %asr26, %l1
        set     0x0300, %g1
        and     %l1, %g1, %l1
        srlx    %l1, 8, %l1		! %l1 has thread ID

	mov	cregs_lsu_ctl_reg_ic_thr, %g1
	srlx	%g1, %l1, %g1		! extract IC bit for thread
	and	%g1, 1, %g1		!

	mov	cregs_lsu_ctl_reg_dc_thr, %g2
	srlx	%g2, %l1, %g2		! extract DC bit for thread
	and	%g2, 1, %g2
	sllx	%g2, 1, %g2

	or	%g2, %g1, %g2		! combine IC and DC bit

	setx	cregs_lsu_ctl_reg_r64, %g1, %l1
	or	%l1, %g2, %l1		! combine IC/DC bit with rest of lsu_ctl_reg
#else
	setx	cregs_lsu_ctl_reg_r64, %g1, %l1
#endif
	stxa	%l1, [%g0] ASI_LSU_CTL_REG

        setx	HPriv_Reset_Handler, %g1, %g2
	rdhpr	%hpstate, %g3
!	mov	0x804, %g4
!	mov	0x5, %g4
	wrpr	1, %tl
	setx	cregs_htstate_r64, %g1, %g4
	wrhpr	%g4, %g0, %htstate
	wrpr	0, %tl
	mov     0x0, %o0	/* please don't delete this , used in customized IMMU miss trap */
        jmp	%g2
#ifdef HPV_NONSPLIT_MODE
	wrhpr	%g0, 0x4, %hpstate
#else
	wrhpr	%g0, 0x800, %hpstate
#endif
        nop
        nop

#if defined SYNC_THREADS_2 && !defined NO_SLAM_INIT_CMP
    sync_threads_2
#endif

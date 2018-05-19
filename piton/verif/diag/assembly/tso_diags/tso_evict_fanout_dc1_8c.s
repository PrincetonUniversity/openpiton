// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_evict_fanout_dc1_8c.s
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
 /**********************************************************************
 * Name:   tso_evict_fanout_dc1_8c.s
 *
 * Description: D$ invalidations caused by an evict where many
 * D$-s (of the 8 cores) need to be invalidated.
 **********************************************************************/

#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define DATA2_BASE_DATA_ADDR      0x960000
#define DATA2_BASE_DATA_ADDR_RA   0x100960000

#define USER_PAGE_CUSTOM_MAP

#define data_base_reg1	  		%o1
#define data_base_reg2	  		%o2

#define my_id_reg	  		%l1
#define test_reg	  		%l2
#define counter_reg	  		%l3
#define tmp1	  			%l4
#define tmp2	  			%l5
#define tmp3	  			%l6

#define ITERATIONS 	  		0x1

#include "boot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main
main:

        set     ITERATIONS,	counter_reg 
	add	%g0, 0x100, my_id_reg

th_fork(th_main,%l0)

th_main_0:
        add     my_id_reg, 0x00, my_id_reg	! this is my ID address
	ba	go; nop
th_main_1:
        add     my_id_reg, 0x04, my_id_reg
	ba	go; nop
th_main_2:
        add     my_id_reg, 0x08, my_id_reg
	ba	go; nop
th_main_3:
        add     my_id_reg, 0x0c, my_id_reg
	ba	go; nop
th_main_4:
        add     my_id_reg, 0x10, my_id_reg
	ba	go; nop
th_main_5:
        add     my_id_reg, 0x14, my_id_reg
	ba	go; nop
th_main_6:
        add     my_id_reg, 0x18, my_id_reg
	ba	go; nop
th_main_7:
        add     my_id_reg, 0x1c, my_id_reg
	ba	go; nop
th_main_8:
        add     my_id_reg, 0x20, my_id_reg
	ba	go; nop
th_main_9:
        add     my_id_reg, 0x24, my_id_reg
	ba	go; nop
th_main_10:
        add     my_id_reg, 0x28, my_id_reg
	ba	go; nop
th_main_11:
        add     my_id_reg, 0x2c, my_id_reg
	ba	go; nop
th_main_12:
        add     my_id_reg, 0x30, my_id_reg
	ba	go; nop
th_main_13:
        add     my_id_reg, 0x34, my_id_reg
	ba	go; nop
th_main_14:
        add     my_id_reg, 0x38, my_id_reg
	ba	go; nop
th_main_15:
        add     my_id_reg, 0x3c, my_id_reg
	ba	go; nop
th_main_16:
        add     my_id_reg, 0x40, my_id_reg
	ba	go; nop
th_main_17:
        add     my_id_reg, 0x44, my_id_reg
	ba	go; nop
th_main_18:
        add     my_id_reg, 0x48, my_id_reg
	ba	go; nop
th_main_19:
        add     my_id_reg, 0x4c, my_id_reg
	ba	go; nop
th_main_20:
        add     my_id_reg, 0x50, my_id_reg
	ba	go; nop
th_main_21:
        add     my_id_reg, 0x54, my_id_reg
	ba	go; nop
th_main_22:
        add     my_id_reg, 0x58, my_id_reg
	ba	go; nop
th_main_23:
        add     my_id_reg, 0x5c, my_id_reg
	ba	go; nop
th_main_24:
        add     my_id_reg, 0x60, my_id_reg
	ba	go; nop
th_main_25:
        add     my_id_reg, 0x64, my_id_reg
	ba	go; nop
th_main_26:
        add     my_id_reg, 0x68, my_id_reg
	ba	go; nop
th_main_27:
        add     my_id_reg, 0x6c, my_id_reg
	ba	go; nop
th_main_28:
        add     my_id_reg, 0x70, my_id_reg
	ba	go; nop
th_main_29:
        add     my_id_reg, 0x74, my_id_reg
	ba	go; nop
th_main_30:
        add     my_id_reg, 0x78, my_id_reg
	ba	go; nop
th_main_31:
        add     my_id_reg, 0x7c, my_id_reg
	ba	go; nop

go:
	setx    protected_area,	%l0, data_base_reg1	! the data area
	setx    protected_area2,%l0, data_base_reg2	! the data area2

loop:
	ld 	[data_base_reg1], test_reg		! read the data area
#ifdef EVICT4
        ld      [data_base_reg1 + 0x10], test_reg       ! read the data area
        ld      [data_base_reg1 + 0x20], test_reg       ! read the data area
        ld      [data_base_reg1 + 0x30], test_reg       ! read the data area
#endif
#ifdef EVICT3
        ld      [data_base_reg1 + 0x20], test_reg       ! read the data area
        ld      [data_base_reg1 + 0x30], test_reg       ! read the data area
#endif
#ifdef EVICT2
        ld      [data_base_reg1 + 0x30], test_reg       ! read the data area
#endif

        set     barrier_code,%i0			! all thread meet here
        jmpl    %i0,%o7
        nop 

	sub	my_id_reg, 0x100, tmp1			! thread 0 executes
	brz	tmp1,  evict				! an evicting load
	nop
goon:							! proceed or end
	dec	counter_reg
	brz	counter_reg, good_end
	nop
	ba	loop
	nop

evict:							! this aliases
	ba	goon					! data area and thus
	ld 	[data_base_reg2], test_reg		! evicts

!--------------------------------------------------------------------------

barrier_code:
	setx	barrier_data, tmp1, tmp2
bloop1:							! lock the barrier count
	mov	my_id_reg, tmp1
	cas	[tmp2], %g0, tmp1
	brnz	tmp1, bloop1
#ifdef PREFETCH
	prefetch [tmp2], #n_reads
#else
	nop
#endif

	ld	[tmp2 + 4], tmp3			! increment
	inc	tmp3
	st	tmp3, [tmp2 + 4]

	st	%g0, [tmp2]				! unlock
bloop2: 
        ld      [tmp2 + 4], tmp3
        brz     tmp3, bout2				! barrier already reset
        sub     tmp3, THREAD_COUNT, tmp3                ! subtract THREAD_COUNT
        brnz    tmp3, bloop2                            ! if 0 we are out.
#ifdef PREFETCH
	prefetch [tmp2], #n_reads
#else
	nop
#endif
        
        st      %g0, [tmp2 + 4]                         ! clear the barrier counter
bout2:
        jmpl    %o7+8, %g0                              ! return
        nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

	.data
.global protected_area
protected_area:
	.word	0xbee1
	.skip 0x1000
	.word	0xbee1
	
SECTION .DATA2  DATA_VA=0x960000

attr_data {
        Name = .DATA2,
        VA=DATA2_BASE_DATA_ADDR,
        RA=DATA2_BASE_DATA_ADDR_RA,
        PA=ra2pa(DATA2_BASE_DATA_ADDR_RA,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global protected_area2
protected_area2:
	.word	0xbee2
	.skip 0x400
.global barrier_data
barrier_data:
	.word	0x0
	.word	0x0
.end

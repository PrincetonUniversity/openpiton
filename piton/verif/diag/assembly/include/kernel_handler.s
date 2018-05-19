// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: kernel_handler.s
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
.global kernel_syscall
kernel_syscall:
	! save globals
	stx	%g1, [%g7+8]
	stx	%g2, [%g7+16]
	stx	%g3, [%g7+24]
	stx	%g4, [%g7+32]
	stx	%g5, [%g7+40]
	stx	%g6, [%g7+48]

	setx	syscall_jmptab, %g1, %g2
	sllx	%o1, 3, %g1
	add	%g2, %g1, %g2	! %g2 = ptr into jump table based on call #
	ldx	[%g2], %g1
	jmp	%g1

kernel_sysret:
	! restore globals
	ldx	[%g7+8], %g1
	ldx	[%g7+16], %g2
	ldx	[%g7+24], %g3
	ldx	[%g7+32], %g4
	ldx	[%g7+40], %g5
	ldx	[%g7+48], %g6

	ta	T_SYSRET
	nop

! %o2 = size in bytes
! %o3 = alignment in bytes (has to be power of 2)
! %o4 = returned pointer
kernel_memalign:
	setx	heapptr, %g1, %g2
	ldx	[%g2], %g1	! %g1 = heapptr
	mov	%o3, %g3
	sub	%g3, 1, %g3	! alignment mask
	and	%g3, %g1, %g4
	brz	%g4, align_done
	not	%g3
	and	%g3, %g1, %g1
	add	%g1, %o3, %g1
align_done:
	mov	%g1, %o4
	add	%g1, %o2, %g1
	ba	kernel_sysret
	stx	%g1, [%g2]
	
kernel_printhex:
	ba	kernel_sysret	! $EV trig_pc_d(1,expr(@VA(.KERNEL.kernel_printhex), 16, 16)) -> printhex("diagprinthex", %o2)
	nop
	
kernel_printdec:
	ba	kernel_sysret	! $EV trig_pc_d(1,expr(@VA(.KERNEL.kernel_printdec), 16, 16)) -> printdec("diagprintdec", %o2)
	nop

.data
syscall_jmptab:
	.xword	0x0000000000000000
	.xword	kernel_memalign
	.xword	kernel_printhex
	.xword	kernel_printdec

heapptr:
	.xword	0x0000000000000000

start_label_list:
#if defined(USER_PAGE_CUSTOM_MAP) || !defined(USER_TEXT_MT_MAP)
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
#else
changequote([, ])dnl
	foreachbit([i], 128, M4_user_data_mask, [
	.xword	[main]i
])dnl
changequote(`,')dnl'
#endif

.align 512
user_globals:


SECTION .USER_HEAP        DATA_VA=0x68020000
changequote([, ])dnl
forloop([i], 0, 7, [	
ifdef([part_]i[_used],[
attr_data {
        Name = .USER_HEAP,
        RA = 0x0178020000,
        PA = ra2pa2(0x0178020000,i),
        [part_]i[_d_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
        [part_]i[_d_ctx_nonzero_ps0_tsb_csm],
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1,       TTE_Context=0x44, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
        TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
        TTE_E=0,      TTE_P=1,        TTE_W=1
        }

.data
.global user_heap_start
user_heap_start:
])dnl
])dnl
changequote(`,')dnl'

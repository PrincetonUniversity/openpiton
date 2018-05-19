// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: RF_8win_macros.h
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
/* @(#)RF_8win_macros.h	1.2 01/18/94						*/
/****************************************************************************
 * RF_8win_macros.h - include file for V9_regfile.s	
 * Following are definitions and macros used in register file
 * diagnostics.
*****************************************************************************/

/* Macros */

!----------------------------------------------------------------------
! These macros read out a block of registers by using store inst

#define read_locals(reg)		\
		st	%l0, [reg];	\
		st	%l1, [reg];	\
		st	%l2, [reg];	\
		st	%l3, [reg];	\
		st	%l4, [reg];	\
		st	%l5, [reg];	\
		st	%l6, [reg];	\
		st	%l7, [reg]

#define read_globals(reg)		\
		st	%g0, [reg];	\
		st	%g1, [reg];	\
		st	%g2, [reg];	\
		st	%g3, [reg];	\
		st	%g4, [reg];	\
		st	%g5, [reg];	\
		st	%g6, [reg];	\
		st	%g7, [reg]

#define read_ins(reg)		\
		st	%i0, [reg];	\
		st	%i1, [reg];	\
		st	%i2, [reg];	\
		st	%i3, [reg];	\
		st	%i4, [reg];	\
		st	%i5, [reg];	\
		st	%i6, [reg];	\
		st	%i7, [reg]

#define read_outs(reg)		\
		st	%o0, [reg];	\
		st	%o1, [reg];	\
		st	%o2, [reg];	\
		st	%o3, [reg];	\
		st	%o4, [reg];	\
		st	%o5, [reg];	\
		st	%o6, [reg];	\
		st	%o7, [reg]

!----------------------------------------------------------------------
! This macro loads a register file block from memory

#define load_local_block(addr)		\
		ldd	[addr], %l0;	\
		ldd	[addr + 8], %l2;	\
		ldd	[addr + 16], %l4;	\
		ldd	[addr + 24], %l6;	\

#define load_global_block(addr)		\
		ldd	[addr], %g0;	\
		ldd	[addr + 8], %g2;	\
		ldd	[addr + 16], %g4;	\
		ldd	[addr + 24], %g6;	\

#define load_out_block(addr)		\
		ldd	[addr], %o0;	\
		ldd	[addr + 8], %o2;	\
		ldd	[addr + 16], %o4;	\
		ldd	[addr + 24], %o6;	\

#define load_in_block(addr)		\
		ldd	[addr], %i0;	\
		ldd	[addr + 8], %i2;	\
		ldd	[addr + 16], %i4;	\
		ldd	[addr + 24], %i6;	\

!----------------------------------------------------------------------
! This macro loads up all of the visible registers including globals
! from the address supplied in the "reg".  %g1 is assumed to be
! this register.  This will not map in a block.  

#define ld_no_incr_mapped(reg)		\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;	\
		wrpr %l1,%l2,%canrestore;	\
		load_out_block(reg);	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		load_in_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_block(reg);	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore	%g0, %g0, %g0;	\
		ldd	[reg + 8], %g2;	\
		ldd	[reg + 16], %g4;	\
		ldd	[reg + 24], %g6;	\
		ldd	[reg], %g0


!----------------------------------------------------------------------
! This macro does the read out of the specified register by
! doing stores 

#define read_em_out(reg)		\
		st	reg, [%l0];	\
		or	reg, reg, %g1;	\
		ld	[%l0],%l1;	\
		cmp	%l1,%g1;	\
		tne	%icc,BAD_TRAP;	\
		st	%g1, [%l0];	\
		and	reg, reg, %g1;	\
		st	%g1, [%l0]

!-------------------------------------------------------------------
! These macros read all of the registers out in a block
! Because of the way Read_em_out works, %g1 must be the first one
! that is read out using these macros (otherwise it will get clobbered)

#define read_locals_out()		\
		read_em_out(%l0);	\
		read_em_out(%l1);	\
		read_em_out(%l2);	\
		read_em_out(%l3);	\
		read_em_out(%l4);	\
		read_em_out(%l5);	\
		read_em_out(%l6);	\
		read_em_out(%l7)

#define read_outs_out()			\
		read_em_out(%o0);	\
		read_em_out(%o1);	\
		read_em_out(%o2);	\
		read_em_out(%o3);	\
		read_em_out(%o4);	\
		read_em_out(%o5);	\
		read_em_out(%o6);	\
		read_em_out(%o7)

#define read_ins_out()			\
		read_em_out(%i0);	\
		read_em_out(%i1);	\
		read_em_out(%i2);	\
		read_em_out(%i3);	\
		read_em_out(%i4);	\
		read_em_out(%i5);	\
		read_em_out(%i6);	\
		read_em_out(%i7)

#define read_globals_out()		\
		read_em_out(%g1);	\
		read_em_out(%g0);	\
		read_em_out(%g2);	\
		read_em_out(%g3);	\
		read_em_out(%g4);	\
		read_em_out(%g5);	\
		read_em_out(%g6);	\
		read_em_out(%g7)

!----------------------------------------------------------------------
! This macro reads out the entire register file (except for any
! blocks that are mapped out).  read the globals out first

#define read_em_all()			\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		read_globals_out();	\
                read_outs_out();	\
                read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		read_ins_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		read_locals_out();	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0

!----------------------------------------------------------------------
! These macros load up registers with the cumulative sum of the two
! specified registers.

#define load_local_sum(reg1, reg2)		\
		mov	reg1, %l0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l1;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l2;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l3;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l4;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l5;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l6;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l7;		\
		add	reg1, reg2, reg1

#define load_global_sum(reg1, reg2)		\
		mov	reg1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g1;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g2;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g3;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g4;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g5;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g6;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g7;		\
		add	reg1, reg2, reg1

#define load_in_sum(reg1, reg2)		\
		mov	reg1, %i0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i1;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i2;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i3;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i4;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i5;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i6;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i7;		\
		add	reg1, reg2, reg1

#define load_out_sum(reg1, reg2)		\
		mov	reg1, %o0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o1;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o2;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o3;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o4;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o5;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o6;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o7;		\
		add	reg1, reg2, reg1

! same as above 4 macros but also forces a read immediately
! after the write

#define load_local_sum_read(reg1, reg2)		\
		mov	reg1, %l0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l1;		\
		add	reg1, reg2, reg1;	\
		add	%l0, %l0, %g0;		\
		mov	reg1, %l2;		\
		add	%l1, %l1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l3;		\
		add	%l2, %l2, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l4;		\
		add	%l3, %l3, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l5;		\
		add	%l4, %l4, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l6;		\
		add	%l5, %l5, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %l7;		\
		add	%l6, %l6, %g0;		\
		add	reg1, reg2, reg1;	\
		nop;				\
		add	%l7, %l7, %g0


#define load_global_sum_read(reg1, reg2)	\
		mov	reg1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g1;		\
		add	reg1, reg2, reg1;	\
		add	%g0, %g0, %g0;		\
		mov	reg1, %g2;		\
		add	%g1, %g1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g3;		\
		add	%g2, %g2, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g4;		\
		add	%g3, %g3, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g5;		\
		add	%g4, %g4, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g6;		\
		add	%g5, %g5, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %g7;		\
		add	%g6, %g6, %g0;		\
		add	reg1, reg2, reg1;	\
		nop;				\
		add	%g7, %g7, %g0

#define load_in_sum_read(reg1, reg2)		\
		mov	reg1, %i0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i1;		\
		add	reg1, reg2, reg1;	\
		add	%i0, %i0, %g0;		\
		mov	reg1, %i2;		\
		add	%i1, %i1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i3;		\
		add	%i2, %i2, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i4;		\
		add	%i3, %i3, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i5;		\
		add	%i4, %i4, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i6;		\
		add	%i5, %i5, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %i7;		\
		add	%i6, %i6, %g0;		\
		add	reg1, reg2, reg1;	\
		nop;				\
		add	%i7, %i7, %g0

#define load_out_sum_read(reg1, reg2)		\
		mov	reg1, %o0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o1;		\
		add	reg1, reg2, reg1;	\
		add	%o0, %o0, %g0;		\
		mov	reg1, %o2;		\
		add	%o1, %o1, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o3;		\
		add	%o2, %o2, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o4;		\
		add	%o3, %o3, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o5;		\
		add	%o4, %o4, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o6;		\
		add	%o5, %o5, %g0;		\
		add	reg1, reg2, reg1;	\
		mov	reg1, %o7;		\
		add	%o6, %o6, %g0;		\
		add	reg1, reg2, reg1;	\
		nop;				\
		add	%o7, %o7, %g0

!----------------------------------------------------------------------
! This macro loads up all the visible registers (including globals)
! using a accumulating sum.  

#define ld_sum_mapped(accum, incr, dum1)	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		mov	accum, %l0;		\
		mov	incr, %l1;		\
		mov	dum1, %l2;		\
		load_global_sum(accum, incr);	\
		mov	%l0, accum;		\
		mov	%l1, incr;		\
		mov	%l2, dum1;		\
		load_out_sum(accum, incr);	\
		load_local_sum(accum, incr);	\
		load_in_sum(accum, incr);	\
		set	6, dum1;		\
	3:	mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_sum(accum, incr);	\
		load_in_sum(accum, incr);	\
		subcc	dum1, 1, dum1;		\
		bne	3b;			\
		nop;				\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_sum(accum, incr)

! Same as above, but uses the macros that cause a read to
! the just written register

#define ld_sum_mapped_read(accum, incr, dum1)	\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr	%l1,%l2,%canrestore;	\
		mov	accum, %l0;		\
		mov	incr, %l1;		\
		mov	dum1, %l2;		\
		load_global_sum_read(accum, incr);	\
		mov	%l0, accum;		\
		mov	%l1, incr;		\
		mov	%l2, dum1;		\
		load_out_sum_read(accum, incr);	\
		load_local_sum_read(accum, incr);	\
		load_in_sum_read(accum, incr);	\
		set	6, dum1;		\
	3:	mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_sum_read(accum, incr);	\
		load_in_sum_read(accum, incr);	\
		subcc	dum1, 1, dum1;		\
		bne	3b;			\
		nop;				\
		mov	0x1,%l1;		\
		mov	0x2,%l2;		\
		wrpr %l1,%l2,%cansave;		\
		wrpr %l1,%l2,%canrestore;	\
		restore %g0, %g0, %g0;	\
		load_local_sum_read(accum, incr)

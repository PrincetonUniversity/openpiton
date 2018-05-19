// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: libc.s
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
#include "defines.h"

!--------------------------------------------------------------------------
! tso diags related definitions
!--------------------------------------------------------------------------
#define LOCK_TIMEOUT            0x100
#define ENTRY(a)                .align 32; .global a; a:


!--------------------------------------------------------------------------

.section .text
	
       .align 4
       .global pass
pass:
        ta  T_GOOD_TRAP
        nop

       .align 4
       .global fail
fail:
        ta T_BAD_TRAP
        nop

	.align 4
	.global memalign
memalign:
	save    %sp, -192, %sp

	mov	1,   %o1
	mov	%i0, %o3
	mov	%i1, %o2
	ta	T_SYSCALL
	nop
	mov	%o4, %o0

        ret
        restore %g0, %o0, %o0

	.align 4
	.global printf
printf:
	ldx	[%o0], %g0
simics_printf:
	nop
	retl
	nop
	
        .align 4
        .global exit
exit:
        cmp     %o0, 0
        bne     exitfail
        nop
        call    pass, 0
        nop
exitfail:
        call    fail, 0
        nop

!--------------------------------------------------------------------------
! tso diags related library functions
!--------------------------------------------------------------------------
!--------------------------------------------------------------------------
!       Acquire a lock using ldstub - spins using ldub until lock is free
!       status = mplock(addr, owner, timeout, timecount)
!	Note: timecount is not used any more.
!	Note: simplfied for pre-silicon env purposes.
!--------------------------------------------------------------------------
ENTRY(mplock)
        save    %sp, -0xc0, %sp
1:
        ldstub  [%i0], %l1              ! try to acquire lock
        tst     %l1                     ! did we get it?
        bne     2f                      ! no, branch
        nop
        stb     %i1, [%i0+1]            ! got lock, set owner field
        ret                             ! return success
        restore %g0, 0, %o0
2:                                      ! didn't get lock
        mov     %i2, %l2           	! set timeout limit
3:               
        ldub    [%i0], %l1              ! read lock value
        tst     %l1                     ! is it free?
        beq     1b                      ! yes, branch

        subcc   %l2, 1, %l2             ! timecount expired? 
        bne     3b                      ! no, branch
	nop

        ret                             ! timeout occurred
        restore %g0, 1, %o0  		! return failure

!--------------------------------------------------------------------------
!       Acquire a lock using ldstub - spins using ldub until lock is free
!       status = mplockcasx(addr, owner, timeout, timecount)
!       Note: timecount is not used any more.
!       Note: simplfied for pre-silicon env purposes.
!--------------------------------------------------------------------------
ENTRY(mplockcasx)
        save    %sp, -0xc0, %sp
4:
	add	%i1, 0x100, %l1
	casx    [%i0], %g0, %l1		! try to get lock

        tst     %l1                     ! did we get it?
        bne     5f                      ! no, branch
        nop
        stx     %i1, [%i0+8]            ! got lock, set owner field
        ret                             ! return success
        restore %g0, 0, %o0
5:                                      ! didn't get lock
        mov     %i2, %l2                ! set timeout limit
6:
        ldx    [%i0], %l1 		! read lock value
        tst     %l1                     ! is it free?
        beq     4b                      ! yes, branch

        subcc   %l2, 1, %l2             ! timecount expired?
        bne     6b                      ! no, branch
        nop

        ret                             ! timeout occurred
        restore %g0, 1, %o0             ! return failure


!--------------------------------------------------------------------------
!       Load a dowbleword
!       data1 = loadd(&data2, addr)
!--------------------------------------------------------------------------
ENTRY(loadd)
        mov     %o0, %o2
        ldd     [%o1], %o0
        retl
        st      %o1, [%o2]

!--------------------------------------------------------------------------
!       Load an extended word
!       data = loadx(addr)
!--------------------------------------------------------------------------
ENTRY(loadx)
        retl
        ldx     [%o0], %o0

!--------------------------------------------------------------------------
!       Load a halfword (short), one byte a time
!       data = loadh_by_bytes(addr)
!--------------------------------------------------------------------------
ENTRY(loadh_by_bytes)
        ldub    [%o0], %o1
        sll     %o1, 8, %o1
        ldub    [%o0+1], %o0
        retl
        or      %o1, %o0, %o0

!--------------------------------------------------------------------------
!       Load a word, 1 byte at a time
!       data = loadw_by_bytes(addr)
!--------------------------------------------------------------------------
ENTRY(loadw_by_bytes)
        ldub    [%o0+3], %o4
        ldub    [%o0+2], %o3
        sll     %o3, 8, %o3
        or      %o3, %o4, %o4
        ldub    [%o0+1], %o2
        sll     %o2, 16, %o2
        or      %o2, %o4, %o4
        ldub    [%o0], %o1
        sll     %o1, 24, %o1
        retl
        or      %o1, %o4, %o0

!--------------------------------------------------------------------------
!       Load a dowbleword, 1 byte at a time
!       data1 = loadd_by_bytes(&data2, addr)
!--------------------------------------------------------------------------
ENTRY(loadd_by_bytes)
        save    %sp, -0xc0, %sp
        ldub    [%i1+3], %o0
        ldub    [%i1+2], %o3
        sll     %o3, 8, %o3
        or      %o3, %o0, %o0
        ldub    [%i1+1], %o2
        sll     %o2, 16, %o2
        or      %o2, %o0, %o0
        ldub    [%i1], %o1
        sll     %o1, 24, %o1
        or      %o1, %o0, %o0
        ldub    [%i1+7], %l3
        ldub    [%i1+6], %l2
        sll     %l2, 8, %l2
        or      %l2, %l3, %l3
        ldub    [%i1+5], %l1
        sll     %l1, 16, %l1
        or      %l1, %l3, %l3
        ldub    [%i1+4], %l0
        sll     %l0, 24, %l0
        or      %l0, %l3, %l3
        st      %l3, [%i0]
        ret 
        restore %o0, %g0, %o0 



!--------------------------------------------------------------------------
!       Load a pointer, 1 byte at a time
!       addr = loadp_by_bytes(addr)
!--------------------------------------------------------------------------
ENTRY(loadp_by_bytes)
        save    %sp, -0xc0, %sp
        ldub    [%i0+7], %o0
        ldub    [%i0+6], %l3
        sllx    %l3, 8, %l3
        or      %l3, %o0, %o0
        ldub    [%i0+5], %l2
        sllx    %l2, 16, %l2
        or      %l2, %o0, %o0
        ldub    [%i0+4], %l1
        sllx    %l1, 24, %l1
        or      %l1, %o0, %o0
        ldub    [%i0+3], %l0
        sllx    %l0, 32, %l0
        or      %l0, %o0, %o0
        ldub    [%i0+2], %o3
        sllx    %o3, 40, %o3
        or      %o3, %o0, %o0
        ldub    [%i0+1], %o2
        sllx    %o2, 48, %o2
        or      %o2, %o0, %o0
        ldub    [%i0], %o1
        sllx    %o1, 56, %o1
        or      %o1, %o0, %o0
        ret 
        restore %o0, %g0, %o0 

!--------------------------------------------------------------------------
!       Store a block (64-bytes)
!       storeblock(addr)
!--------------------------------------------------------------------------
ENTRY(storeblock)
        retl
        stda    %f0, [%o0] 0xf0

!--------------------------------------------------------------------------
!       load a block
!       loadblock(addr)
!--------------------------------------------------------------------------
ENTRY(loadblock)
        retl
        ldda    [%o0] 0xf0, %f0

!--------------------------------------------------------------------------
!       loadb_func(addr)
!--------------------------------------------------------------------------
ENTRY(loadb_func)
        retl
        ldub    [%o0], %o0

!--------------------------------------------------------------------------
! These below were inline( functions in MSPLAIN tests...
! I made the assembly routines.
!--------------------------------------------------------------------------

!--------------------------------------------------------------------------
!       Init a lock
!       initmplock(addr)
!--------------------------------------------------------------------------
ENTRY(initmplock)
	retl
        sth     %g0, [%o0]

!--------------------------------------------------------------------------
!       unlock
!       mpunlock(addr)
!--------------------------------------------------------------------------
ENTRY(mpunlock)
	retl
        sth     %g0, [%o0]

!--------------------------------------------------------------------------
!       unlock
!       mpunlockx(addr)
!--------------------------------------------------------------------------
ENTRY(mpunlockx)
	retl
        stx     %g0, [%o0]

!--------------------------------------------------------------------------
!       Load a word
!       data = loadw(addr)
!--------------------------------------------------------------------------
ENTRY(loadw)
        retl
        ld      [%o0], %o0

!--------------------------------------------------------------------------
!       Load a halv word
!       data = loadh(addr)
!--------------------------------------------------------------------------
ENTRY(loadh)
        retl
        lduh      [%o0], %o0

!--------------------------------------------------------------------------
!       Store a byte
!       storeb(data, addr)
!--------------------------------------------------------------------------
ENTRY(storeb)
	retl
        stb     %o0, [%o1]

!--------------------------------------------------------------------------
!       Store a word (integer)
!       storew(data, addr)
!--------------------------------------------------------------------------
ENTRY(storew)
	retl
        st      %o0, [%o1]

!--------------------------------------------------------------------------
!       Store a word (integer)
!       storex(data, addr)
!--------------------------------------------------------------------------
ENTRY(storex)
	retl
        stx     %o0, [%o1]

!--------------------------------------------------------------------------
!       Store a doubleword
!       stored(data1, data2, addr)
!--------------------------------------------------------------------------
ENTRY(stored)
	retl
        std     %o0, [%o2]
 
!--------------------------------------------------------------------------
!       Swap a word
!       data = swap(data, addr)
!--------------------------------------------------------------------------
ENTRY(swap)
	retl
        swap    [%o1], %o0

!--------------------------------------------------------------------------
!       Compare and swap a word
!       data = casa(data, addr)
!--------------------------------------------------------------------------
ENTRY(casa)
	retl
        casa    [%o1] 0x80, %g0, %o0

!--------------------------------------------------------------------------
!       Store a halfword (short), 1 byte at a time
!       storeh_by_bytes(data, addr)
!--------------------------------------------------------------------------
ENTRY(storeh_by_bytes)
        stb     %o0, [%o1+1]
        srl     %o0, 8, %o2
	retl
        stb     %o2, [%o1]

!--------------------------------------------------------------------------
!       Store a word (integer), 1 byte at a time
!       storew_by_bytes(data, addr)
!--------------------------------------------------------------------------
ENTRY(storew_by_bytes)
        stb     %o0, [%o1+3]
        srl     %o0, 24, %o2
        stb     %o2, [%o1]
        srl     %o0, 16, %o3
        stb     %o3, [%o1+1]
        srl     %o0, 8, %o4
	retl
        stb     %o4, [%o1+2]

!--------------------------------------------------------------------------
!       Prefetch a line for many reads - loads into E$
!       prefetch_for_read_many(addr)
!--------------------------------------------------------------------------
ENTRY(prefetch_for_read_many)
	retl
        prefetch [%o0], 0

!--------------------------------------------------------------------------
!       Prefetch a line for one reads - loads into P$
!       prefetch_for_read_once(addr)
!--------------------------------------------------------------------------
ENTRY(prefetch_for_read_once)
	retl
        prefetch [%o0], 1

!--------------------------------------------------------------------------
!       Prefetch a line for write
!       prefetch_for_write_many(addr)
!--------------------------------------------------------------------------
ENTRY(prefetch_for_write_many)
	retl
        prefetch [%o0], 2

!--------------------------------------------------------------------------
!       Prefetch a line for write
!       prefetch_for_write_once(addr)
!--------------------------------------------------------------------------
ENTRY(prefetch_for_write_once)
	retl
        prefetch [%o0], 3


!--------------------------------------------------------------------------
!       membar_sync()
!--------------------------------------------------------------------------
ENTRY(membar_sync)
	retl
        membar	0x40

!--------------------------------------------------------------------------
!       membar_store_load()
!--------------------------------------------------------------------------
ENTRY(membar_storeload)
	retl
        membar #StoreLoad

!--------------------------------------------------------------------------
!       ldstub(addr)
!--------------------------------------------------------------------------
ENTRY(ldstub)
        retl
        ldstub  [%o0], %o0

!--------------------------------------------------------------------------
!       Load a pointer
!       addr1 = loadp(addr)
!--------------------------------------------------------------------------
ENTRY(loadp)
	retl
        ldx     [%o0], %o0

!--------------------------------------------------------------------------
!       Store a pointer
!       storep(addr1, addr)
!--------------------------------------------------------------------------
ENTRY(storep)
	retl
        stx     %o0, [%o1]

!================= end for now ============================================

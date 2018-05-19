// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ASI_LSU_DIAG_ASI42_VA10_test_3.s
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
#define  THREAD_COUNT 4
#include "boot.s"

!
!       Test D$ & I$ diag mode
!

#define	 LSU_DIAG_REG_ASI     0x42
#define	 LSU_DIAG_REG_VA      0x10
#define		LSU_DIAG_REG_DC_MASK       0x02
#define		LSU_DIAG_REG_IC_MASK       0x01
!	
#define  LSU_CONTROL_REG_ASI  0x45
#define         LSU_CONTROL_REG_DIMMU_MASK    0x0c
#define         LSU_CONTROL_REG_DMMU_MASK     0x08
#define         LSU_CONTROL_REG_IMMU_MASK     0x04
#define         LSU_CONTROL_REG_DCIC_MASK     0x03
#define         LSU_CONTROL_REG_DC_MASK       0x02
#define         LSU_CONTROL_REG_IC_MASK       0x01
!
#define  DCACHE_DATA_REG_ASI  0x46
#define  DCACHE_TAG_REG_ASI   0x47
#define  ICACHE_INST_REG_ASI  0x66
!       Address format
!               63:18   -res 0
!               17:16   way             0x00010000
!               15:13   -res 0
!               12:06   line in set     0x00001fc0,  Note this is 11:5 of PA
!               05:03   word in line    0x00000038,  Note this is  4:2 of PA
!               02:00   -res 0
!
!       Data format
!               63:35   -res 0
!               34      Valid
!               33      -res 0
!               32      parity
!               31:28   -res 0
!               27:0    Cache line tag (PA[39:12])
!
#define  ICACHE_TAG_REG_ASI   0x67
!               17:16   way             0x00010000
!               15:13   -res 0
!               12:06   line in set     0x00001fc0,  Note this is 11:5 of PA
!               05:03   -res 0
!               02:00   -res 0
!
!	
!-------------------------------------------------------------------------------------------
!
!	First part verify that use only one way in the I$ when LSU_DIAG_REG_IC_MASK is set
!		I$ is 16KB 4 Way SA so have 4KB/way
!		D$ is  8KB 4 Way SA so have 2KB/way
!
!	Put everything on a single 64KB page  (TTE_size=1)
!
!
!	    Setup:
!		Enter hyper mode
!		enable I$ & D$
!		Clear I$ ways 0-3 for the sets corresponding to Label1
!
!		As the D$ uses random replacement, only test forced placement 	
!
!		Set the LSU_DIAG_REG_IC_MASK
!		Br      Label1
!		nop
!		.align	4096	! force into the same set		
!	   Label1:			
!		Now use ASI backdook to verify that Label1 went to way 3, way 0-2 unchanged
!		exit with fail if not true
!		Br	Label2	
!		nop
!		.align	4096	! force into the same set
!	    Label2:	
!		Now use ASI backdook to verify that Label2 went to way 3, way 0-2 unchanged
!		exit with fail if not true
!		Br	Label3	
!		nop
!		.align	4096	! force into the same set
!	    Label3:	
!		Now use ASI backdook to verify that Label3 went to way 3, way 0-2 unchanged
!		exit with fail if not true
!		Clear the LSU_DIAG_REG_IC_MASK
!
!		I$ restriction ok
!
!
!
!		Now test D$
!
!		As the D$ uses random replacement, only test forced placement 
!
!		Set the LSU_DIAG_REG_DC_MASK
!
!		LDX	Data0		! should goto way 0
!		LDX	Data1		!		   1
!		LDX	Data2		!		   2
!		LDX	Data3		!		   3
!
!		Verify with D$ backdoor that data went to the correct places
!		exit with fail if not true
!
!		LDX	DATA4	
!
!		Verify with D$ backdoor that data went to way 0 and ways 1-3 are unchanged
!		exit with fail if not true
!
!
!		exit with pass	:-)
!
!
!		.align	2048			! next set offset
!	Data0	.xword	0x1111111111111111
!		.align	2048			! next set offset
!	Data1	.xword	0x2222222222222222
!		.align	2048			! next set offset
!	Data2	.xword	0x3333333333333333
!		.align	2048			! next set offset
!	Data3	.xword	0x4444444444444444
!		.align	2048			! next set offset
!	Data4	.xword	0x5555555555555555
!
!
!
!
!
!
!
!
!
!
!
!-------------------------------------------------------------------------------------------
!


.text
.global main

main:                   !  test enters here from boot in user mode

th_fork(th_main)
th_main_3:
        setx active_thread, %l1, %o5     !  the active_thread code needs to be non-cachable
        jmpl    %o5, %o7
        nop

th_main_0:
        ta      T_GOOD_TRAP
        nop

th_main_1:
        ta      T_GOOD_TRAP
        nop


th_main_2:
        ta      T_GOOD_TRAP
        nop



	
!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040010000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040010000,
        PA= ra2pa(0x0000000040010000,0),
        RA= 0x0000000040010000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size_Ptr=0, TTE_Size=1, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }

.text
.global active_thread
!
!     Setup:
!           Enter Hiper mode
!           Enable I$ & D$;
!
active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

        add     %g0,LSU_CONTROL_REG_DCIC_MASK,%l2               ! D$ + I$ enable bits
        ldxa    [%g0]LSU_CONTROL_REG_ASI,%l1
        or      %l2,%l1,%l1
        stxa    %l1,[%g0]LSU_CONTROL_REG_ASI  ! insure I$ & D$ are enabled

        setx    Label1, %l1, %o3
	
!
! I$ tags are not cleared by reset so be sure all of the tags we want to check will be clear
!	
        setx    0x00010000,%l0,%o6      ! Used to incr. way bits
        setx    0x00001fc0,%l0,%o7      ! Mask to isolate set index for Label1
	sll	%o3,1,%l0		! Adjust for 1 bit offset
        and     %o7,%l0,%i0             ! generate way 0
        add     %i0,%o6,%i1             ! generate way 1
        add     %i1,%o6,%i2             ! generate way 2
        add     %i2,%o6,%i3             ! generate way 3
	
	stxa	%g0,[%i0]ICACHE_TAG_REG_ASI	! insure tag for way 0 is clear
	stxa	%g0,[%i1]ICACHE_TAG_REG_ASI	! insure tag for way 1 is clear
	stxa	%g0,[%i2]ICACHE_TAG_REG_ASI	! insure tag for way 2 is clear
	stxa	%g0,[%i3]ICACHE_TAG_REG_ASI	! insure tag for way 3 is clear

!	Set the LSU_DIAG_REG_IC_MASK

	or	%g0,LSU_DIAG_REG_VA,%l0
	or	%g0,LSU_DIAG_REG_IC_MASK,%l1
	ldxa	[%l0]LSU_DIAG_REG_ASI,%l2
	or	%l1,%l2,%l3
	stxa	%l3,[%l0]LSU_DIAG_REG_ASI

	ba	Label1
	xor	%g1,%g1,%g1		! clear error code register
	

!       Data format returned by ldxa  ICACHE_TAG_REG_ASI
!               63:35   -res 0
!               34      Valid	(should be 1)
!               33      -res 0
!               32      parity  (forced to 1 prior to compare)
!               31:28   -res 0
!               27:0    Cache line tag (PA[39:12])
!

	.align  4096
Label1:
	or	%g0,0x101,%l0
	sllx	%l0,32,%l0			! setup to set P & V bits
	setx    Label1, %l1, %l4
	srlx	%l4,12,%l4			! PA to 29:12
	or	%l0,%l4,%l4			! Build expected tag value
	
	
	ldxa	[%i0]ICACHE_TAG_REG_ASI,%l0	! get way 0 tag
	ldxa	[%i1]ICACHE_TAG_REG_ASI,%l1	! get way 1 tag
	ldxa	[%i2]ICACHE_TAG_REG_ASI,%l2	! get way 2 tag
	ldxa	[%i3]ICACHE_TAG_REG_ASI,%l3	! get way 3 tag


	cmp	%l0,%l4				! verify we didn't use way 0
	be	test_fail
	add	%g1,1,%g1			! fail code = 1
	cmp	%l1,%l4				! verify we didn't use way 1
	be	test_fail
	add	%g1,1,%g1			! fail code = 2
	cmp	%l2,%l4				! verify we didn't use way 2
	be	test_fail
	add	%g1,1,%g1			! fail code = 3
	cmp	%l3,%l4				! verify we did use way 3
	bne	test_fail
	add	%g1,1,%g1			! fail code = 4
	ba	Label2
	nop


	.align  4096
Label2:
	add	%l4,1,%l4			! next 4KB page

	ldxa	[%i0]ICACHE_TAG_REG_ASI,%l0	! get way 0 tag
	ldxa	[%i1]ICACHE_TAG_REG_ASI,%l1	! get way 1 tag
	ldxa	[%i2]ICACHE_TAG_REG_ASI,%l2	! get way 2 tag
	ldxa	[%i3]ICACHE_TAG_REG_ASI,%l3	! get way 3 tag


	cmp	%l0,%l4				! verify we didn't use way 0
	be	test_fail
	add	%g1,1,%g1			! fail code = 5
	cmp	%l1,%l4				! verify we didn't use way 1
	be	test_fail
	add	%g1,1,%g1			! fail code = 6
	cmp	%l2,%l4				! verify we didn't use way 2
	be	test_fail
	add	%g1,1,%g1			! fail code = 7
	cmp	%l3,%l4				! verify we did use way 3
	bne	test_fail
	add	%g1,1,%g1			! fail code = 8
	ba	Label3
	nop


	.align  4096
Label3:
	add	%l4,1,%l4			! next 4KB page

	ldxa	[%i0]ICACHE_TAG_REG_ASI,%l0	! get way 0 tag
	ldxa	[%i1]ICACHE_TAG_REG_ASI,%l1	! get way 1 tag
	ldxa	[%i2]ICACHE_TAG_REG_ASI,%l2	! get way 2 tag
	ldxa	[%i3]ICACHE_TAG_REG_ASI,%l3	! get way 3 tag


	cmp	%l0,%l4				! verify we didn't use way 0
	be	test_fail
	add	%g1,1,%g1			! fail code = 9
	cmp	%l1,%l4				! verify we didn't use way 1
	be	test_fail
	add	%g1,1,%g1			! fail code = 10
	cmp	%l2,%l4				! verify we didn't use way 2
	be	test_fail
	add	%g1,1,%g1			! fail code = 11
	cmp	%l3,%l4				! verify we did use way 3
	bne	test_fail
	add	%g1,1,%g1			! fail code = 12

	
!	Set the LSU_DIAG_REG_DC_MASK
!
	or	%g0,LSU_DIAG_REG_VA,%l0
	or	%g0,LSU_DIAG_REG_DC_MASK,%l1
	ldxa	[%l0]LSU_DIAG_REG_ASI,%l2
	or	%l1,%l2,%l3
	stxa	%l3,[%l0]LSU_DIAG_REG_ASI

	setx	Data0,%l0,%i0
	setx	Data1,%l0,%i1
	setx	Data2,%l0,%i2
	setx	Data3,%l0,%i3
	setx	Data4,%l0,%i4
		
	ldx	[%i0+0],%l0			! should goto way 0
	ldx	[%i1+0],%l1			!		   1
	ldx	[%i2+0],%l2			!		   2
	ldx	[%i3+0],%l3			!		   3
!
!		Verify with D$ backdoor that data went to the correct places
!		exit with fail if not true
!
!
!	Build the expected D$ data read tag
!
	srlx	%i0,11,%i7			! build expected tag
	setx	0x1ffffff,%l7,%l6		! mask to isolate 28:0
	and	%l6,%i7,%i7
	sllx	%i7,11,%i7
	and	%i0,0x7f8,%l7			! isolate set:word
	or	%l7,%i7,%o0			! have base address for load
	add	%o0,0x800,%o1			! expected read tag for way 1
	add	%o1,0x800,%o2			! expected read tag for way 2
	add	%o2,0x800,%o3			! expected read tag for way 3
	add	%o3,0x800,%o4			! expected read tag for way 0, data 4
	
	ldxa	[%o0]DCACHE_DATA_REG_ASI,%l4	! should read data 0:	1's
	ldxa	[%o1]DCACHE_DATA_REG_ASI,%l5	!		    1:	2's
	ldxa	[%o2]DCACHE_DATA_REG_ASI,%l6	!		    2:	3's
	ldxa	[%o3]DCACHE_DATA_REG_ASI,%l7	!		    3:	4's

	cmp	%l0,%l4				! is data0 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 13
	cmp	%l1,%l5				! is data1 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 14
	cmp	%l2,%l6				! is data2 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 15
	cmp	%l3,%l7				! is data3 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 16
!
!	
	ldx	[%i4+0],%l4			! should goto way 0
!
!		Verify with D$ backdoor that data went to way 0 and ways 1-3 are unchanged
!		exit with fail if not true
!
	ldxa	[%o4]DCACHE_DATA_REG_ASI,%g4	! should read data 4:	5's, displace 1's
	
	cmp	%l4,%g4				! is data4 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 17
	cmp	%l1,%l5				! is data1 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 18
	cmp	%l2,%l6				! is data2 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 19
	cmp	%l3,%l7				! is data3 in the cache ??
	bne	test_fail
	add	%g1,1,%g1			! fail code = 20
!
!	Verify tag for way 0 has tag for Data4 and way 2 has tag for Data 2
!	
	srlx	%i4,10,%l0		! PA 39:11 -> 29:1
	add	%l0,1,%l0		! set valid bit
	and	%i4,0x7f0,%l1		! isolate bits 10:4, way is 0	
	ldxa	[%l1]DCACHE_TAG_REG_ASI,%g5	! Read tag
	setx	0x3fffffff,%g7,%l2
	and	%l2,%g5,%g5		! Clear P bit
	cmp	%g5,%l0				! check for match
	bne	test_fail
	add	%g1,1,%g1			! fail code = 21

	srlx	%i2,10,%l0		! PA 39:11 -> 29:1
	add	%l0,1,%l0		! set valid bit
	and	%i2,0x7f0,%l1		! isolate bits 10:4
	setx	0x00001000,%g7,%l2	! mask to indicate way 2
	or	%l1,%l2,%l1	
	ldxa	[%l1]DCACHE_TAG_REG_ASI,%g5	! Read tag
	setx	0x3fffffff,%g7,%l2
	and	%l2,%g5,%g5		! Clear P bit
	cmp	%g5,%l0				! check for match
	bne	test_fail
	add	%g1,1,%g1			! fail code = 21

!	
test_pass:
        ta      T_GOOD_TRAP
        nop
!
!
test_fail:
        ta      T_BAD_TRAP
        nop
!
!
	.align	8192			! D$ set 0 offset
Data0:	.xword	0x1111111111111111
	.align	2048			! next set offset
Data1:	.xword	0x2222222222222222
	.align	2048			! next set offset
Data2:	.xword	0x3333333333333333
	.align	2048			! next set offset
Data3:	.xword	0x4444444444444444
	.align	2048			! next set offset
Data4:	.xword	0x5555555555555555




	

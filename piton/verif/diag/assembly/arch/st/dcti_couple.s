// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dcti_couple.s
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
/*
 *  Description:
 * 	TEST the back-2-back control transfer instructions 
 * 
 *  Date :  Nov 9, 2001
 */

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

#define  SAM_DONE 1	
.text

.global main

main:
#if SAM_DONE
	ta	T_CHANGE_PRIV
	nop

	/*
	 * Mixed call, bcc, b and tcc 
	 */

	/*
	 ********************************************
	 * branch taken , done retry in delay slot 
	 ********************************************
 	 */
lable_0_0:
	set 	0x0, 	%l0	/* bcc , no annul */
	set 	0x0, 	%l1	/* bcc , annul */
   lable_0_1:
	nop
	nop
	nop
	nop

        /*
         * Before we switched to nucleus context, we have to
         * provide the correct TTE entries in the ITLB for this page.
         */
        ta      T_CHANGE_HPRIV
        nop

#define TAG_ACCESS1     0x0000000020010000
#define DATA_IN1        0x8000000120010003
        mov     0x0,    %l0

        setx    TAG_ACCESS1,     %l0,   %g4
        setx    DATA_IN1,       %l0,    %g5
        mov     0x30,   %g7
        stxa    %g4, [ %g7 ] 0x50
        stxa    %g5, [ %g0 ] 0x54

        ta      T_CHANGE_HPRIV
        nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_0_2, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on reg value : taken */ 
	mov	0x0,	%l3
	brz  	%l3,	lable_0_2
	done
	brz  	%l3,	lable_0_4		/* not taken */

   lable_0_2:
	nop
	nop
   lable_0_3:
	nop
	nop

	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_0_4, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on reg value : taken : retry in delay slot */ 
	set	0x0,	%l3
	brz  	%l3,	lable_0_5
	retry
	brz  	%l3,	lable_0_6		/* not taken */

   lable_0_4:
	nop
	nop
   lable_0_5:
	nop
	nop
  	
	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_0_7, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch not taken : done taken */
	mov	0x0,	%l3
	brnz	%l3,	lable_0_6	
	done		

	set	0xaaaa,	%l1
   lable_0_6:
	set	0xaabb,	%l1
	nop
   lable_0_7: 	
	set	0xbbbb,	%l1
	nop
	
	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
	mov	0x0,	%l0
        setx  lable_0_9, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch not taken : retry taken */
	mov	0x0,	%l3
	brnz	%l3,	lable_0_8	
	retry

	set	0xaaaa,	%l1
   lable_0_8:
	set	0xaabb,	%l1
	nop
   lable_0_9: 	
	set	0xbbbb,	%l1
	nop
	
lable_1_0:
	set 	0x0, 	%l0	/* bcc , no annul */
	set 	0x0, 	%l1	/* bcc , annul */
   lable_1_1:
	nop
	nop
	nop
	nop

	ta	T_CHANGE_PRIV
	nop

	/* set up window mgt regs */
	set	0x0,	%l4
	wrpr	%l4,	0x1,	%cwp
	set	0x0,	%l4
	wrpr	%l4,	0x5,	%cansave
	set	0x0,	%l4
	wrpr	%l4,	0x1,	%canrestore

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_1_2, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on cc value : taken */ 
	ba  	%icc,	lable_1_2
	done
	ba  	%icc,	lable_1_3		/* not taken */

   lable_1_2:
	nop
	nop
   lable_1_3:
	nop
	nop

	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_1_4, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on cc value : taken : retry in delay slot */ 
	set	0x0,	%l3
	ba  	%xcc,	lable_1_5
	retry
	ba  	%xcc,	lable_1_6		/* not taken */

   lable_1_4:
	nop
	nop
   lable_1_5:
	nop
	nop
  	
	set	0x0,	%l3
	set	0x0,	%g1
	setx	lable_1_6,  %l3,	%l4

	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_1_7, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch not taken : done taken */
	bn	%icc,	lable_1_6	
	done		
	ba	%icc,	lable_1_6	

	set	0xaaaa,	%l1
   lable_1_6:
	set	0xaabb,	%l1
	nop
   lable_1_7: 	
	set	0xbbbb,	%l1
	nop
	
	set	0x0,	%l3
	set	0x0,	%g1
	setx	lable_1_8,  %l3,	%l4

	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_1_9, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch not taken : retry taken */
	bn	%icc,	lable_1_8	
	retry
	bn	%xcc,	lable_1_8	

	set	0xaaaa,	%l1
   lable_1_8:
	set	0xaabb,	%l1
	nop
   lable_1_9: 	
	set	0xbbbb,	%l1
	nop
	
	/*
	 ********************************************
	 * branch not taken, annuled 
	 *	done retry in delay slot 
	 ********************************************
 	 */
lable_2_0:
	set 	0x0, 	%l0	
	set 	0x0, 	%l1
   lable_2_1:
	nop
	nop
	nop
	nop

	ta	T_CHANGE_PRIV
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_2_2, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on reg value : not taken */ 
	mov 	0x1, 	%l0	
	mov	0x1,	%l3	
	brz,a  	%l3,	lable_2_2
	done
	brz  	%l3,	lable_2_3		/* taken */

   lable_2_2:
	nop
	nop
   lable_2_3:
	nop
	nop

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_2_4, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on reg value : not taken : retry in delay slot */ 
	set	0x1,	%l3
	brz,a  	%l3,	lable_2_5
	retry
	brz  	%l3,	lable_2_4		/* taken */

   lable_2_4:
	set	0xaaaa,	%l3
	nop
   lable_2_5:
	set	0xbbbb,	%l3
	nop
  	
	/*
	 ********************************************
	 * branch not taken, annuled 
	 *	done retry in delay slot 
	 ********************************************
 	 */
lable_3_0:
	set 	0x0, 	%l0	/* bcc , no annul */
	set 	0x0, 	%l1	/* bcc , annul */
   lable_3_1:
	nop
	nop
	nop
	nop

	/* set up window mgt regs */
	set	0x0,	%l4
	wrpr	%l4,	0x1,	%cwp
	wrpr	%l4,	0x5,	%cansave
	wrpr	%l4,	0x1,	%canrestore

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_3_2, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on cc value : not taken */ 
	set	0x1,	%l3
	set	0x0,	%l2
	sub	%l3,	%l2,	%l3
	be,a  	%icc,	lable_3_2	/* not taken , annuled */
	done
	ba  	%icc,	lable_3_3		/* taken */

   lable_3_2:
	set	0x1,	%l3
   lable_3_3:
	set	0x3,	%l3

        /* set up the trap stack for done & retry instruction */
        wrpr  1, %tl
        setx  lable_3_4, %l0, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
        setx 0x1000, %g1, %g2
        wrpr %g2, %g0, %tstate

	/* branch on cc value : not taken */ 
	set	0x1,	%l3
	set	0x0,	%l2
	sub	%l3,	%l2,	%l3
	be,a  	%xcc,	lable_3_4
	retry		/* annuled */
	ba  	%xcc,	lable_3_5		/* taken */

   lable_3_4:
	set	0x1,	%l3
   lable_3_5:
	set	0xffff,	%l3
	nop

! 	/*
! 	 *****************************************8**	
! 	 *  done/retry in the delay slot
!  	 *	of 
! 	 *		CALL, JMPL, RETURN
! 	 ******************************************8*
! 	 */
! lable_4_0:
!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_1, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

! 	call	fncall_0
! 	done

! lable_4_1:
! 	ta	T_CHANGE_PRIV
! 	nop

!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_2, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

!         call    fncall_0
!         retry

! lable_4_2:
! 	ta	T_CHANGE_PRIV
! 	nop

!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_3, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

! 	set	0x0,	%l0
! 	setx	lable_4_4,	%l0, %l1	
! 	jmpl	%l1,	%g1	
! 	done
! 	ba	lable_4_3_0
! 	nop

!   lable_4_3:
! 	ba	diag_fail	/* self-checking */
! 	nop

!   lable_4_3_0:
! 	set	0xbb,	%l3

!   lable_4_4:
! 	set	0xaa,	%l3

! lable_4_5:
! 	ta	T_CHANGE_PRIV
! 	nop

!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_6, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

! 	set	0x0,	%l0
! 	setx	lable_4_7,	%l0, %l1	
! 	jmpl	%l1,	%g1	
! 	retry
! 	ba	lable_4_6_0
! 	nop

!   lable_4_6:
! 	ba 	diag_fail	/* make it self-checking */
! 	nop

!   lable_4_6_0:
! 	set	0xbb,	%l3
!   lable_4_7:
! 	set	0xaa,	%l3

! lable_4_8:
! 	ta	T_CHANGE_PRIV
! 	nop

!         set     0x0,    %l4
!         wrpr    %l4,    0x1,    %cwp
!         wrpr    %l4,    0x5,    %cansave
!         wrpr    %l4,    0x1,    %canrestore

!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_10, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

! 	set	0x0,	%l0
! 	setx	lable_4_9,	%l0, %l1	
! 	return  %l1 + 4
! 	done
! 	ba	lable_4_9_0
! 	nop

!   lable_4_10:
! 	ba	diag_fail	/* self-checking */
! 	nop

!   lable_4_9_0:
! 	set	0xbb,	%l3
!   lable_4_9:
! 	set	0xff,	%l3

! lable_4_11:
! 	ta	T_CHANGE_PRIV
! 	nop

!         set     0x0,    %l4
!         wrpr    %l4,    0x1,    %cwp
!         wrpr    %l4,    0x5,    %cansave
!         wrpr    %l4,    0x1,    %canrestore

!         /* set up the trap stack for done & retry instruction */
!         wrpr  1, %tl
!         setx  lable_4_12, %l0, %g2
!         wrpr %g2, %g0, %tpc
!         wrpr %g2, %g0, %tnpc
!         setx 0x1000, %g1, %g2
!         wrpr %g2, %g0, %tstate

! 	set	0x0,	%l0
! 	setx	lable_4_12_0,	%l0, %l1	
! 	return  %l1 + 4
! 	retry
! 	ba	lable_4_13
! 	nop

!   lable_4_12:
! 	ba	diag_fail
! 	nop

!   lable_4_12_0:
! 	set	0xbb,	%l3
!   lable_4_13:
! 	set	0xaa,	%l3
#endif

/*
 **************************************
 * 	special inst combinations 
 **************************************
 */
	call	fncall_0	
	call	fncall_1	
	call	fncall_2	
	call	fncall_3	
	call	fncall_4	
	call	fncall_5	
	call	fncall_6	
	call	fncall_7	

	set	0x0,	%l0	
	set	0x0,	%g2
	wrpr	0, %tl  ! set trap level correctly
	setx	label_5_0, %l0, %l1	
	setx	label_5_1, %l0, %l2	
	setx	label_5_2, %l0, %l3	

	jmpl	%l1,	%g2
	call	fncall_0
	jmpl	%l2,	%g2
	call	fncall_5	
	nop

label_5_0: set	0xff00,	%l0
label_5_1: set	0xff01,	%l0
label_5_2: set	0xff02,	%l0

	ta	T_CHANGE_PRIV
	nop

        set     0x0,    %l0
        wrpr    %l0,    0x5,    %cwp
        set     0x0,    %l0
        wrpr    %l0,    0x1,    %cansave
        wrpr    %l0,    0x5,    %canrestore

	set	0x0,	%l0	
	set	0x0,	%g2
	setx	label_6_0, %l0, %l1	
	setx	label_6_1, %l0, %l2	
	setx	label_6_2, %l0, %l3	
	setx	label_6_3, %l0, %l4	
	setx	label_6_4, %l0, %l5	

	return	%l1 + 4	
	call	fncall_0
	jmpl	%l4,	%g2
	call	fncall_7

label_6_0: set	0x10,	%l0
label_6_1: set	0x11,	%l0
label_6_2: set	0x12,	%l0
label_6_3: set	0x13,	%l0
label_6_4: set	0x14,	%l0

        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cwp
        set     0x0,    %l0
        wrpr    %l0,    0x6,    %cansave
        wrpr    %l0,    0x0,    %canrestore
	ta	T_CHANGE_NONPRIV
	nop

	/*
	 * braches
	 */
	set	0x6,	%l1
	set	0x6,	%l2
	set	0x6,	%l3
	set	0x6,	%l4
	set	0x6,	%l5
	set	0x6,	%l6
label_7_0: 	
	brlz	%l1,	label_7_2
label_7_1: 
	brlz	%l2,	label_7_3
label_7_2:
	brlz	%l3,	label_7_4
label_7_3:
	brlz	%l4,	label_7_5
label_7_4:
	brlz	%l5,	label_7_6
label_7_5:
	brlz	%l6,	outbr1
label_7_6:
	sub	%l1,	1, %l1
	sub	%l2,	1, %l2
	sub	%l3,	1, %l3
	sub	%l4,	1, %l4
	sub	%l5,	1, %l5
	sub	%l6,	1, %l6

	brlz	%l1,	label_7_1
	brlz	%l2,	label_7_2
	brlz	%l3,	label_7_3
	brlz	%l4,	label_7_4
	brlz	%l5,	label_7_5
	brlz	%l6,	outbr1
	nop

	ba	label_7_0
	nop

outbr1:

	/*
	 * braches with annul bit set
	 */
	set	0x6,	%l1
	set	0x6,	%l2
	set	0x6,	%l3
	set	0x6,	%l4
	set	0x6,	%l5
	set	0x6,	%l6
label_7_0_0: 	
	brlz,a	%l1,	label_7_0_2
label_7_0_1: 
	brlz,a	%l2,	label_7_0_3
label_7_0_2:
	brlz,a	%l3,	label_7_0_4
label_7_0_3:
	brlz,a	%l4,	label_7_0_5
label_7_0_4:
	brlz,a	%l5,	label_7_0_6
label_7_0_5:
	brlz,a	%l6,	outbr2
	nop
label_7_0_6:
	sub	%l1,	1, %l1
	sub	%l2,	1, %l2
	sub	%l3,	1, %l3
	sub	%l4,	1, %l4
	sub	%l5,	1, %l5
	sub	%l6,	1, %l6

	brlz	%l1,	label_7_0_1
	brlz	%l2,	label_7_0_2
	brlz	%l3,	label_7_0_3
	brlz	%l4,	label_7_0_4
	brlz	%l5,	label_7_0_5
	brlz	%l6,	outbr2
	nop

	ba	label_7_0_0
	nop

outbr2:
	bn	label_8_0
	bn	label_8_1	
	bn	label_8_2	
	bn	label_8_3	
	bn	label_8_4	
	bn	label_8_5	
	nop
label_8_0:	set     0x0,    %l1
label_8_1:	set     0x0,    %l2
label_8_2:	set     0x0,    %l3
label_8_3:	set     0x0,    %l4
label_8_4:	set     0x0,    %l5
label_8_5:	set     0x0,    %l6

outbr2_1:
	bn,a	label_8_1_0
	bn,a	label_8_1_1	
	bn,a	label_8_1_2	
	bn,a	label_8_1_3	
	bn,a	label_8_1_4	
	bn,a	label_8_1_5	
	nop
label_8_1_0:	set     0x0,    %l1
label_8_1_1:	set     0x0,    %l2
label_8_1_2:	set     0x0,    %l3
label_8_1_3:	set     0x0,    %l4
label_8_1_4:	set     0x0,    %l5
label_8_1_5:	set     0x0,    %l6

outbr3:
	ba	label_9_0
	ba	label_9_1	
	ba	label_9_2	
	ba	label_9_3	
	ba	label_9_4	
	ba	label_8_5	
	nop
label_9_0:	set     0x0,    %l1
label_9_1:	set     0x0,    %l2
label_9_2:	set     0x0,    %l3
label_9_3:	set     0x0,    %l4
label_9_4:	set     0x0,    %l5
label_9_5:	set     0x0,    %l6

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

	/*
	 *  Call routines 
 	 */	 
.global fncall_0
fncall_0:
	set	0x2,	%i2	
	retl
	nop
.global fncall_1
fncall_1:
	set	0x2,	%i2	
	retl
	nop
.global fncall_2
fncall_2:
	set	0x2,	%i2	
	retl
	nop
.global fncall_3
fncall_3:
	set	0x2,	%i2	
	retl
	nop

.global fncall_4
fncall_4:
	set	0x2,	%i2	
	retl
	nop

.global fncall_5
fncall_5:
	set	0x2,	%i2	
	retl
	nop

.global fncall_6
fncall_6:
	set	0x2,	%i2	
	retl
	nop

.global fncall_7
fncall_7:
	set	0x2,	%i2	
	retl
	nop

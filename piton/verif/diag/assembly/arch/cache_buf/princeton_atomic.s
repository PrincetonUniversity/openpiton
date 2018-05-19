// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: l2_buf.s
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
 *****************************************************
 *
 *  This diag creates a lot of ld/st/atomic instrs to cause dline/iline/l2line hits
 *  and misses
 *
 *****************************************************
 */
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif
.text


.global I_iline_hit0
.global I_iline_hit1
.global I_iline_hit2
.global I_iline_hit3
.global data_0
.global data_1
.global data_2
.global data_3
.global data_4
.global data_5
.global data_6
.global data_7
.global data_8
main:

!
!* MissQ:
!    * Partial stores/atomics without/with partial/full dependences to another
!        stores/atomics.
!    * Mix of same line misses, partial stores/atomics dependences.
!    * No-way misses: 16 misses on the same sets diff ways followed by more
!                     misses on the same set.
!    * Miss hits on writeback buffer.
!
!* FillQ:
!    * IQ hits FillQ: 2 fills in FillQ blocked by consecutive access from IQ,
!                     followed by an access hitting FillQ.
!    * Similar scenario, but 3rd of fills change FillQ priority.
!
!!!!!!!!!!!!
!  Same set hits and misses for D cache
!  No-way misses: 16 misses on the same sets diff ways followed by more
!  Jump to locations 1KB apart to hit the same index (<9:4>)
!!!!!!!!!!!!

! CHange priv level since to be able to run casxa
!
  ta T_CHANGE_PRIV

atomic0:
! CAS with no data in L1D
  setx data, %l7, %l0
  setx 0x5091baa9, %l7, %l1
  setx 0x11111111, %l7, %l2
  casa  [%l0] 0x80, %l1, %l2
  setx 0x9f373ce2, %l7, %l1
  casa  [%l0] 0x80, %l1, %l2

! successful CAS with data in L1D, does it invalidate? YES
  addx %l0, 0x8, %l0
  lduw [%l0], %l1
  setx 0x22222222, %l7, %l2
  casa  [%l0] 0x80, %l1, %l2
  lduw [%l0], %l1 ! L1D should be taking a miss
  setx 0x33333333, %l7, %l2
  casa  [%l0] 0x80, %l1, %l2
!
! failing CAS with data in L1D, does it invalidate? NO
  addx %l0, 0x8, %l0
  lduw [%l0], %l2
  setx 0x45674567, %l7, %l2
  casa  [%l0] 0x80, %l1, %l2
  !addx %l0, 0x8, %l0
  lduw [%l0], %l1 ! L1D should be taking a miss
  setx 0x56785678, %l7, %l2
  casa  [%l0] 0x80, %l1, %l2

! ldst noncached
  setuw 0x6789, %l1
  ldstub  [%l0], %l1

! ldst cached
  ldub [%l0], %l1
  setuw 0x1234, %l1
  ldstub  [%l0], %l1

! ldst cached
  ldub [%l0], %l1
  add %l1, 1, %l1
  setuw 0x2345, %l1
  ldstub  [%l0], %l1

! ldst cached
  ldub [%l0], %l1
  add %l1, 1, %l1
  setuw 0x3456, %l1
  ldstuba  [%l0] 0x80, %l1

! ldst cached
  ldub [%l0], %l1
  add %l1, 1, %l1
  setuw 0x4567, %l1
  ldstuba  [%l0] 0x80, %l1
  !std %l1, [%l0]

! ldst cached
  ldub [%l0], %l1
  add %l1, 1, %l1
  setuw 0x4567, %l1
  ldstuba  [%l0] 0x80, %l1

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xc001dea1,     %l0
        ta      T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta      T_BAD_TRAP
        nop
        nop
.data
data:
               .word 0x5091baa9
               .word 0x9f373ce2
               .word 0x968f01b6
               .word 0xd6c8de06
               .word 0xd0e2b9
               .word 0x9d0907cc
               .word 0xfbb01793
               .word 0x32440704

data_1:
               .word 0x50894776
               .word 0x874168dd
               .word 0xe14a3c75
               .word 0xb9935f75
               .word 0x4bc03e67
               .word 0xdc709d05
               .word 0x8d7462f7
               .word 0x9c5acdc3

data_2:
               .word 0x5f34dbd8
               .word 0xdb45b8fd
               .word 0x9d604778
               .word 0xc36a8bf7
               .word 0xafbc95a9
               .word 0xe2ba758b
               .word 0x9835810f
               .word 0x623097a3

data_3:
               .word 0xd046bf61
               .word 0xcd78fc04
               .word 0x50d82dbb
               .word 0xeef6bc02
               .word 0xc2933389
               .word 0x4d337712
               .word 0xe2f1adde
               .word 0x1ef49a5d

data_4:
               .word 0xf299be37
               .word 0x77dd6bb7
               .word 0xe20522ec
               .word 0x41cf54af
               .word 0x66651ce8
               .word 0x99331e91
               .word 0x87c0a55f
               .word 0x4596be8c

data_5:
               .word 0xb4fda793
               .word 0x5efb895f
               .word 0x9c5765ee
               .word 0x52ea383e
               .word 0xdc2cf6fa
               .word 0xd235a4c3
               .word 0x37c02dfd
               .word 0x3eed9830

data_6:
               .word 0xafa51c42
               .word 0x7b2a0a49
               .word 0xc876f356
               .word 0x9858c68f
               .word 0x21ab3dc6
               .word 0x66632a7
               .word 0x6b177319
               .word 0x4c72ef2d

data_7:
               .word 0xe70ead27
               .word 0xc536d446
               .word 0x291207f1
               .word 0x62746da9
               .word 0x2332caa7
               .word 0x398b2601
               .word 0x3b1b2f88
               .word 0x15d8d7cd

data_8:
               .word 0x9e8349b7
               .word 0x4b830a2c
               .word 0xb109733c
               .word 0x4cdcca36
               .word 0x1f0faacd
               .word 0xda8665d7
               .word 0x9bdca812
               .word 0x8df95b3a

data_9:
               .word 0x7983fe7b
               .word 0xa4e42852
               .word 0xf2e4b9ea
               .word 0xd7e95805
               .word 0xd58245bd
               .word 0x53dbc6f4
               .word 0x49ad75f4
               .word 0x29e2b005

.align 64
data_10:
               .word 0xfcc10392
               .word 0x2edc3118
               .word 0x1cb80862
               .word 0xcf70b288
               .word 0xc588d3cd
               .word 0x2bef8068
               .word 0x662215f
               .word 0x3b0202a2

data_11:
               .word 0x38741b2c
               .word 0xe4fae95d
               .word 0xcee5f53f
               .word 0x1e076554
               .word 0xc3f124a9
               .word 0x4deeb005
               .word 0xb15d8bf7
               .word 0x9baecde9

data_12:
               .word 0x7384010
               .word 0xc77a2507
               .word 0xbf6713ce
               .word 0xae184ca3
               .word 0xaf6cb5d1
               .word 0x8093eee4
               .word 0x5caf2b54
               .word 0xc398c397

data_13:
               .word 0xd5b8a417
               .word 0xb767237f
               .word 0xe6815693
               .word 0x47885d5
               .word 0xe1a11918
               .word 0xc439f5df
               .word 0xc0ce1384
               .word 0xc7da44cb

data_14:
               .word 0x58d0feae
               .word 0x66eafc32
               .word 0xe51941c4
               .word 0x5258efea
               .word 0x426eab26
               .word 0x4dee5214
               .word 0x57bad187
               .word 0xc0b16a89

data_15:
               .word 0xf0f92b58
               .word 0x7c841b11
               .word 0x7006edcc
               .word 0xd6b73c0a
               .word 0x8fe799f7
               .word 0x19762968
               .word 0xf79215d2
               .word 0x8d219e3a

data_16:
               .word 0xbb16182a
               .word 0x5042cd11
               .word 0xcf18d9ca
               .word 0x89b08dfd
               .word 0x82b13b5b
               .word 0x98770f01
               .word 0xfbda2ecd
               .word 0xf2ffc22a

data_17:
               .word 0x780a044e
               .word 0xba5adcac
               .word 0xe9ae8e10
               .word 0x3657acb3
               .word 0xf3c9b374
               .word 0xd935e7cb
               .word 0xec155355
               .word 0xa82aea09

data_18:
               .word 0x859e0e80
               .word 0x429c3e5f
               .word 0xee150ea4
               .word 0x59f0c2be
               .word 0xdebeb3a
               .word 0x9b9ddef5
               .word 0x1562bd3a
               .word 0xe7f3a36b

data_19:
               .word 0x1c9f1394
               .word 0xa0a4cd2a
               .word 0x5c0f1dc2
               .word 0x59b4aed3
               .word 0xe20bd6fa
               .word 0x2f816a71
               .word 0xbc3893c2
               .word 0xd5f3ce48

.align 8192

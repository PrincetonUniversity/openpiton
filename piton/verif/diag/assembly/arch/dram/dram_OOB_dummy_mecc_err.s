// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_OOB_dummy_mecc_err.s
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
/***********************************************************************
 * Name:    dram_OOB_mecc_err.s
 * Date:    July 24, 2003
 *
 *  Description: Out of bound access, which would cause the MECC error
 *               and generate a trap.
 *
 *
 *  
 *
 **********************************************************************/
#define H_HT0_Data_access_error_0x32 My_Data_Access_Exception
#define H_HT0_Reserved_0x78 My_Data_Access_Exception1
#define TRAP_TYPE_32 0x32
#define TRAP_TYPE_78 0x78

#define MAIN_PAGE_HV_ALSO

#include "boot.s"
#include "my_intr_handlers.s"

.text
.global main
.global My_Data_Access_Exception
.global My_Data_Access_Exception1

#include "err_defines.h"

main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV


  setx  0x9700000280, %l0, %l1
  setx  0xfe00000000000000, %l0, %l2
  setx  0x1000, %l0, %l6
  setx  page1, %l0, %l3
  setx  0x0200000000000000, %l0, %l7   ! MECC error indication 0x280 dram reg

  ! wr 1 to clear the error status registers

  stx   %l2, [%l1]           ! channel 0
  add   %l1, %l6, %l0
  stx   %l2, [%l0]           ! channel 1
  add   %l0, %l6, %l0
  stx   %l2, [%l0]           ! channel 2
  add   %l0, %l6, %l0
  stx   %l2, [%l0]           ! channel 3


  add    %g0, 0x4, %l4        ! loop count 4

  ! read back the last written register
  ldx   [%l1], %l0
  ! wait
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;

  mov    1, %l5
  sllx   %l5, 39, %l5        ! to mask bit 39 for 
  not    %l5

        wr      %g0,0x4,%fprs


        setx    float_data,%l0,%g1

        ldd     [%g1],%f0
        ldd     [%g1],%f2
        ldd     [%g1],%f4
        ldd     [%g1],%f6
        ldd     [%g1],%f8
        ldd     [%g1],%f10
        ldd     [%g1],%f12
        ldd     [%g1],%f14
        ldd     [%g1],%f16
        ldd     [%g1],%f18
        ldd     [%g1],%f20
        ldd     [%g1],%f22
        ldd     [%g1],%f24
        ldd     [%g1],%f26
        ldd     [%g1],%f28
        ldd     [%g1],%f30

loop01:


  stda    %f0, [%l3]ASI_BLK_P
  add     %l3,0xa00,%l4
  stda    %f0, [%l4]ASI_BLK_P
  add     %l3,0x100,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f0, [%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x200,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f16,[%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x300,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f0, [%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x400,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f16,[%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x500,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f0, [%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x600,%l4
  stxa    %l4,[%l4]ASI_BLK_INIT_ST_QUAD_LDD_P
  stda    %f16,[%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
  add     %l3,0x700,%l4
  stda    %f0, [%l4]ASI_BLOCK_AS_IF_USER_PRIMARY


  !ldx   [%l3], %l0

  nop
  nop
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  !cmp  %o0, TRAP_TYPE_32
  !bne   test_fail
  !nop

  ldx  [%l1], %l0
  ! UPDATE THIS
  cmp %l0, %l7
  bne test_fail

  sllx  %l3, 1, %l3           ! different OOB address
  add   %l3, 0x40, %l3        ! next channel for data access
  and   %l3, %l5, %l3         ! mask bit 39, to make sure its mem
  add   %l1, %l6, %l1         ! next channel, for register read

  deccc   %l4
  !bne     loop01                                  ! repeat
  !nop

  nop
  nop

  ba  test_pass   ! test passed if u are here
  nop

My_Data_Access_Exception:
  ! Read trap type register
  rdpr  %tt, %o0
  cmp  %o0, TRAP_TYPE_32
  bne   test_fail
  nop
  done

My_Data_Access_Exception1:
  ! Read trap type register, disruptive trap
  rdpr  %tt, %o0
  cmp  %o0, TRAP_TYPE_78
  bne   test_fail
  nop
  nop
  retry


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP


.data
.align 0x1fff+1

target1:
        .word   0,0,0,0
.align 1024
target2:
        .word   0,0,0,0
.align 1024
target3:
        .word   0,0,0,0
.align 1024


stop_flag:  .word 0xffffffff, 0xffffffff
float_data: .word 0x3fe80000, 0x12345678


#define PAGE1_ADDR 0x2200180000
#define PAGE1_ADDR_RA 0x2200180000

SECTION .PAGE1 DATA_VA=PAGE1_ADDR
attr_data {
        Name = .PAGE1,
        VA=PAGE1_ADDR, PA=ra2pa(PAGE1_ADDR_RA,0), RA=PAGE1_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=1, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1

page1  :        .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x111111111111111a
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x111111111111111a
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a9abcdef0
                .xword   0x1111111111111111
                .xword   0x0a0a0a0a76547654
                .skip    256
                .skip    256
                .skip    256
                .skip    256
                .skip    16777216


.end


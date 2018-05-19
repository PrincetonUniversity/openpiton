// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_subroutines.s
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
sub_set_sei_en:
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x1, %l2
  sllx  %l2, SEI_EN, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI
  ret
  restore

sub_set_sei_sshot:
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x1, %l2
  sllx  %l2, SEI_SSHOT, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI
  ret
  restore

sub_inject_sei_error:
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x1, %l2
  sllx  %l2, %i0, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI
  ret
  restore

sub_set_see_ceen:
  ldxa  [%g0] ASI_SEE, %l1
  mov   0x1, %l2
  sllx  %l2, SEE_CEEN, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEE
  ret
  restore

sub_set_see_nceen:
  ldxa  [%g0] ASI_SEE, %l1
  mov   0x1, %l2
  sllx  %l2, SEE_NCEEN, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEE
  ret
  restore

sub_check_sparc_error_status:

  ! Form expected value
  setx  SES_INIT_VALUE, %l2, %l1
  sllx  %i0, 29, %i0
  or    %l1, %i0, %l1
  mov   0x1, %l2
  sllx  %l2, %i1, %l2
  or    %l1, %l2, %l1

  ! Read Sparc Error Status Register
  ldxa  [%g0] ASI_SES, %l0

  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ret
  restore

sub_check_sparc_error_address:

  ! Read Sparc Error Address Register
  ldxa  [%g0] ASI_SEA, %l0

  ! Mask out unnecessary bits
  and   %l0, %i1, %l0

  ! Compare with expected value
  cmp   %l0, %i0
  bne   %xcc, test_fail
  nop

  ret
  restore


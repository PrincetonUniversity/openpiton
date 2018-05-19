// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_int_ops.s
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

!! Use private tag overflow and div by zero trap handlers
#define H_T0_Tag_Overflow 
#define My_T0_Tag_Overflow set 0x4893fca1, %l3; done; nop                        
                  
#define H_T0_Division_By_Zero 
#define My_T0_Division_By_Zero set 0x1f349abc, %o4; done; nop
        

                
#include "boot.s"
.global main

.text
.global diag_pass               

main:
/*
 *****************************************************
 *
 *  This diag will test all the corner cases for integer
 *   ops
 *****************************************************
 */

!!----------------------------------------------------
!! Category 1:  ALU ops
!!======================
!!      1) All ALU ops set ccs correctly        
!!              -ADD/SUB overflow occurs
!!              -SUB sets cc.c on borrow
!!              -Tagged ops set ccs correctly               
!!      2) Carry bit for addc/subc is icc.c not xcc.c
!!      3) Tagged ops generate tag_overflow trap correctly
!!      4) Tag_overflow trap prevents ccs and rd from being written
!!      5) MULS
!!              a) Bit shifted into r[rs1][31] is correct
!!              b) If LSB of Y=1 rs2 is added otherwise zero is added
!!              c) Integer CCs are updated
!!              d) Y is shifted right with LSB of rs1 shifted in
!!----------------------------------------------------
!!----------------------------------------------------
!! Catagory 2:  Shift ops
!!========================
!!      1) 32 bit shift op is given a shift count greater than 31
!!      2) 64 bit shift op is given a shift count greater than 64
!!      3) shift count can be either immediate or from reg
!!      4) SRL zeroes out upper 32 bits
!!      5) SRA sign extends to upper 32 bits
!!      6) SRA by zero converts 32 bit to 64 bit number
!!      7) SRAX sign extends, SRLX inserts zero        
!!----------------------------------------------------
!!----------------------------------------------------
!! Category 3:  MUL/DIV ops
!!===========================
!!      1) SDIVX: Largest negative number/-1 = Largest negative number
!!      2) SDIV(X) and UDIV(X) give different results when
!!              dividing by -1
!!      3) create all three types of 32 bit div ovfl
!!      4) YREG is used on all 32 bit divs
!!      5) condition codes get set correctly for DIV
!!      6) 32 bit divs extend the lower 32 bits of result to 64 bits
!!      7) UDIV and SDIV only use lower 32 bits of input 2 (sign or zero extended)
!!      8) UDIV and SDIV round inexact quotient toward zero
!!      9) All 4 divs can cause division by zero trap
!!      10) SMUL and UMUL only use lower 32 bits of inputs (sign or zero extended)
!!      11) SMUL and UMUL write upper 32 bits of product to YREG
!!      12) MUL sets ccs correctly        
!!----------------------------------------------------

!!----------------------------------------------------
!! Category 1:  ALU ops
!!======================
!!      1) All ALU ops set ccs correctly   

!!      N and Z have 2 classes:  adder and logic                     
!!      a) xcc.z = 1, icc.z = 1
        taddcc %r0, %r0, %r1
        andcc %g0, 5, %g2        
!!      b) xcc.z = 0, icc.z = 1
        set 0xbeeffeed, %r3
        sllx %r3, 32, %r3
        taddcc %r3, 0, %r4
        andcc %r3, %r3, %g5
!!      c) xcc.z = 0, icc.z = 0
        taddcc %r3, 1, %g4
        orcc %r3, 1, %g5                
!!      d) xcc.n = 0, icc.n = 1        
        set 0x80000000, %g3
        srl %g3, 0, %g3 !! clear upper 32 bits
        orcc %g3, %g0, %g3
        taddcc %g3, %g0, %g3
!!      e) xcc.n = 1, icc.n = 0
        sllx %g3, 32, %g3
        orcc %g3, %g0, %g3
        taddcc %g3, %g0, %g3
        
!!      Only add and sub can set C or V
!!      f) xcc.c = 0, icc.c = 1
        set 0x80000000, %g3
        srl %g3, 0, %g3 !! clear upper 32 bits
        addcc %g3, %g3, %g4
        subcc %g4, 1, %g6
        taddcc %g3, %g3, %g7
        tsubcc %g4, 1, %r8
!!      g) xcc.c = 1, icc.c = 0
        sllx %g3, 32, %g3
        addcc %g3, %g3, %g6
        subcc %g0, %g4, %g5
        taddcc %g3, %g3, %g6
        tsubcc %g0, %g4, %g5
!!      g) xcc.v = 0, icc.v = 1
        set 0x80000000, %g3
        srl %g3, 0, %g3 !! clear upper 32 bits
        taddcc %g3, %g3, %g4
        subcc %g3, 1, %g5
!!      h) xcc.v = 1, icc.v = 0
        sllx %g3, 32, %g3
        taddcc %g3, %g3, %g6
        tsubcc %g3, %g4, %g7
!!      i) tagged overflow (either bit0 or bit1 of either operand)
        taddcc %r0, 1, %r1
        taddcc %r0, 2, %r2
        mov 5, %r2
        tsubcc %r2, 4, %r5
        mov 6, %r2
        tsubcc %r2, 4, %r5

!!      2) Carry bit for addc/subc is icc.c not xcc.c
        set 0x80000000, %g3
        srl %g3, 0, %g3 !! clear upper 32 bits
        addcc %g3, %g3, %g4
        addc %g0, %g0, %g1
 
!!      3) Tagged ops generate tag_overflow trap correctly
!!      4) Tag_overflow trap prevents ccs and rd from being written
        taddcctv %g0, %g0, %g1 !! dont trap if no overflow
        taddcctv %g0, 1, %g1 !! trap from tag overflow
        tsubcctv %g0, -8, %g2 !! dont trap
        set 0x80000000, %g3
        tsubcctv %g3, 4, %g3 !! trap from normal sub overflow
                                      
!!      5) MULS
!!              a) Bit shifted into r[rs1][31] is correct
        wr %g0, 0, %y !! clear y reg
        !! set ccr to verify that the bit is icc.n ^ icc.v
        wr %g0, 0, %ccr
time_mulscc_start:
        mulscc %g0, 0, %g1
time_mulscc_end:	
        wr %g0, 2, %ccr
        mulscc %g0, 0, %g1
        wr %g0, 4, %ccr
        mulscc %g0, 0, %g1
        wr %g0, 0xa, %ccr
        mulscc %g0, 0, %g1
!!              b) If LSB of Y=1 rs2 is added otherwise zero is added
        set 0x8, %g2
        wr %g0, 0, %y
        mulscc %g2, 5, %g1
        wr %g0, 1, %y
        mulscc %g2, 5, %g1
!!              c) Integer CCs are updated
        !! icc.z
        wr %g0, 0, %ccr
        mulscc %g0, 0, %g1
        mulscc %g0, 1, %g1
        !! icc.n
        mulscc %g0, 0, %g1
        wr %g0, 2, %ccr
        mulscc %g0, 0, %g1
        !! icc.c, icc.v (v = 0, c = 0 already done)
        set 0x80000000, %g2
        mulscc %g0, %g2, %g3                                   
!!              d) Y is shifted right with LSB of rs1 shifted in
        set 0xdeadbeef, %g5
        wr %g5, 0, %y
        set 1, %g2
        mulscc %g2, 0, %g3
        set 2, %g2
        mulscc %g2, 0, %g3
        rd %y, %g7

!!----------------------------------------------------
!! Catagory 2:  Shift ops
!!========================
!!      1) 32 bit shift op is given a shift count greater than 31
        set 0xfeedbeef, %g1
        set 33, %l5
        sll %g1, %l5, %g2
!!      2) 64 bit shift op is given a shift count greater than 64 
        set 70, %l5
        sllx %g1, %l5, %g2        
!!      3) shift count can be either immediate or from reg
        set 5, %g2
        sll %g1, %g2, %g3
!!      4) SRL zeroes out upper 32 bits
        sll %g1, 5, %g3
        srl %g3, 1, %g4
!!      5) SRA sign extends to upper 32 bits
        sra %g3, 1, %g4
!!      6) SRA by zero converts 32 bit to 64 bit number
        srl %g1, 0, %g4
        sra %g1, 0, %g5                
!!      7) SRAX sign extends, SRLX inserts zero        
        set 0xfeedbeef, %g1
        sllx %g1, 32, %g2
        srlx %g2, 3, %g3
        srax %g2, 3, %g4 !! 1 extend
        srax %g3, 3, %g4 !! 0 extend
        
!!----------------------------------------------------
!! Category 3:  MUL/DIV ops
!!===========================
        wr %g0, 0, %y   !! clear yreg
!!      1) SDIVX: Largest negative number/-1 = Largest negative number
        setx 0x8000000000000000, %g2, %g1
time_sdivx_start:
        sdivx %g1, -1, %g2
time_sdivx_end:
!!      2) SDIV(X) and UDIV(X) give different results when
!!              dividing by -1
        set 0xfeedcaca, %g2
time_sdiv_start:
        sdiv %g2, -1, %g3
time_sdiv_end:
        udiv %g2, -1, %g3
        sllx %g2, 15, %g2
        sdivx %g2, -1, %g3
        udivx %g2, -1, %g3        
!!      3) create all three types of 32 bit div ovfl (check ovfl cc at same time)
        wr %g0, 5, %y
        udivcc %g0, 1, %g2
        sdivcc %g0, 1, %g2
        sdivcc %g0, -1, %g2       
!!      4) YREG is used on all 32 bit divs
        wr %g0, 1, %y
time_udiv_start:
        udiv %g0, 4, %g2
time_udiv_end:
        sdiv %g0, -4, %g2
!!      5) condition codes get set correctly for DIV
!!              for udiv xcc.n, v, c , icc.c always zero
!!              for sdiv xcc.v,c icc.c always zero 
!!              all .n and .v caught by overflow tests               
        wr %g0, 0, %y
        set 2, %g1
!!      test .z (icc.z always = xcc.z)       
        udivcc %g1, 3, %g3 !! set icc.z, xcc.z
        sdivcc %g1, 3, %g3
        udivcc %g1, 1, %g3 !! dont set .z
        sdivcc %g1, 1, %g3
!!      6) 32 bit divs extend the lower 32 bits of result to 64 bits
        wr %g0, 1, %y
        sdiv %g0, 2, %g1 !! should cause sign extension
        sdiv %g0, 4, %g1 !! no sign extension
        udiv %g0, 2, %g1
        udiv %g0, 4, %g1
!!      7) UDIV and SDIV only use lower 32 bits of input 2 (sign or zero extended)
        setx 0xdeadbeeffeedcaca, %g1, %g2
        udiv %g2, %g2, %g3
        sdiv %g2, %g2, %g3
        setx 0xdeadbeef0eedcada, %g1, %g2
        udiv %g2, %g2, %g3
        sdiv %g2, %g2, %g3
!!      8) UDIV and SDIV round inexact quotient toward zero
        set 5, %g2
        udiv %g2, 2, %g3
        sdiv %g2, 2, %g3
        sdiv %g2, -2, %g3
                
!!      9) All 3 divs can cause division by zero trap
        set 0xdeadbeef, %g5
        sdivcc %g5, %g0, %g6                       
        udivcc %g5, %g0, %g6
        sdivx %g5, %g0, %g6                       
        udivx %g5, %g0, %g6
        
!!      10) SMUL and UMUL only use lower 32 bits of inputs (sign or zero extended)
        setx 0xdeadbeeffeedcaca, %g1, %g2
        umul %g2, %g2, %g3
        smul %g2, %g2, %g3
        setx 0xdeadbeef0eedcada, %g1, %g2
        umul %g2, %g2, %g3
        smul %g2, %g2, %g3
!!      11) SMUL and UMUL write upper 32 bits of product to YREG
        wr %g0, 0, %y !! clear YREG
        set 0xdeadbeef, %g1
time_umul_start:
        umul %g1, 8, %g2
time_umul_end:
        rd %y, %g2
time_smul_start:
        smul %g1, 8, %g2
time_smul_end:	
        rd %y, %g2
!!      12) MUL sets ccs correctly        
!!      test xcc.z (icc.n, xcc.n = 0)
        umulcc %g0, 25, %g1
        smulcc %g0, 25, %g1
!!      test icc.z
        set 0x80000000, %g1
        umulcc %g1, 2, %g2 !! icc.z = 1
        smulcc %g1, 2, %g2        
        umulcc %g1, 1, %g2 !! icc.z = 0, icc.n = 1
        smulcc %g1, 1, %g2 !! xcc.n = 1
                                                     
/*
 ********************************
 *      Diag PASSED             *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

__PERL__

use strict;
use TRELoad 'AnalyzeDiag';

verbose(0);

my $dir = '.';

my $analyzer = AnalyzeDiag::Analyzer->new(dir => $dir);

tie my %values, 'Tie::IxHash';
%values =
  (
   mulscc =>
   {
    pretty_name => 'mulscc (multiply step)',
    expect      => 7,
    tolerance   => 0,
   },
   umul =>
   {
    pretty_name => 'umul (unsgnd 32b mul)',
    expect      => 11,
    tolerance   => 0,
   },
   smul =>
   {
    pretty_name => 'smul (sgnd 32b mul)',
    expect      => 11,
    tolerance   => 0,
   },
   sdivx =>
   {
    pretty_name => "sdivx (sgnd 64b div)",
    expect      => 72,
    tolerance   => 0,
   },
   sdiv =>
   {
    pretty_name => "sdiv (sgnd 32b div)",
    expect      => 72,
    tolerance   => 0,
   },
   udiv =>
   {
    pretty_name => "udiv (unsgnd 32b div)",
    expect      => 72,
    tolerance   => 0,
   }

  );

my @measures;
foreach my $value (keys %values) {
  push @measures, AnalyzeDiag::Measurement->new(name => $value,
						start => "time_${value}_start",
						end => "time_${value}_end",
					       );
}

$analyzer->add_measurements(@measures);

my %results = $analyzer->analyze();

foreach my $value (keys %values) {
  diag_ok(exists $results{$value}, "Found results for '$value'\n");


  if(exists $results{$value}) {

    # Compute average
    my $total = 0;
    foreach my $elem (@{$results{$value}}) {
      $total += $elem;
    }
    $total /= @{$results{$value}};
    $total = sprintf "%0.2f", $total;

    # Test vs expected
    if(exists $values{$value}{expect}) {
      my $tol =
	exists $values{$value}{tolerance} ? $values{$value}{tolerance} : 0;

      my $pretty_name = exists $values{$value}{pretty_name} ?
	$values{$value}{pretty_name} : $value;

      diag_is_numeric($total, $values{$value}{expect},
		      "$pretty_name", $tol);
    }

  }

}

script_exit;

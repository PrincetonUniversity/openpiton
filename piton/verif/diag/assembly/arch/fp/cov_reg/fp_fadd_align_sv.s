// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_fadd_align_sv.s
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
********************************************************************************
   random seed:	157348632
   Jal fpu_mix_6.j:	
********************************************************************************/

#define T0_Fp_exception_ieee_754 H_T0_Fp_exception_ieee_754_0x21
#define T0_Fp_exception_other    H_T0_Fp_exception_other_0x22

#define ENABLE_T0_Fp_disabled_0x20

#include "enable_traps.h"
#include "boot.s"


.text
.global main
.global T0_Fp_exception_ieee_754
.global T0_Fp_exception_other


main:

	wr    %g0, 0x7, %fprs
        setx  fsr_tem_en, %l0, %l3  
        ld    [%l3+0x0], %fsr 
        setx  data_region0, %g1, %r8



	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62

	faddd	%f0, %f2,  %f62
        faddd	%f0, %f4,  %f62
	faddd	%f0, %f6,  %f62
	faddd	%f0, %f8,  %f62
	faddd	%f0, %f10, %f62
	faddd	%f0, %f12, %f62
	faddd	%f0, %f14, %f62
	faddd	%f0, %f16, %f62
	faddd	%f0, %f18, %f62
        faddd	%f0, %f20, %f62
	faddd	%f0, %f22, %f62
	faddd	%f0, %f24, %f62
	faddd	%f0, %f26, %f62
	faddd	%f0, %f28, %f62
	faddd	%f0, %f30, %f62
	faddd	%f0, %f32, %f62
	faddd	%f0, %f34, %f62
	faddd	%f0, %f36, %f62
	faddd	%f0, %f38, %f62
	faddd	%f0, %f40, %f62
	faddd	%f0, %f42, %f62
	faddd	%f0, %f44, %f62
	faddd	%f0, %f46, %f62
	faddd	%f0, %f48, %f62
	faddd	%f0, %f50, %f62
	faddd	%f0, %f52, %f62
        faddd	%f0, %f54, %f62
	faddd	%f0, %f56, %f62
	faddd	%f0, %f58, %f62
	faddd	%f0, %f60, %f62


        setx  data_region1, %g1, %r8



	ldd	[%r8 + 0], %f0
	ldd	[%r8 + 8], %f2
	ldd	[%r8 + 16], %f4
	ldd	[%r8 + 24], %f6
	ldd	[%r8 + 32], %f8
	ldd	[%r8 + 40], %f10
	ldd	[%r8 + 48], %f12
	ldd	[%r8 + 56], %f14
	ldd	[%r8 + 64], %f16
	ldd	[%r8 + 72], %f18
	ldd	[%r8 + 80], %f20
	ldd	[%r8 + 88], %f22
	ldd	[%r8 + 96], %f24
	ldd	[%r8 + 104], %f26
	ldd	[%r8 + 112], %f28
	ldd	[%r8 + 120], %f30
	ldd	[%r8 + 128], %f32
	ldd	[%r8 + 136], %f34
	ldd	[%r8 + 144], %f36
	ldd	[%r8 + 152], %f38
	ldd	[%r8 + 160], %f40
	ldd	[%r8 + 168], %f42
	ldd	[%r8 + 176], %f44
	ldd	[%r8 + 184], %f46
	ldd	[%r8 + 192], %f48
	ldd	[%r8 + 200], %f50
	ldd	[%r8 + 208], %f52
	ldd	[%r8 + 216], %f54
	ldd	[%r8 + 224], %f56
	ldd	[%r8 + 232], %f58
	ldd	[%r8 + 240], %f60
	ldd	[%r8 + 248], %f62

	faddd	%f0, %f2,  %f62
        faddd	%f0, %f4,  %f62
	faddd	%f0, %f6,  %f62
	faddd	%f0, %f8,  %f62
	faddd	%f0, %f10, %f62
	faddd	%f0, %f12, %f62
	faddd	%f0, %f14, %f62
	faddd	%f0, %f16, %f62
	faddd	%f0, %f18, %f62
        faddd	%f0, %f20, %f62
	faddd	%f0, %f22, %f62
	faddd	%f0, %f24, %f62
	faddd	%f0, %f26, %f62
	faddd	%f0, %f28, %f62
	faddd	%f0, %f30, %f62
	faddd	%f0, %f32, %f62
	faddd	%f0, %f34, %f62
	faddd	%f0, %f36, %f62
	faddd	%f0, %f38, %f62
	faddd	%f0, %f40, %f62
	faddd	%f0, %f42, %f62
	faddd	%f0, %f44, %f62
	faddd	%f0, %f46, %f62
	faddd	%f0, %f48, %f62
	faddd	%f0, %f50, %f62
	faddd	%f0, %f52, %f62
        faddd	%f0, %f54, %f62
	faddd	%f0, %f56, %f62
	faddd	%f0, %f58, %f62
	faddd	%f0, %f60, %f62
	
	
        .text
        ta      T_GOOD_TRAP


!=========================
        .data

.align 256
fsr_tem_en:
        .word           0x00000000      ! TEM - all disabled - rd 0
        .word           0x40000000      ! TEM - all disabled - rd 1
        .word           0x80000000      ! TEM - all disabled - rd 2
        .word           0xc0000000      ! TEM - all disabled - rd 3



.align 128
data_region0:
       .xword          0x4400000000000000      ! 1.0                                
       .xword          0x4000000000000001      ! 0.0                                        
       .xword          0x4010000000000001      ! -1.0    
       .xword          0x4020000000000001      ! -1.0    
       .xword          0x4030000000000001      ! -1.0    
	      .xword          0x4040000000000001      ! -1.0    
	      .xword          0x4050000000000001      ! -1.0    
	      .xword          0x4060000000000001      ! -1.0    
	      .xword          0x4070000000000001      ! -1.0    
	      .xword          0x4080000000000001      ! -1.0    
	      .xword          0x4090000000000001      ! -1.0    
	      .xword          0x40a0000000000001      ! -1.0    
	      .xword          0x40b0000000000001      ! -1.0    
	      .xword          0x40c0000000000001      ! -1.0    
	      .xword          0x40d0000000000001      ! -1.0    
	      .xword          0x40e0000000000001      ! -1.0    
	      .xword          0x40f0000000000001      ! -1.0    
	      .xword          0x4100000000000001      ! -1.0    
	      .xword          0x4110000000000001      ! -1.0    
	      .xword          0x4120000000000001      ! -1.0    
	      .xword          0x4130000000000001      ! -1.0    
	      .xword          0x4140000000000001      ! -1.0    
	      .xword          0x4150000000000001      ! -1.0    
	      .xword          0x4160000000000001      ! -1.0    
	      .xword          0x4170000000000001      ! -1.0    
	      .xword          0x4180000000000001      ! -1.0    
	      .xword          0x4190000000000001      ! -1.0    
	      .xword          0x41a0000000000001      ! -1.0    
	      .xword          0x41b0000000000001      ! -1.0    
	      .xword          0x41c0000000000001      ! -1.0    
	      .xword          0x41d0000000000001      ! -1.0    
	      .xword          0x41e0000000000001      ! -1.0  
		      .xword          0x41f0000000000001      ! -1.0  
		      .xword          0x4200000000000001      ! -1.0  
		      .xword          0x4210000000000001      ! -1.0  
		      .xword          0x4220000000000001      ! -1.0  
		      .xword          0x4230000000000001      ! -1.0  
		      .xword          0x4240000000000001      ! -1.0  
		      .xword          0x4250000000000001      ! -1.0  
		      .xword          0x4260000000000001      ! -1.0    
	                                    
       .xword          0x8000000000000001      ! -0.0       
	
	
data_region1:
       .xword          0x4400000000000000      ! 1.0           
		      .xword          0x4400000000000001      ! -1.0  
		      .xword          0x4200000000000001      ! -1.0  
		      .xword          0x4210000000000001      ! -1.0  
		      .xword          0x4220000000000001      ! -1.0  
		      .xword          0x4230000000000001      ! -1.0  
		      .xword          0x4240000000000001      ! -1.0  
		      .xword          0x4250000000000001      ! -1.0  
		      .xword          0x4260000000000001      ! -1.0  
	 		      .xword          0x4270000000000001      ! -1.0  
	 		      .xword          0x4280000000000001      ! -1.0
			      .xword          0x4290000000000001      ! -1.0
			      .xword          0x42a0000000000001      ! -1.0
			      .xword          0x42b0000000000001      ! -1.0
			      .xword          0x42c0000000000001      ! -1.0
			      .xword          0x42d0000000000001      ! -1.0
			      .xword          0x42f0000000000001      ! -1.0
			      .xword          0x4300000000000001      ! -1.0
			      .xword          0x4310000000000001      ! -1.0
			      .xword          0x4320000000000001      ! -1.0
			      .xword          0x4330000000000001      ! -1.0
			      .xword          0x4340000000000001      ! -1.0
			      .xword          0x4350000000000001      ! -1.0
			      .xword          0x4360000000000001      ! -1.0
			      .xword          0x4370000000000001      ! -1.0
				      .xword          0x4380000000000001      ! -1.0
				      .xword          0x4390000000000001      ! -1.0
				      .xword          0x4300000000000001      ! -1.0
				      .xword          0x43a0000000000001      ! -1.0
				      .xword          0x43b0000000000001      ! -1.0
				      .xword          0x43c0000000000001      ! -1.0
				      .xword          0x43d0000000000001      ! -1.0
				      .xword          0x43e0000000000001      ! -1.0
				      .xword          0x43f0000000000001      ! -1.0
					      .xword          0x4400000000000001      ! -1.0
					      .xword          0x4410000000000001      ! -1.0
					      .xword          0x4420000000000001      ! -1.0
					      .xword          0x4430000000000001      ! -1.0
	
	
	
	                                    
       .xword          0x8000000000000001      ! -0.0                                       


.end


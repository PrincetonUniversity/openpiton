// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: traps.s
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

#define NORMAL_TRAP(n) mov n, %g7; b TrapCheck;  nop;nop;nop;nop;nop;nop
#define SPILL_TRAP(n) saved; mov n, %g7; b TrapCheck;  nop;
#define FILL_TRAP(n) restored; mov n, %g7; b TrapCheck;  nop;

#define CUSTOM_TRAP(n) setx n, %g1, %g2; jmp %g2; nop

#define CORRECTED_ECC_ERROR_TRAP(n) retry; nop;nop;nop;nop;nop;nop;nop;

				
.text

T0_Reserved_0x00:		
#ifdef H_T0_Reserved_0x00
#ifdef SUN_H_T0_Reserved_0x00
	 SUN_H_T0_Reserved_0x00 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

T0_Reserved_0x01:		
#ifdef H_T0_Reserved_0x01
#ifdef SUN_H_T0_Reserved_0x01
	 SUN_H_T0_Reserved_0x01 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T0_Reserved_0x02:		
#ifdef H_T0_Reserved_0x02
#ifdef SUN_H_T0_Reserved_0x02
	 SUN_H_T0_Reserved_0x02 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x02)
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

T0_Reserved_0x03:		
#ifdef H_T0_Reserved_0x03
#ifdef SUN_H_T0_Reserved_0x03
	 SUN_H_T0_Reserved_0x03 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

T0_Reserved_0x04:		
#ifdef H_T0_Reserved_0x04
#ifdef SUN_H_T0_Reserved_0x04
	 SUN_H_T0_Reserved_0x04 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

T0_Reserved_0x05:		
#ifdef H_T0_Reserved_0x05
#ifdef SUN_H_T0_Reserved_0x05
	 SUN_H_T0_Reserved_0x05 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

T0_Reserved_0x06:		
#ifdef H_T0_Reserved_0x06
#ifdef SUN_H_T0_Reserved_0x06
	 SUN_H_T0_Reserved_0x06 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

T0_Reserved_0x07:		
#ifdef H_T0_Reserved_0x07
#ifdef SUN_H_T0_Reserved_0x07
	 SUN_H_T0_Reserved_0x07 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

T0_Instruction_Access_Exception_0x08:
#ifdef H_T0_Instruction_access_exception_0x08
#ifdef SUN_H_T0_Instruction_access_exception_0x08
	 SUN_H_T0_Instruction_access_exception_0x08 
#else
#	ifdef My_T0_Instruction_access_exception_0x08
		My_T0_Instruction_access_exception_0x08
#	else
		CUSTOM_TRAP(H_T0_Instruction_access_exception_0x08)
#	endif
#endif
.align 32	
#else	
	NORMAL_TRAP(0x08); 
#endif

T0_Reserved_0x09:		
#ifdef H_T0_Reserved_0x09
#ifdef SUN_H_T0_Reserved_0x09
	 SUN_H_T0_Reserved_0x09 
#else
	CUSTOM_TRAP(H_T0_Reserved_0x09)
#endif
.align 32	
#else	
	NORMAL_TRAP(0x09); 
#endif

T0_Instruction_Access_Error_0x0a:		
#ifdef H_T0_Instruction_access_error_0x0a
#ifdef SUN_H_T0_Instruction_access_error_0x0a
	 SUN_H_T0_Instruction_access_error_0x0a 
#else
        CUSTOM_TRAP(H_T0_Instruction_access_error_0x0a)
#endif
.align 32
#else
#ifdef ENABLE_ITLB_ERROR_TRAP
	stxa %g0, [%g0] 0x60; retry; nop; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x0a); 
#endif
#endif

T0_Reserved_0x0b:		
#ifdef H_T0_Reserved_0x0b
#ifdef SUN_H_T0_Reserved_0x0b
	 SUN_H_T0_Reserved_0x0b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

T0_Reserved_0x0c:		
#ifdef H_T0_Reserved_0x0c
#ifdef SUN_H_T0_Reserved_0x0c
	 SUN_H_T0_Reserved_0x0c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

T0_Reserved_0x0d:		
#ifdef H_T0_Reserved_0x0d
#ifdef SUN_H_T0_Reserved_0x0d
	 SUN_H_T0_Reserved_0x0d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0d)
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

T0_Reserved_0x0e:		
#ifdef H_T0_Reserved_0x0e
#ifdef SUN_H_T0_Reserved_0x0e
	 SUN_H_T0_Reserved_0x0e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

T0_Reserved_0x0f:		
#ifdef H_T0_Reserved_0x0f
#ifdef SUN_H_T0_Reserved_0x0f
	 SUN_H_T0_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

T0_Illegal_Instruction_0x10:
#ifdef H_T0_Illegal_instruction_0x10
#ifdef SUN_H_T0_Illegal_instruction_0x10
	 SUN_H_T0_Illegal_instruction_0x10 
#else
#	ifdef My_T0_Illegal_instruction_0x10
		My_T0_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_T0_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

T0_Privileged_Opcode_0x11:
#ifdef H_T0_Privileged_opcode_0x11
#ifdef SUN_H_T0_Privileged_opcode_0x11
	 SUN_H_T0_Privileged_opcode_0x11 
#else
#	ifdef My_T0_Privileged_opcode_0x11
		My_T0_Privileged_opcode_0x11
#	else
        	CUSTOM_TRAP(H_T0_Privileged_opcode_0x11)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x11)
#endif

T0_Unimplemented_LDD_0x12:
#ifdef H_T0_Unimplemented_LDD_0x12
#ifdef SUN_H_T0_Unimplemented_LDD_0x12
	 SUN_H_T0_Unimplemented_LDD_0x12 
#else
        CUSTOM_TRAP(H_T0_Unimplemented_LDD_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12)
#endif

T0_Unimplemented_STD_0x13:
#ifdef H_T0_Unimplemented_STD_0x13
#ifdef SUN_H_T0_Unimplemented_STD_0x13
	 SUN_H_T0_Unimplemented_STD_0x13 
#else
        CUSTOM_TRAP(H_T0_Unimplemented_STD_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13)
#endif

T0_Reserved_0x14:		
#ifdef H_T0_Reserved_0x14
#ifdef SUN_H_T0_Reserved_0x14
	 SUN_H_T0_Reserved_0x14 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

T0_Reserved_0x15:		
#ifdef H_T0_Reserved_0x15
#ifdef SUN_H_T0_Reserved_0x15
	 SUN_H_T0_Reserved_0x15 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

T0_Reserved_0x16:		
#ifdef H_T0_Reserved_0x16
#ifdef SUN_H_T0_Reserved_0x16
	 SUN_H_T0_Reserved_0x16 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

T0_Reserved_0x17:		
#ifdef H_T0_Reserved_0x17
#ifdef SUN_H_T0_Reserved_0x17
	 SUN_H_T0_Reserved_0x17 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

T0_Reserved_0x18:		
#ifdef H_T0_Reserved_0x18
#ifdef SUN_H_T0_Reserved_0x18
	 SUN_H_T0_Reserved_0x18 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

T0_Reserved_0x19:		
#ifdef H_T0_Reserved_0x19
#ifdef SUN_H_T0_Reserved_0x19
	 SUN_H_T0_Reserved_0x19 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

T0_Reserved_0x1a:		
#ifdef H_T0_Reserved_0x1a
#ifdef SUN_H_T0_Reserved_0x1a
	 SUN_H_T0_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

T0_Reserved_0x1b:		
#ifdef H_T0_Reserved_0x1b
#ifdef SUN_H_T0_Reserved_0x1b
	 SUN_H_T0_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

T0_Reserved_0x1c:		
#ifdef H_T0_Reserved_0x1c
#ifdef SUN_H_T0_Reserved_0x1c
	 SUN_H_T0_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

T0_Reserved_0x1d:		
#ifdef H_T0_Reserved_0x1d
#ifdef SUN_H_T0_Reserved_0x1d
	 SUN_H_T0_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

T0_Reserved_0x1e:		
#ifdef H_T0_Reserved_0x1e
#ifdef SUN_H_T0_Reserved_0x1e
	 SUN_H_T0_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

T0_Reserved_0x1f:		
#ifdef H_T0_Reserved_0x1f
#ifdef SUN_H_T0_Reserved_0x1f
	 SUN_H_T0_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

T0_Fp_Disabled_0x20:
#ifdef H_T0_Fp_disabled_0x20
#ifdef SUN_H_T0_Fp_disabled_0x20
	 SUN_H_T0_Fp_disabled_0x20 
#else
#	ifdef My_T0_Fp_disabled_0x20
		My_T0_Fp_disabled_0x20
#	else
        	CUSTOM_TRAP(H_T0_Fp_disabled_0x20)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x20)
#endif

T0_Fp_Exception_Ieee_754_0x21:		
#ifdef H_T0_Fp_exception_ieee_754_0x21
#ifdef SUN_H_T0_Fp_exception_ieee_754_0x21
	 SUN_H_T0_Fp_exception_ieee_754_0x21 
#else
        CUSTOM_TRAP(H_T0_Fp_exception_ieee_754_0x21)
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

T0_Fp_Exception_Other_0x22:		
#ifdef H_T0_Fp_exception_other_0x22
#ifdef SUN_H_T0_Fp_exception_other_0x22
	 SUN_H_T0_Fp_exception_other_0x22 
#else
#	ifdef My_T0_Fp_exception_other_0x22
		My_T0_Fp_exception_other_0x22
#	else
        CUSTOM_TRAP(H_T0_Fp_exception_other_0x22)
#endif
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

T0_Tag_Overflow_0x23:		
#ifdef H_T0_Tag_Overflow
#ifdef SUN_H_T0_Tag_Overflow
	 SUN_H_T0_Tag_Overflow 
#else
#	ifdef My_T0_Tag_Overflow
		My_T0_Tag_Overflow
#	else
		CUSTOM_TRAP(H_T0_Tag_Overflow)
#	endif
#endif
#else
	NORMAL_TRAP(0x23); 
#endif
.align	32

T0_Clean_Window_0x24:
#ifdef H_T0_Clean_Window
#ifdef SUN_H_T0_Clean_Window
	 SUN_H_T0_Clean_Window 
#else
#	ifdef My_T0_Clean_Window
		My_T0_Clean_Window
#	else
		CUSTOM_TRAP(H_T0_Clean_Window)
#	endif
#endif
#else                
#ifdef CLEAN_WIN_RETRY
	rdpr %cleanwin, %g1; add %g1,1,%g1; wrpr %g1, %g0, %cleanwin; retry;
#else
	restore; mov 0x24, %g7; b TrapCheck;  nop;nop;nop;nop;nop;
#endif
#endif
.align	128

T0_Division_By_Zero_0x28:		
#ifdef H_T0_Division_By_Zero
#ifdef SUN_H_T0_Division_By_Zero
	 SUN_H_T0_Division_By_Zero 
#else
#	ifdef My_T0_Division_By_Zero
		My_T0_Division_By_Zero
#	else
		CUSTOM_TRAP(H_T0_Division_By_Zero)
#	endif
#endif
#else
	NORMAL_TRAP(0x28); 	
#endif
.align 32	                

T0_Reserved_0x29:		
#ifdef H_T0_Reserved_0x29
#ifdef SUN_H_T0_Reserved_0x29
	 SUN_H_T0_Reserved_0x29 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

T0_Reserved_0x2a:		
#ifdef H_T0_Reserved_0x2a
#ifdef SUN_H_T0_Reserved_0x2a
	 SUN_H_T0_Reserved_0x2a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

T0_Reserved_0x2b:		
#ifdef H_T0_Reserved_0x2b
#ifdef SUN_H_T0_Reserved_0x2b
	 SUN_H_T0_Reserved_0x2b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

T0_Reserved_0x2c:		
#ifdef H_T0_Reserved_0x2c
#ifdef SUN_H_T0_Reserved_0x2c
	 SUN_H_T0_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

T0_Reserved_0x2d:		
#ifdef H_T0_Reserved_0x2d
#ifdef SUN_H_T0_Reserved_0x2d
	 SUN_H_T0_Reserved_0x2d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

T0_Reserved_0x2e:		
#ifdef H_T0_Reserved_0x2e
#ifdef SUN_H_T0_Reserved_0x2e
	 SUN_H_T0_Reserved_0x2e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

T0_Reserved_0x2f:		
#ifdef H_T0_Reserved_0x2f
#ifdef SUN_H_T0_Reserved_0x2f
	 SUN_H_T0_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

T0_Data_Access_Exception_0x30:		
#ifdef H_T0_Data_Access_Exception_0x30
#ifdef SUN_H_T0_Data_Access_Exception_0x30
	 SUN_H_T0_Data_Access_Exception_0x30 
#else

#	ifdef My_T0_Data_Access_Exception_0x30
		My_T0_Data_Access_Exception_0x30
#	else
	        CUSTOM_TRAP(H_T0_Data_Access_Exception_0x30)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x30); 
#endif

T0_Reserved_0x31:		
#ifdef H_T0_Reserved_0x31
#ifdef SUN_H_T0_Reserved_0x31
	 SUN_H_T0_Reserved_0x31 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x31)
#endif
.align 32
#else
	NORMAL_TRAP(0x31); 
#endif


T0_Data_Access_Error_0x32:		
#ifdef H_T0_Data_access_error_0x32
#ifdef SUN_H_T0_Data_access_error_0x32
	 SUN_H_T0_Data_access_error_0x32 
#else
        CUSTOM_TRAP(H_T0_Data_access_error_0x32)
#endif
.align 32
#else
#ifdef ENABLE_DTLB_ERROR_TRAP
	mov 8, %g3; stxa %g0, [%g3] 0x60; retry; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x32); 
#endif
#endif

T0_Reserved_0x33:		
#ifdef H_T0_Reserved_0x33
#ifdef SUN_H_T0_Reserved_0x33
	 SUN_H_T0_Reserved_0x33 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x33)
#endif
.align 32
#else
	NORMAL_TRAP(0x33);
#endif

T0_Mem_Address_Not_Aligned_0x34:		
#ifdef H_T0_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_T0_Mem_Address_Not_Aligned_0x34
	 SUN_H_T0_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_T0_Mem_Address_Not_Aligned_0x34
		My_T0_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_T0_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
		NORMAL_TRAP(0x34); 
#endif

T0_Lddf_Mem_Address_Not_Aligned_0x35:
#ifdef H_T0_Lddf_Mem_Address_Not_Aligned_0x35
#ifdef SUN_H_T0_Lddf_Mem_Address_Not_Aligned_0x35
	 SUN_H_T0_Lddf_Mem_Address_Not_Aligned_0x35 
#else
#	ifdef My_T0_Lddf_Mem_Address_Not_Aligned_0x35
		My_T0_Lddf_Mem_Address_Not_Aligned_0x35
#	else
		CUSTOM_TRAP(H_T0_Lddf_Mem_Address_Not_Aligned_0x35)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

T0_Stdf_Mem_Address_Not_Aligned_0x36:
#ifdef H_T0_Stdf_Mem_Address_Not_Aligned_0x36
#ifdef SUN_H_T0_Stdf_Mem_Address_Not_Aligned_0x36
	 SUN_H_T0_Stdf_Mem_Address_Not_Aligned_0x36 
#else
#	ifdef My_T0_Stdf_Mem_Address_Not_Aligned_0x36
		T0_Stdf_Mem_Address_Not_Aligned_0x36
#	else
		CUSTOM_TRAP(H_T0_Stdf_Mem_Address_Not_Aligned_0x36)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

T0_Privileged_Action_0x37:		
#ifdef H_T0_Privileged_Action_0x37
#ifdef SUN_H_T0_Privileged_Action_0x37
	 SUN_H_T0_Privileged_Action_0x37 
#else
#	ifdef My_T0_Privileged_Action_0x37
		My_T0_Privileged_Action_0x37
#	else
		CUSTOM_TRAP(H_T0_Privileged_Action_0x37)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

T0_Reserved_0x38:		
#ifdef H_T0_Reserved_0x38
#ifdef SUN_H_T0_Reserved_0x38
	 SUN_H_T0_Reserved_0x38 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

T0_Reserved_0x39:		
#ifdef H_T0_Reserved_0x39
#ifdef SUN_H_T0_Reserved_0x39
	 SUN_H_T0_Reserved_0x39 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

T0_Reserved_0x3a:		
#ifdef H_T0_Reserved_0x3a
#ifdef SUN_H_T0_Reserved_0x3a
	 SUN_H_T0_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

T0_Reserved_0x3b:		
#ifdef H_T0_Reserved_0x3b
#ifdef SUN_H_T0_Reserved_0x3b
	 SUN_H_T0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

T0_Reserved_0x3c:		
#ifdef H_T0_Reserved_0x3b
#ifdef SUN_H_T0_Reserved_0x3b
	 SUN_H_T0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3c); 
#endif

T0_Reserved_0x3d:		
#ifdef H_T0_Reserved_0x3d
#ifdef SUN_H_T0_Reserved_0x3d
	 SUN_H_T0_Reserved_0x3d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3d)
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

T0_Reserved_0x3e:		
#ifdef H_T0_Reserved_0x3e
#ifdef SUN_H_T0_Reserved_0x3e
	 SUN_H_T0_Reserved_0x3e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3e)
#endif
.align 32
#else
	NORMAL_TRAP(0x3e); 
#endif

T0_Reserved_0x3f:		
#ifdef H_T0_Reserved_0x3f
#ifdef SUN_H_T0_Reserved_0x3f
	 SUN_H_T0_Reserved_0x3f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3f)
#endif
.align 32
#else
	NORMAL_TRAP(0x3f); 
#endif

T0_Reserved_0x40:		
#ifdef H_T0_Reserved_0x40
#ifdef SUN_H_T0_Reserved_0x40
	 SUN_H_T0_Reserved_0x40 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

T0_Interrupt_Level_1_0x41:		
#ifdef H_T0_Interrupt_Level_1_0x41
#ifdef SUN_H_T0_Interrupt_Level_1_0x41
	 SUN_H_T0_Interrupt_Level_1_0x41 
#else
#	ifdef My_T0_Interrupt_Level_1_0x41
		My_T0_Interrupt_Level_1_0x41
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_1_0x41)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

T0_Interrupt_Level_2_0x42:		
#ifdef H_T0_Interrupt_Level_2_0x42
#ifdef SUN_H_T0_Interrupt_Level_2_0x42
	 SUN_H_T0_Interrupt_Level_2_0x42 
#else
#	ifdef My_T0_Interrupt_Level_2_0x42
		My_T0_Interrupt_Level_2_0x42
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_2_0x42)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

T0_Interrupt_Level_3_0x43:		
#ifdef H_T0_Interrupt_Level_3_0x43
#ifdef SUN_H_T0_Interrupt_Level_3_0x43
	 SUN_H_T0_Interrupt_Level_3_0x43 
#else
#	ifdef My_T0_Interrupt_Level_3_0x43
		My_T0_Interrupt_Level_3_0x43
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_3_0x43)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

T0_Interrupt_Level_4_0x44:		
#ifdef H_T0_Interrupt_Level_4_0x44
#ifdef SUN_H_T0_Interrupt_Level_4_0x44
	 SUN_H_T0_Interrupt_Level_4_0x44 
#else
#	ifdef My_T0_Interrupt_Level_4_0x44
		My_T0_Interrupt_Level_4_0x44
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_4_0x44)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

T0_Interrupt_Level_5_0x45:		
#ifdef H_T0_Interrupt_Level_5_0x45
#ifdef SUN_H_T0_Interrupt_Level_5_0x45
	 SUN_H_T0_Interrupt_Level_5_0x45 
#else
#	ifdef My_T0_Interrupt_Level_5_0x45
		My_T0_Interrupt_Level_5_0x45
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_5_0x45)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

T0_Interrupt_Level_6_0x46:		
#ifdef H_T0_Interrupt_Level_6_0x46
#ifdef SUN_H_T0_Interrupt_Level_6_0x46
	 SUN_H_T0_Interrupt_Level_6_0x46 
#else
#	ifdef My_T0_Interrupt_Level_6_0x46
		My_T0_Interrupt_Level_6_0x46
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_6_0x46)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

T0_Interrupt_Level_7_0x47:		
#ifdef H_T0_Interrupt_Level_7_0x47
#ifdef SUN_H_T0_Interrupt_Level_7_0x47
	 SUN_H_T0_Interrupt_Level_7_0x47 
#else
#	ifdef My_T0_Interrupt_Level_7_0x47
		My_T0_Interrupt_Level_7_0x47
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_7_0x47)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

T0_Interrupt_Level_8_0x48:		
#ifdef H_T0_Interrupt_Level_8_0x48
#ifdef SUN_H_T0_Interrupt_Level_8_0x48
	 SUN_H_T0_Interrupt_Level_8_0x48 
#else
#	ifdef My_T0_Interrupt_Level_8_0x48
		My_T0_Interrupt_Level_8_0x48
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_8_0x48)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

T0_Interrupt_Level_9_0x49:		
#ifdef H_T0_Interrupt_Level_9_0x49
#ifdef SUN_H_T0_Interrupt_Level_9_0x49
	 SUN_H_T0_Interrupt_Level_9_0x49 
#else
#	ifdef My_T0_Interrupt_Level_9_0x49
		My_T0_Interrupt_Level_9_0x49
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_9_0x49)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

T0_Interrupt_Level_10_0x4a:		
#ifdef H_T0_Interrupt_Level_10_0x4a
#ifdef SUN_H_T0_Interrupt_Level_10_0x4a
	 SUN_H_T0_Interrupt_Level_10_0x4a 
#else
#	ifdef My_T0_Interrupt_Level_10_0x4a
		My_T0_Interrupt_Level_10_0x4a
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_10_0x4a)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

T0_Interrupt_Level_11_0x4b:		
#ifdef H_T0_Interrupt_Level_11_0x4b
#ifdef SUN_H_T0_Interrupt_Level_11_0x4b
	 SUN_H_T0_Interrupt_Level_11_0x4b 
#else
#	ifdef My_T0_Interrupt_Level_11_0x4b
		My_T0_Interrupt_Level_11_0x4b
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_11_0x4b)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

T0_Interrupt_Level_12_0x4c:		
#ifdef H_T0_Interrupt_Level_12_0x4c
#ifdef SUN_H_T0_Interrupt_Level_12_0x4c
	 SUN_H_T0_Interrupt_Level_12_0x4c 
#else
#	ifdef My_T0_Interrupt_Level_12_0x4c
		My_T0_Interrupt_Level_12_0x4c
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_12_0x4c)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

T0_Interrupt_Level_13_0x4d:		
#ifdef H_T0_Interrupt_Level_13_0x4d
#ifdef SUN_H_T0_Interrupt_Level_13_0x4d
	 SUN_H_T0_Interrupt_Level_13_0x4d 
#else
#	ifdef My_T0_Interrupt_Level_13_0x4d
		My_T0_Interrupt_Level_13_0x4d
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_13_0x4d)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

T0_Interrupt_Level_14_0x4e:		
#ifdef H_T0_Interrupt_Level_14_0x4e
#ifdef SUN_H_T0_Interrupt_Level_14_0x4e
	 SUN_H_T0_Interrupt_Level_14_0x4e 
#else
#	ifdef My_T0_Interrupt_Level_14_0x4e
		My_T0_Interrupt_Level_14_0x4e
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_14_0x4e)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

T0_Interrupt_Level_15_0x4f:		
#ifdef H_T0_Interrupt_Level_15_0x4f
#ifdef SUN_H_T0_Interrupt_Level_15_0x4f
	 SUN_H_T0_Interrupt_Level_15_0x4f 
#else
#	ifdef My_T0_Interrupt_Level_15_0x4f
		My_T0_Interrupt_Level_15_0x4f
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_15_0x4f)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

T0_Reserved_0x50:		
#ifdef H_T0_Reserved_0x50
#ifdef SUN_H_T0_Reserved_0x50
	 SUN_H_T0_Reserved_0x50 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

T0_Reserved_0x51:		
#ifdef H_T0_Reserved_0x51
#ifdef SUN_H_T0_Reserved_0x51
	 SUN_H_T0_Reserved_0x51 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

T0_Reserved_0x52:		
#ifdef H_T0_Reserved_0x52
#ifdef SUN_H_T0_Reserved_0x52
	 SUN_H_T0_Reserved_0x52 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

T0_Reserved_0x53:		
#ifdef H_T0_Reserved_0x53
#ifdef SUN_H_T0_Reserved_0x53
	 SUN_H_T0_Reserved_0x53 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

T0_Reserved_0x54:		
#ifdef H_T0_Reserved_0x54
#ifdef SUN_H_T0_Reserved_0x54
	 SUN_H_T0_Reserved_0x54 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

T0_Reserved_0x55:		
#ifdef H_T0_Reserved_0x55
#ifdef SUN_H_T0_Reserved_0x55
	 SUN_H_T0_Reserved_0x55 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

T0_Reserved_0x56:		
#ifdef H_T0_Reserved_0x56
#ifdef SUN_H_T0_Reserved_0x56
	 SUN_H_T0_Reserved_0x56 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

T0_Reserved_0x57:		
#ifdef H_T0_Reserved_0x57
#ifdef SUN_H_T0_Reserved_0x57
	 SUN_H_T0_Reserved_0x57 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

T0_Reserved_0x58:		
#ifdef H_T0_Reserved_0x58
#ifdef SUN_H_T0_Reserved_0x58
	 SUN_H_T0_Reserved_0x58 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

T0_Reserved_0x59:		
#ifdef H_T0_Reserved_0x59
#ifdef SUN_H_T0_Reserved_0x59
	 SUN_H_T0_Reserved_0x59 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

T0_Reserved_0x5a:		
#ifdef H_T0_Reserved_0x5a
#ifdef SUN_H_T0_Reserved_0x5a
	 SUN_H_T0_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

T0_Reserved_0x5b:		
#ifdef H_T0_Reserved_0x5b
#ifdef SUN_H_T0_Reserved_0x5b
	 SUN_H_T0_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

T0_Reserved_0x5c:		
#ifdef H_T0_Reserved_0x5c
#ifdef SUN_H_T0_Reserved_0x5c
	 SUN_H_T0_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

T0_Reserved_0x5d:		
#ifdef H_T0_Reserved_0x5d
#ifdef SUN_H_T0_Reserved_0x5d
	 SUN_H_T0_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

T0_Reserved_0x5e:		
#ifdef H_T0_Reserved_0x5e
#ifdef SUN_H_T0_Reserved_0x5e
	 SUN_H_T0_Reserved_0x5e 
#else
#       ifdef My_T0_Reserved_0x5e
                My_T0_Reserved_0x5e
#       else
        	CUSTOM_TRAP(H_T0_Reserved_0x5e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x5e); 
#endif

T0_Reserved_0x5f:		
#ifdef H_T0_Reserved_0x5f
#ifdef SUN_H_T0_Reserved_0x5f
	 SUN_H_T0_Reserved_0x5f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5f)
#endif
.align 32
#else
	NORMAL_TRAP(0x5f); 
#endif 

T0_Interrupt_0x60:		
#ifdef H_T0_Interrupt_0x60
#ifdef SUN_H_T0_Interrupt_0x60
	 SUN_H_T0_Interrupt_0x60 
#else
#	ifdef My_T0_Interrupt_0x60
		My_T0_Interrupt_0x60
#	else
		CUSTOM_TRAP(H_T0_Interrupt_0x60)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x60); 
#endif

T0_Reserved_0x61:		
#ifdef H_T0_Reserved_0x61
#ifdef SUN_H_T0_Reserved_0x61
	 SUN_H_T0_Reserved_0x61 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x61)
#endif
.align 32
#else
	NORMAL_TRAP(0x61); 
#endif

T0_Reserved_0x62:		
#ifdef H_T0_Reserved_0x62
#ifdef SUN_H_T0_Reserved_0x62
	 SUN_H_T0_Reserved_0x62 
#else
#       ifdef My_T0_Reserved_0x62
                My_T0_Reserved_0x62
#       else    
              CUSTOM_TRAP(H_T0_Reserved_0x62)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

T0_Corrected_ECC_error_0x63:		
#ifdef H_T0_Corrected_ECC_error_0x63
#ifdef SUN_H_T0_Corrected_ECC_error_0x63
	 SUN_H_T0_Corrected_ECC_error_0x63 
#else
        CUSTOM_TRAP(H_T0_Corrected_ECC_error_0x63)
#endif
.align 32
#else
	CORRECTED_ECC_ERROR_TRAP(0x63);
#endif

T0_Fast_Instr_Access_MMU_Miss_0x64:
#ifdef H_T0_fast_instr_access_MMU_miss
#ifdef SUN_H_T0_fast_instr_access_MMU_miss
	 SUN_H_T0_fast_instr_access_MMU_miss 
#else
        CUSTOM_TRAP(H_T0_fast_instr_access_MMU_miss)
#endif
#else
#ifdef S2MEM_IMMU_MISS_HANDLER
#include S2MEM_IMMU_MISS_HANDLER
#else
#ifdef  HPV_NONSPLIT_MODE
#include "immu_miss_handler.s"
#else
nop	! immu trap is now handled in hypervisor
#endif	
#endif	
#endif

.align 128	
T0_Fast_Data_Access_MMU_Miss_0x68:
#ifdef H_T0_fast_data_access_MMU_miss
#ifdef SUN_H_T0_fast_data_access_MMU_miss
	 SUN_H_T0_fast_data_access_MMU_miss 
#else
        CUSTOM_TRAP(H_T0_fast_data_access_MMU_miss)
#endif
#else
#ifdef S2MEM_IMMU_MISS_HANDLER
#include S2MEM_IMMU_MISS_HANDLER
#else
#ifdef  HPV_NONSPLIT_MODE
#include "dmmu_miss_handler.s"
#else
nop	! dmmu trap is now handled in hypervisor
#endif	
#endif	
#endif

.align 128	
T0_Fast_Data_Access_Protection_0x6c:		
#ifdef H_T0_data_access_protection_0x6c
#ifdef SUN_H_T0_data_access_protection_0x6c
	 SUN_H_T0_data_access_protection_0x6c 
#else
        CUSTOM_TRAP(H_T0_data_access_protection_0x6c)
#endif
#else
		NORMAL_TRAP(0x6c);
#endif

.align 128	
T0_Reserved_0x70:		
#ifdef H_T0_Reserved_0x70
#ifdef SUN_H_T0_Reserved_0x70
	 SUN_H_T0_Reserved_0x70 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

T0_Reserved_0x71:		
#ifdef H_T0_Reserved_0x71
#ifdef SUN_H_T0_Reserved_0x71
	 SUN_H_T0_Reserved_0x71 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

T0_Reserved_0x72:		
#ifdef H_T0_Reserved_0x72
#ifdef SUN_H_T0_Reserved_0x72
	 SUN_H_T0_Reserved_0x72 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

T0_Reserved_0x73:		
#ifdef H_T0_Reserved_0x73
#ifdef SUN_H_T0_Reserved_0x73
	 SUN_H_T0_Reserved_0x73 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

T0_Reserved_0x74:		
#ifdef H_T0_Reserved_0x74
#ifdef SUN_H_T0_Reserved_0x74
	 SUN_H_T0_Reserved_0x74 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x74)
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

T0_Reserved_0x75:		
#ifdef H_T0_Reserved_0x75
#ifdef SUN_H_T0_Reserved_0x75
	 SUN_H_T0_Reserved_0x75 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

T0_Reserved_0x76:		
#ifdef H_T0_Reserved_0x76
#ifdef SUN_H_T0_Reserved_0x76
	 SUN_H_T0_Reserved_0x76 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

T0_Reserved_0x77:		
#ifdef H_T0_Reserved_0x77
#ifdef SUN_H_T0_Reserved_0x77
	 SUN_H_T0_Reserved_0x77 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

T0_Reserved_0x78:		
#ifdef H_T0_Reserved_0x78
#ifdef SUN_H_T0_Reserved_0x78
	 SUN_H_T0_Reserved_0x78 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

T0_Reserved_0x79:		
#ifdef H_T0_Reserved_0x79
#ifdef SUN_H_T0_Reserved_0x79
	 SUN_H_T0_Reserved_0x79 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

T0_Reserved_0x7a:		
#ifdef H_T0_Reserved_0x7a
#ifdef SUN_H_T0_Reserved_0x7a
	 SUN_H_T0_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

T0_Reserved_0x7b:		
#ifdef H_T0_Reserved_0x7b
#ifdef SUN_H_T0_Reserved_0x7b
	 SUN_H_T0_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

T0_Cpu_Mondo_Trap_0x7c:
#ifdef H_T0_Cpu_Mondo_Trap_0x7c
#ifdef SUN_H_T0_Cpu_Mondo_Trap_0x7c
	 SUN_H_T0_Cpu_Mondo_Trap_0x7c 
#else
#	ifdef My_T0_Cpu_Mondo_Trap_0x7c
		My_T0_Cpu_Mondo_Trap_0x7c
#	else	
		CUSTOM_TRAP(H_T0_Cpu_Mondo_Trap_0x7c)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

T0_Dev_Mondo_Trap_0x7d:
#ifdef H_T0_Dev_Mondo_Trap_0x7d
#ifdef SUN_H_T0_Dev_Mondo_Trap_0x7d
	 SUN_H_T0_Dev_Mondo_Trap_0x7d 
#else	
#	ifdef My_T0_Dev_Mondo_Trap_0x7d
		My_T0_Dev_Mondo_Trap_0x7d
#	else	
		CUSTOM_TRAP(H_T0_Dev_Mondo_Trap_0x7d)
#	endif	
#endif	
.align 32
#else
	NORMAL_TRAP(0x7d);
#endif

T0_Resumable_Error_0x7e:
#ifdef H_T0_Resumable_Error_0x7e
#ifdef SUN_H_T0_Resumable_Error_0x7e
	 SUN_H_T0_Resumable_Error_0x7e
#else	
#	ifdef My_T0_Resumable_Error_0x7e
		My_T0_Resumable_Error_0x7e
#	else	
		CUSTOM_TRAP(H_T0_Resumable_Error_0x7e)
#	endif	
#endif
.align 32
#else	
	NORMAL_TRAP(0x7e); 
#endif

T0_Non_Resumable_Error_0x7f:
#ifdef H_T0_Non_Resumable_Error_0x7f
#ifdef SUN_H_T0_Non_Resumable_Error_0x7f
	 SUN_H_T0_Non_Resumable_Error_0x7f 
#else
#	ifdef My_T0_Non_Resumable_Error_0x7f
		My_T0_Non_Resumable_Error_0x7f
#	else	
		CUSTOM_TRAP(H_T0_Non_Resumable_Error_0x7f)
#	endif	
#endif
.align 32
#else	
	NORMAL_TRAP(0x7f);
#endif	

T0_Window_Spill_0_Normal_0x80:		
#ifdef H_T0_Window_Spill_0_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_0_Normal_Trap
	 SUN_H_T0_Window_Spill_0_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_0_Normal_Trap
		My_T0_Window_Spill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_0_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x80)
#endif
#endif

.align 128	
T0_Window_Spill_1_Normal_0x84:		
#ifdef H_T0_Window_Spill_1_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_1_Normal_Trap
	 SUN_H_T0_Window_Spill_1_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_1_Normal_Trap
		My_T0_Window_Spill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x84)
#endif
#endif

.align 128	
T0_Window_Spill_2_Normal_0x88:		
#ifdef H_T0_Window_Spill_2_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_2_Normal_Trap
	 SUN_H_T0_Window_Spill_2_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_2_Normal_Trap
		My_T0_Window_Spill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x88)
#endif
#endif

.align 128	
T0_Window_Spill_3_Normal_0x8c:		
#ifdef H_T0_Window_Spill_3_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_3_Normal_Trap
	 SUN_H_T0_Window_Spill_3_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_3_Normal_Trap
		My_T0_Window_Spill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x8c)
#endif
#endif

.align 128	
T0_Window_Spill_4_Normal_0x90:
#ifdef H_T0_Window_Spill_4_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_4_Normal_Trap
	 SUN_H_T0_Window_Spill_4_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_4_Normal_Trap
		My_T0_Window_Spill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x90)
#endif
#endif

.align 128	
T0_Window_Spill_5_Normal_0x94:
#ifdef H_T0_Window_Spill_5_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_5_Normal_Trap
	 SUN_H_T0_Window_Spill_5_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_5_Normal_Trap
		My_T0_Window_Spill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x94)
#endif
#endif

.align 128	
T0_Window_Spill_6_Normal_0x98:
#ifdef H_T0_Window_Spill_6_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_6_Normal_Trap
	 SUN_H_T0_Window_Spill_6_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_6_Normal_Trap
		My_T0_Window_Spill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x98)
#endif
#endif

.align 128	
T0_Window_Spill_7_Normal_0x9c:
#ifdef H_T0_Window_Spill_7_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_7_Normal_Trap
	 SUN_H_T0_Window_Spill_7_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_7_Normal_Trap
		My_T0_Window_Spill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x9c)
#endif
#endif

.align 128
T0_Window_Spill_0_Other_0xa0:		
#ifdef H_T0_Window_Spill_0_Other_Trap
#ifdef SUN_H_T0_Window_Spill_0_Other_Trap
	 SUN_H_T0_Window_Spill_0_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_0_Other_Trap
		My_T0_Window_Spill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_0_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa0)
#endif
#endif

.align 128
T0_Window_Spill_1_Other_0xa4:		
#ifdef H_T0_Window_Spill_1_Other_Trap
#ifdef SUN_H_T0_Window_Spill_1_Other_Trap
	 SUN_H_T0_Window_Spill_1_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_1_Other_Trap
		My_T0_Window_Spill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_1_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa4)
#endif
#endif

.align 128
T0_Window_Spill_2_Other_0xa8:		
#ifdef H_T0_Window_Spill_2_Other_Trap
#ifdef SUN_H_T0_Window_Spill_2_Other_Trap
	 SUN_H_T0_Window_Spill_2_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_2_Other_Trap
		My_T0_Window_Spill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_2_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa8)
#endif
#endif

.align 128
T0_Window_Spill_3_Other_0xac:
#ifdef H_T0_Window_Spill_3_Other_Trap
#ifdef SUN_H_T0_Window_Spill_3_Other_Trap
	 SUN_H_T0_Window_Spill_3_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_3_Other_Trap
		My_T0_Window_Spill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_3_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xac)
#endif
#endif

.align 128
T0_Window_Spill_4_Other_0xb0:
#ifdef H_T0_Window_Spill_4_Other_Trap
#ifdef SUN_H_T0_Window_Spill_4_Other_Trap
	 SUN_H_T0_Window_Spill_4_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_4_Other_Trap
		My_T0_Window_Spill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_4_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb0)
#endif
#endif

.align 128
T0_Window_Spill_5_Other_0xb4:
#ifdef H_T0_Window_Spill_5_Other_Trap
#ifdef SUN_H_T0_Window_Spill_5_Other_Trap
	 SUN_H_T0_Window_Spill_5_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_5_Other_Trap
		My_T0_Window_Spill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_5_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb4)
#endif
#endif

.align 128
T0_Window_Spill_6_Other_0xb8:
#ifdef H_T0_Window_Spill_6_Other_Trap
#ifdef SUN_H_T0_Window_Spill_6_Other_Trap
	 SUN_H_T0_Window_Spill_6_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_6_Other_Trap
		My_T0_Window_Spill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_6_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb8)
#endif
#endif

.align 128
T0_Window_Spill_7_Other_0xbc:
#ifdef H_T0_Window_Spill_7_Other_Trap
#ifdef SUN_H_T0_Window_Spill_7_Other_Trap
	 SUN_H_T0_Window_Spill_7_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_7_Other_Trap
		My_T0_Window_Spill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_7_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xbc)
#endif
#endif

.align 128
T0_Window_Fill_0_Normal_0xc0:
#ifdef H_T0_Window_Fill_0_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_0_Normal_Trap
	 SUN_H_T0_Window_Fill_0_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_0_Normal_Trap
		My_T0_Window_Fill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_0_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc0)
#endif
#endif

.align 128
T0_Window_Fill_1_Normal_0xc4:
#ifdef H_T0_Window_Fill_1_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_1_Normal_Trap
	 SUN_H_T0_Window_Fill_1_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_1_Normal_Trap
		My_T0_Window_Fill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc4)
#endif
#endif

.align 128
T0_Window_Fill_2_Normal_0xc8:
#ifdef H_T0_Window_Fill_2_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_2_Normal_Trap
	 SUN_H_T0_Window_Fill_2_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_2_Normal_Trap
		My_T0_Window_Fill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc8)
#endif
#endif

.align 128
T0_Window_Fill_3_Normal_0xcc:
#ifdef H_T0_Window_Fill_3_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_3_Normal_Trap
	 SUN_H_T0_Window_Fill_3_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_3_Normal_Trap
		My_T0_Window_Fill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xcc)
#endif
#endif

.align 128
T0_Window_Fill_4_Normal_0xd0:
#ifdef H_T0_Window_Fill_4_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_4_Normal_Trap
	 SUN_H_T0_Window_Fill_4_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_4_Normal_Trap
		My_T0_Window_Fill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd0)
#endif
#endif

.align 128
T0_Window_Fill_5_Normal_0xd4:
#ifdef H_T0_Window_Fill_5_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_5_Normal_Trap
	 SUN_H_T0_Window_Fill_5_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_5_Normal_Trap
		My_T0_Window_Fill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd4)
#endif
#endif

.align 128
T0_Window_Fill_6_Normal_0xd8:
#ifdef H_T0_Window_Fill_6_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_6_Normal_Trap
	 SUN_H_T0_Window_Fill_6_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_6_Normal_Trap
		My_T0_Window_Fill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd8)
#endif
#endif

.align 128
T0_Window_Fill_7_Normal_0xdc:
#ifdef H_T0_Window_Fill_7_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_7_Normal_Trap
	 SUN_H_T0_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_7_Normal_Trap
		My_T0_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xdc)
#endif
#endif

.align 128
T0_Window_Fill_0_Other_0xe0:
#ifdef H_T0_Window_Fill_0_Other_Trap
#ifdef SUN_H_T0_Window_Fill_0_Other_Trap
	 SUN_H_T0_Window_Fill_0_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_0_Other_Trap
		My_T0_Window_Fill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_0_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe0)
#endif

.align 128
T0_Window_Fill_1_Other_0xe4:
#ifdef H_T0_Window_Fill_1_Other_Trap
#ifdef SUN_H_T0_Window_Fill_1_Other_Trap
	 SUN_H_T0_Window_Fill_1_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_1_Other_Trap
		My_T0_Window_Fill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_1_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe4)
#endif

.align 128
T0_Window_Fill_2_Other_0xe8:
#ifdef H_T0_Window_Fill_2_Other_Trap
#ifdef SUN_H_T0_Window_Fill_2_Other_Trap
	 SUN_H_T0_Window_Fill_2_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_2_Other_Trap
		My_T0_Window_Fill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_2_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe8)
#endif

.align 128
T0_Window_Fill_3_Other_0xec:
#ifdef H_T0_Window_Fill_3_Other_Trap
#ifdef SUN_H_T0_Window_Fill_3_Other_Trap
	 SUN_H_T0_Window_Fill_3_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_3_Other_Trap
		My_T0_Window_Fill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_3_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xec)
#endif

.align 128
T0_Window_Fill_4_Other_0xf0:
#ifdef H_T0_Window_Fill_4_Other_Trap
#ifdef SUN_H_T0_Window_Fill_4_Other_Trap
	 SUN_H_T0_Window_Fill_4_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_4_Other_Trap
		My_T0_Window_Fill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_4_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf0)
#endif

.align 128
T0_Window_Fill_5_Other_0xf4:
#ifdef H_T0_Window_Fill_5_Other_Trap
#ifdef SUN_H_T0_Window_Fill_5_Other_Trap
	 SUN_H_T0_Window_Fill_5_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_5_Other_Trap
		My_T0_Window_Fill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_5_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf4)
#endif

.align 128
T0_Window_Fill_6_Other_0xf8:
#ifdef H_T0_Window_Fill_6_Other_Trap
#ifdef SUN_H_T0_Window_Fill_6_Other_Trap
	 SUN_H_T0_Window_Fill_6_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_6_Other_Trap
		My_T0_Window_Fill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_6_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf8)
#endif

.align 128
T0_Window_Fill_7_Other_0xfc:
#ifdef H_T0_Window_Fill_7_Other_Trap
#ifdef SUN_H_T0_Window_Fill_7_Other_Trap
	 SUN_H_T0_Window_Fill_7_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_7_Other_Trap
		My_T0_Window_Fill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_7_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xfc)
#endif

.align 128
T0_GoodTrap_0x100:
.global good_trap
good_trap:     
#ifndef TESTER_DUMP
#ifndef FPGA_HW
	rd %asr26, %g1; wr %g1, 0x1, %asr26; nop; b good_trap;nop;nop;nop;nop
#else
#ifndef HPV_NONSPLIT_MODE
        ta T_GOOD_TRAP + 0x9c; nop;nop;nop;  nop;nop;nop;nop    ! to Hypervisor
#else
        CUSTOM_TRAP(proc_good_trap)
#endif
#endif
#else
        CUSTOM_TRAP(state_checkpoint_skip)
#endif

T0_BadTrap_0x101:
#ifdef EXPECT_BAD_TRAP
        b good_trap; nop;nop;nop;nop;nop;nop;nop
#else
.global bad_trap
bad_trap:
#ifndef FPGA_HW
        b bad_trap; nop;nop;nop;nop;nop;nop;nop
#else
#ifndef HPV_NONSPLIT_MODE
        ta T_BAD_TRAP + 0x9c; nop;nop;nop;  nop;nop;nop;nop    ! to Hypervisor
#else
        CUSTOM_TRAP(proc_bad_trap)
#endif
#endif
#endif
	
T0_ChangePriv_0x102:
#ifdef H_T0_ChangePriv_0x102
#ifdef SUN_H_T0_ChangePriv_0x102
         SUN_H_T0_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_T0_ChangePriv_0x102)
#endif
#else
        rdpr    %tstate, %g1
	mov	0x400, %g2
	and	%g1, %g2, %g3
	brz,a	%g3, .+8
	wrpr	%g1, %g2, %tstate
	done
	nop
	nop
#endif
	
T0_ChangeNonPriv_0x103:
#ifdef H_T0_ChangeNonPriv_0x103
#ifdef SUN_H_T0_ChangeNonPriv_0x103
         SUN_H_T0_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_T0_ChangeNonPriv_0x103)
#endif
#else
        rdpr    %tstate, %g1
	mov	0x400, %g2
	and	%g1, %g2, %g3
	brnz,a	%g3, .+8
	wrpr	%g1, %g2, %tstate
	done
	nop
	nop
#endif

T0_ChangeToTL1_0x104:
#ifdef H_T0_ChangeToTL1_0x104
#ifdef SUN_H_T0_ChangeToTL1_0x104
         SUN_H_T0_ChangeToTL1_0x104
#else
                CUSTOM_TRAP(H_T0_ChangeToTL1_0x104)
#endif
#else
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
#endif
	
T0_ChangeToTL0_0x105:
#ifdef H_T0_ChangeToTL0_0x105
#ifdef SUN_H_T0_ChangeToTL0_0x105
	 SUN_H_T0_ChangeToTL0_0x105 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x105)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done
#endif
	
T0_ChangeToTL0_0x106:
#ifdef H_T0_ChangeToTL0_0x106
#ifdef SUN_H_T0_ChangeToTL0_0x106
	 SUN_H_T0_ChangeToTL0_0x106 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x106)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done
#endif
	
T0_ChangeToTL0_0x107:
#ifdef H_T0_ChangeToTL0_0x107
#ifdef SUN_H_T0_ChangeToTL0_0x107
	 SUN_H_T0_ChangeToTL0_0x107 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x107)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done
#endif

.align 128
T0_TrapEn_0x108:
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
	mov     0x800, %g2
	add	%o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
	sth	%g2, [%g3+%o0]
	done

.align 64
T0_TrapDis_0x10a:	
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
	mov     0, %g2
	add	%o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
	sth	%g2, [%g3+%o0]
	done

.align 64
T0_TrapEn_Ntimes_0x10c:	
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
	mov	%o1, %g2
	add	%o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
	sth	%g2, [%g3+%o0]
	done

.align 128
T0_PThreadMutexLock_0x110:
        wrpr    1, %gl    ! set it back to 1
!!        setx    pthread_mutex_data, %g2, %g3
        sethi   %hi(pthread_mutex_data), %g3
pt_retry:
        ldstub  [%g3+%g7], %g2
        brz     %g2, pt_done
        nop
pt_loop:
        ldub    [%g3+%g7], %g2
        brnz    %g2, pt_loop
        nop
        ba,a    pt_retry
pt_done:
        membar  #LoadLoad | #LoadStore
        ldsb    [%g4+%g6], %g3
        add     1, %g3, %g3
        stub    %g3, [%g4+%g6]
        done
        nop

.align 128
T0_PThreadMutexUnLock_0x114:	
        wrpr    1, %gl    ! set it back to 1
!!        setx    pthread_mutex_data, %g2, %g3
        sethi   %hi(pthread_mutex_data), %g3
        stub    %g0, [%g3+%g7]
        ldsb    [%g4+%g6], %g3
        subcc   %g5, 1, %g5     ! %g5 timeout count
        te      T_BAD_TRAP
        cmp     %g3, THREAD_COUNT
        bl,a    .-12
        ldsb    [%g4+%g6], %g3
        done
        nop
	
.align 64
T0_Trap_Sync_0x116:
        setx    pthread_counter_data, %g1, %g4
!!      we will change the GL not other's
        wrpr    1, %gl
        rdpr    %tstate, %g3    ! get TSTATE
        mov     1,%g1
        sllx    %g1, 40, %g1    ! mov GL to low bit
        xor      %g1, %g3, %g3   ! change the prev GL value
        wrpr    %g3, %tstate
        done
        nop


	
.align 64
! call kernel device routine
T0_Trap_SysCall_0x118:
	! calculate ptr to syscall data according to thread ID
	mov	%o1, %g1	! save %o1
	rdth_id_p		! get thread ID
	sllx	%o1, 6, %o1
	setx	pthread_syscall_data, %g2, %g4
	add	%g4, %o1, %g4	! %g4 = ptr to thread's data
	ba	syscall_handler
	mov	%g1, %o1	! restore %o1
	
.align 64
T0_Trap_SysRet_0x11a:
	! calculate ptr to syscall data according to thread ID
	mov	%o1, %g1	! save %o1
	rdth_id_p		! get thread ID
	sllx	%o1, 6, %o1
	setx	pthread_syscall_data, %g2, %g4
	add	%g4, %o1, %g4	! %g4 = ptr to thread's data
	ba	sysret_handler
	mov	%g1, %o1	! restore %o1

.align 512
T0_HTrap_ChangePriv_0x120:
        ta      %icc, T_API_CHANGE_PRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64
T0_HTrap_ChangeNonPriv_0x122:
        ta      %icc, T_API_CHANGE_NONPRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapEn_0x124:
        ta      %icc, T_API_TRAP_EN
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapDis_0x126:
        ta      %icc, T_API_TRAP_DIS
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapEn_Ntimes_0x128:
        ta      %icc, T_API_TRAP_EN_N_TIMES
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_ChangeCtx_0x12a:
#ifndef HPV_NONSPLIT_MODE
        ta      %icc, T_API_CHANGE_CTX
	done
	nop
	nop
	nop
	nop
	nop
	nop
#else
        mov     0x08, %g1
        stxa    %o1, [%g1] 0x21 ! set PCONTEXT
        mov     0x10, %g1
        stxa    %o2, [%g1] 0x21 ! set SCONTEXT
        xor     %o3, 0x1, %o3   ! invert bit so that later can
        xor     %o4, 0x1, %o4   !    be xor'ed using wrpr 
        sllx    %o3, 10, %o3    ! align priv bit
        sllx    %o4, 2, %o4     ! align hpriv bit
        rdpr    %tstate, %g1
        or      %g1, 0x400, %g1
        wrpr    %g1, %o3, %tstate
        rdhpr   %htstate, %g1
        or      %g1, 0x4, %g1
        wrhpr   %g1, %o4, %htstate
        wrpr    %o5, %g0, %tnpc
        done
#endif

.align 64
T0_Dummy_0x12c:
	nop
	nop

.align 64	
T0_RdThId_0x12e:
#ifndef HPV_NONSPLIT_MODE
        ta      %icc, T_API_RD_THID
	done
	nop
	nop
	nop
	nop
	nop
	nop
#else


    setx     0xba00000000, %o1, %g1
    ldxa     [%g1] 0x15, %g1            ! has coreid


    srlx    %g1, 8, %o1
    mulx    %o1, PTON_X_TILES, %o1
    and     %g1, 0xff, %g1
    add     %g1, %o1, %g1    

    !srlx    %g1, 5, %o1
    !add     %o1, %g1, %g1        ! translate from x,y coordinates to coreid
    !set     0x3f, %o1           ! get the lowest 6 bits
    !and     %g1, %o1, %g1
    
    sllx    %g1, 1, %g1

	rd	%asr26, %o1
    srlx    %o1, 8, %o1
    add     %o1, %g1, %o1
#ifdef PORTABLE_CORE
        set     0x0001, %g1
#else
        set     0x007f, %g1
#endif
    and     %o1, %g1, %o1


        done
        nop
#endif

.align 512
T0_Trap_Instruction_0x130:
#ifdef H_T0_Trap_Instruction_0
#ifdef SUN_H_T0_Trap_Instruction_0
	 SUN_H_T0_Trap_Instruction_0 
#else
#	ifdef My_T0_Trap_Instruction_0
		My_T0_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
T0_Trap_Instruction_0x131:
#ifdef H_T0_Trap_Instruction_1
#ifdef SUN_H_T0_Trap_Instruction_1
	SUN_H_T0_Trap_Instruction_1
#else
#	ifdef My_T0_Trap_Instruction_1
		My_T0_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
T0_Trap_Instruction_0x132:
#ifdef H_T0_Trap_Instruction_2
#ifdef SUN_H_T0_Trap_Instruction_2
	SUN_H_T0_Trap_Instruction_2
#else
#	ifdef My_T0_Trap_Instruction_2
		My_T0_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_2)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST0;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T0_Trap_Instruction_0x133:
#ifdef H_T0_Trap_Instruction_3
#ifdef SUN_H_T0_Trap_Instruction_3
	SUN_H_T0_Trap_Instruction_3
#else
#	ifdef My_T0_Trap_Instruction_3
		My_T0_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_3)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST1;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T0_Trap_Instruction_0x134:
#ifdef H_T0_Trap_Instruction_4
#ifdef SUN_H_T0_Trap_Instruction_4
	 SUN_H_T0_Trap_Instruction_4
#else
#	ifdef My_T0_Trap_Instruction_4
		My_T0_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
T0_Trap_Instruction_0x135:
#ifdef H_T0_Trap_Instruction_5
#ifdef SUN_H_T0_Trap_Instruction_5
	SUN_H_T0_Trap_Instruction_5
#else
#	ifdef My_T0_Trap_Instruction_5
		My_T0_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif

T0_Trap_Instruction_0x136:
#ifdef H_T0_Trap_Instruction_0x136
#ifdef SUN_H_T0_Trap_Instruction_0x136
                SUN_H_T0_Trap_Instruction_0x136
#else
#               ifdef My_T0_Trap_Instruction_0x136
                        My_T0_Trap_Instruction_0x136
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x136)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x136);
#endif

T0_Trap_Instruction_0x137:
#ifdef H_T0_Trap_Instruction_0x137
#ifdef SUN_H_T0_Trap_Instruction_0x137
                SUN_H_T0_Trap_Instruction_0x137
#else
#               ifdef My_T0_Trap_Instruction_0x137
                        My_T0_Trap_Instruction_0x137
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x137)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x137);
#endif

T0_Trap_Instruction_0x138:
#ifdef H_T0_Trap_Instruction_0x138
#ifdef SUN_H_T0_Trap_Instruction_0x138
                SUN_H_T0_Trap_Instruction_0x138
#else
#               ifdef My_T0_Trap_Instruction_0x138
                        My_T0_Trap_Instruction_0x138
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x138)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x138);
#endif

T0_Trap_Instruction_0x139:
#ifdef H_T0_Trap_Instruction_0x139
#ifdef SUN_H_T0_Trap_Instruction_0x139
                SUN_H_T0_Trap_Instruction_0x139
#else
#               ifdef My_T0_Trap_Instruction_0x139
                        My_T0_Trap_Instruction_0x139
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x139)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x139);
#endif

T0_Trap_Instruction_0x13a:
#ifdef H_T0_Trap_Instruction_0x13a
#ifdef SUN_H_T0_Trap_Instruction_0x13a
                SUN_H_T0_Trap_Instruction_0x13a
#else
#               ifdef My_T0_Trap_Instruction_0x13a
                        My_T0_Trap_Instruction_0x13a
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13a);
#endif

T0_Trap_Instruction_0x13b:
#ifdef H_T0_Trap_Instruction_0x13b
#ifdef SUN_H_T0_Trap_Instruction_0x13b
                SUN_H_T0_Trap_Instruction_0x13b
#else
#               ifdef My_T0_Trap_Instruction_0x13b
                        My_T0_Trap_Instruction_0x13b
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13b);
#endif

T0_Trap_Instruction_0x13c:
#ifdef H_T0_Trap_Instruction_0x13c
#ifdef SUN_H_T0_Trap_Instruction_0x13c
                SUN_H_T0_Trap_Instruction_0x13c
#else
#               ifdef My_T0_Trap_Instruction_0x13c
                        My_T0_Trap_Instruction_0x13c
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13c);
#endif

T0_Trap_Instruction_0x13d:
#ifdef H_T0_Trap_Instruction_0x13d
#ifdef SUN_H_T0_Trap_Instruction_0x13d
                SUN_H_T0_Trap_Instruction_0x13d
#else
#               ifdef My_T0_Trap_Instruction_0x13d
                        My_T0_Trap_Instruction_0x13d
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13d);
#endif

T0_Trap_Instruction_0x13e:
#ifdef H_T0_Trap_Instruction_0x13e
#ifdef SUN_H_T0_Trap_Instruction_0x13e
                SUN_H_T0_Trap_Instruction_0x13e
#else
#               ifdef My_T0_Trap_Instruction_0x13e
                        My_T0_Trap_Instruction_0x13e
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13e);
#endif

T0_Trap_Instruction_0x13f:
#ifdef H_T0_Trap_Instruction_0x13f
#ifdef SUN_H_T0_Trap_Instruction_0x13f
                SUN_H_T0_Trap_Instruction_0x13f
#else
#               ifdef My_T0_Trap_Instruction_0x13f
                        My_T0_Trap_Instruction_0x13f
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x13f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13f);
#endif

T0_Trap_Instruction_0x140:
#ifdef H_T0_Trap_Instruction_0x140
#ifdef SUN_H_T0_Trap_Instruction_0x140
                SUN_H_T0_Trap_Instruction_0x140
#else
#               ifdef My_T0_Trap_Instruction_0x140
                        My_T0_Trap_Instruction_0x140
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x140)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x140);
#endif

T0_Trap_Instruction_0x141:
#ifdef H_T0_Trap_Instruction_0x141
#ifdef SUN_H_T0_Trap_Instruction_0x141
                SUN_H_T0_Trap_Instruction_0x141
#else
#               ifdef My_T0_Trap_Instruction_0x141
                        My_T0_Trap_Instruction_0x141
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x141)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x141);
#endif

T0_Trap_Instruction_0x142:
#ifdef H_T0_Trap_Instruction_0x142
#ifdef SUN_H_T0_Trap_Instruction_0x142
                SUN_H_T0_Trap_Instruction_0x142
#else
#               ifdef My_T0_Trap_Instruction_0x142
                        My_T0_Trap_Instruction_0x142
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x142)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x142);
#endif

T0_Trap_Instruction_0x143:
#ifdef H_T0_Trap_Instruction_0x143
#ifdef SUN_H_T0_Trap_Instruction_0x143
                SUN_H_T0_Trap_Instruction_0x143
#else
#               ifdef My_T0_Trap_Instruction_0x143
                        My_T0_Trap_Instruction_0x143
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x143)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x143);
#endif

T0_Trap_Instruction_0x144:
#ifdef H_T0_Trap_Instruction_0x144
#ifdef SUN_H_T0_Trap_Instruction_0x144
                SUN_H_T0_Trap_Instruction_0x144
#else
#               ifdef My_T0_Trap_Instruction_0x144
                        My_T0_Trap_Instruction_0x144
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x144)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x144);
#endif

T0_Trap_Instruction_0x145:
#ifdef H_T0_Trap_Instruction_0x145
#ifdef SUN_H_T0_Trap_Instruction_0x145
                SUN_H_T0_Trap_Instruction_0x145
#else
#               ifdef My_T0_Trap_Instruction_0x145
                        My_T0_Trap_Instruction_0x145
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x145)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x145);
#endif

T0_Trap_Instruction_0x146:
#ifdef H_T0_Trap_Instruction_0x146
#ifdef SUN_H_T0_Trap_Instruction_0x146
                SUN_H_T0_Trap_Instruction_0x146
#else
#               ifdef My_T0_Trap_Instruction_0x146
                        My_T0_Trap_Instruction_0x146
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x146)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x146);
#endif

T0_Trap_Instruction_0x147:
#ifdef H_T0_Trap_Instruction_0x147
#ifdef SUN_H_T0_Trap_Instruction_0x147
                SUN_H_T0_Trap_Instruction_0x147
#else
#               ifdef My_T0_Trap_Instruction_0x147
                        My_T0_Trap_Instruction_0x147
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x147)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x147);
#endif

T0_Trap_Instruction_0x148:
#ifdef H_T0_Trap_Instruction_0x148
#ifdef SUN_H_T0_Trap_Instruction_0x148
                SUN_H_T0_Trap_Instruction_0x148
#else
#               ifdef My_T0_Trap_Instruction_0x148
                        My_T0_Trap_Instruction_0x148
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x148)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x148);
#endif

T0_Trap_Instruction_0x149:
#ifdef H_T0_Trap_Instruction_0x149
#ifdef SUN_H_T0_Trap_Instruction_0x149
                SUN_H_T0_Trap_Instruction_0x149
#else
#               ifdef My_T0_Trap_Instruction_0x149
                        My_T0_Trap_Instruction_0x149
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x149)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x149);
#endif

T0_Trap_Instruction_0x14a:
#ifdef H_T0_Trap_Instruction_0x14a
#ifdef SUN_H_T0_Trap_Instruction_0x14a
                SUN_H_T0_Trap_Instruction_0x14a
#else
#               ifdef My_T0_Trap_Instruction_0x14a
                        My_T0_Trap_Instruction_0x14a
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14a);
#endif

T0_Trap_Instruction_0x14b:
#ifdef H_T0_Trap_Instruction_0x14b
#ifdef SUN_H_T0_Trap_Instruction_0x14b
                SUN_H_T0_Trap_Instruction_0x14b
#else
#               ifdef My_T0_Trap_Instruction_0x14b
                        My_T0_Trap_Instruction_0x14b
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14b);
#endif

T0_Trap_Instruction_0x14c:
#ifdef H_T0_Trap_Instruction_0x14c
#ifdef SUN_H_T0_Trap_Instruction_0x14c
                SUN_H_T0_Trap_Instruction_0x14c
#else
#               ifdef My_T0_Trap_Instruction_0x14c
                        My_T0_Trap_Instruction_0x14c
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14c);
#endif

T0_Trap_Instruction_0x14d:
#ifdef H_T0_Trap_Instruction_0x14d
#ifdef SUN_H_T0_Trap_Instruction_0x14d
                SUN_H_T0_Trap_Instruction_0x14d
#else
#               ifdef My_T0_Trap_Instruction_0x14d
                        My_T0_Trap_Instruction_0x14d
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14d);
#endif

T0_Trap_Instruction_0x14e:
#ifdef H_T0_Trap_Instruction_0x14e
#ifdef SUN_H_T0_Trap_Instruction_0x14e
                SUN_H_T0_Trap_Instruction_0x14e
#else
#               ifdef My_T0_Trap_Instruction_0x14e
                        My_T0_Trap_Instruction_0x14e
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14e);
#endif

T0_Trap_Instruction_0x14f:
#ifdef H_T0_Trap_Instruction_0x14f
#ifdef SUN_H_T0_Trap_Instruction_0x14f
                SUN_H_T0_Trap_Instruction_0x14f
#else
#               ifdef My_T0_Trap_Instruction_0x14f
                        My_T0_Trap_Instruction_0x14f
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x14f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14f);
#endif

T0_Trap_Instruction_0x150:
#ifdef H_T0_Trap_Instruction_0x150
#ifdef SUN_H_T0_Trap_Instruction_0x150
                SUN_H_T0_Trap_Instruction_0x150
#else
#               ifdef My_T0_Trap_Instruction_0x150
                        My_T0_Trap_Instruction_0x150
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x150)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x150);
#endif

T0_Trap_Instruction_0x151:
#ifdef H_T0_Trap_Instruction_0x151
#ifdef SUN_H_T0_Trap_Instruction_0x151
                SUN_H_T0_Trap_Instruction_0x151
#else
#               ifdef My_T0_Trap_Instruction_0x151
                        My_T0_Trap_Instruction_0x151
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x151)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x151);
#endif

T0_Trap_Instruction_0x152:
#ifdef H_T0_Trap_Instruction_0x152
#ifdef SUN_H_T0_Trap_Instruction_0x152
                SUN_H_T0_Trap_Instruction_0x152
#else
#               ifdef My_T0_Trap_Instruction_0x152
                        My_T0_Trap_Instruction_0x152
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x152)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x152);
#endif

T0_Trap_Instruction_0x153:
#ifdef H_T0_Trap_Instruction_0x153
#ifdef SUN_H_T0_Trap_Instruction_0x153
                SUN_H_T0_Trap_Instruction_0x153
#else
#               ifdef My_T0_Trap_Instruction_0x153
                        My_T0_Trap_Instruction_0x153
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x153)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x153);
#endif

T0_Trap_Instruction_0x154:
#ifdef H_T0_Trap_Instruction_0x154
#ifdef SUN_H_T0_Trap_Instruction_0x154
                SUN_H_T0_Trap_Instruction_0x154
#else
#               ifdef My_T0_Trap_Instruction_0x154
                        My_T0_Trap_Instruction_0x154
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x154)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x154);
#endif

T0_Trap_Instruction_0x155:
#ifdef H_T0_Trap_Instruction_0x155
#ifdef SUN_H_T0_Trap_Instruction_0x155
                SUN_H_T0_Trap_Instruction_0x155
#else
#               ifdef My_T0_Trap_Instruction_0x155
                        My_T0_Trap_Instruction_0x155
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x155)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x155);
#endif

T0_Trap_Instruction_0x156:
#ifdef H_T0_Trap_Instruction_0x156
#ifdef SUN_H_T0_Trap_Instruction_0x156
                SUN_H_T0_Trap_Instruction_0x156
#else
#               ifdef My_T0_Trap_Instruction_0x156
                        My_T0_Trap_Instruction_0x156
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x156)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x156);
#endif

T0_Trap_Instruction_0x157:
#ifdef H_T0_Trap_Instruction_0x157
#ifdef SUN_H_T0_Trap_Instruction_0x157
                SUN_H_T0_Trap_Instruction_0x157
#else
#               ifdef My_T0_Trap_Instruction_0x157
                        My_T0_Trap_Instruction_0x157
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x157)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x157);
#endif

T0_Trap_Instruction_0x158:
#ifdef H_T0_Trap_Instruction_0x158
#ifdef SUN_H_T0_Trap_Instruction_0x158
                SUN_H_T0_Trap_Instruction_0x158
#else
#               ifdef My_T0_Trap_Instruction_0x158
                        My_T0_Trap_Instruction_0x158
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x158)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x158);
#endif

T0_Trap_Instruction_0x159:
#ifdef H_T0_Trap_Instruction_0x159
#ifdef SUN_H_T0_Trap_Instruction_0x159
                SUN_H_T0_Trap_Instruction_0x159
#else
#               ifdef My_T0_Trap_Instruction_0x159
                        My_T0_Trap_Instruction_0x159
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x159)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x159);
#endif

T0_Trap_Instruction_0x15a:
#ifdef H_T0_Trap_Instruction_0x15a
#ifdef SUN_H_T0_Trap_Instruction_0x15a
                SUN_H_T0_Trap_Instruction_0x15a
#else
#               ifdef My_T0_Trap_Instruction_0x15a
                        My_T0_Trap_Instruction_0x15a
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15a);
#endif

T0_Trap_Instruction_0x15b:
#ifdef H_T0_Trap_Instruction_0x15b
#ifdef SUN_H_T0_Trap_Instruction_0x15b
                SUN_H_T0_Trap_Instruction_0x15b
#else
#               ifdef My_T0_Trap_Instruction_0x15b
                        My_T0_Trap_Instruction_0x15b
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15b);
#endif

T0_Trap_Instruction_0x15c:
#ifdef H_T0_Trap_Instruction_0x15c
#ifdef SUN_H_T0_Trap_Instruction_0x15c
                SUN_H_T0_Trap_Instruction_0x15c
#else
#               ifdef My_T0_Trap_Instruction_0x15c
                        My_T0_Trap_Instruction_0x15c
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15c);
#endif

T0_Trap_Instruction_0x15d:
#ifdef H_T0_Trap_Instruction_0x15d
#ifdef SUN_H_T0_Trap_Instruction_0x15d
                SUN_H_T0_Trap_Instruction_0x15d
#else
#               ifdef My_T0_Trap_Instruction_0x15d
                        My_T0_Trap_Instruction_0x15d
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15d);
#endif

T0_Trap_Instruction_0x15e:
#ifdef H_T0_Trap_Instruction_0x15e
#ifdef SUN_H_T0_Trap_Instruction_0x15e
                SUN_H_T0_Trap_Instruction_0x15e
#else
#               ifdef My_T0_Trap_Instruction_0x15e
                        My_T0_Trap_Instruction_0x15e
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15e);
#endif

T0_Trap_Instruction_0x15f:
#ifdef H_T0_Trap_Instruction_0x15f
#ifdef SUN_H_T0_Trap_Instruction_0x15f
                SUN_H_T0_Trap_Instruction_0x15f
#else
#               ifdef My_T0_Trap_Instruction_0x15f
                        My_T0_Trap_Instruction_0x15f
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x15f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15f);
#endif

T0_Trap_Instruction_0x160:
#ifdef H_T0_Trap_Instruction_0x160
#ifdef SUN_H_T0_Trap_Instruction_0x160
                SUN_H_T0_Trap_Instruction_0x160
#else
#               ifdef My_T0_Trap_Instruction_0x160
                        My_T0_Trap_Instruction_0x160
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x160)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x160);
#endif

T0_Trap_Instruction_0x161:
#ifdef H_T0_Trap_Instruction_0x161
#ifdef SUN_H_T0_Trap_Instruction_0x161
                SUN_H_T0_Trap_Instruction_0x161
#else
#               ifdef My_T0_Trap_Instruction_0x161
                        My_T0_Trap_Instruction_0x161
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x161)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x161);
#endif

T0_Trap_Instruction_0x162:
#ifdef H_T0_Trap_Instruction_0x162
#ifdef SUN_H_T0_Trap_Instruction_0x162
                SUN_H_T0_Trap_Instruction_0x162
#else
#               ifdef My_T0_Trap_Instruction_0x162
                        My_T0_Trap_Instruction_0x162
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x162)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x162);
#endif

T0_Trap_Instruction_0x163:
#ifdef H_T0_Trap_Instruction_0x163
#ifdef SUN_H_T0_Trap_Instruction_0x163
                SUN_H_T0_Trap_Instruction_0x163
#else
#               ifdef My_T0_Trap_Instruction_0x163
                        My_T0_Trap_Instruction_0x163
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x163)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x163);
#endif

T0_Trap_Instruction_0x164:
#ifdef H_T0_Trap_Instruction_0x164
#ifdef SUN_H_T0_Trap_Instruction_0x164
                SUN_H_T0_Trap_Instruction_0x164
#else
#               ifdef My_T0_Trap_Instruction_0x164
                        My_T0_Trap_Instruction_0x164
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x164)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x164);
#endif

T0_Trap_Instruction_0x165:
#ifdef H_T0_Trap_Instruction_0x165
#ifdef SUN_H_T0_Trap_Instruction_0x165
                SUN_H_T0_Trap_Instruction_0x165
#else
#               ifdef My_T0_Trap_Instruction_0x165
                        My_T0_Trap_Instruction_0x165
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x165)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x165);
#endif

T0_Trap_Instruction_0x166:
#ifdef H_T0_Trap_Instruction_0x166
#ifdef SUN_H_T0_Trap_Instruction_0x166
                SUN_H_T0_Trap_Instruction_0x166
#else
#               ifdef My_T0_Trap_Instruction_0x166
                        My_T0_Trap_Instruction_0x166
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x166)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x166);
#endif

T0_Trap_Instruction_0x167:
#ifdef H_T0_Trap_Instruction_0x167
#ifdef SUN_H_T0_Trap_Instruction_0x167
                SUN_H_T0_Trap_Instruction_0x167
#else
#               ifdef My_T0_Trap_Instruction_0x167
                        My_T0_Trap_Instruction_0x167
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x167)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x167);
#endif

T0_Trap_Instruction_0x168:
#ifdef H_T0_Trap_Instruction_0x168
#ifdef SUN_H_T0_Trap_Instruction_0x168
                SUN_H_T0_Trap_Instruction_0x168
#else
#               ifdef My_T0_Trap_Instruction_0x168
                        My_T0_Trap_Instruction_0x168
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x168)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x168);
#endif

T0_Trap_Instruction_0x169:
#ifdef H_T0_Trap_Instruction_0x169
#ifdef SUN_H_T0_Trap_Instruction_0x169
                SUN_H_T0_Trap_Instruction_0x169
#else
#               ifdef My_T0_Trap_Instruction_0x169
                        My_T0_Trap_Instruction_0x169
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x169)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x169);
#endif

T0_Trap_Instruction_0x16a:
#ifdef H_T0_Trap_Instruction_0x16a
#ifdef SUN_H_T0_Trap_Instruction_0x16a
                SUN_H_T0_Trap_Instruction_0x16a
#else
#               ifdef My_T0_Trap_Instruction_0x16a
                        My_T0_Trap_Instruction_0x16a
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16a);
#endif

T0_Trap_Instruction_0x16b:
#ifdef H_T0_Trap_Instruction_0x16b
#ifdef SUN_H_T0_Trap_Instruction_0x16b
                SUN_H_T0_Trap_Instruction_0x16b
#else
#               ifdef My_T0_Trap_Instruction_0x16b
                        My_T0_Trap_Instruction_0x16b
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16b);
#endif

T0_Trap_Instruction_0x16c:
#ifdef H_T0_Trap_Instruction_0x16c
#ifdef SUN_H_T0_Trap_Instruction_0x16c
                SUN_H_T0_Trap_Instruction_0x16c
#else
#               ifdef My_T0_Trap_Instruction_0x16c
                        My_T0_Trap_Instruction_0x16c
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16c);
#endif

T0_Trap_Instruction_0x16d:
#ifdef H_T0_Trap_Instruction_0x16d
#ifdef SUN_H_T0_Trap_Instruction_0x16d
                SUN_H_T0_Trap_Instruction_0x16d
#else
#               ifdef My_T0_Trap_Instruction_0x16d
                        My_T0_Trap_Instruction_0x16d
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16d);
#endif

T0_Trap_Instruction_0x16e:
#ifdef H_T0_Trap_Instruction_0x16e
#ifdef SUN_H_T0_Trap_Instruction_0x16e
                SUN_H_T0_Trap_Instruction_0x16e
#else
#               ifdef My_T0_Trap_Instruction_0x16e
                        My_T0_Trap_Instruction_0x16e
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16e);
#endif

T0_Trap_Instruction_0x16f:
#ifdef H_T0_Trap_Instruction_0x16f
#ifdef SUN_H_T0_Trap_Instruction_0x16f
                SUN_H_T0_Trap_Instruction_0x16f
#else
#               ifdef My_T0_Trap_Instruction_0x16f
                        My_T0_Trap_Instruction_0x16f
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x16f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16f);
#endif

T0_Trap_Instruction_0x170:
    CUSTOM_TRAP(hv_putchar)

T0_Trap_Instruction_0x171:
#ifdef H_T0_Trap_Instruction_0x171
#ifdef SUN_H_T0_Trap_Instruction_0x171
                SUN_H_T0_Trap_Instruction_0x171
#else
#               ifdef My_T0_Trap_Instruction_0x171
                        My_T0_Trap_Instruction_0x171
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x171)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x171);
#endif

T0_Trap_Instruction_0x172:
#ifdef H_T0_Trap_Instruction_0x172
#ifdef SUN_H_T0_Trap_Instruction_0x172
                SUN_H_T0_Trap_Instruction_0x172
#else
#               ifdef My_T0_Trap_Instruction_0x172
                        My_T0_Trap_Instruction_0x172
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x172)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x172);
#endif

T0_Trap_Instruction_0x173:
#ifdef H_T0_Trap_Instruction_0x173
#ifdef SUN_H_T0_Trap_Instruction_0x173
                SUN_H_T0_Trap_Instruction_0x173
#else
#               ifdef My_T0_Trap_Instruction_0x173
                        My_T0_Trap_Instruction_0x173
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x173)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x173);
#endif

T0_Trap_Instruction_0x174:
#ifdef H_T0_Trap_Instruction_0x174
#ifdef SUN_H_T0_Trap_Instruction_0x174
                SUN_H_T0_Trap_Instruction_0x174
#else
#               ifdef My_T0_Trap_Instruction_0x174
                        My_T0_Trap_Instruction_0x174
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x174)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x174);
#endif

T0_Trap_Instruction_0x175:
#ifdef H_T0_Trap_Instruction_0x175
#ifdef SUN_H_T0_Trap_Instruction_0x175
                SUN_H_T0_Trap_Instruction_0x175
#else
#               ifdef My_T0_Trap_Instruction_0x175
                        My_T0_Trap_Instruction_0x175
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x175)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x175);
#endif

T0_Trap_Instruction_0x176:
#ifdef H_T0_Trap_Instruction_0x176
#ifdef SUN_H_T0_Trap_Instruction_0x176
                SUN_H_T0_Trap_Instruction_0x176
#else
#               ifdef My_T0_Trap_Instruction_0x176
                        My_T0_Trap_Instruction_0x176
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x176)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x176);
#endif

T0_Trap_Instruction_0x177:
#ifdef H_T0_Trap_Instruction_0x177
#ifdef SUN_H_T0_Trap_Instruction_0x177
                SUN_H_T0_Trap_Instruction_0x177
#else
#               ifdef My_T0_Trap_Instruction_0x177
                        My_T0_Trap_Instruction_0x177
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x177)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x177);
#endif

T0_Trap_Instruction_0x178:
#ifdef H_T0_Trap_Instruction_0x178
#ifdef SUN_H_T0_Trap_Instruction_0x178
                SUN_H_T0_Trap_Instruction_0x178
#else
#               ifdef My_T0_Trap_Instruction_0x178
                        My_T0_Trap_Instruction_0x178
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x178)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x178);
#endif

T0_Trap_Instruction_0x179:
#ifdef H_T0_Trap_Instruction_0x179
#ifdef SUN_H_T0_Trap_Instruction_0x179
                SUN_H_T0_Trap_Instruction_0x179
#else
#               ifdef My_T0_Trap_Instruction_0x179
                        My_T0_Trap_Instruction_0x179
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x179)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x179);
#endif

T0_Trap_Instruction_0x17a:
#ifdef H_T0_Trap_Instruction_0x17a
#ifdef SUN_H_T0_Trap_Instruction_0x17a
                SUN_H_T0_Trap_Instruction_0x17a
#else
#               ifdef My_T0_Trap_Instruction_0x17a
                        My_T0_Trap_Instruction_0x17a
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17a);
#endif

T0_Trap_Instruction_0x17b:
#ifdef H_T0_Trap_Instruction_0x17b
#ifdef SUN_H_T0_Trap_Instruction_0x17b
                SUN_H_T0_Trap_Instruction_0x17b
#else
#               ifdef My_T0_Trap_Instruction_0x17b
                        My_T0_Trap_Instruction_0x17b
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17b);
#endif

T0_Trap_Instruction_0x17c:
#ifdef H_T0_Trap_Instruction_0x17c
#ifdef SUN_H_T0_Trap_Instruction_0x17c
                SUN_H_T0_Trap_Instruction_0x17c
#else
#               ifdef My_T0_Trap_Instruction_0x17c
                        My_T0_Trap_Instruction_0x17c
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17c);
#endif

T0_Trap_Instruction_0x17d:
#ifdef H_T0_Trap_Instruction_0x17d
#ifdef SUN_H_T0_Trap_Instruction_0x17d
                SUN_H_T0_Trap_Instruction_0x17d
#else
#               ifdef My_T0_Trap_Instruction_0x17d
                        My_T0_Trap_Instruction_0x17d
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17d);
#endif

T0_Trap_Instruction_0x17e:
#ifdef H_T0_Trap_Instruction_0x17e
#ifdef SUN_H_T0_Trap_Instruction_0x17e
                SUN_H_T0_Trap_Instruction_0x17e
#else
#               ifdef My_T0_Trap_Instruction_0x17e
                        My_T0_Trap_Instruction_0x17e
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17e);
#endif

T0_Trap_Instruction_0x17f:
#ifdef H_T0_Trap_Instruction_0x17f
#ifdef SUN_H_T0_Trap_Instruction_0x17f
                SUN_H_T0_Trap_Instruction_0x17f
#else
#               ifdef My_T0_Trap_Instruction_0x17f
                        My_T0_Trap_Instruction_0x17f
#               else
                        CUSTOM_TRAP(H_T0_Trap_Instruction_0x17f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17f);
#endif

.align 0x1000	/* align to 0x3000 , tt=0x180 */

T0_Trap_Instruction_0x180:
#ifdef H_T0_Trap_Instruction_0x180
#ifdef SUN_H_T0_Trap_Instruction_0x180
        SUN_H_T0_Trap_Instruction_0x180
#else
#       ifdef My_T0_Trap_Instruction_0x180
                My_T0_Trap_Instruction_0x180
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x180)
#       endif
#endif
#else
        NORMAL_TRAP(0x180);
#endif

.align 512	/* align to 0x3200 , tt=0x190 */
T0_Trap_Instruction_0x190:
#ifdef H_T0_Trap_Instruction_0x190
#ifdef SUN_H_T0_Trap_Instruction_0x190
        SUN_H_T0_Trap_Instruction_0x190
#else
#       ifdef My_T0_Trap_Instruction_0x190
                My_T0_Trap_Instruction_0x190
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x190)
#       endif
#endif
#else
        NORMAL_TRAP(0x190);
#endif

.align 256	/* align to 0x3300 , tt = 0x198 */
T0_Trap_Instruction_0x198:
#ifdef H_T0_Trap_Instruction_0x198
#ifdef SUN_H_T0_Trap_Instruction_0x198
        SUN_H_T0_Trap_Instruction_0x198
#else
#       ifdef My_T0_Trap_Instruction_0x198
                My_T0_Trap_Instruction_0x198
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x198)
#       endif
#endif
#else
        NORMAL_TRAP(0x198);
#endif

.align 32

T0_Trap_Instruction_0x199:
#ifdef H_T0_Trap_Instruction_0x199
#ifdef SUN_H_T0_Trap_Instruction_0x199
        SUN_H_T0_Trap_Instruction_0x199
#else
#       ifdef My_T0_Trap_Instruction_0x199
                My_T0_Trap_Instruction_0x199
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x199)
#       endif
#endif
#else
        NORMAL_TRAP(0x199);
#endif

	
.align 0x4000


T1_Reserved_0x00:	
#ifdef H_T1_Reserved_0x00
#ifdef SUN_H_T1_Reserved_0x00
	 SUN_H_T1_Reserved_0x00 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

T1_Reserved_0x01:		
#ifdef H_T1_Reserved_0x01
#ifdef SUN_H_T1_Reserved_0x01
	 SUN_H_T1_Reserved_0x01 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T1_Reserved_0x02:		
#ifdef H_T1_Reserved_0x02
#ifdef SUN_H_T1_Reserved_0x02
	 SUN_H_T1_Reserved_0x02 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x02)
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

T1_Reserved_0x03:		
#ifdef H_T1_Reserved_0x03
#ifdef SUN_H_T1_Reserved_0x03
	 SUN_H_T1_Reserved_0x03 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

T1_Reserved_0x04:		
#ifdef H_T1_Reserved_0x04
#ifdef SUN_H_T1_Reserved_0x04
	 SUN_H_T1_Reserved_0x04 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

T1_Reserved_0x05:		
#ifdef H_T1_Reserved_0x05
#ifdef SUN_H_T1_Reserved_0x05
	 SUN_H_T1_Reserved_0x05 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

T1_Reserved_0x06:		
#ifdef H_T1_Reserved_0x06
#ifdef SUN_H_T1_Reserved_0x06
	 SUN_H_T1_Reserved_0x06 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

T1_Reserved_0x07:		
#ifdef H_T1_Reserved_0x07
#ifdef SUN_H_T1_Reserved_0x07
	 SUN_H_T1_Reserved_0x07 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

T1_Reserved_0x08:		
#ifdef H_T1_Reserved_0x08
#ifdef SUN_H_T1_Reserved_0x08
	 SUN_H_T1_Reserved_0x08 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x08)
#endif
.align 32
#else
	NORMAL_TRAP(0x08); 
#endif

T1_Reserved_0x09:		
#ifdef H_T1_Reserved_0x09
#ifdef SUN_H_T1_Reserved_0x09
	 SUN_H_T1_Reserved_0x09 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x09)
#endif
.align 32
#else
	NORMAL_TRAP(0x09); 
#endif

T1_Reserved_0x0a:		
#ifdef H_T1_Reserved_0x0a
#ifdef SUN_H_T1_Reserved_0x0a
	 SUN_H_T1_Reserved_0x0a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0a)
#endif
.align 32
#else
#ifdef ENABLE_ITLB_ERROR_TRAP
	stxa %g0, [%g0] 0x60; retry; nop; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x0a); 
#endif
#endif

T1_Reserved_0x0b:		
#ifdef H_T1_Reserved_0x0b
#ifdef SUN_H_T1_Reserved_0x0b
	 SUN_H_T1_Reserved_0x0b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

T1_Reserved_0x0c:		
#ifdef H_T1_Reserved_0x0c
#ifdef SUN_H_T1_Reserved_0x0c
	 SUN_H_T1_Reserved_0x0c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

T1_Reserved_0x0d:		
#ifdef H_T1_Reserved_0x0d
#ifdef SUN_H_T1_Reserved_0x0d
	 SUN_H_T1_Reserved_0x0d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0d)
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

T1_Reserved_0x0e:		
#ifdef H_T1_Reserved_0x0e
#ifdef SUN_H_T1_Reserved_0x0e
	 SUN_H_T1_Reserved_0x0e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

T1_Reserved_0x0f:		
#ifdef H_T1_Reserved_0x0f
#ifdef SUN_H_T1_Reserved_0x0f
	 SUN_H_T1_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

T1_Illegal_Instruction_0x10:
#ifdef H_T1_Illegal_instruction_0x10
#ifdef SUN_H_T1_Illegal_instruction_0x10
	 SUN_H_T1_Illegal_instruction_0x10 
#else
#	ifdef My_T1_Illegal_instruction_0x10
		My_T1_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_T1_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

T1_Reserved_0x11:		
#ifdef H_T1_Reserved_0x11
#ifdef SUN_H_T1_Reserved_0x11
	 SUN_H_T1_Reserved_0x11 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x11)
#endif
.align 32
#else
	NORMAL_TRAP(0x11); 
#endif

T1_Reserved_0x12:		
#ifdef H_T1_Reserved_0x12
#ifdef SUN_H_T1_Reserved_0x12
	 SUN_H_T1_Reserved_0x12 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12); 
#endif

T1_Reserved_0x13:		
#ifdef H_T1_Reserved_0x13
#ifdef SUN_H_T1_Reserved_0x13
	 SUN_H_T1_Reserved_0x13 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13); 
#endif

T1_Reserved_0x14:		
#ifdef H_T1_Reserved_0x14
#ifdef SUN_H_T1_Reserved_0x14
	 SUN_H_T1_Reserved_0x14 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

T1_Reserved_0x15:		
#ifdef H_T1_Reserved_0x15
#ifdef SUN_H_T1_Reserved_0x15
	 SUN_H_T1_Reserved_0x15 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

T1_Reserved_0x16:		
#ifdef H_T1_Reserved_0x16
#ifdef SUN_H_T1_Reserved_0x16
	 SUN_H_T1_Reserved_0x16 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

T1_Reserved_0x17:		
#ifdef H_T1_Reserved_0x17
#ifdef SUN_H_T1_Reserved_0x17
	 SUN_H_T1_Reserved_0x17 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

T1_Reserved_0x18:		
#ifdef H_T1_Reserved_0x18
#ifdef SUN_H_T1_Reserved_0x18
	 SUN_H_T1_Reserved_0x18 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

T1_Reserved_0x19:		
#ifdef H_T1_Reserved_0x19
#ifdef SUN_H_T1_Reserved_0x19
	 SUN_H_T1_Reserved_0x19 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

T1_Reserved_0x1a:		
#ifdef H_T1_Reserved_0x1a
#ifdef SUN_H_T1_Reserved_0x1a
	 SUN_H_T1_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

T1_Reserved_0x1b:		
#ifdef H_T1_Reserved_0x1b
#ifdef SUN_H_T1_Reserved_0x1b
	 SUN_H_T1_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

T1_Reserved_0x1c:		
#ifdef H_T1_Reserved_0x1c
#ifdef SUN_H_T1_Reserved_0x1c
	 SUN_H_T1_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

T1_Reserved_0x1d:		
#ifdef H_T1_Reserved_0x1d
#ifdef SUN_H_T1_Reserved_0x1d
	 SUN_H_T1_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

T1_Reserved_0x1e:		
#ifdef H_T1_Reserved_0x1e
#ifdef SUN_H_T1_Reserved_0x1e
	 SUN_H_T1_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

T1_Reserved_0x1f:		
#ifdef H_T1_Reserved_0x1f
#ifdef SUN_H_T1_Reserved_0x1f
	 SUN_H_T1_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

T1_Reserved_0x20:		
#ifdef H_T1_Reserved_0x20
#ifdef SUN_H_T1_Reserved_0x20
	 SUN_H_T1_Reserved_0x20 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x20)
#endif
.align 32
#else
	NORMAL_TRAP(0x20); 
#endif

T1_Reserved_0x21:		
#ifdef H_T1_Reserved_0x21
#ifdef SUN_H_T1_Reserved_0x21
	 SUN_H_T1_Reserved_0x21 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x21)
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

T1_Reserved_0x22:		
#ifdef H_T1_Reserved_0x22
#ifdef SUN_H_T1_Reserved_0x22
	 SUN_H_T1_Reserved_0x22 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x22)
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

T1_Reserved_0x23:		
#ifdef H_T1_Reserved_0x23
#ifdef SUN_H_T1_Reserved_0x23
	 SUN_H_T1_Reserved_0x23 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x23)
#endif
.align 32
#else
	NORMAL_TRAP(0x23); 
#endif

.align 32
T1_Clean_Window_0x24:
#ifdef H_T0_Clean_Window
#ifdef SUN_H_T0_Clean_Window
	 SUN_H_T0_Clean_Window 
#else
#	ifdef My_T0_Clean_Window
		My_T0_Clean_Window
#	else
		CUSTOM_TRAP(H_T0_Clean_Window)
#	endif
#endif
#else                
#ifdef CLEAN_WIN_RETRY
	rdpr %cleanwin, %g1; add %g1,1,%g1; wrpr %g1, %g0, %cleanwin; retry;
#else
	restore; mov 0x24, %g7; b TrapCheck;  nop;nop;nop;nop;nop;
#endif
#endif

T1_Reserved_0x25:		
#ifdef H_T1_Reserved_0x25
#ifdef SUN_H_T1_Reserved_0x25
	 SUN_H_T1_Reserved_0x25 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x25)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T1_Reserved_0x26:		
#ifdef H_T1_Reserved_0x26
#ifdef SUN_H_T1_Reserved_0x26
	 SUN_H_T1_Reserved_0x26 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x26)
#endif
.align 32
#else
	NORMAL_TRAP(0x26); 
#endif

T1_Reserved_0x27:		
#ifdef H_T1_Reserved_0x27
#ifdef SUN_H_T1_Reserved_0x27
	 SUN_H_T1_Reserved_0x27 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x27)
#endif
.align 32
#else
	NORMAL_TRAP(0x27); 
#endif

T1_Reserved_0x28:		
#ifdef H_T1_Reserved_0x28
#ifdef SUN_H_T1_Reserved_0x28
	 SUN_H_T1_Reserved_0x28 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x28)
#endif
.align 32
#else
	NORMAL_TRAP(0x28); 
#endif

T1_Reserved_0x29:		
#ifdef H_T1_Reserved_0x29
#ifdef SUN_H_T1_Reserved_0x29
	 SUN_H_T1_Reserved_0x29 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

T1_Reserved_0x2a:		
#ifdef H_T1_Reserved_0x2a
#ifdef SUN_H_T1_Reserved_0x2a
	 SUN_H_T1_Reserved_0x2a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

T1_Reserved_0x2b:		
#ifdef H_T1_Reserved_0x2b
#ifdef SUN_H_T1_Reserved_0x2b
	 SUN_H_T1_Reserved_0x2b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

T1_Reserved_0x2c:		
#ifdef H_T1_Reserved_0x2c
#ifdef SUN_H_T1_Reserved_0x2c
	 SUN_H_T1_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

T1_Reserved_0x2d:		
#ifdef H_T1_Reserved_0x2d
#ifdef SUN_H_T1_Reserved_0x2d
	 SUN_H_T1_Reserved_0x2d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

T1_Reserved_0x2e:		
#ifdef H_T1_Reserved_0x2e
#ifdef SUN_H_T1_Reserved_0x2e
	 SUN_H_T1_Reserved_0x2e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

T1_Reserved_0x2f:		
#ifdef H_T1_Reserved_0x2f
#ifdef SUN_H_T1_Reserved_0x2f
	 SUN_H_T1_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

T1_Reserved_0x30:		
#ifdef H_T1_Reserved_0x30
#ifdef SUN_H_T1_Reserved_0x30
	 SUN_H_T1_Reserved_0x30 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x30)
#endif
.align 32
#else
	NORMAL_TRAP(0x30); 
#endif

T1_Reserved_0x31:		
#ifdef H_T1_Reserved_0x31
#ifdef SUN_H_T1_Reserved_0x31
	 SUN_H_T1_Reserved_0x31 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x31)
#endif
.align 32
#else
	NORMAL_TRAP(0x31); 
#endif

T1_Reserved_0x32:		
#ifdef H_T1_Reserved_0x32
#ifdef SUN_H_T1_Reserved_0x32
	 SUN_H_T1_Reserved_0x32 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x32)
#endif
.align 32
#else
#ifdef ENABLE_DTLB_ERROR_TRAP
	mov 8, %g3; stxa %g0, [%g3] 0x60; retry; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x32); 
#endif
#endif

T1_Reserved_0x33:		
#ifdef H_T1_Reserved_0x33
#ifdef SUN_H_T1_Reserved_0x33
	 SUN_H_T1_Reserved_0x33 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x33)
#endif
.align 32
#else
	NORMAL_TRAP(0x33); 
#endif

T1_Mem_Address_Not_Aligned_0x34:		
#ifdef H_T1_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_T1_Mem_Address_Not_Aligned_0x34
	 SUN_H_T1_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_T1_Mem_Address_Not_Aligned_0x34
		My_T1_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_T1_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x34); 
#endif

T1_Reserved_0x35:		
#ifdef H_T1_Reserved_0x35
#ifdef SUN_H_T1_Reserved_0x35
	 SUN_H_T1_Reserved_0x35 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x35)
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

T1_Reserved_0x36:		
#ifdef H_T1_Reserved_0x36
#ifdef SUN_H_T1_Reserved_0x36
	 SUN_H_T1_Reserved_0x36 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x36)
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

T1_Reserved_0x37:		
#ifdef H_T1_Reserved_0x37
#ifdef SUN_H_T1_Reserved_0x37
	 SUN_H_T1_Reserved_0x37 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x37)
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

T1_Reserved_0x38:		
#ifdef H_T1_Reserved_0x38
#ifdef SUN_H_T1_Reserved_0x38
	 SUN_H_T1_Reserved_0x38 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

T1_Reserved_0x39:		
#ifdef H_T1_Reserved_0x39
#ifdef SUN_H_T1_Reserved_0x39
	 SUN_H_T1_Reserved_0x39 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

T1_Reserved_0x3a:		
#ifdef H_T1_Reserved_0x3a
#ifdef SUN_H_T1_Reserved_0x3a
	 SUN_H_T1_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

T1_Reserved_0x3b:		
#ifdef H_T1_Reserved_0x3b
#ifdef SUN_H_T1_Reserved_0x3b
	 SUN_H_T1_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

T1_Reserved_0x3c:		
#ifdef H_T1_Reserved_0x3c
#ifdef SUN_H_T1_Reserved_0x3c
	 SUN_H_T1_Reserved_0x3c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3c)
#endif
.align 32
#else
	NORMAL_TRAP(0x3c); 
#endif

T1_Reserved_0x3d:		
#ifdef H_T1_Reserved_0x3d
#ifdef SUN_H_T1_Reserved_0x3d
	 SUN_H_T1_Reserved_0x3d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3d)
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

T1_Reserved_0x3e:		
#ifdef H_T1_Reserved_0x3e
#ifdef SUN_H_T1_Reserved_0x3e
	 SUN_H_T1_Reserved_0x3e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3e)
#endif
.align 32
#else
	NORMAL_TRAP(0x3e); 
#endif

T1_Reserved_0x3f:		
#ifdef H_T1_Reserved_0x3f
#ifdef SUN_H_T1_Reserved_0x3f
	 SUN_H_T1_Reserved_0x3f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3f)
#endif
.align 32
#else
	NORMAL_TRAP(0x3f); 
#endif

T1_Reserved_0x40:		
#ifdef H_T1_Reserved_0x40
#ifdef SUN_H_T1_Reserved_0x40
	 SUN_H_T1_Reserved_0x40 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

T1_Reserved_0x41:		
#ifdef H_T1_Reserved_0x41
#ifdef SUN_H_T1_Reserved_0x41
	 SUN_H_T1_Reserved_0x41 
#else
#       ifdef My_T1_Reserved_0x41
                My_T1_Reserved_0x41
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x41)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

T1_Reserved_0x42:		
#ifdef H_T1_Reserved_0x42
#ifdef SUN_H_T1_Reserved_0x42
	 SUN_H_T1_Reserved_0x42 
#else
#       ifdef My_T1_Reserved_0x42
                My_T1_Reserved_0x42
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x42)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

T1_Reserved_0x43:		
#ifdef H_T1_Reserved_0x43
#ifdef SUN_H_T1_Reserved_0x43
	 SUN_H_T1_Reserved_0x43 
#else
#       ifdef My_T1_Reserved_0x43
                My_T1_Reserved_0x43
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x43)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

T1_Reserved_0x44:		
#ifdef H_T1_Reserved_0x44
#ifdef SUN_H_T1_Reserved_0x44
	 SUN_H_T1_Reserved_0x44 
#else
#       ifdef My_T1_Reserved_0x44
                My_T1_Reserved_0x44
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x44)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

T1_Reserved_0x45:		
#ifdef H_T1_Reserved_0x45
#ifdef SUN_H_T1_Reserved_0x45
	 SUN_H_T1_Reserved_0x45 
#else
#       ifdef My_T1_Reserved_0x45
                My_T1_Reserved_0x45
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x45)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

T1_Reserved_0x46:		
#ifdef H_T1_Reserved_0x46
#ifdef SUN_H_T1_Reserved_0x46
	 SUN_H_T1_Reserved_0x46 
#else
#       ifdef My_T1_Reserved_0x46
                My_T1_Reserved_0x46
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x46)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

T1_Reserved_0x47:		
#ifdef H_T1_Reserved_0x47
#ifdef SUN_H_T1_Reserved_0x47
	 SUN_H_T1_Reserved_0x47 
#else
#       ifdef My_T1_Reserved_0x47
                My_T1_Reserved_0x47
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x47)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

T1_Reserved_0x48:		
#ifdef H_T1_Reserved_0x48
#ifdef SUN_H_T1_Reserved_0x48
	 SUN_H_T1_Reserved_0x48 
#else
#       ifdef My_T1_Reserved_0x48
                My_T1_Reserved_0x48
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x48)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

T1_Reserved_0x49:		
#ifdef H_T1_Reserved_0x49
#ifdef SUN_H_T1_Reserved_0x49
	 SUN_H_T1_Reserved_0x49 
#else
#       ifdef My_T1_Reserved_0x49
                My_T1_Reserved_0x49
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x49)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

T1_Reserved_0x4a:		
#ifdef H_T1_Reserved_0x4a
#ifdef SUN_H_T1_Reserved_0x4a
	 SUN_H_T1_Reserved_0x4a 
#else
#       ifdef My_T1_Reserved_0x4a
                My_T1_Reserved_0x4a
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4a)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

T1_Reserved_0x4b:		
#ifdef H_T1_Reserved_0x4b
#ifdef SUN_H_T1_Reserved_0x4b
	 SUN_H_T1_Reserved_0x4b 
#else
#       ifdef My_T1_Reserved_0x4b
                My_T1_Reserved_0x4b
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4b)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

T1_Reserved_0x4c:		
#ifdef H_T1_Reserved_0x4c
#ifdef SUN_H_T1_Reserved_0x4c
	 SUN_H_T1_Reserved_0x4c 
#else
#       ifdef My_T1_Reserved_0x4c
                My_T1_Reserved_0x4c
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4c)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

T1_Reserved_0x4d:		
#ifdef H_T1_Reserved_0x4d
#ifdef SUN_H_T1_Reserved_0x4d
	 SUN_H_T1_Reserved_0x4d 
#else
#       ifdef My_T1_Reserved_0x4d
                My_T1_Reserved_0x4d
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4d)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

T1_Reserved_0x4e:		
#ifdef H_T1_Reserved_0x4e
#ifdef SUN_H_T1_Reserved_0x4e
	 SUN_H_T1_Reserved_0x4e 
#else
#       ifdef My_T1_Reserved_0x4e
                My_T1_Reserved_0x4e
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

T1_Reserved_0x4f:		
#ifdef H_T1_Reserved_0x4f
#ifdef SUN_H_T1_Reserved_0x4f
	 SUN_H_T1_Reserved_0x4f 
#else
#       ifdef My_T1_Reserved_0x4f
                My_T1_Reserved_0x4f
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x4f)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

T1_Reserved_0x50:		
#ifdef H_T1_Reserved_0x50
#ifdef SUN_H_T1_Reserved_0x50
	 SUN_H_T1_Reserved_0x50 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

T1_Reserved_0x51:		
#ifdef H_T1_Reserved_0x51
#ifdef SUN_H_T1_Reserved_0x51
	 SUN_H_T1_Reserved_0x51 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

T1_Reserved_0x52:		
#ifdef H_T1_Reserved_0x52
#ifdef SUN_H_T1_Reserved_0x52
	 SUN_H_T1_Reserved_0x52 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

T1_Reserved_0x53:		
#ifdef H_T1_Reserved_0x53
#ifdef SUN_H_T1_Reserved_0x53
	 SUN_H_T1_Reserved_0x53 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

T1_Reserved_0x54:		
#ifdef H_T1_Reserved_0x54
#ifdef SUN_H_T1_Reserved_0x54
	 SUN_H_T1_Reserved_0x54 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

T1_Reserved_0x55:		
#ifdef H_T1_Reserved_0x55
#ifdef SUN_H_T1_Reserved_0x55
	 SUN_H_T1_Reserved_0x55 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

T1_Reserved_0x56:		
#ifdef H_T1_Reserved_0x56
#ifdef SUN_H_T1_Reserved_0x56
	 SUN_H_T1_Reserved_0x56 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

T1_Reserved_0x57:		
#ifdef H_T1_Reserved_0x57
#ifdef SUN_H_T1_Reserved_0x57
	 SUN_H_T1_Reserved_0x57 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

T1_Reserved_0x58:		
#ifdef H_T1_Reserved_0x58
#ifdef SUN_H_T1_Reserved_0x58
	 SUN_H_T1_Reserved_0x58 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

T1_Reserved_0x59:		
#ifdef H_T1_Reserved_0x59
#ifdef SUN_H_T1_Reserved_0x59
	 SUN_H_T1_Reserved_0x59 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

T1_Reserved_0x5a:		
#ifdef H_T1_Reserved_0x5a
#ifdef SUN_H_T1_Reserved_0x5a
	 SUN_H_T1_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

T1_Reserved_0x5b:		
#ifdef H_T1_Reserved_0x5b
#ifdef SUN_H_T1_Reserved_0x5b
	 SUN_H_T1_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

T1_Reserved_0x5c:		
#ifdef H_T1_Reserved_0x5c
#ifdef SUN_H_T1_Reserved_0x5c
	 SUN_H_T1_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

T1_Reserved_0x5d:		
#ifdef H_T1_Reserved_0x5d
#ifdef SUN_H_T1_Reserved_0x5d
	 SUN_H_T1_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

T1_Reserved_0x5e:		
#ifdef H_T1_Reserved_0x5e
#ifdef SUN_H_T1_Reserved_0x5e
	 SUN_H_T1_Reserved_0x5e 
#else
#       ifdef My_T1_Reserved_0x5e
                My_T1_Reserved_0x5e
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x5e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x5e); 
#endif

T1_Reserved_0x5f:		
#ifdef H_T1_Reserved_0x5f
#ifdef SUN_H_T1_Reserved_0x5f
	 SUN_H_T1_Reserved_0x5f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5f)
#endif
.align 32
#else
	NORMAL_TRAP(0x5f); 
#endif

T1_Reserved_0x60:		
#ifdef H_T1_Reserved_0x60
#ifdef SUN_H_T1_Reserved_0x60
	 SUN_H_T1_Reserved_0x60 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x60)
#endif
.align 32
#else
	NORMAL_TRAP(0x60); 
#endif

T1_Reserved_0x61:		
#ifdef H_T1_Reserved_0x61
#ifdef SUN_H_T1_Reserved_0x61
	 SUN_H_T1_Reserved_0x61 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x61)
#endif
.align 32
#else
	NORMAL_TRAP(0x61); 
#endif

T1_Reserved_0x62:		
#ifdef H_T1_Reserved_0x62
#ifdef SUN_H_T1_Reserved_0x62
	 SUN_H_T1_Reserved_0x62 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x62)
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

T1_Reserved_0x63:		
#ifdef H_T1_Reserved_0x63
#ifdef SUN_H_T1_Reserved_0x63
	 SUN_H_T1_Reserved_0x63 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x63)
#endif
.align 32
#else
	CORRECTED_ECC_ERROR_TRAP(0x63);
#endif

T1_Fast_Instr_Access_MMU_Miss_0x64:
#ifdef H_T1_fast_instr_access_MMU_miss_0x64
#ifdef SUN_H_T1_fast_instr_access_MMU_miss_0x64
	 SUN_H_T1_fast_instr_access_MMU_miss_0x64 
#else
        CUSTOM_TRAP(H_T1_fast_instr_access_MMU_miss_0x64)
#endif
.align 32
#else
#ifdef  HPV_NONSPLIT_MODE
#include "immu_miss_handler.s"
#else
nop     ! immu trap is now handled in hypervisor
#endif  
#endif

.align 128	
T1_Fast_Data_Access_MMU_Miss_0x68:
#ifdef H_T1_fast_data_access_MMU_miss_0x68
#ifdef SUN_H_T1_fast_data_access_MMU_miss_0x68
	 SUN_H_T1_fast_data_access_MMU_miss_0x68 
#else
        CUSTOM_TRAP(H_T1_fast_data_access_MMU_miss_0x68)
#endif
.align 32
#else
#ifdef  HPV_NONSPLIT_MODE
#include "dmmu_miss_handler.s"
#else
nop     ! dmmu trap is now handled in hypervisor
#endif
#endif

.align 128	

T1_Fast_Data_Access_Protection_0x6c:		
#ifdef H_T1_data_access_protection_0x6c
#ifdef SUN_H_T1_data_access_protection_0x6c
	 SUN_H_T1_data_access_protection_0x6c 
#else
        CUSTOM_TRAP(H_T1_data_access_protection_0x6c)
#endif
.align 32
#else
	NORMAL_TRAP(0x6c); 
#endif

T1_Reserved_0x6d:		
#ifdef H_T1_Reserved_0x6d
#ifdef SUN_H_T1_Reserved_0x6d
	 SUN_H_T1_Reserved_0x6d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6d)
#endif
.align 32
#else
	NORMAL_TRAP(0x6d); 
#endif

T1_Reserved_0x6e:		
#ifdef H_T1_Reserved_0x6e
#ifdef SUN_H_T1_Reserved_0x6e
	 SUN_H_T1_Reserved_0x6e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6e)
#endif
.align 32
#else
	NORMAL_TRAP(0x6e); 
#endif

T1_Reserved_0x6f:		
#ifdef H_T1_Reserved_0x6f
#ifdef SUN_H_T1_Reserved_0x6f
	 SUN_H_T1_Reserved_0x6f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6f)
#endif
.align 32
#else
	NORMAL_TRAP(0x6f); 
#endif

T1_Reserved_0x70:		
#ifdef H_T1_Reserved_0x70
#ifdef SUN_H_T1_Reserved_0x70
	 SUN_H_T1_Reserved_0x70 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

T1_Reserved_0x71:		
#ifdef H_T1_Reserved_0x71
#ifdef SUN_H_T1_Reserved_0x71
	 SUN_H_T1_Reserved_0x71 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

T1_Reserved_0x72:		
#ifdef H_T1_Reserved_0x72
#ifdef SUN_H_T1_Reserved_0x72
	 SUN_H_T1_Reserved_0x72 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

T1_Reserved_0x73:		
#ifdef H_T1_Reserved_0x73
#ifdef SUN_H_T1_Reserved_0x73
	 SUN_H_T1_Reserved_0x73 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

T1_Reserved_0x74:		
#ifdef H_T1_Reserved_0x74
#ifdef SUN_H_T1_Reserved_0x74
	 SUN_H_T1_Reserved_0x74 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x74)
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

T1_Reserved_0x75:		
#ifdef H_T1_Reserved_0x75
#ifdef SUN_H_T1_Reserved_0x75
	 SUN_H_T1_Reserved_0x75 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

T1_Reserved_0x76:		
#ifdef H_T1_Reserved_0x76
#ifdef SUN_H_T1_Reserved_0x76
	 SUN_H_T1_Reserved_0x76 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

T1_Reserved_0x77:		
#ifdef H_T1_Reserved_0x77
#ifdef SUN_H_T1_Reserved_0x77
	 SUN_H_T1_Reserved_0x77 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

T1_Reserved_0x78:		
#ifdef H_T1_Reserved_0x78
#ifdef SUN_H_T1_Reserved_0x78
	 SUN_H_T1_Reserved_0x78 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

T1_Reserved_0x79:		
#ifdef H_T1_Reserved_0x79
#ifdef SUN_H_T1_Reserved_0x79
	 SUN_H_T1_Reserved_0x79 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

T1_Reserved_0x7a:		
#ifdef H_T1_Reserved_0x7a
#ifdef SUN_H_T1_Reserved_0x7a
	 SUN_H_T1_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

T1_Reserved_0x7b:		
#ifdef H_T1_Reserved_0x7b
#ifdef SUN_H_T1_Reserved_0x7b
	 SUN_H_T1_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

T1_Reserved_0x7c:		
#ifdef H_T1_Reserved_0x7c
#ifdef SUN_H_T1_Reserved_0x7c
	 SUN_H_T1_Reserved_0x7c 
#else
#	ifdef My_T1_Reserved_0x7c
		My_T1_Reserved_0x7c
#	else	
		CUSTOM_TRAP(H_T1_Reserved_0x7c)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

T1_Reserved_0x7d:		
#ifdef H_T1_Reserved_0x7d
#ifdef SUN_H_T1_Reserved_0x7d
	 SUN_H_T1_Reserved_0x7d 
#else
#	ifdef My_T1_Reserved_0x7d
		My_T1_Reserved_0x7d
#	else	
        	CUSTOM_TRAP(H_T1_Reserved_0x7d)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7d); 
#endif

T1_Reserved_0x7e:		
#ifdef H_T1_Reserved_0x7e
#ifdef SUN_H_T1_Reserved_0x7e
	 SUN_H_T1_Reserved_0x7e 
#else
#	ifdef My_T1_Reserved_0x7e
		My_T1_Reserved_0x7e
#	else	
        	CUSTOM_TRAP(H_T1_Reserved_0x7e)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7e); 
#endif

T1_Reserved_0x7f:		
#ifdef H_T1_Reserved_0x7f
#ifdef SUN_H_T1_Reserved_0x7f
	 SUN_H_T1_Reserved_0x7f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7f)
#endif
.align 32
#else
	NORMAL_TRAP(0x7f); 
#endif

T1_Reserved_0x80:		
#ifdef H_T1_Reserved_0x80
#ifdef SUN_H_T1_Reserved_0x80
	 SUN_H_T1_Reserved_0x80 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x80)
#endif
#else
		NORMAL_TRAP(0x80); 
#endif

.align 128	
T1_Reserved_0x84:		
#ifdef H_T1_Reserved_0x84
#ifdef SUN_H_T1_Reserved_0x84
	 SUN_H_T1_Reserved_0x84 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x84)
#endif
#else
		NORMAL_TRAP(0x84); 
#endif

.align 128	
T1_Reserved_0x88:		
#ifdef H_T1_Reserved_0x88
#ifdef SUN_H_T1_Reserved_0x88
	 SUN_H_T1_Reserved_0x88 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x88)
#endif
#else
		NORMAL_TRAP(0x88); 
#endif

.align 128	
T1_Reserved_0x8c:		
#ifdef H_T1_Reserved_0x8c
#ifdef SUN_H_T1_Reserved_0x8c
	 SUN_H_T1_Reserved_0x8c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x8c)
#endif
#else
		NORMAL_TRAP(0x8c); 
#endif
.align 128

T1_Reserved_0x90:		
#ifdef H_T1_Reserved_0x90
#ifdef SUN_H_T1_Reserved_0x90
	 SUN_H_T1_Reserved_0x90 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x90)
#endif
.align 32
#else
	NORMAL_TRAP(0x90); 
#endif

T1_Reserved_0x91:		
#ifdef H_T1_Reserved_0x91
#ifdef SUN_H_T1_Reserved_0x91
	 SUN_H_T1_Reserved_0x91 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x91)
#endif
.align 32
#else
	NORMAL_TRAP(0x91); 
#endif

T1_Reserved_0x92:		
#ifdef H_T1_Reserved_0x92
#ifdef SUN_H_T1_Reserved_0x92
	 SUN_H_T1_Reserved_0x92 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x92)
#endif
.align 32
#else
	NORMAL_TRAP(0x92); 
#endif

T1_Reserved_0x93:		
#ifdef H_T1_Reserved_0x93
#ifdef SUN_H_T1_Reserved_0x93
	 SUN_H_T1_Reserved_0x93 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x93)
#endif
.align 32
#else
	NORMAL_TRAP(0x93); 
#endif

T1_Reserved_0x94:		
#ifdef H_T1_Reserved_0x94
#ifdef SUN_H_T1_Reserved_0x94
	 SUN_H_T1_Reserved_0x94 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x94)
#endif
.align 32
#else
	NORMAL_TRAP(0x94); 
#endif

T1_Reserved_0x95:		
#ifdef H_T1_Reserved_0x95
#ifdef SUN_H_T1_Reserved_0x95
	 SUN_H_T1_Reserved_0x95 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x95)
#endif
.align 32
#else
	NORMAL_TRAP(0x95); 
#endif

T1_Reserved_0x96:		
#ifdef H_T1_Reserved_0x96
#ifdef SUN_H_T1_Reserved_0x96
	 SUN_H_T1_Reserved_0x96 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x96)
#endif
.align 32
#else
	NORMAL_TRAP(0x96); 
#endif

T1_Reserved_0x97:		
#ifdef H_T1_Reserved_0x97
#ifdef SUN_H_T1_Reserved_0x97
	 SUN_H_T1_Reserved_0x97 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x97)
#endif
.align 32
#else
	NORMAL_TRAP(0x97); 
#endif

T1_Reserved_0x98:		
#ifdef H_T1_Reserved_0x98
#ifdef SUN_H_T1_Reserved_0x98
	 SUN_H_T1_Reserved_0x98 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x98)
#endif
.align 32
#else
	NORMAL_TRAP(0x98); 
#endif

T1_Reserved_0x99:		
#ifdef H_T1_Reserved_0x99
#ifdef SUN_H_T1_Reserved_0x99
	 SUN_H_T1_Reserved_0x99 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x99)
#endif
.align 32
#else
	NORMAL_TRAP(0x99); 
#endif

T1_Reserved_0x9a:		
#ifdef H_T1_Reserved_0x9a
#ifdef SUN_H_T1_Reserved_0x9a
	 SUN_H_T1_Reserved_0x9a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9a)
#endif
.align 32
#else
	NORMAL_TRAP(0x9a); 
#endif

T1_Reserved_0x9b:		
#ifdef H_T1_Reserved_0x9b
#ifdef SUN_H_T1_Reserved_0x9b
	 SUN_H_T1_Reserved_0x9b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9b)
#endif
.align 32
#else
	NORMAL_TRAP(0x9b); 
#endif

T1_Reserved_0x9c:		
#ifdef H_T1_Reserved_0x9c
#ifdef SUN_H_T1_Reserved_0x9c
	 SUN_H_T1_Reserved_0x9c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9c)
#endif
.align 32
#else
	NORMAL_TRAP(0x9c); 
#endif

T1_Reserved_0x9d:		
#ifdef H_T1_Reserved_0x9d
#ifdef SUN_H_T1_Reserved_0x9d
	 SUN_H_T1_Reserved_0x9d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9d)
#endif
.align 32
#else
	NORMAL_TRAP(0x9d); 
#endif

T1_Reserved_0x9e:		
#ifdef H_T1_Reserved_0x9e
#ifdef SUN_H_T1_Reserved_0x9e
	 SUN_H_T1_Reserved_0x9e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9e)
#endif
.align 32
#else
	NORMAL_TRAP(0x9e); 
#endif

T1_Reserved_0x9f:		
#ifdef H_T1_Reserved_0x9f
#ifdef SUN_H_T1_Reserved_0x9f
	 SUN_H_T1_Reserved_0x9f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x9f)
#endif
.align 32
#else
	NORMAL_TRAP(0x9f); 
#endif

T1_Reserved_0xa0:		
#ifdef H_T1_Reserved_0xa0
#ifdef SUN_H_T1_Reserved_0xa0
	 SUN_H_T1_Reserved_0xa0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa0)
#endif
.align 32
#else
	NORMAL_TRAP(0xa0); 
#endif

T1_Reserved_0xa1:		
#ifdef H_T1_Reserved_0xa1
#ifdef SUN_H_T1_Reserved_0xa1
	 SUN_H_T1_Reserved_0xa1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa1)
#endif
.align 32
#else
	NORMAL_TRAP(0xa1); 
#endif

T1_Reserved_0xa2:		
#ifdef H_T1_Reserved_0xa2
#ifdef SUN_H_T1_Reserved_0xa2
	 SUN_H_T1_Reserved_0xa2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa2)
#endif
.align 32
#else
	NORMAL_TRAP(0xa2); 
#endif

T1_Reserved_0xa3:		
#ifdef H_T1_Reserved_0xa3
#ifdef SUN_H_T1_Reserved_0xa3
	 SUN_H_T1_Reserved_0xa3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa3)
#endif
.align 32
#else
	NORMAL_TRAP(0xa3); 
#endif

T1_Reserved_0xa4:		
#ifdef H_T1_Reserved_0xa4
#ifdef SUN_H_T1_Reserved_0xa4
	 SUN_H_T1_Reserved_0xa4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa4)
#endif
.align 32
#else
	NORMAL_TRAP(0xa4); 
#endif

T1_Reserved_0xa5:		
#ifdef H_T1_Reserved_0xa5
#ifdef SUN_H_T1_Reserved_0xa5
	 SUN_H_T1_Reserved_0xa5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa5)
#endif
.align 32
#else
	NORMAL_TRAP(0xa5); 
#endif

T1_Reserved_0xa6:		
#ifdef H_T1_Reserved_0xa6
#ifdef SUN_H_T1_Reserved_0xa6
	 SUN_H_T1_Reserved_0xa6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa6)
#endif
.align 32
#else
	NORMAL_TRAP(0xa6); 
#endif

T1_Reserved_0xa7:		
#ifdef H_T1_Reserved_0xa7
#ifdef SUN_H_T1_Reserved_0xa7
	 SUN_H_T1_Reserved_0xa7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa7)
#endif
.align 32
#else
	NORMAL_TRAP(0xa7); 
#endif

T1_Reserved_0xa8:		
#ifdef H_T1_Reserved_0xa8
#ifdef SUN_H_T1_Reserved_0xa8
	 SUN_H_T1_Reserved_0xa8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa8)
#endif
.align 32
#else
	NORMAL_TRAP(0xa8); 
#endif

T1_Reserved_0xa9:		
#ifdef H_T1_Reserved_0xa9
#ifdef SUN_H_T1_Reserved_0xa9
	 SUN_H_T1_Reserved_0xa9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xa9)
#endif
.align 32
#else
	NORMAL_TRAP(0xa9); 
#endif

T1_Reserved_0xaa:		
#ifdef H_T1_Reserved_0xaa
#ifdef SUN_H_T1_Reserved_0xaa
	 SUN_H_T1_Reserved_0xaa 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xaa)
#endif
.align 32
#else
	NORMAL_TRAP(0xaa); 
#endif

T1_Reserved_0xab:		
#ifdef H_T1_Reserved_0xab
#ifdef SUN_H_T1_Reserved_0xab
	 SUN_H_T1_Reserved_0xab 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xab)
#endif
.align 32
#else
	NORMAL_TRAP(0xab); 
#endif

T1_Reserved_0xac:		
#ifdef H_T1_Reserved_0xac
#ifdef SUN_H_T1_Reserved_0xac
	 SUN_H_T1_Reserved_0xac 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xac)
#endif
.align 32
#else
	NORMAL_TRAP(0xac); 
#endif

T1_Reserved_0xad:		
#ifdef H_T1_Reserved_0xad
#ifdef SUN_H_T1_Reserved_0xad
	 SUN_H_T1_Reserved_0xad 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xad)
#endif
.align 32
#else
	NORMAL_TRAP(0xad); 
#endif

T1_Reserved_0xae:		
#ifdef H_T1_Reserved_0xae
#ifdef SUN_H_T1_Reserved_0xae
	 SUN_H_T1_Reserved_0xae 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xae)
#endif
.align 32
#else
	NORMAL_TRAP(0xae); 
#endif

T1_Reserved_0xaf:		
#ifdef H_T1_Reserved_0xaf
#ifdef SUN_H_T1_Reserved_0xaf
	 SUN_H_T1_Reserved_0xaf 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xaf)
#endif
.align 32
#else
	NORMAL_TRAP(0xaf); 
#endif

T1_Reserved_0xb0:		
#ifdef H_T1_Reserved_0xb0
#ifdef SUN_H_T1_Reserved_0xb0
	 SUN_H_T1_Reserved_0xb0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb0)
#endif
.align 32
#else
	NORMAL_TRAP(0xb0); 
#endif

T1_Reserved_0xb1:		
#ifdef H_T1_Reserved_0xb1
#ifdef SUN_H_T1_Reserved_0xb1
	 SUN_H_T1_Reserved_0xb1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb1)
#endif
.align 32
#else
	NORMAL_TRAP(0xb1); 
#endif

T1_Reserved_0xb2:		
#ifdef H_T1_Reserved_0xb2
#ifdef SUN_H_T1_Reserved_0xb2
	 SUN_H_T1_Reserved_0xb2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb2)
#endif
.align 32
#else
	NORMAL_TRAP(0xb2); 
#endif

T1_Reserved_0xb3:		
#ifdef H_T1_Reserved_0xb3
#ifdef SUN_H_T1_Reserved_0xb3
	 SUN_H_T1_Reserved_0xb3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb3)
#endif
.align 32
#else
	NORMAL_TRAP(0xb3); 
#endif

T1_Reserved_0xb4:		
#ifdef H_T1_Reserved_0xb4
#ifdef SUN_H_T1_Reserved_0xb4
	 SUN_H_T1_Reserved_0xb4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb4)
#endif
.align 32
#else
	NORMAL_TRAP(0xb4); 
#endif

T1_Reserved_0xb5:		
#ifdef H_T1_Reserved_0xb5
#ifdef SUN_H_T1_Reserved_0xb5
	 SUN_H_T1_Reserved_0xb5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb5)
#endif
.align 32
#else
	NORMAL_TRAP(0xb5); 
#endif

T1_Reserved_0xb6:		
#ifdef H_T1_Reserved_0xb6
#ifdef SUN_H_T1_Reserved_0xb6
	 SUN_H_T1_Reserved_0xb6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb6)
#endif
.align 32
#else
	NORMAL_TRAP(0xb6); 
#endif

T1_Reserved_0xb7:		
#ifdef H_T1_Reserved_0xb7
#ifdef SUN_H_T1_Reserved_0xb7
	 SUN_H_T1_Reserved_0xb7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb7)
#endif
.align 32
#else
	NORMAL_TRAP(0xb7); 
#endif

T1_Reserved_0xb8:		
#ifdef H_T1_Reserved_0xb8
#ifdef SUN_H_T1_Reserved_0xb8
	 SUN_H_T1_Reserved_0xb8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb8)
#endif
.align 32
#else
	NORMAL_TRAP(0xb8); 
#endif

T1_Reserved_0xb9:		
#ifdef H_T1_Reserved_0xb9
#ifdef SUN_H_T1_Reserved_0xb9
	 SUN_H_T1_Reserved_0xb9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xb9)
#endif
.align 32
#else
	NORMAL_TRAP(0xb9); 
#endif

T1_Reserved_0xba:		
#ifdef H_T1_Reserved_0xba
#ifdef SUN_H_T1_Reserved_0xba
	 SUN_H_T1_Reserved_0xba 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xba)
#endif
.align 32
#else
	NORMAL_TRAP(0xba); 
#endif

T1_Reserved_0xbb:		
#ifdef H_T1_Reserved_0xbb
#ifdef SUN_H_T1_Reserved_0xbb
	 SUN_H_T1_Reserved_0xbb 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xbb)
#endif
.align 32
#else
	NORMAL_TRAP(0xbb); 
#endif

T1_Reserved_0xbc:		
#ifdef H_T1_Reserved_0xbc
#ifdef SUN_H_T1_Reserved_0xbc
	 SUN_H_T1_Reserved_0xbc 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xbc)
#endif
.align 32
#else
	NORMAL_TRAP(0xbc); 
#endif

T1_Reserved_0xbd:		
#ifdef H_T1_Reserved_0xbd
#ifdef SUN_H_T1_Reserved_0xbd
	 SUN_H_T1_Reserved_0xbd 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xbd)
#endif
.align 32
#else
	NORMAL_TRAP(0xbd); 
#endif

T1_Reserved_0xbe:		
#ifdef H_T1_Reserved_0xbe
#ifdef SUN_H_T1_Reserved_0xbe
	 SUN_H_T1_Reserved_0xbe 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xbe)
#endif
.align 32
#else
	NORMAL_TRAP(0xbe); 
#endif

T1_Reserved_0xbf:		
#ifdef H_T1_Reserved_0xbf
#ifdef SUN_H_T1_Reserved_0xbf
	 SUN_H_T1_Reserved_0xbf 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xbf)
#endif
.align 32
#else
	NORMAL_TRAP(0xbf); 
#endif

T1_Reserved_0xc0:		
#ifdef H_T1_Reserved_0xc0
#ifdef SUN_H_T1_Reserved_0xc0
	 SUN_H_T1_Reserved_0xc0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc0)
#endif
.align 32
#else
	NORMAL_TRAP(0xc0); 
#endif

T1_Reserved_0xc1:		
#ifdef H_T1_Reserved_0xc1
#ifdef SUN_H_T1_Reserved_0xc1
	 SUN_H_T1_Reserved_0xc1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc1)
#endif
.align 32
#else
	NORMAL_TRAP(0xc1); 
#endif

T1_Reserved_0xc2:		
#ifdef H_T1_Reserved_0xc2
#ifdef SUN_H_T1_Reserved_0xc2
	 SUN_H_T1_Reserved_0xc2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc2)
#endif
.align 32
#else
	NORMAL_TRAP(0xc2); 
#endif

T1_Reserved_0xc3:		
#ifdef H_T1_Reserved_0xc3
#ifdef SUN_H_T1_Reserved_0xc3
	 SUN_H_T1_Reserved_0xc3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc3)
#endif
.align 32
#else
	NORMAL_TRAP(0xc3); 
#endif

T1_Reserved_0xc4:		
#ifdef H_T1_Reserved_0xc4
#ifdef SUN_H_T1_Reserved_0xc4
	 SUN_H_T1_Reserved_0xc4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc4)
#endif
.align 32
#else
	NORMAL_TRAP(0xc4); 
#endif

T1_Reserved_0xc5:		
#ifdef H_T1_Reserved_0xc5
#ifdef SUN_H_T1_Reserved_0xc5
	 SUN_H_T1_Reserved_0xc5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc5)
#endif
.align 32
#else
	NORMAL_TRAP(0xc5); 
#endif

T1_Reserved_0xc6:		
#ifdef H_T1_Reserved_0xc6
#ifdef SUN_H_T1_Reserved_0xc6
	 SUN_H_T1_Reserved_0xc6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc6)
#endif
.align 32
#else
	NORMAL_TRAP(0xc6); 
#endif

T1_Reserved_0xc7:		
#ifdef H_T1_Reserved_0xc7
#ifdef SUN_H_T1_Reserved_0xc7
	 SUN_H_T1_Reserved_0xc7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc7)
#endif
.align 32
#else
	NORMAL_TRAP(0xc7); 
#endif

T1_Reserved_0xc8:		
#ifdef H_T1_Reserved_0xc8
#ifdef SUN_H_T1_Reserved_0xc8
	 SUN_H_T1_Reserved_0xc8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc8)
#endif
.align 32
#else
	NORMAL_TRAP(0xc8); 
#endif

T1_Reserved_0xc9:		
#ifdef H_T1_Reserved_0xc9
#ifdef SUN_H_T1_Reserved_0xc9
	 SUN_H_T1_Reserved_0xc9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xc9)
#endif
.align 32
#else
	NORMAL_TRAP(0xc9); 
#endif

T1_Reserved_0xca:		
#ifdef H_T1_Reserved_0xca
#ifdef SUN_H_T1_Reserved_0xca
	 SUN_H_T1_Reserved_0xca 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xca)
#endif
.align 32
#else
	NORMAL_TRAP(0xca); 
#endif

T1_Reserved_0xcb:		
#ifdef H_T1_Reserved_0xcb
#ifdef SUN_H_T1_Reserved_0xcb
	 SUN_H_T1_Reserved_0xcb 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xcb)
#endif
.align 32
#else
	NORMAL_TRAP(0xcb); 
#endif

T1_Reserved_0xcc:		
#ifdef H_T1_Reserved_0xcc
#ifdef SUN_H_T1_Reserved_0xcc
	 SUN_H_T1_Reserved_0xcc 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xcc)
#endif
.align 32
#else
	NORMAL_TRAP(0xcc); 
#endif

T1_Reserved_0xcd:		
#ifdef H_T1_Reserved_0xcd
#ifdef SUN_H_T1_Reserved_0xcd
	 SUN_H_T1_Reserved_0xcd 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xcd)
#endif
.align 32
#else
	NORMAL_TRAP(0xcd); 
#endif

T1_Reserved_0xce:		
#ifdef H_T1_Reserved_0xce
#ifdef SUN_H_T1_Reserved_0xce
	 SUN_H_T1_Reserved_0xce 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xce)
#endif
.align 32
#else
	NORMAL_TRAP(0xce); 
#endif

T1_Reserved_0xcf:		
#ifdef H_T1_Reserved_0xcf
#ifdef SUN_H_T1_Reserved_0xcf
	 SUN_H_T1_Reserved_0xcf 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xcf)
#endif
.align 32
#else
	NORMAL_TRAP(0xcf); 
#endif

T1_Reserved_0xd0:		
#ifdef H_T1_Reserved_0xd0
#ifdef SUN_H_T1_Reserved_0xd0
	 SUN_H_T1_Reserved_0xd0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd0)
#endif
.align 32
#else
	NORMAL_TRAP(0xd0); 
#endif

T1_Reserved_0xd1:		
#ifdef H_T1_Reserved_0xd1
#ifdef SUN_H_T1_Reserved_0xd1
	 SUN_H_T1_Reserved_0xd1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd1)
#endif
.align 32
#else
	NORMAL_TRAP(0xd1); 
#endif

T1_Reserved_0xd2:		
#ifdef H_T1_Reserved_0xd2
#ifdef SUN_H_T1_Reserved_0xd2
	 SUN_H_T1_Reserved_0xd2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd2)
#endif
.align 32
#else
	NORMAL_TRAP(0xd2); 
#endif

T1_Reserved_0xd3:		
#ifdef H_T1_Reserved_0xd3
#ifdef SUN_H_T1_Reserved_0xd3
	 SUN_H_T1_Reserved_0xd3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd3)
#endif
.align 32
#else
	NORMAL_TRAP(0xd3); 
#endif

T1_Reserved_0xd4:		
#ifdef H_T1_Reserved_0xd4
#ifdef SUN_H_T1_Reserved_0xd4
	 SUN_H_T1_Reserved_0xd4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd4)
#endif
.align 32
#else
	NORMAL_TRAP(0xd4); 
#endif

T1_Reserved_0xd5:		
#ifdef H_T1_Reserved_0xd5
#ifdef SUN_H_T1_Reserved_0xd5
	 SUN_H_T1_Reserved_0xd5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd5)
#endif
.align 32
#else
	NORMAL_TRAP(0xd5); 
#endif

T1_Reserved_0xd6:		
#ifdef H_T1_Reserved_0xd6
#ifdef SUN_H_T1_Reserved_0xd6
	 SUN_H_T1_Reserved_0xd6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd6)
#endif
.align 32
#else
	NORMAL_TRAP(0xd6); 
#endif

T1_Reserved_0xd7:		
#ifdef H_T1_Reserved_0xd7
#ifdef SUN_H_T1_Reserved_0xd7
	 SUN_H_T1_Reserved_0xd7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd7)
#endif
.align 32
#else
	NORMAL_TRAP(0xd7); 
#endif

T1_Reserved_0xd8:		
#ifdef H_T1_Reserved_0xd8
#ifdef SUN_H_T1_Reserved_0xd8
	 SUN_H_T1_Reserved_0xd8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd8)
#endif
.align 32
#else
	NORMAL_TRAP(0xd8); 
#endif

T1_Reserved_0xd9:		
#ifdef H_T1_Reserved_0xd9
#ifdef SUN_H_T1_Reserved_0xd9
	 SUN_H_T1_Reserved_0xd9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xd9)
#endif
.align 32
#else
	NORMAL_TRAP(0xd9); 
#endif

T1_Reserved_0xda:		
#ifdef H_T1_Reserved_0xda
#ifdef SUN_H_T1_Reserved_0xda
	 SUN_H_T1_Reserved_0xda 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xda)
#endif
.align 32
#else
	NORMAL_TRAP(0xda); 
#endif

T1_Reserved_0xdb:		
#ifdef H_T1_Reserved_0xdb
#ifdef SUN_H_T1_Reserved_0xdb
	 SUN_H_T1_Reserved_0xdb 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xdb)
#endif
.align 32
#else
	NORMAL_TRAP(0xdb); 
#endif

T1_Reserved_0xdc:		
#ifdef H_T1_Window_Fill_7_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_7_Normal_Trap
	 SUN_H_T1_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_7_Normal_Trap
		My_T1_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
	NORMAL_TRAP(0xdc); 
#endif
.align 128

T1_Reserved_0xe0:		
#ifdef H_T1_Reserved_0xe0
#ifdef SUN_H_T1_Reserved_0xe0
	 SUN_H_T1_Reserved_0xe0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe0)
#endif
.align 32
#else
	NORMAL_TRAP(0xe0); 
#endif

T1_Reserved_0xe1:		
#ifdef H_T1_Reserved_0xe1
#ifdef SUN_H_T1_Reserved_0xe1
	 SUN_H_T1_Reserved_0xe1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe1)
#endif
.align 32
#else
	NORMAL_TRAP(0xe1); 
#endif

T1_Reserved_0xe2:		
#ifdef H_T1_Reserved_0xe2
#ifdef SUN_H_T1_Reserved_0xe2
	 SUN_H_T1_Reserved_0xe2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe2)
#endif
.align 32
#else
	NORMAL_TRAP(0xe2); 
#endif

T1_Reserved_0xe3:		
#ifdef H_T1_Reserved_0xe3
#ifdef SUN_H_T1_Reserved_0xe3
	 SUN_H_T1_Reserved_0xe3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe3)
#endif
.align 32
#else
	NORMAL_TRAP(0xe3); 
#endif

T1_Reserved_0xe4:		
#ifdef H_T1_Reserved_0xe4
#ifdef SUN_H_T1_Reserved_0xe4
	 SUN_H_T1_Reserved_0xe4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe4)
#endif
.align 32
#else
	NORMAL_TRAP(0xe4); 
#endif

T1_Reserved_0xe5:		
#ifdef H_T1_Reserved_0xe5
#ifdef SUN_H_T1_Reserved_0xe5
	 SUN_H_T1_Reserved_0xe5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe5)
#endif
.align 32
#else
	NORMAL_TRAP(0xe5); 
#endif

T1_Reserved_0xe6:		
#ifdef H_T1_Reserved_0xe6
#ifdef SUN_H_T1_Reserved_0xe6
	 SUN_H_T1_Reserved_0xe6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe6)
#endif
.align 32
#else
	NORMAL_TRAP(0xe6); 
#endif

T1_Reserved_0xe7:		
#ifdef H_T1_Reserved_0xe7
#ifdef SUN_H_T1_Reserved_0xe7
	 SUN_H_T1_Reserved_0xe7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe7)
#endif
.align 32
#else
	NORMAL_TRAP(0xe7); 
#endif

T1_Reserved_0xe8:		
#ifdef H_T1_Reserved_0xe8
#ifdef SUN_H_T1_Reserved_0xe8
	 SUN_H_T1_Reserved_0xe8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe8)
#endif
.align 32
#else
	NORMAL_TRAP(0xe8); 
#endif

T1_Reserved_0xe9:		
#ifdef H_T1_Reserved_0xe9
#ifdef SUN_H_T1_Reserved_0xe9
	 SUN_H_T1_Reserved_0xe9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xe9)
#endif
.align 32
#else
	NORMAL_TRAP(0xe9); 
#endif

T1_Reserved_0xea:		
#ifdef H_T1_Reserved_0xea
#ifdef SUN_H_T1_Reserved_0xea
	 SUN_H_T1_Reserved_0xea 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xea)
#endif
.align 32
#else
	NORMAL_TRAP(0xea); 
#endif

T1_Reserved_0xeb:		
#ifdef H_T1_Reserved_0xeb
#ifdef SUN_H_T1_Reserved_0xeb
	 SUN_H_T1_Reserved_0xeb 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xeb)
#endif
.align 32
#else
	NORMAL_TRAP(0xeb); 
#endif

T1_Reserved_0xec:		
#ifdef H_T1_Reserved_0xec
#ifdef SUN_H_T1_Reserved_0xec
	 SUN_H_T1_Reserved_0xec 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xec)
#endif
.align 32
#else
	NORMAL_TRAP(0xec); 
#endif

T1_Reserved_0xed:		
#ifdef H_T1_Reserved_0xed
#ifdef SUN_H_T1_Reserved_0xed
	 SUN_H_T1_Reserved_0xed 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xed)
#endif
.align 32
#else
	NORMAL_TRAP(0xed); 
#endif

T1_Reserved_0xee:		
#ifdef H_T1_Reserved_0xee
#ifdef SUN_H_T1_Reserved_0xee
	 SUN_H_T1_Reserved_0xee 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xee)
#endif
.align 32
#else
	NORMAL_TRAP(0xee); 
#endif

T1_Reserved_0xef:		
#ifdef H_T1_Reserved_0xef
#ifdef SUN_H_T1_Reserved_0xef
	 SUN_H_T1_Reserved_0xef 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xef)
#endif
.align 32
#else
	NORMAL_TRAP(0xef); 
#endif

T1_Reserved_0xf0:		
#ifdef H_T1_Reserved_0xf0
#ifdef SUN_H_T1_Reserved_0xf0
	 SUN_H_T1_Reserved_0xf0 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf0)
#endif
.align 32
#else
	NORMAL_TRAP(0xf0); 
#endif

T1_Reserved_0xf1:		
#ifdef H_T1_Reserved_0xf1
#ifdef SUN_H_T1_Reserved_0xf1
	 SUN_H_T1_Reserved_0xf1 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf1)
#endif
.align 32
#else
	NORMAL_TRAP(0xf1); 
#endif

T1_Reserved_0xf2:		
#ifdef H_T1_Reserved_0xf2
#ifdef SUN_H_T1_Reserved_0xf2
	 SUN_H_T1_Reserved_0xf2 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf2)
#endif
.align 32
#else
	NORMAL_TRAP(0xf2); 
#endif

T1_Reserved_0xf3:		
#ifdef H_T1_Reserved_0xf3
#ifdef SUN_H_T1_Reserved_0xf3
	 SUN_H_T1_Reserved_0xf3 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf3)
#endif
.align 32
#else
	NORMAL_TRAP(0xf3); 
#endif

T1_Reserved_0xf4:		
#ifdef H_T1_Reserved_0xf4
#ifdef SUN_H_T1_Reserved_0xf4
	 SUN_H_T1_Reserved_0xf4 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf4)
#endif
.align 32
#else
	NORMAL_TRAP(0xf4); 
#endif

T1_Reserved_0xf5:		
#ifdef H_T1_Reserved_0xf5
#ifdef SUN_H_T1_Reserved_0xf5
	 SUN_H_T1_Reserved_0xf5 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf5)
#endif
.align 32
#else
	NORMAL_TRAP(0xf5); 
#endif

T1_Reserved_0xf6:		
#ifdef H_T1_Reserved_0xf6
#ifdef SUN_H_T1_Reserved_0xf6
	 SUN_H_T1_Reserved_0xf6 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf6)
#endif
.align 32
#else
	NORMAL_TRAP(0xf6); 
#endif

T1_Reserved_0xf7:		
#ifdef H_T1_Reserved_0xf7
#ifdef SUN_H_T1_Reserved_0xf7
	 SUN_H_T1_Reserved_0xf7 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf7)
#endif
.align 32
#else
	NORMAL_TRAP(0xf7); 
#endif

T1_Reserved_0xf8:		
#ifdef H_T1_Reserved_0xf8
#ifdef SUN_H_T1_Reserved_0xf8
	 SUN_H_T1_Reserved_0xf8 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf8)
#endif
.align 32
#else
	NORMAL_TRAP(0xf8); 
#endif

T1_Reserved_0xf9:		
#ifdef H_T1_Reserved_0xf9
#ifdef SUN_H_T1_Reserved_0xf9
	 SUN_H_T1_Reserved_0xf9 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xf9)
#endif
.align 32
#else
	NORMAL_TRAP(0xf9); 
#endif

T1_Reserved_0xfa:		
#ifdef H_T1_Reserved_0xfa
#ifdef SUN_H_T1_Reserved_0xfa
	 SUN_H_T1_Reserved_0xfa 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xfa)
#endif
.align 32
#else
	NORMAL_TRAP(0xfa); 
#endif

T1_Reserved_0xfb:		
#ifdef H_T1_Reserved_0xfb
#ifdef SUN_H_T1_Reserved_0xfb
	 SUN_H_T1_Reserved_0xfb 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xfb)
#endif
.align 32
#else
	NORMAL_TRAP(0xfb); 
#endif

T1_Reserved_0xfc:		
#ifdef H_T1_Reserved_0xfc
#ifdef SUN_H_T1_Reserved_0xfc
	 SUN_H_T1_Reserved_0xfc 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xfc)
#endif
.align 32
#else
	NORMAL_TRAP(0xfc); 
#endif

T1_Reserved_0xfd:		
#ifdef H_T1_Reserved_0xfd
#ifdef SUN_H_T1_Reserved_0xfd
	 SUN_H_T1_Reserved_0xfd 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xfd)
#endif
.align 32
#else
	NORMAL_TRAP(0xfd); 
#endif

T1_Reserved_0xfe:		
#ifdef H_T1_Reserved_0xfe
#ifdef SUN_H_T1_Reserved_0xfe
	 SUN_H_T1_Reserved_0xfe 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xfe)
#endif
.align 32
#else
	NORMAL_TRAP(0xfe); 
#endif

T1_Reserved_0xff:		
#ifdef H_T1_Reserved_0xff
#ifdef SUN_H_T1_Reserved_0xff
	 SUN_H_T1_Reserved_0xff 
#else
        CUSTOM_TRAP(H_T1_Reserved_0xff)
#endif
.align 32
#else
	NORMAL_TRAP(0xff); 
#endif

.align 128
T1_GoodTrap_0x100:
        b good_trap;nop;nop;nop;nop;nop;nop;nop

T1_BadTrap_0x101:
        b bad_trap; nop;nop;nop;nop;nop;nop;nop

.align 32
T1_ChangePriv_0x102:
#ifdef H_T1_ChangePriv_0x102
#ifdef SUN_H_T1_ChangePriv_0x102
         SUN_H_T1_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_T1_ChangePriv_0x102)
#endif
#else
        rdpr    %tstate, %g1
        mov     0x400, %g2
        and     %g1, %g2, %g3
        brz,a   %g3, .+8
        wrpr    %g1, %g2, %tstate
        done
        nop
        nop
#endif

.align 32
T1_ChangeNonPriv_0x103:
#ifdef H_T1_ChangeNonPriv_0x103
#ifdef SUN_H_T1_ChangeNonPriv_0x103
         SUN_H_T1_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_T1_ChangeNonPriv_0x103)
#endif
#else
        rdpr    %tstate, %g1
        mov     0x400, %g2
        and     %g1, %g2, %g3
        brnz,a  %g3, .+8
        wrpr    %g1, %g2, %tstate
        done
        nop
        nop
#endif

T1_ChangeToTL1_0x104:
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
		
T1_ChangeToTL0_0x105:
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done

.align 128
T1_TrapEn_0x108:
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
        mov     0x800, %g2
        add     %o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
        sth     %g2, [%g3+%o0]
        done

.align 64
T1_TrapDis_0x10a:
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
        mov     0, %g2
        add     %o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
        sth     %g2, [%g3+%o0]
        done

.align 64
T1_TrapEn_Ntimes_0x10c:
	! use set instead of setx to save a few instructions
	! may not work if address of trap_enable_data changes
        set     trap_enable_data, %g3
	mov	%o1, %g2
        add     %o0, %o0, %o0
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	sllx	%g1, 10, %g1
	add	%o0, %g1, %o0
        sth     %g2, [%g3+%o0]
        done

.align 128
T1_PThreadMutexLock_0x110:
        rdpr    %tl, %g2
        cmp     %g2, 2
        bne,a   +8
        or      %i0, %g0, %o1
        setx    pthread_mutex_data, %g2, %g3
pt_retry_1:	
	ldstub	[%g3+%o1], %g2
	brz	%g2, pt_done_1
	nop
pt_loop_1:
	ldub	[%g3+%o1], %g2
	brnz	%g2, pt_loop_1
	nop
	ba,a	pt_retry_1
pt_done_1:
	membar	#LoadLoad | #LoadStore
	done

.align 128
T1_PThreadMutexUnLock_0x114:	
        setx    pthread_mutex_data, %g2, %g5
	stub	%g0, [%g5+%o1]
	done
	
.align 64
T1_Trap_Sync_0x116:

	setx	pthread_counter_data, %g1, %g4
	rdpr	%tpc, %g2
	rdpr	%tnpc,%g3
	mov     %g3, %g1
	add	%g2, 60, %g2
	add	%g3, 60, %g3
	wrpr	%g2, 0, %tpc  ! set %tcp/%tnpc
	wrpr	%g3, 0, %tnpc
	jmp	%g1           ! %g1 is original %tnpc
	nop

	
.align 64
T1_Trap_Function_0x118:
! call kernel dervice routine
	mov	0x0,	%o0
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 512
T1_HTrap_Enable_0x120:
! call kernel dervice routine
#ifndef HPV_NONSPLIT_MODE
	ta	%icc, T_API_CHANGE_PRIV
	done
	mov	123, %g1
	mov	123, %g1
	mov	123, %g1
	nop
	nop
	nop
#else	
	rdhpr	%htstate, %g1
	mov	0x4, %g2
	and	%g1, %g2, %g3
	brz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x180
	nop
#endif
	
.align 64
T1_HTrap_Disable_0x122:
#ifndef HPV_NONSPLIT_MODE
        ta      %icc, T_API_CHANGE_NONPRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop
#else	
	rdhpr	%htstate, %g1
	mov	0x4, %g2
	and	%g1, %g2, %g3
	brnz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x182
	nop
#endif
	
.align 64
T1_Trap_Function_0x124:
        ta      %icc, T_API_TRAP_EN
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64
T1_Trap_Function_0x126:
        ta      %icc, T_API_TRAP_DIS
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T1_HTrapEn_Ntimes_0x128:
        ta      %icc, T_API_TRAP_EN_N_TIMES
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T1_ChangeCtx_0x12a:
        ta      %icc, T_API_CHANGE_CTX
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64
T1_Dummy_0x12c:
	nop
	nop

.align 64	
T1_RdThId_0x12e:
#ifndef HPV_NONSPLIT_MODE
        ta      %icc, T_API_RD_THID
	done
	nop
	nop
	nop
	nop
	nop
	nop
#else

    setx     0xba00000000, %o1, %g1
    ldxa     [%g1] 0x15, %g1            ! has coreid


    srlx    %g1, 8, %o1
    mulx    %o1, PTON_X_TILES, %o1
    and     %g1, 0xff, %g1
    add     %g1, %o1, %g1    

    !srlx    %g1, 5, %o1
    !add     %o1, %g1, %g1        ! translate from x,y coordinates to coreid
    !set     0x3f, %o1           ! get the lowest 6 bits
    !and     %g1, %o1, %g1
    
    sllx    %g1, 1, %g1

	rd	%asr26, %o1
    srlx    %o1, 8, %o1
    add     %o1, %g1, %o1
#ifdef PORTABLE_CORE
        set     0x0001, %g1
#else
        set     0x007f, %g1
#endif
    and     %o1, %g1, %o1


        done
        nop
#endif

.align 512
T1_Trap_Instruction_0x130:
#ifdef H_T1_Trap_Instruction_0
#ifdef SUN_H_T1_Trap_Instruction_0
	 SUN_H_T1_Trap_Instruction_0 
#else
#	ifdef My_T1_Trap_Instruction_0
		My_T1_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
T1_Trap_Instruction_0x131:
#ifdef H_T1_Trap_Instruction_1
#ifdef SUN_H_T1_Trap_Instruction_1
	SUN_H_T1_Trap_Instruction_1
#else
#	ifdef My_T1_Trap_Instruction_1
		My_T1_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
T1_Trap_Instruction_0x132:
#ifdef H_T1_Trap_Instruction_2
#ifdef SUN_H_T1_Trap_Instruction_2
	SUN_H_T1_Trap_Instruction_2
#else
#	ifdef My_T1_Trap_Instruction_2
		My_T1_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_2)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST0;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T1_Trap_Instruction_0x133:
#ifdef H_T1_Trap_Instruction_3
#ifdef SUN_H_T1_Trap_Instruction_3
	SUN_H_T1_Trap_Instruction_3
#else
#	ifdef My_T1_Trap_Instruction_3
		My_T1_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_3)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST1;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T1_Trap_Instruction_0x134:
#ifdef H_T1_Trap_Instruction_4
#ifdef SUN_H_T1_Trap_Instruction_4
	 SUN_H_T1_Trap_Instruction_4
#else
#	ifdef My_T1_Trap_Instruction_4
		My_T1_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
T1_Trap_Instruction_0x135:
#ifdef H_T1_Trap_Instruction_5
#ifdef SUN_H_T1_Trap_Instruction_5
	SUN_H_T1_Trap_Instruction_5
#else
#	ifdef My_T1_Trap_Instruction_5
		My_T1_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif

T1_Trap_Instruction_0x136:
#ifdef H_T1_Trap_Instruction_0x136
#ifdef SUN_H_T1_Trap_Instruction_0x136
                SUN_H_T1_Trap_Instruction_0x136
#else
#               ifdef My_T1_Trap_Instruction_0x136
                        My_T1_Trap_Instruction_0x136
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x136)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x136);
#endif

T1_Trap_Instruction_0x137:
#ifdef H_T1_Trap_Instruction_0x137
#ifdef SUN_H_T1_Trap_Instruction_0x137
                SUN_H_T1_Trap_Instruction_0x137
#else
#               ifdef My_T1_Trap_Instruction_0x137
                        My_T1_Trap_Instruction_0x137
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x137)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x137);
#endif

T1_Trap_Instruction_0x138:
#ifdef H_T1_Trap_Instruction_0x138
#ifdef SUN_H_T1_Trap_Instruction_0x138
                SUN_H_T1_Trap_Instruction_0x138
#else
#               ifdef My_T1_Trap_Instruction_0x138
                        My_T1_Trap_Instruction_0x138
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x138)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x138);
#endif

T1_Trap_Instruction_0x139:
#ifdef H_T1_Trap_Instruction_0x139
#ifdef SUN_H_T1_Trap_Instruction_0x139
                SUN_H_T1_Trap_Instruction_0x139
#else
#               ifdef My_T1_Trap_Instruction_0x139
                        My_T1_Trap_Instruction_0x139
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x139)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x139);
#endif

T1_Trap_Instruction_0x13a:
#ifdef H_T1_Trap_Instruction_0x13a
#ifdef SUN_H_T1_Trap_Instruction_0x13a
                SUN_H_T1_Trap_Instruction_0x13a
#else
#               ifdef My_T1_Trap_Instruction_0x13a
                        My_T1_Trap_Instruction_0x13a
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13a);
#endif

T1_Trap_Instruction_0x13b:
#ifdef H_T1_Trap_Instruction_0x13b
#ifdef SUN_H_T1_Trap_Instruction_0x13b
                SUN_H_T1_Trap_Instruction_0x13b
#else
#               ifdef My_T1_Trap_Instruction_0x13b
                        My_T1_Trap_Instruction_0x13b
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13b);
#endif

T1_Trap_Instruction_0x13c:
#ifdef H_T1_Trap_Instruction_0x13c
#ifdef SUN_H_T1_Trap_Instruction_0x13c
                SUN_H_T1_Trap_Instruction_0x13c
#else
#               ifdef My_T1_Trap_Instruction_0x13c
                        My_T1_Trap_Instruction_0x13c
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13c);
#endif

T1_Trap_Instruction_0x13d:
#ifdef H_T1_Trap_Instruction_0x13d
#ifdef SUN_H_T1_Trap_Instruction_0x13d
                SUN_H_T1_Trap_Instruction_0x13d
#else
#               ifdef My_T1_Trap_Instruction_0x13d
                        My_T1_Trap_Instruction_0x13d
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13d);
#endif

T1_Trap_Instruction_0x13e:
#ifdef H_T1_Trap_Instruction_0x13e
#ifdef SUN_H_T1_Trap_Instruction_0x13e
                SUN_H_T1_Trap_Instruction_0x13e
#else
#               ifdef My_T1_Trap_Instruction_0x13e
                        My_T1_Trap_Instruction_0x13e
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13e);
#endif

T1_Trap_Instruction_0x13f:
#ifdef H_T1_Trap_Instruction_0x13f
#ifdef SUN_H_T1_Trap_Instruction_0x13f
                SUN_H_T1_Trap_Instruction_0x13f
#else
#               ifdef My_T1_Trap_Instruction_0x13f
                        My_T1_Trap_Instruction_0x13f
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x13f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x13f);
#endif

T1_Trap_Instruction_0x140:
#ifdef H_T1_Trap_Instruction_0x140
#ifdef SUN_H_T1_Trap_Instruction_0x140
                SUN_H_T1_Trap_Instruction_0x140
#else
#               ifdef My_T1_Trap_Instruction_0x140
                        My_T1_Trap_Instruction_0x140
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x140)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x140);
#endif

T1_Trap_Instruction_0x141:
#ifdef H_T1_Trap_Instruction_0x141
#ifdef SUN_H_T1_Trap_Instruction_0x141
                SUN_H_T1_Trap_Instruction_0x141
#else
#               ifdef My_T1_Trap_Instruction_0x141
                        My_T1_Trap_Instruction_0x141
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x141)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x141);
#endif

T1_Trap_Instruction_0x142:
#ifdef H_T1_Trap_Instruction_0x142
#ifdef SUN_H_T1_Trap_Instruction_0x142
                SUN_H_T1_Trap_Instruction_0x142
#else
#               ifdef My_T1_Trap_Instruction_0x142
                        My_T1_Trap_Instruction_0x142
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x142)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x142);
#endif

T1_Trap_Instruction_0x143:
#ifdef H_T1_Trap_Instruction_0x143
#ifdef SUN_H_T1_Trap_Instruction_0x143
                SUN_H_T1_Trap_Instruction_0x143
#else
#               ifdef My_T1_Trap_Instruction_0x143
                        My_T1_Trap_Instruction_0x143
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x143)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x143);
#endif

T1_Trap_Instruction_0x144:
#ifdef H_T1_Trap_Instruction_0x144
#ifdef SUN_H_T1_Trap_Instruction_0x144
                SUN_H_T1_Trap_Instruction_0x144
#else
#               ifdef My_T1_Trap_Instruction_0x144
                        My_T1_Trap_Instruction_0x144
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x144)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x144);
#endif

T1_Trap_Instruction_0x145:
#ifdef H_T1_Trap_Instruction_0x145
#ifdef SUN_H_T1_Trap_Instruction_0x145
                SUN_H_T1_Trap_Instruction_0x145
#else
#               ifdef My_T1_Trap_Instruction_0x145
                        My_T1_Trap_Instruction_0x145
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x145)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x145);
#endif

T1_Trap_Instruction_0x146:
#ifdef H_T1_Trap_Instruction_0x146
#ifdef SUN_H_T1_Trap_Instruction_0x146
                SUN_H_T1_Trap_Instruction_0x146
#else
#               ifdef My_T1_Trap_Instruction_0x146
                        My_T1_Trap_Instruction_0x146
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x146)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x146);
#endif

T1_Trap_Instruction_0x147:
#ifdef H_T1_Trap_Instruction_0x147
#ifdef SUN_H_T1_Trap_Instruction_0x147
                SUN_H_T1_Trap_Instruction_0x147
#else
#               ifdef My_T1_Trap_Instruction_0x147
                        My_T1_Trap_Instruction_0x147
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x147)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x147);
#endif

T1_Trap_Instruction_0x148:
#ifdef H_T1_Trap_Instruction_0x148
#ifdef SUN_H_T1_Trap_Instruction_0x148
                SUN_H_T1_Trap_Instruction_0x148
#else
#               ifdef My_T1_Trap_Instruction_0x148
                        My_T1_Trap_Instruction_0x148
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x148)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x148);
#endif

T1_Trap_Instruction_0x149:
#ifdef H_T1_Trap_Instruction_0x149
#ifdef SUN_H_T1_Trap_Instruction_0x149
                SUN_H_T1_Trap_Instruction_0x149
#else
#               ifdef My_T1_Trap_Instruction_0x149
                        My_T1_Trap_Instruction_0x149
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x149)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x149);
#endif

T1_Trap_Instruction_0x14a:
#ifdef H_T1_Trap_Instruction_0x14a
#ifdef SUN_H_T1_Trap_Instruction_0x14a
                SUN_H_T1_Trap_Instruction_0x14a
#else
#               ifdef My_T1_Trap_Instruction_0x14a
                        My_T1_Trap_Instruction_0x14a
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14a);
#endif

T1_Trap_Instruction_0x14b:
#ifdef H_T1_Trap_Instruction_0x14b
#ifdef SUN_H_T1_Trap_Instruction_0x14b
                SUN_H_T1_Trap_Instruction_0x14b
#else
#               ifdef My_T1_Trap_Instruction_0x14b
                        My_T1_Trap_Instruction_0x14b
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14b);
#endif

T1_Trap_Instruction_0x14c:
#ifdef H_T1_Trap_Instruction_0x14c
#ifdef SUN_H_T1_Trap_Instruction_0x14c
                SUN_H_T1_Trap_Instruction_0x14c
#else
#               ifdef My_T1_Trap_Instruction_0x14c
                        My_T1_Trap_Instruction_0x14c
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14c);
#endif

T1_Trap_Instruction_0x14d:
#ifdef H_T1_Trap_Instruction_0x14d
#ifdef SUN_H_T1_Trap_Instruction_0x14d
                SUN_H_T1_Trap_Instruction_0x14d
#else
#               ifdef My_T1_Trap_Instruction_0x14d
                        My_T1_Trap_Instruction_0x14d
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14d);
#endif

T1_Trap_Instruction_0x14e:
#ifdef H_T1_Trap_Instruction_0x14e
#ifdef SUN_H_T1_Trap_Instruction_0x14e
                SUN_H_T1_Trap_Instruction_0x14e
#else
#               ifdef My_T1_Trap_Instruction_0x14e
                        My_T1_Trap_Instruction_0x14e
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14e);
#endif

T1_Trap_Instruction_0x14f:
#ifdef H_T1_Trap_Instruction_0x14f
#ifdef SUN_H_T1_Trap_Instruction_0x14f
                SUN_H_T1_Trap_Instruction_0x14f
#else
#               ifdef My_T1_Trap_Instruction_0x14f
                        My_T1_Trap_Instruction_0x14f
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x14f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x14f);
#endif

T1_Trap_Instruction_0x150:
#ifdef H_T1_Trap_Instruction_0x150
#ifdef SUN_H_T1_Trap_Instruction_0x150
                SUN_H_T1_Trap_Instruction_0x150
#else
#               ifdef My_T1_Trap_Instruction_0x150
                        My_T1_Trap_Instruction_0x150
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x150)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x150);
#endif

T1_Trap_Instruction_0x151:
#ifdef H_T1_Trap_Instruction_0x151
#ifdef SUN_H_T1_Trap_Instruction_0x151
                SUN_H_T1_Trap_Instruction_0x151
#else
#               ifdef My_T1_Trap_Instruction_0x151
                        My_T1_Trap_Instruction_0x151
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x151)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x151);
#endif

T1_Trap_Instruction_0x152:
#ifdef H_T1_Trap_Instruction_0x152
#ifdef SUN_H_T1_Trap_Instruction_0x152
                SUN_H_T1_Trap_Instruction_0x152
#else
#               ifdef My_T1_Trap_Instruction_0x152
                        My_T1_Trap_Instruction_0x152
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x152)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x152);
#endif

T1_Trap_Instruction_0x153:
#ifdef H_T1_Trap_Instruction_0x153
#ifdef SUN_H_T1_Trap_Instruction_0x153
                SUN_H_T1_Trap_Instruction_0x153
#else
#               ifdef My_T1_Trap_Instruction_0x153
                        My_T1_Trap_Instruction_0x153
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x153)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x153);
#endif

T1_Trap_Instruction_0x154:
#ifdef H_T1_Trap_Instruction_0x154
#ifdef SUN_H_T1_Trap_Instruction_0x154
                SUN_H_T1_Trap_Instruction_0x154
#else
#               ifdef My_T1_Trap_Instruction_0x154
                        My_T1_Trap_Instruction_0x154
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x154)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x154);
#endif

T1_Trap_Instruction_0x155:
#ifdef H_T1_Trap_Instruction_0x155
#ifdef SUN_H_T1_Trap_Instruction_0x155
                SUN_H_T1_Trap_Instruction_0x155
#else
#               ifdef My_T1_Trap_Instruction_0x155
                        My_T1_Trap_Instruction_0x155
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x155)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x155);
#endif

T1_Trap_Instruction_0x156:
#ifdef H_T1_Trap_Instruction_0x156
#ifdef SUN_H_T1_Trap_Instruction_0x156
                SUN_H_T1_Trap_Instruction_0x156
#else
#               ifdef My_T1_Trap_Instruction_0x156
                        My_T1_Trap_Instruction_0x156
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x156)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x156);
#endif

T1_Trap_Instruction_0x157:
#ifdef H_T1_Trap_Instruction_0x157
#ifdef SUN_H_T1_Trap_Instruction_0x157
                SUN_H_T1_Trap_Instruction_0x157
#else
#               ifdef My_T1_Trap_Instruction_0x157
                        My_T1_Trap_Instruction_0x157
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x157)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x157);
#endif

T1_Trap_Instruction_0x158:
#ifdef H_T1_Trap_Instruction_0x158
#ifdef SUN_H_T1_Trap_Instruction_0x158
                SUN_H_T1_Trap_Instruction_0x158
#else
#               ifdef My_T1_Trap_Instruction_0x158
                        My_T1_Trap_Instruction_0x158
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x158)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x158);
#endif

T1_Trap_Instruction_0x159:
#ifdef H_T1_Trap_Instruction_0x159
#ifdef SUN_H_T1_Trap_Instruction_0x159
                SUN_H_T1_Trap_Instruction_0x159
#else
#               ifdef My_T1_Trap_Instruction_0x159
                        My_T1_Trap_Instruction_0x159
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x159)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x159);
#endif

T1_Trap_Instruction_0x15a:
#ifdef H_T1_Trap_Instruction_0x15a
#ifdef SUN_H_T1_Trap_Instruction_0x15a
                SUN_H_T1_Trap_Instruction_0x15a
#else
#               ifdef My_T1_Trap_Instruction_0x15a
                        My_T1_Trap_Instruction_0x15a
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15a);
#endif

T1_Trap_Instruction_0x15b:
#ifdef H_T1_Trap_Instruction_0x15b
#ifdef SUN_H_T1_Trap_Instruction_0x15b
                SUN_H_T1_Trap_Instruction_0x15b
#else
#               ifdef My_T1_Trap_Instruction_0x15b
                        My_T1_Trap_Instruction_0x15b
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15b);
#endif

T1_Trap_Instruction_0x15c:
#ifdef H_T1_Trap_Instruction_0x15c
#ifdef SUN_H_T1_Trap_Instruction_0x15c
                SUN_H_T1_Trap_Instruction_0x15c
#else
#               ifdef My_T1_Trap_Instruction_0x15c
                        My_T1_Trap_Instruction_0x15c
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15c);
#endif

T1_Trap_Instruction_0x15d:
#ifdef H_T1_Trap_Instruction_0x15d
#ifdef SUN_H_T1_Trap_Instruction_0x15d
                SUN_H_T1_Trap_Instruction_0x15d
#else
#               ifdef My_T1_Trap_Instruction_0x15d
                        My_T1_Trap_Instruction_0x15d
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15d);
#endif

T1_Trap_Instruction_0x15e:
#ifdef H_T1_Trap_Instruction_0x15e
#ifdef SUN_H_T1_Trap_Instruction_0x15e
                SUN_H_T1_Trap_Instruction_0x15e
#else
#               ifdef My_T1_Trap_Instruction_0x15e
                        My_T1_Trap_Instruction_0x15e
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15e);
#endif

T1_Trap_Instruction_0x15f:
#ifdef H_T1_Trap_Instruction_0x15f
#ifdef SUN_H_T1_Trap_Instruction_0x15f
                SUN_H_T1_Trap_Instruction_0x15f
#else
#               ifdef My_T1_Trap_Instruction_0x15f
                        My_T1_Trap_Instruction_0x15f
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x15f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x15f);
#endif

T1_Trap_Instruction_0x160:
#ifdef H_T1_Trap_Instruction_0x160
#ifdef SUN_H_T1_Trap_Instruction_0x160
                SUN_H_T1_Trap_Instruction_0x160
#else
#               ifdef My_T1_Trap_Instruction_0x160
                        My_T1_Trap_Instruction_0x160
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x160)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x160);
#endif

T1_Trap_Instruction_0x161:
#ifdef H_T1_Trap_Instruction_0x161
#ifdef SUN_H_T1_Trap_Instruction_0x161
                SUN_H_T1_Trap_Instruction_0x161
#else
#               ifdef My_T1_Trap_Instruction_0x161
                        My_T1_Trap_Instruction_0x161
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x161)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x161);
#endif

T1_Trap_Instruction_0x162:
#ifdef H_T1_Trap_Instruction_0x162
#ifdef SUN_H_T1_Trap_Instruction_0x162
                SUN_H_T1_Trap_Instruction_0x162
#else
#               ifdef My_T1_Trap_Instruction_0x162
                        My_T1_Trap_Instruction_0x162
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x162)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x162);
#endif

T1_Trap_Instruction_0x163:
#ifdef H_T1_Trap_Instruction_0x163
#ifdef SUN_H_T1_Trap_Instruction_0x163
                SUN_H_T1_Trap_Instruction_0x163
#else
#               ifdef My_T1_Trap_Instruction_0x163
                        My_T1_Trap_Instruction_0x163
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x163)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x163);
#endif

T1_Trap_Instruction_0x164:
#ifdef H_T1_Trap_Instruction_0x164
#ifdef SUN_H_T1_Trap_Instruction_0x164
                SUN_H_T1_Trap_Instruction_0x164
#else
#               ifdef My_T1_Trap_Instruction_0x164
                        My_T1_Trap_Instruction_0x164
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x164)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x164);
#endif

T1_Trap_Instruction_0x165:
#ifdef H_T1_Trap_Instruction_0x165
#ifdef SUN_H_T1_Trap_Instruction_0x165
                SUN_H_T1_Trap_Instruction_0x165
#else
#               ifdef My_T1_Trap_Instruction_0x165
                        My_T1_Trap_Instruction_0x165
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x165)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x165);
#endif

T1_Trap_Instruction_0x166:
#ifdef H_T1_Trap_Instruction_0x166
#ifdef SUN_H_T1_Trap_Instruction_0x166
                SUN_H_T1_Trap_Instruction_0x166
#else
#               ifdef My_T1_Trap_Instruction_0x166
                        My_T1_Trap_Instruction_0x166
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x166)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x166);
#endif

T1_Trap_Instruction_0x167:
#ifdef H_T1_Trap_Instruction_0x167
#ifdef SUN_H_T1_Trap_Instruction_0x167
                SUN_H_T1_Trap_Instruction_0x167
#else
#               ifdef My_T1_Trap_Instruction_0x167
                        My_T1_Trap_Instruction_0x167
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x167)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x167);
#endif

T1_Trap_Instruction_0x168:
#ifdef H_T1_Trap_Instruction_0x168
#ifdef SUN_H_T1_Trap_Instruction_0x168
                SUN_H_T1_Trap_Instruction_0x168
#else
#               ifdef My_T1_Trap_Instruction_0x168
                        My_T1_Trap_Instruction_0x168
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x168)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x168);
#endif

T1_Trap_Instruction_0x169:
#ifdef H_T1_Trap_Instruction_0x169
#ifdef SUN_H_T1_Trap_Instruction_0x169
                SUN_H_T1_Trap_Instruction_0x169
#else
#               ifdef My_T1_Trap_Instruction_0x169
                        My_T1_Trap_Instruction_0x169
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x169)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x169);
#endif

T1_Trap_Instruction_0x16a:
#ifdef H_T1_Trap_Instruction_0x16a
#ifdef SUN_H_T1_Trap_Instruction_0x16a
                SUN_H_T1_Trap_Instruction_0x16a
#else
#               ifdef My_T1_Trap_Instruction_0x16a
                        My_T1_Trap_Instruction_0x16a
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16a);
#endif

T1_Trap_Instruction_0x16b:
#ifdef H_T1_Trap_Instruction_0x16b
#ifdef SUN_H_T1_Trap_Instruction_0x16b
                SUN_H_T1_Trap_Instruction_0x16b
#else
#               ifdef My_T1_Trap_Instruction_0x16b
                        My_T1_Trap_Instruction_0x16b
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16b);
#endif

T1_Trap_Instruction_0x16c:
#ifdef H_T1_Trap_Instruction_0x16c
#ifdef SUN_H_T1_Trap_Instruction_0x16c
                SUN_H_T1_Trap_Instruction_0x16c
#else
#               ifdef My_T1_Trap_Instruction_0x16c
                        My_T1_Trap_Instruction_0x16c
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16c);
#endif

T1_Trap_Instruction_0x16d:
#ifdef H_T1_Trap_Instruction_0x16d
#ifdef SUN_H_T1_Trap_Instruction_0x16d
                SUN_H_T1_Trap_Instruction_0x16d
#else
#               ifdef My_T1_Trap_Instruction_0x16d
                        My_T1_Trap_Instruction_0x16d
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16d);
#endif

T1_Trap_Instruction_0x16e:
#ifdef H_T1_Trap_Instruction_0x16e
#ifdef SUN_H_T1_Trap_Instruction_0x16e
                SUN_H_T1_Trap_Instruction_0x16e
#else
#               ifdef My_T1_Trap_Instruction_0x16e
                        My_T1_Trap_Instruction_0x16e
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16e);
#endif

T1_Trap_Instruction_0x16f:
#ifdef H_T1_Trap_Instruction_0x16f
#ifdef SUN_H_T1_Trap_Instruction_0x16f
                SUN_H_T1_Trap_Instruction_0x16f
#else
#               ifdef My_T1_Trap_Instruction_0x16f
                        My_T1_Trap_Instruction_0x16f
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x16f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x16f);
#endif

T1_Trap_Instruction_0x170:
#ifdef H_T1_Trap_Instruction_0x170
#ifdef SUN_H_T1_Trap_Instruction_0x170
                SUN_H_T1_Trap_Instruction_0x170
#else
#               ifdef My_T1_Trap_Instruction_0x170
                        My_T1_Trap_Instruction_0x170
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x170)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x170);
#endif

T1_Trap_Instruction_0x171:
#ifdef H_T1_Trap_Instruction_0x171
#ifdef SUN_H_T1_Trap_Instruction_0x171
                SUN_H_T1_Trap_Instruction_0x171
#else
#               ifdef My_T1_Trap_Instruction_0x171
                        My_T1_Trap_Instruction_0x171
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x171)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x171);
#endif

T1_Trap_Instruction_0x172:
#ifdef H_T1_Trap_Instruction_0x172
#ifdef SUN_H_T1_Trap_Instruction_0x172
                SUN_H_T1_Trap_Instruction_0x172
#else
#               ifdef My_T1_Trap_Instruction_0x172
                        My_T1_Trap_Instruction_0x172
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x172)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x172);
#endif

T1_Trap_Instruction_0x173:
#ifdef H_T1_Trap_Instruction_0x173
#ifdef SUN_H_T1_Trap_Instruction_0x173
                SUN_H_T1_Trap_Instruction_0x173
#else
#               ifdef My_T1_Trap_Instruction_0x173
                        My_T1_Trap_Instruction_0x173
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x173)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x173);
#endif

T1_Trap_Instruction_0x174:
#ifdef H_T1_Trap_Instruction_0x174
#ifdef SUN_H_T1_Trap_Instruction_0x174
                SUN_H_T1_Trap_Instruction_0x174
#else
#               ifdef My_T1_Trap_Instruction_0x174
                        My_T1_Trap_Instruction_0x174
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x174)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x174);
#endif

T1_Trap_Instruction_0x175:
#ifdef H_T1_Trap_Instruction_0x175
#ifdef SUN_H_T1_Trap_Instruction_0x175
                SUN_H_T1_Trap_Instruction_0x175
#else
#               ifdef My_T1_Trap_Instruction_0x175
                        My_T1_Trap_Instruction_0x175
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x175)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x175);
#endif

T1_Trap_Instruction_0x176:
#ifdef H_T1_Trap_Instruction_0x176
#ifdef SUN_H_T1_Trap_Instruction_0x176
                SUN_H_T1_Trap_Instruction_0x176
#else
#               ifdef My_T1_Trap_Instruction_0x176
                        My_T1_Trap_Instruction_0x176
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x176)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x176);
#endif

T1_Trap_Instruction_0x177:
#ifdef H_T1_Trap_Instruction_0x177
#ifdef SUN_H_T1_Trap_Instruction_0x177
                SUN_H_T1_Trap_Instruction_0x177
#else
#               ifdef My_T1_Trap_Instruction_0x177
                        My_T1_Trap_Instruction_0x177
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x177)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x177);
#endif

T1_Trap_Instruction_0x178:
#ifdef H_T1_Trap_Instruction_0x178
#ifdef SUN_H_T1_Trap_Instruction_0x178
                SUN_H_T1_Trap_Instruction_0x178
#else
#               ifdef My_T1_Trap_Instruction_0x178
                        My_T1_Trap_Instruction_0x178
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x178)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x178);
#endif

T1_Trap_Instruction_0x179:
#ifdef H_T1_Trap_Instruction_0x179
#ifdef SUN_H_T1_Trap_Instruction_0x179
                SUN_H_T1_Trap_Instruction_0x179
#else
#               ifdef My_T1_Trap_Instruction_0x179
                        My_T1_Trap_Instruction_0x179
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x179)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x179);
#endif

T1_Trap_Instruction_0x17a:
#ifdef H_T1_Trap_Instruction_0x17a
#ifdef SUN_H_T1_Trap_Instruction_0x17a
                SUN_H_T1_Trap_Instruction_0x17a
#else
#               ifdef My_T1_Trap_Instruction_0x17a
                        My_T1_Trap_Instruction_0x17a
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17a)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17a);
#endif

T1_Trap_Instruction_0x17b:
#ifdef H_T1_Trap_Instruction_0x17b
#ifdef SUN_H_T1_Trap_Instruction_0x17b
                SUN_H_T1_Trap_Instruction_0x17b
#else
#               ifdef My_T1_Trap_Instruction_0x17b
                        My_T1_Trap_Instruction_0x17b
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17b)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17b);
#endif

T1_Trap_Instruction_0x17c:
#ifdef H_T1_Trap_Instruction_0x17c
#ifdef SUN_H_T1_Trap_Instruction_0x17c
                SUN_H_T1_Trap_Instruction_0x17c
#else
#               ifdef My_T1_Trap_Instruction_0x17c
                        My_T1_Trap_Instruction_0x17c
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17c)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17c);
#endif

T1_Trap_Instruction_0x17d:
#ifdef H_T1_Trap_Instruction_0x17d
#ifdef SUN_H_T1_Trap_Instruction_0x17d
                SUN_H_T1_Trap_Instruction_0x17d
#else
#               ifdef My_T1_Trap_Instruction_0x17d
                        My_T1_Trap_Instruction_0x17d
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17d)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17d);
#endif

T1_Trap_Instruction_0x17e:
#ifdef H_T1_Trap_Instruction_0x17e
#ifdef SUN_H_T1_Trap_Instruction_0x17e
                SUN_H_T1_Trap_Instruction_0x17e
#else
#               ifdef My_T1_Trap_Instruction_0x17e
                        My_T1_Trap_Instruction_0x17e
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17e)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17e);
#endif

T1_Trap_Instruction_0x17f:
#ifdef H_T1_Trap_Instruction_0x17f
#ifdef SUN_H_T1_Trap_Instruction_0x17f
                SUN_H_T1_Trap_Instruction_0x17f
#else
#               ifdef My_T1_Trap_Instruction_0x17f
                        My_T1_Trap_Instruction_0x17f
#               else
                        CUSTOM_TRAP(H_T1_Trap_Instruction_0x17f)
#                       endif
#               endif
#else
        NORMAL_TRAP(0x17f);
#endif

.align 0x1000	/* align to 0x3000 , tt=0x180 */

T1_HTrap_ChangePriv_0x180:
        rdpr    %tl, %g1
        sub     %g1, 1, %g1
        wrpr    %g1, %tl
        rdhpr   %htstate, %g1
        mov     0x4, %g2
        and     %g1, %g2, %g3
        brz,a   %g3, .+8
        wrhpr   %g1, %g2, %htstate
        done
        .word 0x180
        nop
        
.align 64
T1_HTrap_ChangeNonPriv_0x182:
        rdpr    %tl, %g1
        sub     %g1, 1, %g1
        wrpr    %g1, %tl
        rdhpr   %htstate, %g1
        mov     0x4, %g2
        and     %g1, %g2, %g3
        brnz,a  %g3, .+8
        wrhpr   %g1, %g2, %htstate
        done
        .word 0x182
        nop

! If counter > 0,  trap is enabled for n times, decrement counter
! If counter = 0,  trap is disabled, go to BadTrap
! If counter = -1, trap has taken n times, go to GoodTrap directly
! If counter <-1,  trap is enabled for n times, increment counter 
.align 0x4000
TrapCheck:	
#ifndef HPV_NONSPLIT_MODE
	ta	T_API_RD_THID_GLOBAL
#else
        rd      %asr26, %g1
#ifdef PORTABLE_CORE
        set     0x0300, %g4
#else
        set     0x1f00, %g4
#endif
        and     %g1, %g4, %g1
        srlx    %g1, 8, %g1
#endif
	set	trap_enable_data, %g3
	add	%g7, %g7, %g4
        sllx    %g1, 10, %g1
        add     %g4, %g1, %g4
	ldsh	[%g3+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap
#ifdef NO_TRAPCHECK
	nop
#else
	mov     0,      %o0
#endif
	be	%xcc, T0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end
CheckGoodTrap:
	cmp	%g2, -1
	be	%xcc, T0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end:		
	sth	%g2, [%g3+%g4]
	done


#ifdef  HPV_NONSPLIT_MODE
#ifdef KAOS
#include "kaos_immu_miss_handler_ext.s"
#include "kaos_dmmu_miss_handler_ext.s"
#else
#include "immu_miss_handler_ext.s"
#include "dmmu_miss_handler_ext.s"
#endif
#endif
#include "syscall_handler.s"

#ifdef TESTER_DUMP
state_checkpoint_skip:
        ta      0x98
        nop
        ba      good_trap
        nop
#endif

#ifdef FPGA_HW
#ifdef HPV_NONSPLIT_MODE
#include "good_bad_trap_handler.s"
#endif
#endif

#include "io_handler.s"

.data

changequote([, ])dnl
trap_enable_data:	
forloop([i], 0, 127, [
[dt0_0_t]i:
	.half 	E0_0x00,E0_0x01,E0_0x02,E0_0x03,E0_0x04,E0_0x05,E0_0x06,E0_0x07
	.half 	E0_0x08,E0_0x09,E0_0x0a,E0_0x0b,E0_0x0c,E0_0x0d,E0_0x0e,E0_0x0f

	.half 	E0_0x10,E0_0x11,E0_0x12,E0_0x13,E0_0x14,E0_0x15,E0_0x16,E0_0x17
	.half 	E0_0x18,E0_0x19,E0_0x1a,E0_0x1b,E0_0x1c,E0_0x1d,E0_0x1e,E0_0x1f
	
	.half 	E0_0x20,E0_0x21,E0_0x22,E0_0x23,E0_0x24,E0_0x25,E0_0x26,E0_0x27
	.half 	E0_0x28,E0_0x29,E0_0x2a,E0_0x2b,E0_0x2c,E0_0x2d,E0_0x2e,E0_0x2f
	
	.half 	E0_0x30,E0_0x31,E0_0x32,E0_0x33,E0_0x34,E0_0x35,E0_0x36,E0_0x37
	.half 	E0_0x38,E0_0x39,E0_0x3a,E0_0x3b,E0_0x3c,E0_0x3d,E0_0x3e,E0_0x3f
	
[dt0_64_t]i:
	.half 	E0_0x40,E0_0x41,E0_0x42,E0_0x43,E0_0x44,E0_0x45,E0_0x46,E0_0x47
	.half 	E0_0x48,E0_0x49,E0_0x4a,E0_0x4b,E0_0x4c,E0_0x4d,E0_0x4e,E0_0x4f
	
	.half 	E0_0x50,E0_0x51,E0_0x52,E0_0x53,E0_0x54,E0_0x55,E0_0x56,E0_0x57
	.half 	E0_0x58,E0_0x59,E0_0x5a,E0_0x5b,E0_0x5c,E0_0x5d,E0_0x5e,E0_0x5f
	
	.half 	E0_0x60,E0_0x61,E0_0x62,E0_0x63,E0_0x64,E0_0x65,E0_0x66,E0_0x67
	.half 	E0_0x68,E0_0x69,E0_0x6a,E0_0x6b,E0_0x6c,E0_0x6d,E0_0x6e,E0_0x6f
	
	.half 	E0_0x70,E0_0x71,E0_0x72,E0_0x73,E0_0x74,E0_0x75,E0_0x76,E0_0x77
	.half 	E0_0x78,E0_0x79,E0_0x7a,E0_0x7b,E0_0x7c,E0_0x7d,E0_0x7e,E0_0x7f
	
[dt0_128_t]i:
	.half 	E0_0x80,E0_0x81,E0_0x82,E0_0x83,E0_0x84,E0_0x85,E0_0x86,E0_0x87
	.half 	E0_0x88,E0_0x89,E0_0x8a,E0_0x8b,E0_0x8c,E0_0x8d,E0_0x8e,E0_0x8f

	.half 	E0_0x90,E0_0x91,E0_0x92,E0_0x93,E0_0x94,E0_0x95,E0_0x96,E0_0x97
	.half 	E0_0x98,E0_0x99,E0_0x9a,E0_0x9b,E0_0x9c,E0_0x9d,E0_0x9e,E0_0x9f

	.half 	E0_0xa0,E0_0xa1,E0_0xa2,E0_0xa3,E0_0xa4,E0_0xa5,E0_0xa6,E0_0xa7
	.half 	E0_0xa8,E0_0xa9,E0_0xaa,E0_0xab,E0_0xac,E0_0xad,E0_0xae,E0_0xaf

	.half 	E0_0xb0,E0_0xb1,E0_0xb2,E0_0xb3,E0_0xb4,E0_0xb5,E0_0xb6,E0_0xb7
	.half 	E0_0xb8,E0_0xb9,E0_0xba,E0_0xbb,E0_0xbc,E0_0xbd,E0_0xbe,E0_0xbf

[dt0_192_t]i:	
	.half 	E0_0xc0,E0_0xc1,E0_0xc2,E0_0xc3,E0_0xc4,E0_0xc5,E0_0xc6,E0_0xc7
	.half 	E0_0xc8,E0_0xc9,E0_0xca,E0_0xcb,E0_0xcc,E0_0xcd,E0_0xce,E0_0xcf

	.half 	E0_0xd0,E0_0xd1,E0_0xd2,E0_0xd3,E0_0xd4,E0_0xd5,E0_0xd6,E0_0xd7
	.half 	E0_0xd8,E0_0xd9,E0_0xda,E0_0xdb,E0_0xdc,E0_0xdd,E0_0xde,E0_0xdf

	.half 	E0_0xe0,E0_0xe1,E0_0xe2,E0_0xe3,E0_0xe4,E0_0xe5,E0_0xe6,E0_0xe7
	.half 	E0_0xe8,E0_0xe9,E0_0xea,E0_0xeb,E0_0xec,E0_0xed,E0_0xee,E0_0xef

	.half 	E0_0xf0,E0_0xf1,E0_0xf2,E0_0xf3,E0_0xf4,E0_0xf5,E0_0xf6,E0_0xf7
	.half 	E0_0xf8,E0_0xf9,E0_0xfa,E0_0xfb,E0_0xfc,E0_0xfd,E0_0xfe,E0_0xff

[dt1_0_t]i:	
	.half 	E1_0x00,E1_0x01,E1_0x02,E1_0x03,E1_0x04,E1_0x05,E1_0x06,E1_0x07
	.half 	E1_0x08,E1_0x09,E1_0x0a,E1_0x0b,E1_0x0c,E1_0x0d,E1_0x0e,E1_0x0f

	.half 	E1_0x10,E1_0x11,E1_0x12,E1_0x13,E1_0x14,E1_0x15,E1_0x16,E1_0x17
	.half 	E1_0x18,E1_0x19,E1_0x1a,E1_0x1b,E1_0x1c,E1_0x1d,E1_0x1e,E1_0x1f
	
	.half 	E1_0x20,E1_0x21,E1_0x22,E1_0x23,E1_0x24,E1_0x25,E1_0x26,E1_0x27
	.half 	E1_0x28,E1_0x29,E1_0x2a,E1_0x2b,E1_0x2c,E1_0x2d,E1_0x2e,E1_0x2f
	
	.half 	E1_0x30,E1_0x31,E1_0x32,E1_0x33,E1_0x34,E1_0x35,E1_0x36,E1_0x37
	.half 	E1_0x38,E1_0x39,E1_0x3a,E1_0x3b,E1_0x3c,E1_0x3d,E1_0x3e,E1_0x3f
	
[dt1_64_t]i:
	.half 	E1_0x40,E1_0x41,E1_0x42,E1_0x43,E1_0x44,E1_0x45,E1_0x46,E1_0x47
	.half 	E1_0x48,E1_0x49,E1_0x4a,E1_0x4b,E1_0x4c,E1_0x4d,E1_0x4e,E1_0x4f
	
	.half 	E1_0x50,E1_0x51,E1_0x52,E1_0x53,E1_0x54,E1_0x55,E1_0x56,E1_0x57
	.half 	E1_0x58,E1_0x59,E1_0x5a,E1_0x5b,E1_0x5c,E1_0x5d,E1_0x5e,E1_0x5f
	
	.half 	E1_0x60,E1_0x61,E1_0x62,E1_0x63,E1_0x64,E1_0x65,E1_0x66,E1_0x67
	.half 	E1_0x68,E1_0x69,E1_0x6a,E1_0x6b,E1_0x6c,E1_0x6d,E1_0x6e,E1_0x6f
	
	.half 	E1_0x70,E1_0x71,E1_0x72,E1_0x73,E1_0x74,E1_0x75,E1_0x76,E1_0x77
	.half 	E1_0x78,E1_0x79,E1_0x7a,E1_0x7b,E1_0x7c,E1_0x7d,E1_0x7e,E1_0x7f
	
[dt1_128_t]i:
	.half 	E1_0x80,E1_0x81,E1_0x82,E1_0x83,E1_0x84,E1_0x85,E1_0x86,E1_0x87
	.half 	E1_0x88,E1_0x89,E1_0x8a,E1_0x8b,E1_0x8c,E1_0x8d,E1_0x8e,E1_0x8f

	.half 	E1_0x90,E1_0x91,E1_0x92,E1_0x93,E1_0x94,E1_0x95,E1_0x96,E1_0x97
	.half 	E1_0x98,E1_0x99,E1_0x9a,E1_0x9b,E1_0x9c,E1_0x9d,E1_0x9e,E1_0x9f

	.half 	E1_0xa0,E1_0xa1,E1_0xa2,E1_0xa3,E1_0xa4,E1_0xa5,E1_0xa6,E1_0xa7
	.half 	E1_0xa8,E1_0xa9,E1_0xaa,E1_0xab,E1_0xac,E1_0xad,E1_0xae,E1_0xaf

	.half 	E1_0xb0,E1_0xb1,E1_0xb2,E1_0xb3,E1_0xb4,E1_0xb5,E1_0xb6,E1_0xb7
	.half 	E1_0xb8,E1_0xb9,E1_0xba,E1_0xbb,E1_0xbc,E1_0xbd,E1_0xbe,E1_0xbf

[dt1_192_t]i:	
	.half 	E1_0xc0,E1_0xc1,E1_0xc2,E1_0xc3,E1_0xc4,E1_0xc5,E1_0xc6,E1_0xc7
	.half 	E1_0xc8,E1_0xc9,E1_0xca,E1_0xcb,E1_0xcc,E1_0xcd,E1_0xce,E1_0xcf

	.half 	E1_0xd0,E1_0xd1,E1_0xd2,E1_0xd3,E1_0xd4,E1_0xd5,E1_0xd6,E1_0xd7
	.half 	E1_0xd8,E1_0xd9,E1_0xda,E1_0xdb,E1_0xdc,E1_0xdd,E1_0xde,E1_0xdf

	.half 	E1_0xe0,E1_0xe1,E1_0xe2,E1_0xe3,E1_0xe4,E1_0xe5,E1_0xe6,E1_0xe7
	.half 	E1_0xe8,E1_0xe9,E1_0xea,E1_0xeb,E1_0xec,E1_0xed,E1_0xee,E1_0xef

	.half 	E1_0xf0,E1_0xf1,E1_0xf2,E1_0xf3,E1_0xf4,E1_0xf5,E1_0xf6,E1_0xf7
	.half 	E1_0xf8,E1_0xf9,E1_0xfa,E1_0xfb,E1_0xfc,E1_0xfd,E1_0xfe,E1_0xff
])dnl
changequote(`,')dnl

pthread_mutex_data:

	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	
pthread_counter_data:

	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0

.align 512
pthread_syscall_data:

	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
#ifdef FPGA_HW
#ifdef HPV_NONSPLIT_MODE
.align 32
.global thread_status_mem
thread_status_mem:
	.xword 0x0000000000000000
#endif
#endif

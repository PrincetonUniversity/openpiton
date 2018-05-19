// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: htraps.s
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

#ifdef CSM_ENABLE
#define CSM_TRAP(n) mov n, %g7; b CSM_trap;  nop;nop;nop;nop;nop;nop
#endif

#ifdef SPILL_TRAP_RETRY
#define SPILL_TRAP(n) saved; retry; nop;nop;nop;nop;nop;nop;
#else
#define SPILL_TRAP(n) saved; mov n, %g7; b TrapCheck;  nop;
#endif

#ifdef FILL_TRAP_RETRY
#define FILL_TRAP(n) restored; retry; nop;nop;nop;nop;nop;nop;
#else
#define FILL_TRAP(n) restored; mov n, %g7; b TrapCheck;  nop;
#endif

#define CUSTOM_TRAP(n) setx n, %g1, %g2; jmp %g2; nop

#define CORRECTED_ECC_ERROR_TRAP(n) retry; nop;nop;nop;nop;nop;nop;nop;
				
.text

HT0_Reserved_0x00:		
#ifdef H_HT0_Reserved_0x00
#ifdef SUN_H_HT0_Reserved_0x00
	 SUN_H_HT0_Reserved_0x00 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

HT0_Reserved_0x01:		
#ifdef H_HT0_Reserved_0x01
#ifdef SUN_H_HT0_Reserved_0x01
	 SUN_H_HT0_Reserved_0x01 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

HT0_Reserved_0x02:		
#ifdef H_HT0_Reserved_0x02
#ifdef SUN_H_HT0_Reserved_0x02
	 SUN_H_HT0_Reserved_0x02 
#else
#	ifdef My_HT0_Reserved_0x02
		My_HT0_Reserved_0x02
#	else
        	CUSTOM_TRAP(H_HT0_Reserved_0x02)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

HT0_Reserved_0x03:		
#ifdef H_HT0_Reserved_0x03
#ifdef SUN_H_HT0_Reserved_0x03
	 SUN_H_HT0_Reserved_0x03 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

HT0_Reserved_0x04:		
#ifdef H_HT0_Reserved_0x04
#ifdef SUN_H_HT0_Reserved_0x04
	 SUN_H_HT0_Reserved_0x04 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

HT0_Reserved_0x05:		
#ifdef H_HT0_Reserved_0x05
#ifdef SUN_H_HT0_Reserved_0x05
	 SUN_H_HT0_Reserved_0x05 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

HT0_Reserved_0x06:		
#ifdef H_HT0_Reserved_0x06
#ifdef SUN_H_HT0_Reserved_0x06
	 SUN_H_HT0_Reserved_0x06 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

HT0_Reserved_0x07:		
#ifdef H_HT0_Reserved_0x07
#ifdef SUN_H_HT0_Reserved_0x07
	 SUN_H_HT0_Reserved_0x07 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

HT0_Instruction_Access_Exception_0x08:
#ifdef H_HT0_Instruction_access_exception_0x08
#ifdef SUN_H_HT0_Instruction_access_exception_0x08
	 SUN_H_HT0_Instruction_access_exception_0x08 
#else
#	ifdef My_HT0_Instruction_access_exception_0x08
		My_HT0_Instruction_access_exception_0x08
#	else
		CUSTOM_TRAP(H_HT0_Instruction_access_exception_0x08)
#	endif
#endif
.align 32	
#else	
#	ifdef CLEAR_ITTE_P_ON_INSTR_ACC_EXCE
		b iaccess_except_handler; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x08); 
#	endif
#endif

HT0_Reserved_0x09:		
#ifdef H_HT0_Reserved_0x09
#ifdef SUN_H_HT0_Reserved_0x09
	 SUN_H_HT0_Reserved_0x09 
#else
	CUSTOM_TRAP(H_HT0_Reserved_0x09)
#endif
.align 32	
#else	
	NORMAL_TRAP(0x09); 
#endif

HT0_Instruction_Access_Error_0x0a:		
#ifdef H_HT0_Instruction_access_error_0x0a
#ifdef SUN_H_HT0_Instruction_access_error_0x0a
	 SUN_H_HT0_Instruction_access_error_0x0a 
#else
        CUSTOM_TRAP(H_HT0_Instruction_access_error_0x0a)
#endif
.align 32
#else
#ifdef ENABLE_ITLB_ERROR_TRAP
	stxa %g0, [%g0] 0x60; retry; nop; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x0a); 
#endif
#endif

HT0_Reserved_0x0b:		
#ifdef H_HT0_Reserved_0x0b
#ifdef SUN_H_HT0_Reserved_0x0b
	 SUN_H_HT0_Reserved_0x0b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

HT0_Reserved_0x0c:		
#ifdef H_HT0_Reserved_0x0c
#ifdef SUN_H_HT0_Reserved_0x0c
	 SUN_H_HT0_Reserved_0x0c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

HT0_Reserved_0x0d:		
#ifdef H_HT0_Reserved_0x0d
#ifdef SUN_H_HT0_Reserved_0x0d
	 SUN_H_HT0_Reserved_0x0d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0d)
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

HT0_Reserved_0x0e:		
#ifdef H_HT0_Reserved_0x0e
#ifdef SUN_H_HT0_Reserved_0x0e
	 SUN_H_HT0_Reserved_0x0e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

HT0_Reserved_0x0f:		
#ifdef H_HT0_Reserved_0x0f
#ifdef SUN_H_HT0_Reserved_0x0f
	 SUN_H_HT0_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

HT0_Illegal_Instruction_0x10:
#ifdef H_HT0_Illegal_instruction_0x10
#ifdef SUN_H_HT0_Illegal_instruction_0x10
	 SUN_H_HT0_Illegal_instruction_0x10 
#else
#	ifdef My_HT0_Illegal_instruction_0x10
		My_HT0_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_HT0_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

HT0_Privileged_Opcode_0x11:
#ifdef H_HT0_Privileged_opcode_0x11
#ifdef SUN_H_HT0_Privileged_opcode_0x11
	 SUN_H_HT0_Privileged_opcode_0x11 
#else
#	ifdef My_HT0_Privileged_opcode_0x11
		My_HT0_Privileged_opcode_0x11
#	else
        	CUSTOM_TRAP(H_HT0_Privileged_opcode_0x11)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x11)
#endif

HT0_Unimplemented_LDD_0x12:
#ifdef H_HT0_Unimplemented_LDD_0x12
#ifdef SUN_H_HT0_Unimplemented_LDD_0x12
	 SUN_H_HT0_Unimplemented_LDD_0x12 
#else
        CUSTOM_TRAP(H_HT0_Unimplemented_LDD_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12)
#endif

HT0_Unimplemented_STD_0x13:
#ifdef H_HT0_Unimplemented_STD_0x13
#ifdef SUN_H_HT0_Unimplemented_STD_0x13
	 SUN_H_HT0_Unimplemented_STD_0x13 
#else
        CUSTOM_TRAP(H_HT0_Unimplemented_STD_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13)
#endif

HT0_Reserved_0x14:		
#ifdef H_HT0_Reserved_0x14
#ifdef SUN_H_HT0_Reserved_0x14
	 SUN_H_HT0_Reserved_0x14 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

HT0_Reserved_0x15:		
#ifdef H_HT0_Reserved_0x15
#ifdef SUN_H_HT0_Reserved_0x15
	 SUN_H_HT0_Reserved_0x15 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

HT0_Reserved_0x16:		
#ifdef H_HT0_Reserved_0x16
#ifdef SUN_H_HT0_Reserved_0x16
	 SUN_H_HT0_Reserved_0x16 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

HT0_Reserved_0x17:		
#ifdef H_HT0_Reserved_0x17
#ifdef SUN_H_HT0_Reserved_0x17
	 SUN_H_HT0_Reserved_0x17 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

HT0_Reserved_0x18:		
#ifdef H_HT0_Reserved_0x18
#ifdef SUN_H_HT0_Reserved_0x18
	 SUN_H_HT0_Reserved_0x18 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

HT0_Reserved_0x19:		
#ifdef H_HT0_Reserved_0x19
#ifdef SUN_H_HT0_Reserved_0x19
	 SUN_H_HT0_Reserved_0x19 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

HT0_Reserved_0x1a:		
#ifdef H_HT0_Reserved_0x1a
#ifdef SUN_H_HT0_Reserved_0x1a
	 SUN_H_HT0_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

HT0_Reserved_0x1b:		
#ifdef H_HT0_Reserved_0x1b
#ifdef SUN_H_HT0_Reserved_0x1b
	 SUN_H_HT0_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

HT0_Reserved_0x1c:		
#ifdef H_HT0_Reserved_0x1c
#ifdef SUN_H_HT0_Reserved_0x1c
	 SUN_H_HT0_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

HT0_Reserved_0x1d:		
#ifdef H_HT0_Reserved_0x1d
#ifdef SUN_H_HT0_Reserved_0x1d
	 SUN_H_HT0_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

HT0_Reserved_0x1e:		
#ifdef H_HT0_Reserved_0x1e
#ifdef SUN_H_HT0_Reserved_0x1e
	 SUN_H_HT0_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

HT0_Reserved_0x1f:		
#ifdef H_HT0_Reserved_0x1f
#ifdef SUN_H_HT0_Reserved_0x1f
	 SUN_H_HT0_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

HT0_Fp_Disabled_0x20:
#ifdef H_HT0_Fp_disabled_0x20
#ifdef SUN_H_HT0_Fp_disabled_0x20
	 SUN_H_HT0_Fp_disabled_0x20 
#else
#	ifdef My_HT0_Fp_disabled_0x20
		My_HT0_Fp_disabled_0x20
#	else
        	CUSTOM_TRAP(H_HT0_Fp_disabled_0x20)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x20)
#endif

HT0_Fp_Exception_Ieee_754_0x21:		
#ifdef H_HT0_Fp_exception_ieee_754_0x21
#ifdef SUN_H_HT0_Fp_exception_ieee_754_0x21
	 SUN_H_HT0_Fp_exception_ieee_754_0x21 
#else
        CUSTOM_TRAP(H_HT0_Fp_exception_ieee_754_0x21)
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

HT0_Fp_Exception_Other_0x22:		
#ifdef H_HT0_Fp_exception_other_0x22
#ifdef SUN_H_HT0_Fp_exception_other_0x22
	 SUN_H_HT0_Fp_exception_other_0x22 
#else
#	ifdef My_HT0_Fp_exception_other_0x22
		My_HT0_Fp_exception_other_0x22
#	else
        CUSTOM_TRAP(H_HT0_Fp_exception_other_0x22)
#endif
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

HT0_Tag_Overflow_0x23:		
#ifdef H_HT0_Tag_Overflow
#ifdef SUN_H_HT0_Tag_Overflow
	 SUN_H_HT0_Tag_Overflow 
#else
#	ifdef My_HT0_Tag_Overflow
		My_HT0_Tag_Overflow
#	else
		CUSTOM_TRAP(H_HT0_Tag_Overflow)
#	endif
#endif
#else
	NORMAL_TRAP(0x23); 
#endif
.align	32

HT0_Clean_Window_0x24:
#ifdef H_HT0_Clean_Window
#ifdef SUN_H_HT0_Clean_Window
	 SUN_H_HT0_Clean_Window 
#else
#	ifdef My_HT0_Clean_Window
		My_HT0_Clean_Window
#	else
		CUSTOM_TRAP(H_HT0_Clean_Window)
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

HT0_Division_By_Zero_0x28:		
#ifdef H_HT0_Division_By_Zero
#ifdef SUN_H_HT0_Division_By_Zero
	 SUN_H_HT0_Division_By_Zero 
#else
#	ifdef My_HT0_Division_By_Zero
		My_HT0_Division_By_Zero
#	else
		CUSTOM_TRAP(H_HT0_Division_By_Zero)
#	endif
#endif
#else
	NORMAL_TRAP(0x28); 	
#endif
.align 32	                

HT0_Internal_Processor_Error_0x29:		
#ifdef H_HT0_Internal_Processor_Error_0x29
#ifdef SUN_H_HT0_Internal_Processor_Error_0x29
	 SUN_H_HT0_Internal_Processor_Error_0x29 
#else
        CUSTOM_TRAP(H_HT0_Internal_Processor_Error_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

HT0_Reserved_0x2a:		
#ifdef H_HT0_Reserved_0x2a
#ifdef SUN_H_HT0_Reserved_0x2a
	 SUN_H_HT0_Reserved_0x2a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

HT0_Reserved_0x2b:		
#ifdef H_HT0_Reserved_0x2b
#ifdef SUN_H_HT0_Reserved_0x2b
	 SUN_H_HT0_Reserved_0x2b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

HT0_Reserved_0x2c:		
#ifdef H_HT0_Reserved_0x2c
#ifdef SUN_H_HT0_Reserved_0x2c
	 SUN_H_HT0_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

HT0_Reserved_0x2d:		
#ifdef H_HT0_Reserved_0x2d
#ifdef SUN_H_HT0_Reserved_0x2d
	 SUN_H_HT0_Reserved_0x2d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

HT0_Reserved_0x2e:		
#ifdef H_HT0_Reserved_0x2e
#ifdef SUN_H_HT0_Reserved_0x2e
	 SUN_H_HT0_Reserved_0x2e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

HT0_Reserved_0x2f:		
#ifdef H_HT0_Reserved_0x2f
#ifdef SUN_H_HT0_Reserved_0x2f
	 SUN_H_HT0_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

HT0_Data_Access_Exception_0x30:		
#ifdef H_HT0_Data_Access_Exception_0x30
#ifdef SUN_H_HT0_Data_Access_Exception_0x30
	 SUN_H_HT0_Data_Access_Exception_0x30 
#else

#	ifdef My_HT0_Data_Access_Exception_0x30
		My_HT0_Data_Access_Exception_0x30
#	else
	        CUSTOM_TRAP(H_HT0_Data_Access_Exception_0x30)
#	endif
#endif
.align 32
#else
#	ifdef CLEAR_DTTE_P_ON_DATA_ACC_EXCE
		b daccess_except_handler; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x30); 
#	endif
#endif

HT0_Reserved_0x31:		
#ifdef H_HT0_Reserved_0x31
#ifdef SUN_H_HT0_Reserved_0x31
	 SUN_H_HT0_Reserved_0x31 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x31)
#endif
.align 32
#else
	NORMAL_TRAP(0x31); 
#endif


HT0_Data_Access_Error_0x32:		
#ifdef H_HT0_Data_access_error_0x32
#ifdef SUN_H_HT0_Data_access_error_0x32
	 SUN_H_HT0_Data_access_error_0x32 
#else
        CUSTOM_TRAP(H_HT0_Data_access_error_0x32)
#endif
.align 32
#else
#ifdef ENABLE_DTLB_ERROR_TRAP
	mov 8, %g3; stxa %g0, [%g3] 0x60; retry; nop; nop; nop; nop; nop;
#else
	NORMAL_TRAP(0x32); 
#endif
#endif

HT0_Reserved_0x33:		
#ifdef H_HT0_Reserved_0x33
#ifdef SUN_H_HT0_Reserved_0x33
	 SUN_H_HT0_Reserved_0x33 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x33)
#endif
.align 32
#else
	NORMAL_TRAP(0x33);
#endif

HT0_Mem_Address_Not_Aligned_0x34:		
#ifdef H_HT0_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_HT0_Mem_Address_Not_Aligned_0x34
	 SUN_H_HT0_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_HT0_Mem_Address_Not_Aligned_0x34
		My_HT0_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_HT0_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
#	if defined CHECK_SFSR_SFAR || defined FIX_MEM_ASSRESS_NOT_ALIGNED
		b proc_mem_align; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x34); 
#	endif
#endif

HT0_Lddf_Mem_Address_Not_Aligned_0x35:
#ifdef H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#ifdef SUN_H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
	 SUN_H_HT0_Lddf_Mem_Address_Not_Aligned_0x35 
#else
#	ifdef My_HT0_Lddf_Mem_Address_Not_Aligned_0x35
		My_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#	else
		CUSTOM_TRAP(H_HT0_Lddf_Mem_Address_Not_Aligned_0x35)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

HT0_Stdf_Mem_Address_Not_Aligned_0x36:
#ifdef H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#ifdef SUN_H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
	 SUN_H_HT0_Stdf_Mem_Address_Not_Aligned_0x36 
#else
#	ifdef My_HT0_Stdf_Mem_Address_Not_Aligned_0x36
		My_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#	else
		CUSTOM_TRAP(H_HT0_Stdf_Mem_Address_Not_Aligned_0x36)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

HT0_Privileged_Action_0x37:		
#ifdef H_HT0_Privileged_Action_0x37
#ifdef SUN_H_HT0_Privileged_Action_0x37
	 SUN_H_HT0_Privileged_Action_0x37 
#else
#	ifdef My_HT0_Privileged_Action_0x37
		My_HT0_Privileged_Action_0x37
#	else
		CUSTOM_TRAP(H_HT0_Privileged_Action_0x37)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

HT0_Reserved_0x38:		
#ifdef H_HT0_Reserved_0x38
#ifdef SUN_H_HT0_Reserved_0x38
	 SUN_H_HT0_Reserved_0x38 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

HT0_Reserved_0x39:		
#ifdef H_HT0_Reserved_0x39
#ifdef SUN_H_HT0_Reserved_0x39
	 SUN_H_HT0_Reserved_0x39 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

HT0_Reserved_0x3a:		
#ifdef H_HT0_Reserved_0x3a
#ifdef SUN_H_HT0_Reserved_0x3a
	 SUN_H_HT0_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

HT0_Reserved_0x3b:		
#ifdef H_HT0_Reserved_0x3b
#ifdef SUN_H_HT0_Reserved_0x3b
	 SUN_H_HT0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

HT0_Reserved_0x3c:		
#ifdef H_HT0_Reserved_0x3b
#ifdef SUN_H_HT0_Reserved_0x3b
	 SUN_H_HT0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3c); 
#endif

HT0_Reserved_0x3d:		
#ifdef H_HT0_Reserved_0x3d
#ifdef SUN_H_HT0_Reserved_0x3d
	 SUN_H_HT0_Reserved_0x3d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3d)
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

HT0_Instr_Real_Tran_Miss_0x3e:		
#ifdef H_HT0_Instr_Real_Tran_Miss_0x3e
#ifdef SUN_H_HT0_Instr_Real_Tran_Miss_0x3e
	 SUN_H_HT0_Instr_Real_Tran_Miss_0x3e 
#else
        CUSTOM_TRAP(H_HT0_Instr_Real_Tran_Miss_0x3e)
#endif
.align 32
#else
	mov	0x30, %g7
	ba	immu_real_miss_handler_ext
	ldxa	[%g7] 0x50, %g2		! get ra from tag-access
	nop
	nop
	nop
	nop
	nop
#endif

HT0_Data_Real_Tran_Miss_0x3f:		
#ifdef H_HT0_Data_Real_Tran_Miss_0x3f
#ifdef SUN_H_HT0_Data_Real_Tran_Miss_0x3f
	 SUN_H_HT0_Data_Real_Tran_Miss_0x3f 
#else
        CUSTOM_TRAP(H_HT0_Data_Real_Tran_Miss_0x3f)
#endif
.align 32
#else
	mov	0x30, %g7
	ba	dmmu_real_miss_handler_ext
	ldxa	[%g7] 0x58, %g2		! get ra from tag-access
	nop
	nop
	nop
	nop
	nop
#endif

HT0_Reserved_0x40:		
#ifdef H_HT0_Reserved_0x40
#ifdef SUN_H_HT0_Reserved_0x40
	 SUN_H_HT0_Reserved_0x40 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

HT0_Interrupt_Level_1_0x41:		
#ifdef H_HT0_Interrupt_Level_1_0x41
#ifdef SUN_H_HT0_Interrupt_Level_1_0x41
	 SUN_H_HT0_Interrupt_Level_1_0x41 
#else
#	ifdef My_HT0_Interrupt_Level_1_0x41
		My_HT0_Interrupt_Level_1_0x41
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_1_0x41)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

HT0_Interrupt_Level_2_0x42:		
#ifdef H_HT0_Interrupt_Level_2_0x42
#ifdef SUN_H_HT0_Interrupt_Level_2_0x42
	 SUN_H_HT0_Interrupt_Level_2_0x42 
#else
#	ifdef My_HT0_Interrupt_Level_2_0x42
		My_HT0_Interrupt_Level_2_0x42
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_2_0x42)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

HT0_Interrupt_Level_3_0x43:		
#ifdef H_HT0_Interrupt_Level_3_0x43
#ifdef SUN_H_HT0_Interrupt_Level_3_0x43
	 SUN_H_HT0_Interrupt_Level_3_0x43 
#else
#	ifdef My_HT0_Interrupt_Level_3_0x43
		My_HT0_Interrupt_Level_3_0x43
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_3_0x43)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

HT0_Interrupt_Level_4_0x44:		
#ifdef H_HT0_Interrupt_Level_4_0x44
#ifdef SUN_H_HT0_Interrupt_Level_4_0x44
	 SUN_H_HT0_Interrupt_Level_4_0x44 
#else
#	ifdef My_HT0_Interrupt_Level_4_0x44
		My_HT0_Interrupt_Level_4_0x44
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_4_0x44)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

HT0_Interrupt_Level_5_0x45:		
#ifdef H_HT0_Interrupt_Level_5_0x45
#ifdef SUN_H_HT0_Interrupt_Level_5_0x45
	 SUN_H_HT0_Interrupt_Level_5_0x45 
#else
#	ifdef My_HT0_Interrupt_Level_5_0x45
		My_HT0_Interrupt_Level_5_0x45
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_5_0x45)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

HT0_Interrupt_Level_6_0x46:		
#ifdef H_HT0_Interrupt_Level_6_0x46
#ifdef SUN_H_HT0_Interrupt_Level_6_0x46
	 SUN_H_HT0_Interrupt_Level_6_0x46 
#else
#	ifdef My_HT0_Interrupt_Level_6_0x46
		My_HT0_Interrupt_Level_6_0x46
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_6_0x46)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

HT0_Interrupt_Level_7_0x47:		
#ifdef H_HT0_Interrupt_Level_7_0x47
#ifdef SUN_H_HT0_Interrupt_Level_7_0x47
	 SUN_H_HT0_Interrupt_Level_7_0x47 
#else
#	ifdef My_HT0_Interrupt_Level_7_0x47
		My_HT0_Interrupt_Level_7_0x47
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_7_0x47)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

HT0_Interrupt_Level_8_0x48:		
#ifdef H_HT0_Interrupt_Level_8_0x48
#ifdef SUN_H_HT0_Interrupt_Level_8_0x48
	 SUN_H_HT0_Interrupt_Level_8_0x48 
#else
#	ifdef My_HT0_Interrupt_Level_8_0x48
		My_HT0_Interrupt_Level_8_0x48
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_8_0x48)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

HT0_Interrupt_Level_9_0x49:		
#ifdef H_HT0_Interrupt_Level_9_0x49
#ifdef SUN_H_HT0_Interrupt_Level_9_0x49
	 SUN_H_HT0_Interrupt_Level_9_0x49 
#else
#	ifdef My_HT0_Interrupt_Level_9_0x49
		My_HT0_Interrupt_Level_9_0x49
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_9_0x49)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

HT0_Interrupt_Level_10_0x4a:		
#ifdef H_HT0_Interrupt_Level_10_0x4a
#ifdef SUN_H_HT0_Interrupt_Level_10_0x4a
	 SUN_H_HT0_Interrupt_Level_10_0x4a 
#else
#	ifdef My_HT0_Interrupt_Level_10_0x4a
		My_HT0_Interrupt_Level_10_0x4a
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_10_0x4a)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

HT0_Interrupt_Level_11_0x4b:		
#ifdef H_HT0_Interrupt_Level_11_0x4b
#ifdef SUN_H_HT0_Interrupt_Level_11_0x4b
	 SUN_H_HT0_Interrupt_Level_11_0x4b 
#else
#	ifdef My_HT0_Interrupt_Level_11_0x4b
		My_HT0_Interrupt_Level_11_0x4b
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_11_0x4b)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

HT0_Interrupt_Level_12_0x4c:		
#ifdef H_HT0_Interrupt_Level_12_0x4c
#ifdef SUN_H_HT0_Interrupt_Level_12_0x4c
	 SUN_H_HT0_Interrupt_Level_12_0x4c 
#else
#	ifdef My_HT0_Interrupt_Level_12_0x4c
		My_HT0_Interrupt_Level_12_0x4c
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_12_0x4c)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

HT0_Interrupt_Level_13_0x4d:		
#ifdef H_HT0_Interrupt_Level_13_0x4d
#ifdef SUN_H_HT0_Interrupt_Level_13_0x4d
	 SUN_H_HT0_Interrupt_Level_13_0x4d 
#else
#	ifdef My_HT0_Interrupt_Level_13_0x4d
		My_HT0_Interrupt_Level_13_0x4d
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_13_0x4d)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

HT0_Interrupt_Level_14_0x4e:		
#ifdef H_HT0_Interrupt_Level_14_0x4e
#ifdef SUN_H_HT0_Interrupt_Level_14_0x4e
	 SUN_H_HT0_Interrupt_Level_14_0x4e 
#else
#	ifdef My_HT0_Interrupt_Level_14_0x4e
		My_HT0_Interrupt_Level_14_0x4e
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_14_0x4e)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

HT0_Interrupt_Level_15_0x4f:		
#ifdef H_HT0_Interrupt_Level_15_0x4f
#ifdef SUN_H_HT0_Interrupt_Level_15_0x4f
	 SUN_H_HT0_Interrupt_Level_15_0x4f 
#else
#	ifdef My_HT0_Interrupt_Level_15_0x4f
		My_HT0_Interrupt_Level_15_0x4f
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_15_0x4f)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

HT0_Reserved_0x50:		
#ifdef H_HT0_Reserved_0x50
#ifdef SUN_H_HT0_Reserved_0x50
	 SUN_H_HT0_Reserved_0x50 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

HT0_Reserved_0x51:		
#ifdef H_HT0_Reserved_0x51
#ifdef SUN_H_HT0_Reserved_0x51
	 SUN_H_HT0_Reserved_0x51 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

HT0_Reserved_0x52:		
#ifdef H_HT0_Reserved_0x52
#ifdef SUN_H_HT0_Reserved_0x52
	 SUN_H_HT0_Reserved_0x52 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

HT0_Reserved_0x53:		
#ifdef H_HT0_Reserved_0x53
#ifdef SUN_H_HT0_Reserved_0x53
	 SUN_H_HT0_Reserved_0x53 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

HT0_Reserved_0x54:		
#ifdef H_HT0_Reserved_0x54
#ifdef SUN_H_HT0_Reserved_0x54
	 SUN_H_HT0_Reserved_0x54 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

HT0_Reserved_0x55:		
#ifdef H_HT0_Reserved_0x55
#ifdef SUN_H_HT0_Reserved_0x55
	 SUN_H_HT0_Reserved_0x55 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

HT0_Reserved_0x56:		
#ifdef H_HT0_Reserved_0x56
#ifdef SUN_H_HT0_Reserved_0x56
	 SUN_H_HT0_Reserved_0x56 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

HT0_Reserved_0x57:		
#ifdef H_HT0_Reserved_0x57
#ifdef SUN_H_HT0_Reserved_0x57
	 SUN_H_HT0_Reserved_0x57 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

HT0_Reserved_0x58:		
#ifdef H_HT0_Reserved_0x58
#ifdef SUN_H_HT0_Reserved_0x58
	 SUN_H_HT0_Reserved_0x58 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

HT0_Reserved_0x59:		
#ifdef H_HT0_Reserved_0x59
#ifdef SUN_H_HT0_Reserved_0x59
	 SUN_H_HT0_Reserved_0x59 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

HT0_Reserved_0x5a:		
#ifdef H_HT0_Reserved_0x5a
#ifdef SUN_H_HT0_Reserved_0x5a
	 SUN_H_HT0_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

HT0_Reserved_0x5b:		
#ifdef H_HT0_Reserved_0x5b
#ifdef SUN_H_HT0_Reserved_0x5b
	 SUN_H_HT0_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

HT0_Reserved_0x5c:		
#ifdef H_HT0_Reserved_0x5c
#ifdef SUN_H_HT0_Reserved_0x5c
	 SUN_H_HT0_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

HT0_Reserved_0x5d:		
#ifdef H_HT0_Reserved_0x5d
#ifdef SUN_H_HT0_Reserved_0x5d
	 SUN_H_HT0_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

HT0_Reserved_0x5e:		
#ifdef H_HT0_Reserved_0x5e
#ifdef SUN_H_HT0_Reserved_0x5e
	 SUN_H_HT0_Reserved_0x5e 
#else
#	ifdef My_HT0_Reserved_0x5e
		My_HT0_Reserved_0x5e
#	else
        	CUSTOM_TRAP(H_HT0_Reserved_0x5e)
#	endif
#endif
.align 32
#else
	!  disable  HSTICK_COMPARE
	wrhpr	%g0, -1, %hsys_tick_cmpr
	wrhpr	%g0, 0, %hintp
	mov     0x5e, %g7
	b       TrapCheckWithRetry
	nop
	nop
	nop
	nop
#endif

HT0_Reserved_0x5f:		
#ifdef H_HT0_Reserved_0x5f
#ifdef SUN_H_HT0_Reserved_0x5f
	 SUN_H_HT0_Reserved_0x5f 
#else
#	ifdef My_HT0_Reserved_0x5f
		My_HT0_Reserved_0x5f
#	else
        	CUSTOM_TRAP(H_HT0_Reserved_0x5f)
#	endif
#endif
.align 32
#else
	rdhpr	%htstate, %g1
	mov	0x1, %g2	
	wrhpr	%g1, %g2, %htstate
	mov     0x5f, %g7
	b       TrapCheckWithRetry
	nop
	nop
	nop
#endif 

HT0_Interrupt_0x60:	
#ifdef DYNAMIC_CSM
    b CSM_trap
    nop
CSM_trap_done:	
#endif
#ifdef H_HT0_Interrupt_0x60
#ifdef SUN_H_HT0_Interrupt_0x60
	 SUN_H_HT0_Interrupt_0x60 
#else
#	ifdef My_HT0_Interrupt_0x60
		My_HT0_Interrupt_0x60
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_0x60)
#	endif
#endif
#else
#   ifdef DYNAMIC_CSM
        retry
        nop
#   else
	    NORMAL_TRAP(0x60); 
#   endif
#endif
.align 64

!!HT0_Reserved_0x61:		
!!#ifdef H_HT0_Reserved_0x61
!!#ifdef SUN_H_HT0_Reserved_0x61
!!	 SUN_H_HT0_Reserved_0x61 
!!#else
!!        CUSTOM_TRAP(H_HT0_Reserved_0x61)
!!#endif
!!.align 32
!!#else
!!	NORMAL_TRAP(0x61); 
!!#endif

HT0_Reserved_0x62:		
#ifdef H_HT0_Reserved_0x62
#ifdef SUN_H_HT0_Reserved_0x62
	 SUN_H_HT0_Reserved_0x62 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x62)
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

HT0_Corrected_ECC_error_0x63:		
#ifdef H_HT0_Corrected_ECC_error_0x63
#ifdef SUN_H_HT0_Corrected_ECC_error_0x63
	 SUN_H_HT0_Corrected_ECC_error_0x63 
#else
#	ifdef My_HT0_Corrected_ECC_error_0x63
		My_HT0_Corrected_ECC_error_0x63
#       else
                CUSTOM_TRAP(H_HT0_Corrected_ECC_error_0x63)
#       endif
#endif
.align 32
#else
	CORRECTED_ECC_ERROR_TRAP(0x63); 
#endif

HT0_Fast_Instr_Access_MMU_Miss_0x64:
#ifdef H_HT0_fast_instr_access_MMU_miss
#ifdef SUN_H_HT0_fast_instr_access_MMU_miss
	 SUN_H_HT0_fast_instr_access_MMU_miss 
#else
        CUSTOM_TRAP(H_HT0_fast_instr_access_MMU_miss)
#endif
#else
#ifdef S2MEM_IMMU_MISS_HANDLER
#include S2MEM_IMMU_MISS_HANDLER
#else
#include <immu_miss_handler.s>
#endif	
#endif

.align 128
HT0_Fast_Data_Access_MMU_Miss_0x68:
#ifdef H_HT0_fast_data_access_MMU_miss
#ifdef SUN_H_HT0_fast_data_access_MMU_miss
	 SUN_H_HT0_fast_data_access_MMU_miss 
#else
        CUSTOM_TRAP(H_HT0_fast_data_access_MMU_miss)
#endif
#else
#ifdef S2MEM_DMMU_MISS_HANDLER
#include S2MEM_DMMU_MISS_HANDLER
#else
#include <dmmu_miss_handler.s>
#endif	
#endif

.align 128	
HT0_Fast_Data_Access_Protection_0x6c:		
#ifdef H_HT0_data_access_protection_0x6c
#ifdef SUN_H_HT0_data_access_protection_0x6c
	 SUN_H_HT0_data_access_protection_0x6c 
#else
        CUSTOM_TRAP(H_HT0_data_access_protection_0x6c)
#endif
#else
#ifdef SET_DTTE_W_ON_DATA_ACC_PROT
	ba	daccess_prot_handler
	nop
#else
		NORMAL_TRAP(0x6c);
#endif
#endif

.align 128	
HT0_Reserved_0x70:		
#ifdef H_HT0_Reserved_0x70
#ifdef SUN_H_HT0_Reserved_0x70
	 SUN_H_HT0_Reserved_0x70 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

HT0_Reserved_0x71:		
#ifdef H_HT0_Reserved_0x71
#ifdef SUN_H_HT0_Reserved_0x71
	 SUN_H_HT0_Reserved_0x71 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

HT0_Reserved_0x72:		
#ifdef H_HT0_Reserved_0x72
#ifdef SUN_H_HT0_Reserved_0x72
	 SUN_H_HT0_Reserved_0x72 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

HT0_Reserved_0x73:		
#ifdef H_HT0_Reserved_0x73
#ifdef SUN_H_HT0_Reserved_0x73
	 SUN_H_HT0_Reserved_0x73 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

HT0_Reserved_0x74:		
#ifdef H_HT0_Reserved_0x74
#ifdef SUN_H_HT0_Reserved_0x74
	 SUN_H_HT0_Reserved_0x74 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x74)
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

HT0_Reserved_0x75:		
#ifdef H_HT0_Reserved_0x75
#ifdef SUN_H_HT0_Reserved_0x75
	 SUN_H_HT0_Reserved_0x75 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

HT0_Reserved_0x76:		
#ifdef H_HT0_Reserved_0x76
#ifdef SUN_H_HT0_Reserved_0x76
	 SUN_H_HT0_Reserved_0x76 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

HT0_Reserved_0x77:		
#ifdef H_HT0_Reserved_0x77
#ifdef SUN_H_HT0_Reserved_0x77
	 SUN_H_HT0_Reserved_0x77 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

HT0_Reserved_0x78:		
#ifdef H_HT0_Reserved_0x78
#ifdef SUN_H_HT0_Reserved_0x78
	 SUN_H_HT0_Reserved_0x78 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

HT0_Reserved_0x79:		
#ifdef H_HT0_Reserved_0x79
#ifdef SUN_H_HT0_Reserved_0x79
	 SUN_H_HT0_Reserved_0x79 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

HT0_Reserved_0x7a:		
#ifdef H_HT0_Reserved_0x7a
#ifdef SUN_H_HT0_Reserved_0x7a
	 SUN_H_HT0_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

HT0_Reserved_0x7b:		
#ifdef H_HT0_Reserved_0x7b
#ifdef SUN_H_HT0_Reserved_0x7b
	 SUN_H_HT0_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

HT0_Reserved_0x7c:		
#ifdef H_HT0_Reserved_0x7c
#ifdef SUN_H_HT0_Reserved_0x7c
	 SUN_H_HT0_Reserved_0x7c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7c)
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

HT0_Reserved_0x7d:		
#ifdef H_HT0_Reserved_0x7d
#ifdef SUN_H_HT0_Reserved_0x7d
	 SUN_H_HT0_Reserved_0x7d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7d)
#endif
.align 32
#else
	NORMAL_TRAP(0x7d); 
#endif

HT0_Reserved_0x7e:		
#ifdef H_HT0_Reserved_0x7e
#ifdef SUN_H_HT0_Reserved_0x7e
	 SUN_H_HT0_Reserved_0x7e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7e)
#endif
.align 32
#else
	NORMAL_TRAP(0x7e); 
#endif

HT0_Reserved_0x7f:		
#ifdef H_HT0_Reserved_0x7f
#ifdef SUN_H_HT0_Reserved_0x7f
	 SUN_H_HT0_Reserved_0x7f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7f)
#endif
.align 32
#else
	NORMAL_TRAP(0x7f)
#endif

HT0_Window_Spill_0_Normal_0x80:		
#ifdef H_HT0_Window_Spill_0_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_0_Normal_Trap
	 SUN_H_HT0_Window_Spill_0_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_0_Normal_Trap
		My_HT0_Window_Spill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_0_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x80)
#endif

.align 128	
HT0_Window_Spill_1_Normal_0x84:		
#ifdef H_HT0_Window_Spill_1_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_1_Normal_Trap
	 SUN_H_HT0_Window_Spill_1_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_1_Normal_Trap
		My_HT0_Window_Spill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_1_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x84)
#endif

.align 128	
HT0_Window_Spill_2_Normal_0x88:		
#ifdef H_HT0_Window_Spill_2_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_2_Normal_Trap
	 SUN_H_HT0_Window_Spill_2_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_2_Normal_Trap
		My_HT0_Window_Spill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_2_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x88)
#endif

.align 128	
HT0_Window_Spill_3_Normal_0x8c:		
#ifdef H_HT0_Window_Spill_3_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_3_Normal_Trap
	 SUN_H_HT0_Window_Spill_3_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_3_Normal_Trap
		My_HT0_Window_Spill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_3_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x8c)
#endif

.align 128	
HT0_Window_Spill_4_Normal_0x90:
#ifdef H_HT0_Window_Spill_4_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_4_Normal_Trap
	 SUN_H_HT0_Window_Spill_4_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_4_Normal_Trap
		My_HT0_Window_Spill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_4_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x90)
#endif

.align 128	
HT0_Window_Spill_5_Normal_0x94:
#ifdef H_HT0_Window_Spill_5_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_5_Normal_Trap
	 SUN_H_HT0_Window_Spill_5_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_5_Normal_Trap
		My_HT0_Window_Spill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_5_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x94)
#endif

.align 128	
HT0_Window_Spill_6_Normal_0x98:
#ifdef H_HT0_Window_Spill_6_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_6_Normal_Trap
	 SUN_H_HT0_Window_Spill_6_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_6_Normal_Trap
		My_HT0_Window_Spill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_6_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x98)
#endif

.align 128	
HT0_Window_Spill_7_Normal_0x9c:
#ifdef H_HT0_Window_Spill_7_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_7_Normal_Trap
	 SUN_H_HT0_Window_Spill_7_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_7_Normal_Trap
		My_HT0_Window_Spill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_7_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x9c)
#endif

.align 128
HT0_Window_Spill_0_Other_0xa0:		
#ifdef H_HT0_Window_Spill_0_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_0_Other_Trap
	 SUN_H_HT0_Window_Spill_0_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_0_Other_Trap
		My_HT0_Window_Spill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_0_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa0)
#endif

.align 128
HT0_Window_Spill_1_Other_0xa4:		
#ifdef H_HT0_Window_Spill_1_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_1_Other_Trap
	 SUN_H_HT0_Window_Spill_1_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_1_Other_Trap
		My_HT0_Window_Spill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_1_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa4)
#endif

.align 128
HT0_Window_Spill_2_Other_0xa8:		
#ifdef H_HT0_Window_Spill_2_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_2_Other_Trap
	 SUN_H_HT0_Window_Spill_2_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_2_Other_Trap
		My_HT0_Window_Spill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_2_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa8)
#endif

.align 128
HT0_Window_Spill_3_Other_0xac:
#ifdef H_HT0_Window_Spill_3_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_3_Other_Trap
	 SUN_H_HT0_Window_Spill_3_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_3_Other_Trap
		My_HT0_Window_Spill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_3_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xac)
#endif

.align 128
HT0_Window_Spill_4_Other_0xb0:
#ifdef H_HT0_Window_Spill_4_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_4_Other_Trap
	 SUN_H_HT0_Window_Spill_4_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_4_Other_Trap
		My_HT0_Window_Spill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_4_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb0)
#endif

.align 128
HT0_Window_Spill_5_Other_0xb4:
#ifdef H_HT0_Window_Spill_5_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_5_Other_Trap
	 SUN_H_HT0_Window_Spill_5_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_5_Other_Trap
		My_HT0_Window_Spill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_5_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb4)
#endif

.align 128
HT0_Window_Spill_6_Other_0xb8:
#ifdef H_HT0_Window_Spill_6_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_6_Other_Trap
	 SUN_H_HT0_Window_Spill_6_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_6_Other_Trap
		My_HT0_Window_Spill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_6_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb8)
#endif

.align 128
HT0_Window_Spill_7_Other_0xbc:
#ifdef H_HT0_Window_Spill_7_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_7_Other_Trap
	 SUN_H_HT0_Window_Spill_7_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_7_Other_Trap
		My_HT0_Window_Spill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_7_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xbc)
#endif

.align 128
HT0_Window_Fill_0_Normal_0xc0:
#ifdef H_HT0_Window_Fill_0_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_0_Normal_Trap
	 SUN_H_HT0_Window_Fill_0_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_0_Normal_Trap
		My_HT0_Window_Fill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_0_Normal_Trap)
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
HT0_Window_Fill_1_Normal_0xc4:
#ifdef H_HT0_Window_Fill_1_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_1_Normal_Trap
	 SUN_H_HT0_Window_Fill_1_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_1_Normal_Trap
		My_HT0_Window_Fill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_1_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xc4)
#endif

.align 128
HT0_Window_Fill_2_Normal_0xc8:
#ifdef H_HT0_Window_Fill_2_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_2_Normal_Trap
	 SUN_H_HT0_Window_Fill_2_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_2_Normal_Trap
		My_HT0_Window_Fill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_2_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xc8)
#endif

.align 128
HT0_Window_Fill_3_Normal_0xcc:
#ifdef H_HT0_Window_Fill_3_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_3_Normal_Trap
	 SUN_H_HT0_Window_Fill_3_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_3_Normal_Trap
		My_HT0_Window_Fill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_3_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xcc)
#endif

.align 128
HT0_Window_Fill_4_Normal_0xd0:
#ifdef H_HT0_Window_Fill_4_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_4_Normal_Trap
	 SUN_H_HT0_Window_Fill_4_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_4_Normal_Trap
		My_HT0_Window_Fill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_4_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd0)
#endif

.align 128
HT0_Window_Fill_5_Normal_0xd4:
#ifdef H_HT0_Window_Fill_5_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_5_Normal_Trap
	 SUN_H_HT0_Window_Fill_5_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_5_Normal_Trap
		My_HT0_Window_Fill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_5_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd4)
#endif

.align 128
HT0_Window_Fill_6_Normal_0xd8:
#ifdef H_HT0_Window_Fill_6_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_6_Normal_Trap
	 SUN_H_HT0_Window_Fill_6_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_6_Normal_Trap
		My_HT0_Window_Fill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_6_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd8)
#endif

.align 128
HT0_Window_Fill_7_Normal_0xdc:
#ifdef H_HT0_Window_Fill_7_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_7_Normal_Trap
	 SUN_H_HT0_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_7_Normal_Trap
		My_HT0_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xdc)
#endif

.align 128
HT0_Window_Fill_0_Other_0xe0:
#ifdef H_HT0_Window_Fill_0_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_0_Other_Trap
	 SUN_H_HT0_Window_Fill_0_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_0_Other_Trap
		My_HT0_Window_Fill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_0_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe0)
#endif

.align 128
HT0_Window_Fill_1_Other_0xe4:
#ifdef H_HT0_Window_Fill_1_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_1_Other_Trap
	 SUN_H_HT0_Window_Fill_1_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_1_Other_Trap
		My_HT0_Window_Fill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_1_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe4)
#endif

.align 128
HT0_Window_Fill_2_Other_0xe8:
#ifdef H_HT0_Window_Fill_2_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_2_Other_Trap
	 SUN_H_HT0_Window_Fill_2_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_2_Other_Trap
		My_HT0_Window_Fill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_2_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe8)
#endif

.align 128
HT0_Window_Fill_3_Other_0xec:
#ifdef H_HT0_Window_Fill_3_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_3_Other_Trap
	 SUN_H_HT0_Window_Fill_3_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_3_Other_Trap
		My_HT0_Window_Fill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_3_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xec)
#endif

.align 128
HT0_Window_Fill_4_Other_0xf0:
#ifdef H_HT0_Window_Fill_4_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_4_Other_Trap
	 SUN_H_HT0_Window_Fill_4_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_4_Other_Trap
		My_HT0_Window_Fill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_4_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf0)
#endif

.align 128
HT0_Window_Fill_5_Other_0xf4:
#ifdef H_HT0_Window_Fill_5_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_5_Other_Trap
	 SUN_H_HT0_Window_Fill_5_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_5_Other_Trap
		My_HT0_Window_Fill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_5_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf4)
#endif

.align 128
HT0_Window_Fill_6_Other_0xf8:
#ifdef H_HT0_Window_Fill_6_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_6_Other_Trap
	 SUN_H_HT0_Window_Fill_6_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_6_Other_Trap
		My_HT0_Window_Fill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_6_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf8)
#endif

.align 128
HT0_Window_Fill_7_Other_0xfc:
#ifdef H_HT0_Window_Fill_7_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_7_Other_Trap
	 SUN_H_HT0_Window_Fill_7_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_7_Other_Trap
		My_HT0_Window_Fill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_7_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xfc)
#endif

.align 128
HT0_GoodTrap_0x100:
good_trap:		
#ifndef TESTER_DUMP
#ifndef FPGA_HW
	rd %asr26, %g1; wr %g1, 0x1, %asr26; nop; b good_trap;nop;nop;nop;nop
#else
	CUSTOM_TRAP(proc_good_trap)
#endif
#else
        CUSTOM_TRAP(state_checkpoint_skip)
#endif

HT0_BadTrap_0x101:
#ifdef EXPECT_BAD_TRAP
	b good_trap; nop;nop;nop;nop;nop;nop;nop
#else			
bad_trap:
#ifndef FPGA_HW
	b bad_trap; nop;nop;nop;nop;nop;nop;nop
#else
	CUSTOM_TRAP(proc_bad_trap)
#endif
#endif
	
HT0_ChangePriv_0x102:
#ifdef H_HT0_ChangePriv_0x102
#ifdef SUN_H_HT0_ChangePriv_0x102
         SUN_H_HT0_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_HT0_ChangePriv_0x102)
#endif
#else
	rdpr	%tstate, %g1
	mov	0x400, %g2
	and	%g1, %g2, %g3
	brz,a	%g3, .+8
	wrpr	%g1, %g2, %tstate
	done
	nop
	nop
#endif
	
HT0_ChangeNonPriv_0x103:
#ifdef H_HT0_ChangeNonPriv_0x103
#ifdef SUN_H_HT0_ChangeNonPriv_0x103
         SUN_H_HT0_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_HT0_ChangeNonPriv_0x103)
#endif
#else
	rdpr	%tstate, %g1
	mov	0x400, %g2
	and	%g1, %g2, %g3
	brnz,a	%g3, .+8
	wrpr	%g1, %g2, %tstate
	done
	nop
	nop
#endif

HT0_ChangeToTL1_0x104:
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
	
HT0_ChangeToTL0_0x105:
#ifdef H_HT0_ChangeToTL0_0x105
#ifdef SUN_H_HT0_ChangeToTL0_0x105
	 SUN_H_HT0_ChangeToTL0_0x105 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x105)
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
	
HT0_ChangeToTL0_0x106:
#ifdef H_HT0_ChangeToTL0_0x106
#ifdef SUN_H_HT0_ChangeToTL0_0x106
	 SUN_H_HT0_ChangeToTL0_0x106 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x106)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	rdpr %tt, %g4
	done
#endif
	
HT0_ChangeToTL0_0x107:
#ifdef H_HT0_ChangeToTL0_0x107
#ifdef SUN_H_HT0_ChangeToTL0_0x107
	 SUN_H_HT0_ChangeToTL0_0x107 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x107)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	rdpr %tt, %g4
	done
#endif
	
.align 128
HT0_TrapEn_0x108:
! FIXME emulate priv trap	
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_TrapDis_0x10a:	
! FIXME emulate priv trap	
	setx	htrap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_TrapEn_Ntimes_0x10c:	
	setx	htrap_enable_data, %g2, %g1
        mov     %o1, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 128
HT0_PThreadMutexLock_0x110:
#ifdef H_HT0_PThreadMutexLock_0x110
#ifdef SUN_H_HT0_PThreadMutexLock_0x110
         SUN_H_HT0_PThreadMutexLock_0x110
#else
        CUSTOM_TRAP(H_HT0_PThreadMutexLock_0x110)
#endif
#else
	rdpr	%tl, %g2
	cmp	%g2, 2
	bne,a	.+8
	or	%i0, %g0, %g1
	setx	hpthread_mutex_data, %g2, %g3
pt_retry:	
	ldstub	[%g3+%g1], %g2
	brz	%g2, pt_done
	nop
pt_loop:
	ldub	[%g3+%g1], %g2
	brnz	%g2, pt_loop
	nop
	ba,a	pt_retry
pt_done:
	membar	#LoadLoad | #LoadStore
	done
#endif

HT0_ChangeToTL0_0x111:
#ifdef H_HT0_ChangeToTL0_0x111
#ifdef SUN_HT0_ChangeToTL0_0x111
         SUN_HT0_ChangeToTL0_0x111
#else
        CUSTOM_TRAP(H_HT0_ChangeToTL0_0x111)
#endif
#else
	done
	nop
#endif

.align 128
HT0_PThreadMutexUnLock_0x114:	
	setx	hpthread_mutex_data, %g2, %g5
	stub	%g0, [%g5+%g1]
	done
	
.align 64
HT0_Trap_Sync_0x116:
	
	setx	hpthread_counter_data, %g1, %g4
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
HT0_Trap_Function_0x118:
! call kernel dervice routine	
	mov	0x0,	%o0
	done
	.word 0x118
	nop
	nop
	nop
	nop
	nop

.align 512
HT0_Trap_Function_0x120:
! call kernel dervice routine	
	rdhpr	%htstate, %g1
	mov	0x400, %g2
	and	%g1, %g2, %g3
	brz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x120
	nop
	
.align 64
HT0_Trap_Function_0x122:
	rdhpr	%htstate, %g1
	mov	0x4, %g2
	and	%g1, %g2, %g3
	brnz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x122
	nop
	nop
	
.align 64
HT0_Trap_Function_0x124:
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64	
HT0_Trap_Function_0x126:
	setx	htrap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_Trap_Function_0x128:	
	setx	htrap_enable_data, %g2, %g1
        mov     %o1, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
! Function to set PCONTEXT, SCONTEXT,
! pstate.priv, hpstate.hpriv and
! jump to target address.
! Caller should pass argument as:
! %o1    = PCONTEXT
! %o2    = SCONTEXT
! %o3[0] = desired pstate.priv value
! %o4[0] = desired hpstate.hpriv value
! %o5    = target VA
HT0_Trap_Function_0x12a:	
	mov	0x08, %g1
	stxa	%o1, [%g1] 0x21	! set PCONTEXT
	mov	0x10, %g1
	stxa	%o2, [%g1] 0x21	! set SCONTEXT
	xor	%o3, 0x1, %o3	! invert bit so that later can
	xor	%o4, 0x1, %o4	!    be xor'ed using wrpr 
	sllx	%o3, 10, %o3	! align priv bit
	sllx	%o4, 2, %o4	! align hpriv bit
	rdpr 	%tstate, %g1
	or	%g1, 0x400, %g1
	wrpr	%g1, %o3, %tstate
	rdhpr 	%htstate, %g1
	or	%g1, 0x4, %g1
	wrhpr	%g1, %o4, %htstate
	wrpr	%o5, %g0, %tnpc
	done
	nop
	nop

.align 64
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %o1.
HT0_RdThId_0x12e:

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

.align 512
HT0_Trap_Instruction_0x130:
#ifdef H_HT0_Trap_Instruction_0
#ifdef SUN_H_HT0_Trap_Instruction_0
	 SUN_H_HT0_Trap_Instruction_0 
#else
#	ifdef My_HT0_Trap_Instruction_0
		My_HT0_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
HT0_Trap_Instruction_0x131:
#ifdef H_HT0_Trap_Instruction_1
#ifdef SUN_H_HT0_Trap_Instruction_1
	 SUN_H_HT0_Trap_Instruction_1 
#else
#	ifdef My_HT0_Trap_Instruction_1
		My_HT0_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
HT0_Trap_Instruction_0x132:
#ifdef H_HT0_Trap_Instruction_2
#ifdef SUN_H_HT0_Trap_Instruction_2
	 SUN_H_HT0_Trap_Instruction_2 
#else
#	ifdef My_HT0_Trap_Instruction_2
		My_HT0_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_2)
#	endif
#endif
#else
	NORMAL_TRAP(0x132);
#endif

.align 32
HT0_Trap_Instruction_0x133:
#ifdef H_HT0_Trap_Instruction_3
#ifdef SUN_H_HT0_Trap_Instruction_3
	 SUN_H_HT0_Trap_Instruction_3 
#else
#	ifdef My_HT0_Trap_Instruction_3
		My_HT0_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_3)
#	endif
#endif
#else
	NORMAL_TRAP(0x133);
#endif

.align 32
HT0_Trap_Instruction_0x134:
#ifdef H_HT0_Trap_Instruction_4
#ifdef SUN_H_HT0_Trap_Instruction_4
	 SUN_H_HT0_Trap_Instruction_4 
#else
#	ifdef My_HT0_Trap_Instruction_4
		My_HT0_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
HT0_Trap_Instruction_0x135:
#ifdef H_HT0_Trap_Instruction_5
#ifdef SUN_H_HT0_Trap_Instruction_5
	 SUN_H_HT0_Trap_Instruction_5
#else
#	ifdef My_HT0_Trap_Instruction_5
		My_HT0_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif


	
.align 128	
	
HT0_Trap_0x138:
	NORMAL_TRAP(0x138);
.align 128	

HT0_Trap_0x13c:
	NORMAL_TRAP(0x13c);
.align 128	
	
HT0_Trap_0x140:
	NORMAL_TRAP(0x140);
.align 128	
	
HT0_Trap_0x144:
	NORMAL_TRAP(0x144);
.align 128	
	
HT0_Trap_0x148:
	NORMAL_TRAP(0x148);
.align 128	
	
HT0_Trap_0x14c:
	NORMAL_TRAP(0x14c);
.align 128	
	
HT0_Trap_0x150:
	NORMAL_TRAP(0x150);
.align 128	
	
HT0_Trap_0x154:
	NORMAL_TRAP(0x154);
.align 128	
	
HT0_Trap_0x158:
	NORMAL_TRAP(0x158);
.align 128	
	
HT0_Trap_0x15c:
	NORMAL_TRAP(0x15c);
.align 128	
	
HT0_Trap_0x160:
	NORMAL_TRAP(0x160);
.align 128	
	
HT0_Trap_0x164:
	NORMAL_TRAP(0x164);
.align 128	
	
HT0_Trap_0x168:
	NORMAL_TRAP(0x168);
.align 128	
	
HT0_Trap_0x16c:
	NORMAL_TRAP(0x16c);
.align 128	
	
HT0_Trap_0x170:
	NORMAL_TRAP(0x170);
.align 128	
	
HT0_Trap_0x174:
	NORMAL_TRAP(0x174);
.align 128	
	
HT0_Trap_0x178:
	NORMAL_TRAP(0x178);
.align 128	
	
HT0_Trap_0x17c:
	NORMAL_TRAP(0x17c);
.align 128	
HT0_ChangePriv_0x180:
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	rdhpr	%htstate, %g1
	mov	0x4, %g2
	and	%g1, %g2, %g3
	brz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x180
	nop
	
.align 64
HT0_ChangeNonPriv_0x182:
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	rdhpr	%htstate, %g1
	mov	0x4, %g2
	and	%g1, %g2, %g3
	brnz,a	%g3, .+8
	wrhpr	%g1, %g2, %htstate
	done
	.word 0x182
	nop
	nop
	
.align 64
HT0_TrapEn_0x184:
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done
	.word 0x184

.align 64
HT0_TrapDis_0x186:	
	setx	htrap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done
	.word 0x186

.align 64
HT0_TrapEn_Ntimes_0x188:
	setx	htrap_enable_data, %g2, %g1
        mov     %o1, %g2
	add	%o0, %o0, %o0
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %o0, %g3, %o0
	sth	%g2, [%g1+%o0]
	done
	.word 0x188

.align 64
! Function to set PCONTEXT, SCONTEXT,
! pstate.priv, hpstate.hpriv and
! jump to target address.
! Caller should pass argument as:
! %o1    = PCONTEXT
! %o2    = SCONTEXT
! %o3[0] = desired pstate.priv value
! %o4[0] = desired hpstate.hpriv value
! %o5    = target VA
HT0_ChangeCtx_0x18a:	
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	mov	0x08, %g1
	stxa	%o1, [%g1] 0x21	! set PCONTEXT
	mov	0x10, %g1
	stxa	%o2, [%g1] 0x21	! set SCONTEXT
	xor	%o3, 0x1, %o3	! invert bit so that later can
	xor	%o4, 0x1, %o4	!    be xor'ed using wrpr 
	sllx	%o3, 10, %o3	! align priv bit
	sllx	%o4, 2, %o4	! align hpriv bit
	rdpr 	%tstate, %g1
	or	%g1, 0x400, %g1
	wrpr	%g1, %o3, %tstate
	rdhpr 	%htstate, %g1
	or	%g1, 0x4, %g1
	wrhpr	%g1, %o4, %htstate
	wrpr	%o5, %g0, %tnpc
	done
	nop
	nop
	nop

.align 64
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %o1.
HT0_RdThId_0x18e:

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

.align 64
HT0_Trap_Instruction_0x190:
#ifdef H_HT0_HTrap_Instruction_0
#ifdef SUN_H_HT0_HTrap_Instruction_0
	 SUN_H_HT0_HTrap_Instruction_0 
#else
#	ifdef My_HT0_HTrap_Instruction_0
		My_HT0_HTrap_Instruction_0
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x190);
#endif

.align 32
HT0_Trap_Instruction_0x191:
#ifdef H_HT0_HTrap_Instruction_1
#ifdef SUN_H_HT0_HTrap_Instruction_1
	 SUN_H_HT0_HTrap_Instruction_1 
#else
#	ifdef My_HT0_HTrap_Instruction_1
		My_HT0_HTrap_Instruction_1
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x191);
#endif

.align 32
HT0_Trap_Instruction_0x192:
#ifdef H_HT0_HTrap_Instruction_2
#ifdef SUN_H_HT0_HTrap_Instruction_2
	 SUN_H_HT0_HTrap_Instruction_2 
#else
#	ifdef My_HT0_HTrap_Instruction_2
		My_HT0_HTrap_Instruction_2
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_2)
#	endif
#endif
#else
	NORMAL_TRAP(0x192);
#endif

.align 32
HT0_Trap_Instruction_0x193:
#ifdef H_HT0_HTrap_Instruction_3
#ifdef SUN_H_HT0_HTrap_Instruction_3
	 SUN_H_HT0_HTrap_Instruction_3
#else
#	ifdef My_HT0_HTrap_Instruction_3
		My_HT0_HTrap_Instruction_3
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_3)
#	endif
#endif
#else
	NORMAL_TRAP(0x193);
#endif

.align 32
HT0_Trap_Instruction_0x194:
#ifdef H_HT0_HTrap_Instruction_4
#ifdef SUN_H_HT0_HTrap_Instruction_4
	 SUN_H_HT0_HTrap_Instruction_4 
#else
#	ifdef My_HT0_HTrap_Instruction_4
		My_HT0_HTrap_Instruction_4
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x194);
#endif

.align 32
HT0_Trap_Instruction_0x195:
#ifdef H_HT0_HTrap_Instruction_5
#ifdef SUN_H_HT0_HTrap_Instruction_5
	 SUN_H_HT0_HTrap_Instruction_5
#else
#	ifdef My_HT0_HTrap_Instruction_5
		My_HT0_HTrap_Instruction_5
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x195);
#endif

.align 32
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %g1.
HT0_RdThId_0x196:
	rdpr	%gl, %g4
	sub	%g4, 1, %g4
	wrpr	%g4, %g0, %gl


    setx     0xba00000000, %g1, %g4
    ldxa     [%g4] 0x15, %g4            ! has coreid

    srlx    %g4, 8, %g1
    mulx    %g1, PTON_X_TILES, %g1
    and     %g4, 0xff, %g4
    add     %g4, %g1, %g4    

    !srlx    %g4, 5, %g1
    !add     %g1, %g4, %g4        ! translate from x,y coordinates to coreid
    !set     0x3f, %g1           ! get the lowest 6 bits
    !and     %g4, %g1, %g4
    
    sllx    %g4, 1, %g4

	rd	%asr26, %g1
    srlx    %g1, 8, %g1
    add     %g1, %g4, %g1
#ifdef PORTABLE_CORE
        set     0x0001, %g4
#else
        set     0x007f, %g4
#endif
    and     %g1, %g4, %g1

	rdpr    %gl, %g4
        add     %g4, 1, %g4
        wrpr    %g4, %g0, %gl
	done
	nop
#ifdef TESTER_DUMP
.align 64
HT0_Trap_Tester_Dump_0x198:
	setx    state_checkpoint,%g1,%g2
	jmp     %g2
	nop
#else
#ifdef FPGA_HW
.align 64
	NORMAL_TRAP(0x198);
#endif
#endif

#ifdef FPGA_HW
.align 128
HTO_GoodTrap_from_Priv_0x19c:
	CUSTOM_TRAP(proc_good_trap)
.align 32
HTO_BadTrap_from_Priv_0x19d:
	CUSTOM_TRAP(proc_bad_trap)
#endif

.align 0x4000

! If counter > 0,  trap is enabled for n times, decrement counter
! If counter = 0,  trap is disabled, go to BadTrap
! If counter = -1, trap has taken n times, go to GoodTrap directly
! If counter <-1,  trap is enabled for n times, increment counter
TrapCheck:	
        rdth_id_h		! %g3 contains thread id
	set	htrap_enable_data, %g1
	add	%g7, %g7, %g4
        sllx    %g3, 10, %g3
        add     %g4, %g3, %g4
	ldsh	[%g1+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap
#ifdef NO_TRAPCHECK
	nop
#else
	mov	0,	%o0
#endif
	be	%xcc, HT0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end
CheckGoodTrap:
	cmp	%g2, -1
	be	%xcc, HT0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end:		
	sth	%g2, [%g1+%g4]
	done

	
TrapCheckWithRetry:	
	set	htrap_enable_data, %g1
	add	%g7, %g7, %g4
        rdth_id_h
        sllx    %g3, 10, %g3
        add     %g4, %g3, %g4
	ldsh	[%g1+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap_1
#ifdef NO_TRAPCHECK
	nop
#else
	mov	0,	%o0
#endif
	be	%xcc, HT0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end_1
CheckGoodTrap_1:
	cmp	%g2, -1
	be	%xcc, HT0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end_1:
	sth	%g2, [%g1+%g4]
	retry

#ifdef DYNAMIC_CSM
CSM_trap:
	ldxa	[%g0] 0x72, %g1	
    srlx    %g1, 63, %g1
    cmp     %g1, 1
    bne     %xcc, CSM_trap_done
    nop
	ldxa	[%g0] 0x74, %g1
    srlx    %g1, 48, %g6
    mov     0x3ff, %g2
    and     %g6, %g2, %g6
    sllx    %g6, 10, %g6
    setx    0xb580000000, %g2, %g3
    or      %g6, %g3, %g6 
    stx     %g6, [%g6]  !flush the domain in HMC
    membar  #Sync

    
	! demap all itlb and dtlb
	mov	0x80, %g2
	stxa	%g0, [ %g2 ] 0x57
	stxa	%g0, [ %g2 ] 0x5f


    setx   mmu_barrier_addr, %g2, %g3
htrap_barrier_getlock:
    or      %g0, 1, %g2
    setx    mmu_barrierlock_addr, %g3, %g4
    swap    [%g4], %g2
    tst     %g2
    bne     htrap_barrier_getlock
    nop

    setx    mmu_barrier_addr, %g2, %g3
    ld      [%g3], %g6
    add     %g6, 1, %g6
    st      %g6, [%g3]
    
    setx    mmu_barrierlock_addr, %g3, %g4
    st      %g0, [%g4]

    retry   
    nop
#endif

#ifdef KAOS
#include <kaos_immu_miss_handler_ext.s>
#include <kaos_dmmu_miss_handler_ext.s>
#else	
#include <immu_miss_handler_ext.s>
#include <dmmu_miss_handler_ext.s>
#endif

#include "iaccess_except_handler.s"
#include "daccess_except_handler.s"
#include "daccess_prot_handler.s"
#include "mem_not_align_handler.s"
#ifdef FPGA_HW
#include "good_bad_trap_handler.s"
#endif

#ifdef TESTER_DUMP
state_checkpoint_skip:
	ta      0x98
	nop
	ba      good_trap
	nop
#endif

.data

changequote([, ])dnl
htrap_enable_data:	
forloop([i], 0, 127, [
[hdt0_0_t]i:
	.half 	HE0_0x00,HE0_0x01,HE0_0x02,HE0_0x03,HE0_0x04,HE0_0x05,HE0_0x06,HE0_0x07
	.half 	HE0_0x08,HE0_0x09,HE0_0x0a,HE0_0x0b,HE0_0x0c,HE0_0x0d,HE0_0x0e,HE0_0x0f

	.half 	HE0_0x10,HE0_0x11,HE0_0x12,HE0_0x13,HE0_0x14,HE0_0x15,HE0_0x16,HE0_0x17
	.half 	HE0_0x18,HE0_0x19,HE0_0x1a,HE0_0x1b,HE0_0x1c,HE0_0x1d,HE0_0x1e,HE0_0x1f
	
	.half 	HE0_0x20,HE0_0x21,HE0_0x22,HE0_0x23,HE0_0x24,HE0_0x25,HE0_0x26,HE0_0x27
	.half 	HE0_0x28,HE0_0x29,HE0_0x2a,HE0_0x2b,HE0_0x2c,HE0_0x2d,HE0_0x2e,HE0_0x2f
	
	.half 	HE0_0x30,HE0_0x31,HE0_0x32,HE0_0x33,HE0_0x34,HE0_0x35,HE0_0x36,HE0_0x37
	.half 	HE0_0x38,HE0_0x39,HE0_0x3a,HE0_0x3b,HE0_0x3c,HE0_0x3d,HE0_0x3e,HE0_0x3f
	
[hdt0_64_t]i:
	.half 	HE0_0x40,HE0_0x41,HE0_0x42,HE0_0x43,HE0_0x44,HE0_0x45,HE0_0x46,HE0_0x47
	.half 	HE0_0x48,HE0_0x49,HE0_0x4a,HE0_0x4b,HE0_0x4c,HE0_0x4d,HE0_0x4e,HE0_0x4f
	
	.half 	HE0_0x50,HE0_0x51,HE0_0x52,HE0_0x53,HE0_0x54,HE0_0x55,HE0_0x56,HE0_0x57
	.half 	HE0_0x58,HE0_0x59,HE0_0x5a,HE0_0x5b,HE0_0x5c,HE0_0x5d,HE0_0x5e,HE0_0x5f
	
	.half 	HE0_0x60,HE0_0x61,HE0_0x62,HE0_0x63,HE0_0x64,HE0_0x65,HE0_0x66,HE0_0x67
	.half 	HE0_0x68,HE0_0x69,HE0_0x6a,HE0_0x6b,HE0_0x6c,HE0_0x6d,HE0_0x6e,HE0_0x6f
	
	.half 	HE0_0x70,HE0_0x71,HE0_0x72,HE0_0x73,HE0_0x74,HE0_0x75,HE0_0x76,HE0_0x77
	.half 	HE0_0x78,HE0_0x79,HE0_0x7a,HE0_0x7b,HE0_0x7c,HE0_0x7d,HE0_0x7e,HE0_0x7f
	
[hdt0_128_t]i:
	.half 	HE0_0x80,HE0_0x81,HE0_0x82,HE0_0x83,HE0_0x84,HE0_0x85,HE0_0x86,HE0_0x87
	.half 	HE0_0x88,HE0_0x89,HE0_0x8a,HE0_0x8b,HE0_0x8c,HE0_0x8d,HE0_0x8e,HE0_0x8f

	.half 	HE0_0x90,HE0_0x91,HE0_0x92,HE0_0x93,HE0_0x94,HE0_0x95,HE0_0x96,HE0_0x97
	.half 	HE0_0x98,HE0_0x99,HE0_0x9a,HE0_0x9b,HE0_0x9c,HE0_0x9d,HE0_0x9e,HE0_0x9f

	.half 	HE0_0xa0,HE0_0xa1,HE0_0xa2,HE0_0xa3,HE0_0xa4,HE0_0xa5,HE0_0xa6,HE0_0xa7
	.half 	HE0_0xa8,HE0_0xa9,HE0_0xaa,HE0_0xab,HE0_0xac,HE0_0xad,HE0_0xae,HE0_0xaf

	.half 	HE0_0xb0,HE0_0xb1,HE0_0xb2,HE0_0xb3,HE0_0xb4,HE0_0xb5,HE0_0xb6,HE0_0xb7
	.half 	HE0_0xb8,HE0_0xb9,HE0_0xba,HE0_0xbb,HE0_0xbc,HE0_0xbd,HE0_0xbe,HE0_0xbf

[hdt0_192_t]i:	
	.half 	HE0_0xc0,HE0_0xc1,HE0_0xc2,HE0_0xc3,HE0_0xc4,HE0_0xc5,HE0_0xc6,HE0_0xc7
	.half 	HE0_0xc8,HE0_0xc9,HE0_0xca,HE0_0xcb,HE0_0xcc,HE0_0xcd,HE0_0xce,HE0_0xcf

	.half 	HE0_0xd0,HE0_0xd1,HE0_0xd2,HE0_0xd3,HE0_0xd4,HE0_0xd5,HE0_0xd6,HE0_0xd7
	.half 	HE0_0xd8,HE0_0xd9,HE0_0xda,HE0_0xdb,HE0_0xdc,HE0_0xdd,HE0_0xde,HE0_0xdf

	.half 	HE0_0xe0,HE0_0xe1,HE0_0xe2,HE0_0xe3,HE0_0xe4,HE0_0xe5,HE0_0xe6,HE0_0xe7
	.half 	HE0_0xe8,HE0_0xe9,HE0_0xea,HE0_0xeb,HE0_0xec,HE0_0xed,HE0_0xee,HE0_0xef

	.half 	HE0_0xf0,HE0_0xf1,HE0_0xf2,HE0_0xf3,HE0_0xf4,HE0_0xf5,HE0_0xf6,HE0_0xf7
	.half 	HE0_0xf8,HE0_0xf9,HE0_0xfa,HE0_0xfb,HE0_0xfc,HE0_0xfd,HE0_0xfe,HE0_0xff

[hdt1_0_t]i:	
	.half 	HE1_0x00,HE1_0x01,HE1_0x02,HE1_0x03,HE1_0x04,HE1_0x05,HE1_0x06,HE1_0x07
	.half 	HE1_0x08,HE1_0x09,HE1_0x0a,HE1_0x0b,HE1_0x0c,HE1_0x0d,HE1_0x0e,HE1_0x0f

	.half 	HE1_0x10,HE1_0x11,HE1_0x12,HE1_0x13,HE1_0x14,HE1_0x15,HE1_0x16,HE1_0x17
	.half 	HE1_0x18,HE1_0x19,HE1_0x1a,HE1_0x1b,HE1_0x1c,HE1_0x1d,HE1_0x1e,HE1_0x1f
	
	.half 	HE1_0x20,HE1_0x21,HE1_0x22,HE1_0x23,HE1_0x24,HE1_0x25,HE1_0x26,HE1_0x27
	.half 	HE1_0x28,HE1_0x29,HE1_0x2a,HE1_0x2b,HE1_0x2c,HE1_0x2d,HE1_0x2e,HE1_0x2f
	
	.half 	HE1_0x30,HE1_0x31,HE1_0x32,HE1_0x33,HE1_0x34,HE1_0x35,HE1_0x36,HE1_0x37
	.half 	HE1_0x38,HE1_0x39,HE1_0x3a,HE1_0x3b,HE1_0x3c,HE1_0x3d,HE1_0x3e,HE1_0x3f
	
[hdt1_64_t]i:
	.half 	HE1_0x40,HE1_0x41,HE1_0x42,HE1_0x43,HE1_0x44,HE1_0x45,HE1_0x46,HE1_0x47
	.half 	HE1_0x48,HE1_0x49,HE1_0x4a,HE1_0x4b,HE1_0x4c,HE1_0x4d,HE1_0x4e,HE1_0x4f
	
	.half 	HE1_0x50,HE1_0x51,HE1_0x52,HE1_0x53,HE1_0x54,HE1_0x55,HE1_0x56,HE1_0x57
	.half 	HE1_0x58,HE1_0x59,HE1_0x5a,HE1_0x5b,HE1_0x5c,HE1_0x5d,HE1_0x5e,HE1_0x5f
	
	.half 	HE1_0x60,HE1_0x61,HE1_0x62,HE1_0x63,HE1_0x64,HE1_0x65,HE1_0x66,HE1_0x67
	.half 	HE1_0x68,HE1_0x69,HE1_0x6a,HE1_0x6b,HE1_0x6c,HE1_0x6d,HE1_0x6e,HE1_0x6f
	
	.half 	HE1_0x70,HE1_0x71,HE1_0x72,HE1_0x73,HE1_0x74,HE1_0x75,HE1_0x76,HE1_0x77
	.half 	HE1_0x78,HE1_0x79,HE1_0x7a,HE1_0x7b,HE1_0x7c,HE1_0x7d,HE1_0x7e,HE1_0x7f
	
[hdt1_128_t]i:
	.half 	HE1_0x80,HE1_0x81,HE1_0x82,HE1_0x83,HE1_0x84,HE1_0x85,HE1_0x86,HE1_0x87
	.half 	HE1_0x88,HE1_0x89,HE1_0x8a,HE1_0x8b,HE1_0x8c,HE1_0x8d,HE1_0x8e,HE1_0x8f

	.half 	HE1_0x90,HE1_0x91,HE1_0x92,HE1_0x93,HE1_0x94,HE1_0x95,HE1_0x96,HE1_0x97
	.half 	HE1_0x98,HE1_0x99,HE1_0x9a,HE1_0x9b,HE1_0x9c,HE1_0x9d,HE1_0x9e,HE1_0x9f

	.half 	HE1_0xa0,HE1_0xa1,HE1_0xa2,HE1_0xa3,HE1_0xa4,HE1_0xa5,HE1_0xa6,HE1_0xa7
	.half 	HE1_0xa8,HE1_0xa9,HE1_0xaa,HE1_0xab,HE1_0xac,HE1_0xad,HE1_0xae,HE1_0xaf

	.half 	HE1_0xb0,HE1_0xb1,HE1_0xb2,HE1_0xb3,HE1_0xb4,HE1_0xb5,HE1_0xb6,HE1_0xb7
	.half 	HE1_0xb8,HE1_0xb9,HE1_0xba,HE1_0xbb,HE1_0xbc,HE1_0xbd,HE1_0xbe,HE1_0xbf

[hdt1_192_t]i:	
	.half 	HE1_0xc0,HE1_0xc1,HE1_0xc2,HE1_0xc3,HE1_0xc4,HE1_0xc5,HE1_0xc6,HE1_0xc7
	.half 	HE1_0xc8,HE1_0xc9,HE1_0xca,HE1_0xcb,HE1_0xcc,HE1_0xcd,HE1_0xce,HE1_0xcf

	.half 	HE1_0xd0,HE1_0xd1,HE1_0xd2,HE1_0xd3,HE1_0xd4,HE1_0xd5,HE1_0xd6,HE1_0xd7
	.half 	HE1_0xd8,HE1_0xd9,HE1_0xda,HE1_0xdb,HE1_0xdc,HE1_0xdd,HE1_0xde,HE1_0xdf

	.half 	HE1_0xe0,HE1_0xe1,HE1_0xe2,HE1_0xe3,HE1_0xe4,HE1_0xe5,HE1_0xe6,HE1_0xe7
	.half 	HE1_0xe8,HE1_0xe9,HE1_0xea,HE1_0xeb,HE1_0xec,HE1_0xed,HE1_0xee,HE1_0xef

	.half 	HE1_0xf0,HE1_0xf1,HE1_0xf2,HE1_0xf3,HE1_0xf4,HE1_0xf5,HE1_0xf6,HE1_0xf7
	.half 	HE1_0xf8,HE1_0xf9,HE1_0xfa,HE1_0xfb,HE1_0xfc,HE1_0xfd,HE1_0xfe,HE1_0xff
])dnl
changequote(`,')dnl

hpthread_mutex_data:

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
	
hpthread_counter_data:

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

#ifdef FPGA_HW
.align 32
.global thread_status_mem
thread_status_mem:
	.xword 0x0000000000000000
#endif

#ifdef TESTER_DUMP
#if (THREAD_COUNT >= 4)
#include "4thl2flush.s"
#else
#include "1thl2flush.s"
#endif
#endif


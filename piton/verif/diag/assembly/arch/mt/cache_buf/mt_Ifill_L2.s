// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Ifill_L2.s
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
/*************************************************************
  File:		mt_Ifill_L2.s

  Description:
  -----------
  First, each of 4 threads issues 4 imisses to fill the 16
  ways of the Icache. Then each thread issues a 5th miss
  to each cause a L2 replacement and hence eviction
  invalidation.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    4
#include "boot.s"

.text
.global main
.global diag_pass
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3

.global goto_th_0
.global goto_th_1
.global goto_th_2
.global goto_th_3

main:

thread_jump:
	th_fork(goto_th)
        ba diag_fail
	nop

goto_th_0:
	setx		run_th_0, %l1, %l2
	jmp		%l2
	nop

goto_th_1:
	setx		run_th_1, %l1, %l2
	jmp		%l2
	nop

goto_th_2:
	setx		run_th_2, %l1, %l2
	jmp		%l2
	nop

goto_th_3:
	setx		run_th_3, %l1, %l2
	jmp		%l2
	nop
	

!! Diag PASSED
		
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

!! Diag FAILED

diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

!!====================================================

#define TH0_PAGE0_TEXT_ADDR 0x00e000
#define TH0_PAGE0_TEXT_ADDR_PA 0x110000e000
#define TH0_PAGE0_TEXT_ADDR_RA 0x10000e000

				
#define TH0_PAGE1_TEXT_ADDR 0x01e000
#define TH0_PAGE1_TEXT_ADDR_PA 0x110001e000
#define TH0_PAGE1_TEXT_ADDR_RA 0x10001e000

#define TH0_PAGE2_TEXT_ADDR 0x02e000
#define TH0_PAGE2_TEXT_ADDR_PA 0x110002e000
#define TH0_PAGE2_TEXT_ADDR_RA 0x10002e000
				
#define TH0_PAGE3_TEXT_ADDR 0x03e000
#define TH0_PAGE3_TEXT_ADDR_PA 0x110003e000
#define TH0_PAGE3_TEXT_ADDR_RA 0x10003e000
								
		
SECTION .TH0_PAGE0 TEXT_VA=TH0_PAGE0_TEXT_ADDR
attr_text {
	Name = .TH0_PAGE0,
	VA=TH0_PAGE0_TEXT_ADDR,	PA=TH0_PAGE0_TEXT_ADDR_PA, RA=TH0_PAGE0_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global run_th_0
.global th0_page0
				
run_th_0:

! 0x00e000
th0_page0:
		set		0x0,		%i0
		ba		th0_page1
		nop
.end
		
SECTION .TH0_PAGE1 TEXT_VA=TH0_PAGE1_TEXT_ADDR
attr_text {
	Name = .TH0_PAGE1,
	VA=TH0_PAGE1_TEXT_ADDR,	PA=TH0_PAGE1_TEXT_ADDR_PA, RA=TH0_PAGE1_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th0_page1

! 0x01e000
th0_page1:
		add		%i0,	1,		%i0
		ba		th0_page2
		nop
.end
		
SECTION .TH0_PAGE2 TEXT_VA=TH0_PAGE2_TEXT_ADDR
attr_text {
	Name = .TH0_PAGE2,
	VA=TH0_PAGE2_TEXT_ADDR,	PA=TH0_PAGE2_TEXT_ADDR_PA, RA=TH0_PAGE2_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th0_page2

! 0x02e000
th0_page2:
		add		%i0,	1,		%i0
		ba		th0_page3
		nop
.end
		
SECTION .TH0_PAGE3 TEXT_VA=TH0_PAGE3_TEXT_ADDR
attr_text {
	Name = .TH0_PAGE3,
	VA=TH0_PAGE3_TEXT_ADDR,	PA=TH0_PAGE3_TEXT_ADDR_PA, RA=TH0_PAGE3_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th0_page3

! 0x03e000
th0_page3:
		add		%i0,	1,		%i0
		ba		th0_replace
		nop
		
		
!!====================================================

#define TH1_PAGE0_TEXT_ADDR 0x04e000
#define TH1_PAGE0_TEXT_ADDR_PA 0x110004e000
#define TH1_PAGE0_TEXT_ADDR_RA 0x10004e000
				
#define TH1_PAGE1_TEXT_ADDR 0x05e000
#define TH1_PAGE1_TEXT_ADDR_PA 0x110005e000
#define TH1_PAGE1_TEXT_ADDR_RA 0x10005e000

#define TH1_PAGE2_TEXT_ADDR 0x06e000
#define TH1_PAGE2_TEXT_ADDR_PA 0x110006e000
#define TH1_PAGE2_TEXT_ADDR_RA 0x10006e000
				
#define TH1_PAGE3_TEXT_ADDR 0x07e000
#define TH1_PAGE3_TEXT_ADDR_PA 0x110007e000
#define TH1_PAGE3_TEXT_ADDR_RA 0x10007e000
				
						
SECTION .TH1_PAGE0 TEXT_VA=TH1_PAGE0_TEXT_ADDR
attr_text {
	Name = .TH1_PAGE0,
	VA=TH1_PAGE0_TEXT_ADDR,	PA=TH1_PAGE0_TEXT_ADDR_PA, RA=TH1_PAGE0_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global run_th_1
.global th1_page0
				
run_th_1:		

! 0x04e000
th1_page0:
		set		0x0,		%i0
		ba		th1_page1
		nop
.end

SECTION .TH1_PAGE1 TEXT_VA=TH1_PAGE1_TEXT_ADDR
attr_text {
	Name = .TH1_PAGE1,
	VA=TH1_PAGE1_TEXT_ADDR,	PA=TH1_PAGE1_TEXT_ADDR_PA, RA=TH1_PAGE1_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th1_page1

! 0x05e000
th1_page1:
		add		%i0,	1,		%i0
		ba		th1_page2
		nop
.end
		
SECTION .TH1_PAGE2 TEXT_VA=TH1_PAGE2_TEXT_ADDR
attr_text {
	Name = .TH1_PAGE2,
	VA=TH1_PAGE2_TEXT_ADDR,	PA=TH1_PAGE2_TEXT_ADDR_PA, RA=TH1_PAGE2_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th1_page2

! 0x6e000
th1_page2:
		add		%i0,	1,		%i0
		ba		th1_page3
		nop
.end
		
SECTION .TH1_PAGE3 TEXT_VA=TH1_PAGE3_TEXT_ADDR
attr_text {
	Name = .TH1_PAGE3,
	VA=TH1_PAGE3_TEXT_ADDR,	PA=TH1_PAGE3_TEXT_ADDR_PA, RA=TH1_PAGE3_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th1_page3

! 0x07e000
th1_page3:
		add		%i0,	1,		%i0
		setx		diag_pass, %l1, %l2
		jmp		%l2
		nop
.end

		
!!====================================================

#define TH2_PAGE0_TEXT_ADDR 0x08e000
#define TH2_PAGE0_TEXT_ADDR_PA 0x110008e000
#define TH2_PAGE0_TEXT_ADDR_RA 0x10008e000
				
#define TH2_PAGE1_TEXT_ADDR 0x09e000
#define TH2_PAGE1_TEXT_ADDR_PA 0x110009e000
#define TH2_PAGE1_TEXT_ADDR_RA 0x10009e000

#define TH2_PAGE2_TEXT_ADDR 0x0ae000
#define TH2_PAGE2_TEXT_ADDR_PA 0x11000ae000
#define TH2_PAGE2_TEXT_ADDR_RA 0x1000ae000
				
#define TH2_PAGE3_TEXT_ADDR 0x0be000
#define TH2_PAGE3_TEXT_ADDR_PA 0x11000be000
#define TH2_PAGE3_TEXT_ADDR_RA 0x1000be000
				
				
SECTION .TH2_PAGE0 TEXT_VA=TH2_PAGE0_TEXT_ADDR
attr_text {
	Name = .TH2_PAGE0,
	VA=TH2_PAGE0_TEXT_ADDR,	PA=TH2_PAGE0_TEXT_ADDR_PA, RA=TH2_PAGE0_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global run_th_2
.global th2_page0
						
run_th_2:

! 0x08e000
th2_page0:
		set		0x0,		%i0
		ba		th2_page1
		nop
.end

SECTION .TH2_PAGE1  TEXT_VA=TH2_PAGE1_TEXT_ADDR
attr_text {
	Name = .TH2_PAGE1,
	VA=TH2_PAGE1_TEXT_ADDR,	PA=TH2_PAGE1_TEXT_ADDR_PA, RA=TH2_PAGE1_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th2_page1

! 0x09e000
th2_page1:
		add		%i0,	1,		%i0
		ba		th2_page2
		nop
.end
				
SECTION .TH2_PAGE2 TEXT_VA=TH2_PAGE2_TEXT_ADDR
attr_text {
	Name = .TH2_PAGE2,
	VA=TH2_PAGE2_TEXT_ADDR,	PA=TH2_PAGE2_TEXT_ADDR_PA, RA=TH2_PAGE2_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th2_page2

! 0x0ae000
th2_page2:
		add		%i0,	1,		%i0
		ba		th2_page3
		nop
.end
		
SECTION .TH2_PAGE3 TEXT_VA=TH2_PAGE3_TEXT_ADDR
attr_text {
	Name = .TH2_PAGE3,
	VA=TH2_PAGE3_TEXT_ADDR,	PA=TH2_PAGE3_TEXT_ADDR_PA, RA=TH2_PAGE3_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th2_page3

! 0x0be000
th2_page3:
		add		%i0,	1,		%i0
		ba		th2_replace
		nop
.end
		

!!====================================================

#define TH3_PAGE0_TEXT_ADDR 0x0ce000
#define TH3_PAGE0_TEXT_ADDR_PA 0x11000ce000
#define TH3_PAGE0_TEXT_ADDR_RA 0x1000ce000
				
#define TH3_PAGE1_TEXT_ADDR 0x0de000
#define TH3_PAGE1_TEXT_ADDR_PA 0x11000de000
#define TH3_PAGE1_TEXT_ADDR_RA 0x1000de000

#define TH3_PAGE2_TEXT_ADDR 0x0ee000
#define TH3_PAGE2_TEXT_ADDR_PA 0x11000ee000
#define TH3_PAGE2_TEXT_ADDR_RA 0x1000ee000
				
#define TH3_PAGE3_TEXT_ADDR 0x0fe000
#define TH3_PAGE3_TEXT_ADDR_PA 0x11000fe000
#define TH3_PAGE3_TEXT_ADDR_RA 0x1000fe000
				
				
SECTION .TH3_PAGE0 TEXT_VA=TH3_PAGE0_TEXT_ADDR
attr_text {
	Name = .TH3_PAGE0,
	VA=TH3_PAGE0_TEXT_ADDR,	PA=TH3_PAGE0_TEXT_ADDR_PA, RA=TH3_PAGE0_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global run_th_3
.global th3_page0
						
run_th_3:

! 0x0ce000
th3_page0:
		set		0x0,		%i0
		ba		th3_page1
		nop
.end

SECTION .TH3_PAGE1 TEXT_VA=TH3_PAGE1_TEXT_ADDR
attr_text {
	Name = .TH3_PAGE1,
	VA=TH3_PAGE1_TEXT_ADDR,	PA=TH3_PAGE1_TEXT_ADDR_PA, RA=TH3_PAGE1_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th3_page1

! 0x0de000
th3_page1:
		add		%i0,	1,		%i0
		ba		th3_page2
		nop
.end
		
SECTION .TH3_PAGE2 TEXT_VA=TH3_PAGE2_TEXT_ADDR
attr_text {
	Name = .TH3_PAGE2,
	VA=TH3_PAGE2_TEXT_ADDR,	PA=TH3_PAGE2_TEXT_ADDR_PA, RA=TH3_PAGE2_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th3_page2

! 0x0ee000
th3_page2:
		add		%i0,	1,		%i0
		ba		th3_page3
		nop
.end
		
SECTION .TH3_PAGE3 TEXT_VA=TH3_PAGE3_TEXT_ADDR 
attr_text {
	Name = .TH3_PAGE3,
	VA=TH3_PAGE3_TEXT_ADDR,	PA=TH3_PAGE3_TEXT_ADDR_PA, RA=TH3_PAGE3_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th3_page3

! 0x0fe000
th3_page3:
		add		%i0,	1,		%i0
		ba		th3_replace
		nop
.end


!!====================================================

#define TH0_REPLACE_TEXT_ADDR 0x10e000
#define TH0_REPLACE_TEXT_ADDR_PA 0x110010e000
#define TH0_REPLACE_TEXT_ADDR_RA 0x10010e000

#define TH1_REPLACE_TEXT_ADDR 0x11e000
#define TH1_REPLACE_TEXT_ADDR_PA 0x110011e000
#define TH1_REPLACE_TEXT_ADDR_RA 0x10011e000
				
#define TH2_REPLACE_TEXT_ADDR 0x12e000
#define TH2_REPLACE_TEXT_ADDR_PA 0x110012e000
#define TH2_REPLACE_TEXT_ADDR_RA 0x10012e000

#define TH3_REPLACE_TEXT_ADDR 0x13e000
#define TH3_REPLACE_TEXT_ADDR_PA 0x110013e000
#define TH3_REPLACE_TEXT_ADDR_RA 0x10013e000
		

SECTION .TH0_REPLACE TEXT_VA=TH0_REPLACE_TEXT_ADDR
attr_text {
	Name = .TH0_REPLACE,
	VA=TH0_REPLACE_TEXT_ADDR,	PA=TH0_REPLACE_TEXT_ADDR_PA, RA=TH0_REPLACE_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th0_replace

! 0x10e000
th0_replace:
		add		%i0,	1,		%i0
		setx		diag_pass, %l1, %l2
		jmp		%l2
		nop
.end

SECTION .TH1_REPLACE TEXT_VA=TH1_REPLACE_TEXT_ADDR
attr_text {
	Name = .TH1_REPLACE,
	VA=TH1_REPLACE_TEXT_ADDR,	PA=TH1_REPLACE_TEXT_ADDR_PA, RA=TH1_REPLACE_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th1_replace

! 0x11e000
th1_replace:
		add		%i0,	1,		%i0
		setx		diag_pass, %l1, %l2
		jmp		%l2
		nop
.end

SECTION .TH2_REPLACE TEXT_VA=TH2_REPLACE_TEXT_ADDR
attr_text {
	Name = .TH2_REPLACE,
	VA=TH2_REPLACE_TEXT_ADDR,	PA=TH2_REPLACE_TEXT_ADDR_PA, RA=TH2_REPLACE_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th2_replace

! 0x12e000
th2_replace:
		add		%i0,	1,		%i0
		setx		diag_pass, %l1, %l2
		jmp		%l2
		nop
.end

SECTION .TH3_REPLACE TEXT_VA=TH3_REPLACE_TEXT_ADDR
attr_text {
	Name = .TH3_REPLACE,
	VA=TH3_REPLACE_TEXT_ADDR,	PA=TH3_REPLACE_TEXT_ADDR_PA, RA=TH3_REPLACE_TEXT_ADDR_RA,
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}


.text
.global th3_replace

! 0x13e000
th3_replace:
		add		%i0,	1,		%i0
		setx		diag_pass, %l1, %l2
		jmp		%l2
		nop
.end

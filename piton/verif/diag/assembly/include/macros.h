// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: macros.h
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
/* @(#)macros.h	1.21 07/08/99 */
/* following #ifdef allows double #include of this file. */
#ifndef ALREADY_INCLUDED_MACROS_DOT_H
#define ALREADY_INCLUDED_MACROS_DOT_H

#define SAVE_WINDOW(BASE) \
        stx     %l0, [BASE + (0*4)]; \
        stx     %l1, [BASE + (2*4)]; \
        stx     %l2, [BASE + (4*4)]; \
        stx     %l3, [BASE + (6*4)]; \
        stx     %l4, [BASE + (8*4)]; \
        stx     %l5, [BASE + (10*4)]; \
        stx     %l6, [BASE + (12*4)]; \
        stx     %l7, [BASE + (14*4)]; \
        stx     %i0, [BASE + (16*4)]; \
        stx     %i1, [BASE + (18*4)]; \
        stx     %i2, [BASE + (20*4)]; \
        stx     %i3, [BASE + (22*4)]; \
        stx     %i4, [BASE + (24*4)]; \
        stx     %i5, [BASE + (26*4)]; \
        stx     %i6, [BASE + (28*4)]; \
        stx     %i7, [BASE + (30*4)]; 

#define RESTORE_WINDOW(BASE) \
        ldx     [BASE + (0*4)], %l0; \
        ldx     [BASE + (2*4)], %l1; \
        ldx     [BASE + (4*4)], %l2; \
        ldx     [BASE + (6*4)], %l3; \
        ldx     [BASE + (8*4)], %l4; \
        ldx     [BASE + (10*4)], %l5; \
        ldx     [BASE + (12*4)], %l6; \
        ldx     [BASE + (14*4)], %l7; \
        ldx     [BASE + (16*4)], %i0; \
        ldx     [BASE + (18*4)], %i1; \
        ldx     [BASE + (20*4)], %i2; \
        ldx     [BASE + (22*4)], %i3; \
        ldx     [BASE + (24*4)], %i4; \
        ldx     [BASE + (26*4)], %i5; \
        ldx     [BASE + (28*4)], %i6; \
        ldx     [BASE + (30*4)], %i7; 


/*
Store out FP registers to the BBC ram to expose the data
to the pins for tester verification. This macro can be
planted throughout any diag to store the FP data at will.
Activitating the FPREG_STORES macro also causes all the FP
registers to be initialized.
*/
#define FPREG_STORES(ADR_REG, ADR_REG_TMP) \
		setx	0x7ffffffff00, ADR_REG_TMP, ADR_REG; \
		mov	0x15, %asi; \
		stda	%f0, [ADR_REG] %asi; \
		stda	%f2, [ADR_REG] %asi; \
		stda	%f4, [ADR_REG] %asi; \
		stda	%f6, [ADR_REG] %asi; \
		stda	%f8, [ADR_REG] %asi; \
		stda	%f10, [ADR_REG] %asi; \
		stda	%f12, [ADR_REG] %asi; \
		stda	%f14, [ADR_REG] %asi; \
		stda	%f16, [ADR_REG] %asi; \
		stda	%f18, [ADR_REG] %asi; \
		stda	%f20, [ADR_REG] %asi; \
		stda	%f22, [ADR_REG] %asi; \
		stda	%f24, [ADR_REG] %asi; \
		stda	%f26, [ADR_REG] %asi; \
		stda	%f28, [ADR_REG] %asi; \
		stda	%f30, [ADR_REG] %asi; \
		stda	%f32, [ADR_REG] %asi; \
		stda	%f34, [ADR_REG] %asi; \
		stda	%f36, [ADR_REG] %asi; \
		stda	%f38, [ADR_REG] %asi; \
		stda	%f40, [ADR_REG] %asi; \
		stda	%f42, [ADR_REG] %asi; \
		stda	%f44, [ADR_REG] %asi; \
		stda	%f46, [ADR_REG] %asi; \
		stda	%f48, [ADR_REG] %asi; \
		stda	%f50, [ADR_REG] %asi; \
		stda	%f52, [ADR_REG] %asi; \
		stda	%f54, [ADR_REG] %asi; \
		stda	%f56, [ADR_REG] %asi; \
		stda	%f58, [ADR_REG] %asi; \
		stda	%f60, [ADR_REG] %asi; \
		stda	%f62, [ADR_REG] %asi; \
		ldxa	[ADR_REG] %asi, %g0; \

#define DUMP_LOCALS(ADR_REG, ADR_REG_TMP) \
        setx    0x7ffffffff00, ADR_REG_TMP, ADR_REG; \
        mov     0x15, %asi; \
        stxa    %l0, [ADR_REG] %asi; \
        stxa    %l1, [ADR_REG] %asi; \
        stxa    %l2, [ADR_REG] %asi; \
        stxa    %l3, [ADR_REG] %asi; \
        stxa    %l4, [ADR_REG] %asi; \
        stxa    %l5, [ADR_REG] %asi; \
        stxa    %l6, [ADR_REG] %asi; \
        stxa    %l7, [ADR_REG] %asi; \

#define DUMP_OUTS(ADR_REG, ADR_REG_TMP) \
        setx    0x7ffffffff00, ADR_REG_TMP, ADR_REG; \
        mov     0x15, %asi; \
        stxa    %o0, [ADR_REG] %asi; \
        stxa    %o1, [ADR_REG] %asi; \
        stxa    %o2, [ADR_REG] %asi; \
        stxa    %o3, [ADR_REG] %asi; \
        stxa    %o4, [ADR_REG] %asi; \
        stxa    %o5, [ADR_REG] %asi; \
        stxa    %o6, [ADR_REG] %asi; \
        stxa    %o7, [ADR_REG] %asi; \

#define DUMP_GLOBALS(ADR_REG, ADR_REG_TMP) \
        setx    0x7ffffffff00, ADR_REG_TMP, ADR_REG; \
        mov     0x15, %asi; \
        stxa    %g1, [ADR_REG] %asi; \
        stxa    %g2, [ADR_REG] %asi; \
        stxa    %g3, [ADR_REG] %asi; \
        stxa    %g4, [ADR_REG] %asi; \
        stxa    %g5, [ADR_REG] %asi; \
        stxa    %g6, [ADR_REG] %asi; \
        stxa    %g7, [ADR_REG] %asi; \

define(INIT_MEM,
	`define( `INIT_VAL', $1)       
	 define( `DATA_SIZE', eval($3))		
	 define( `BLK_LEN', eval($2))	
	 define( `IT_COUNT', 1)		
	 define( `MOD_VAL', $5)		
	 define( `OPR1', $4)		
	 define( `OPR2', $6)		
	 define( `OPND3', $7)		
	 ifelse(DATA_SIZE,4,`GEN_VALUE',	
                DATA_SIZE,2,`GEN_VALUE',	
                DATA_SIZE,1,`GEN_VALUE',	
                `errprint(ERROR: "INIT_MEM" data_size=DATA_SIZE is illegal)')')

define(GEN_VALUE,
	`ifelse(DATA_SIZE,4,.word eval(INIT_VAL OPR1 MOD_VAL),
                DATA_SIZE,2,.half eval(INIT_VAL OPR1 MOD_VAL),
                DATA_SIZE,1,.byte eval(INIT_VAL OPR1 MOD_VAL)) dnl
         ifelse(eval(len(OPR1)>0),1,`define(`MOD_VAL',eval(MOD_VAL OPR2 OPND3))') dnl
         define(`IT_COUNT', incr(IT_COUNT))
         ifelse(eval(IT_COUNT>BLK_LEN),1,,`GEN_VALUE')') 

/* usage: SET_64(value_hi, value_lo, tmp_reg, dest_reg)
	value_hi : Hi word of the desired extended word -- dword[63:32]
	value_lo : Lo word of the desired extended word -- dword[31:0]
	tmp_reg  : temporary register
	dest_reg : destination register
*/
define(SET_64, `sethi	%hi($1), $3
       or       $3, %lo($1), $3
       sllx	$3, 32, $3
       sethi	%hi($2), $4
       or	$4, $3, $4
       or       $4, %lo($2), $4') 

/* CHECK_SRESULT(reg,imm,tmp_reg1)
	reg: a reg contain value want to compare
	imm: an immediate value 13 bits want to compare
	tmp_reg1: a temparory reg
*/
define(CHECK_SRESULT, `set $2, $3
        sub     $1,$3,$3
        sra     $3,0,$3
        brz,pt  $3,1f
        nop
        ta     0x1	/* ta T_BAD_TRAP */
        1:')
 

/* usage: CHECK_FSRESULT(fp register, value, tmp_reg1, tmp_reg2, MEM_DUMP_POINTER)
	fp register : single precision floating point register whose contents need comparison
	value : The expected value
	tmp_reg1 : a temporary reg buffer, integer register
	tmp_reg2 : a temporary reg buffer, integer register
	MEM_DUMP_POINTER : pointer to the memory dump area where the
  			   machine state will be dumped if a miscompare occurs.
*/
	
define(CHECK_FSRESULT, `st $1, [$5]
	lduw	[$5], $3
	set	$2, $4
	sub	$3, $4, $3
	srl	$3, 0, $3	!clear upper 32-bit, set might sign extend upper 32-bits.
	brz,pt	$3, 1f
	nop
	ta 	T_BAD_TRAP
	1:')

/* usage: CHECK_FDRESULT(fp register, value_hi, value_lo,tmp_reg1, tmp_reg2, MEM_DUMP_POINTER)
	fp register : single precision floating point register whose contents need comparison
	value_hi, value_lo : The expected value
	tmp_reg1 : a temporary reg buffer, integer register
	tmp_reg2 : a temporary reg buffer, integer register
	MEM_DUMP_POINTER : pointer to the memory dump area where the
  			   machine state will be dumped if a miscompare occurs.
*/
	
define(CHECK_FDRESULT, `set $2, $4
	sllx	$4, 32, $4	!move left 32-bits. upper-32bit of 64-bit value.
	set	$3, $5
	srl	$5,0, $5	!clear upper-32 bits
	or	$4, $5, $5
	std $1, [$6]
	ldx	[$6], $4
	sub	$4, $5, $4
	brz,pt	$4, 1f
	nop
	ta 	T_BAD_TRAP
	1:')

/* usuage: CHECK_XRESULT(%?,reg:value_high,reg:value_low,tmp_reg1)
	%?   64 bit reg which has the value need to check
	value_high the high 32 bits of the answer in reg
	value_low the low 32 bits of the answer in reg
	tmp_reg1 a temparory reg buffer 
*/
define(CHECK_XRESULT,`mov $2,$4
        sllx    $4,32,$4
        add     $4,$3,$4
        sub     $1,$4,$4
        brz,pt  $4,1f
        nop
        ta     T_BAD_TRAP 
        1:')

/*usuage: CHECK_XREGS(reg1,reg2,tmp_reg1,tmp_reg2,label)
        reg1 and reg2 : are 64 bits regs want to compare
        tmp_reg1 & tmp_reg2: are buffer regs
        label:place to go when not matched . e.g error_detected or label in prog
*/
define(CHECK_XREGS,`mov $1,$3
        sub     $2,$3,$3
        brz,pt  $3,1f
        nop
        ta     T_BAD_TRAP 
        1:')

/*usuage: REGS_COMPARE(reg1,reg2,tmp_reg1,tmp_reg2,label)
        reg1 and reg2 : are 64 bits regs want to compare
        tmp_reg1 & tmp_reg2: are buffer regs
        label:place to go when not matched . e.g error_detected or label in prog
*/
define(REGS_COMPARE,`mov $1,$3
        mov     $2,$4
        sub     $3,$4,$3
        brnz,pn  $3,$5
        nop')


/* usage: CHECK_FSREGS(reg1,reg2,tmp_reg1,tmp_reg2, MEM_DUMP_POINTER)
	reg1 and reg2 : are single-precision floating point regs that are to be compared
	tmp_reg1 & tmp_reg2: are 64-bit integer regs used as buffer regs
	MEM_DUMP_POINTER : pointer to the memory dump area where the 
                           machine state will be dumped if a miscompare occurs.
	error_found: place to go when failed.
*/

define(CHECK_FSREGS, `st $1, [$5]
	st	$2, [$5+4]
	lduw	[$5], $3
	lduw    [$5+4], $4
	sub     $3, $4, $3	!since single precision registers, so, there is no need to
				!clear upper 32-bits
	brz,pt	$3, 1f
	nop
	ta 	T_BAD_TRAP
	1:')

/* usage: CHECK_FDREGS(reg1,reg2,tmp_reg1,tmp_reg2,MEM_DUMP_POINTER)
	reg1 and reg2 : are double-precision floating point regs that are to be compared
	tmp_reg1 & tmp_reg2 : are 64-bit integer regs used as buffer regs
	MEM_DUMP_POINTER : pointer to the memory dump area where the   
                           machine state will be dumped if a miscompare occurs.
	error_found: place to go when failed. 
*/

define(CHECK_FDREGS, `std $1, [$5]
	std 	$2, [$5+8]
	ldx	[$5], $3
	ldx	[$5+8], $4
	sub	$3, $4, $3
	brz,pt	$3, 1f
	nop
	ta 	T_BAD_TRAP
	1:')

/*usuage: CHECK_XREGS_EQUAL(reg1,reg2,tmp_reg1,tmp_reg2,no_error_found)
        reg1 and reg2 : are 64 bits regs want to compare
        tmp_reg1 & tmp_reg2: are buffer regs
        no_error_found:place to go when passed.
*/
define(CHECK_XREGS_EQUAL,`mov $1,$3
        mov     $2,$4
        sub	$3,$4,$3
	brnz	$3,$5
        nop
        mov	$1,$3
	srlx    $3,32,$3
        srlx    $4,32,$4
       	sub	$3,$4,$3
	brz	$3,$5
        nop')

/* check 64 bit register.(compare 64 bit register with constants)
 * usage:
 *
 *	CHECK_64REG(reg, hi_value, low_value, tmp_reg1, tmp_reg2)
 *
 * reg - 64 bits reg want to compare
 * hi_value, low_value - 2 32 bit constants
 * tmp_reg1, tmp_reg2 - temp. registers
 * ex: CHECK_64REG(%l0, 0x12345678, 0xfedcba98, %o1, %o2)
 */
define(CHECK_64REG, `set $2, $4 !hi_value in tmp_reg1
        sllx    $4, 32, $4      !move left 32-bits
        set     $3, $5          !low_value in tmp_reg2
        srl     $5, 0, $5       !clear upper-32 bits
        or      $4, $5, $4      !64_bit in tmp_reg1
        sub     $1, $4, $4
        brz,pt  $4, 1f
        nop
        ta      T_BAD_TRAP
        1:')


/* RD/WR_CNTL_REG_FIELD macros
	-These two macros work work for any register defined
	 in constants.h with *_RD(REG),*_WR(REG),*_MASK, and *_SHIFT.
	-See /diag/src/sit/examples/exampleCntrlRegRdWr.s for how to use
	 these macros.
	-Currently can't specify a VA for a read/wr to ASI that uses VA. */

#define ECHO(A) A

#define	RD_CNTL_REG_FIELD(DATA_REG,REGNAME,FIELD_NAME,TMP_REG1,TMP_REG2) \
	ECHO(REGNAME)_RD(DATA_REG); \
	setx	ECHO(FIELD_NAME)_MASK,TMP_REG2,TMP_REG1; \
	and	DATA_REG,TMP_REG1,TMP_REG1; \
	srlx	TMP_REG1,ECHO(FIELD_NAME)_SHIFT,DATA_REG

#define	WR_CNTL_REG_FIELD(DATA_REG,REGNAME,FIELD_NAME,TMP_REG1,TMP_REG2) \
	setx	ECHO(FIELD_NAME)_MASK,TMP_REG2,TMP_REG1; \
	ECHO(REGNAME)_RD(TMP_REG2); \
	andn	TMP_REG2,TMP_REG1,TMP_REG2; \
	sllx	DATA_REG,ECHO(FIELD_NAME)_SHIFT,DATA_REG; \
	and	DATA_REG,TMP_REG1,TMP_REG1; \
	or	TMP_REG1,TMP_REG2,TMP_REG1; \
	ECHO(REGNAME)_WR(TMP_REG1);\
	srlx	DATA_REG,ECHO(FIELD_NAME)_SHIFT,DATA_REG;

/* Following macro is to align code on I$line boundary. */

#define ALIGN_BRANCH_ICACHE_LINE \
	ba	1f; \
	nop; \
	.align ICACHE_LINE_SIZE_IN_BYTES; \
	1:


/*purpose: do asi read/write
  usuage: case1 take 2 parameters if the va[63:0] of the reg is fixed
                1st parameter = reg put the rd/wr value
                2nd           = a temp buffer
          e.g read tsb reg
                rdtsb(%l0,tmp_reg1)     ;%l0 will hold the rd value of tsb
                                        ;tmp_reg1 is defined at the program
                                         as #define tmp_reg1  %g5 by portability
                                         guideline.
 
          case2 take 3 parameters if the va[63:0] of the reg is various
                1st           =va that are interested could be in reg or imm_const 13
                2nd           =reg put the rd/wr value
                3rd           = a temp buffer
          e.g read data_access reg
                rdDdata_acc(0x48,%l3,tmp_reg1)  ;0x48 is the va of data_acc reg
                                                ;%l3 will hold the read value
        rdDtsb(returnvalue,tmp_reg1)
        wrDtsb(writevalue,tmp_reg1)
        rdItsb(returnvalue,tmp_reg1)
        wrItsb(writevalue,tmp_reg1)
        rdlsu_control_reg(returnvalue,tmp_reg1)
        wrlsu_control_reg(writevalue,tmp_reg1)
        rdDtag_acc(returnvalue,tmp_reg1)
        wrDtag_acc(writevalue,tmp_reg1)
	rdItag_acc(returnvalue,tmp_reg1)
	wrItag_acc(returnvalue,tmp_reg1)
        wrpcontext(writevalue,tmp_reg1)
        rdpcontext(returnvalue,tmp_reg1)
        wrscontext(writevalue,tmp_reg1)
        rdscontext(returnvalue,tmp_reg1)
        rdDtsb_8k(returnvalue,tmp_reg1)
	rdItsb_8k(returnvalue,tmp_reg1)
        rdDtsb_64k(returnvalue,tmp_reg1)
	rdItsb_64k(returnvalue,tmp_reg1)
        wrDdata_acc(va,writevalue,tmp_reg1)
	wrIdata_acc(va,writevalue,tmp_reg1)
        rdDdata_acc(va,returnvalue,tmp_reg1)
	rdIdata_acc(va,returnvalue,tmp_reg1)
        rdDtag_read(va,returnvalue,tmp_reg1)
        rdItag_read(va,returnvalue,tmp_reg1)
	wrDdemap(demap_data,reg:demap_va,tmp_reg1,tmp_reg2)
	wrIdemap(demap_data,reg:demap_va,tmp_reg1,tmp_reg2)
*/

/*2*/
define(rdDtsb,`mov ASI_DMMU_TSB_BASE_VAL,$2
        ldxa    [$2]ASI_DMMU_TSB_BASE,$1')

define(wrDtsb,`mov ASI_DMMU_TSB_BASE_VAL,$2
        stxa    $1,[$2]ASI_DMMU_TSB_BASE
	membar  0x40')
           
define(rdItsb,`mov ASI_IMMU_TSB_BASE_VAL,$2
        ldxa    [$2]ASI_IMMU_TSB_BASE,$1')
           
define(wrItsb,`mov ASI_IMMU_TSB_BASE_VAL,$2
        stxa    $1,[$2]ASI_IMMU_TSB_BASE
	membar  0x40')
           
define(rdlsu_control_reg,`ldxa [%g0]ASI_DCU_CONTROL_REG,$1')
           
define(wrlsu_control_reg,`stxa $1,[%g0]ASI_DCU_CONTROL_REG
	membar  0x40')
           
define(rdDtag_acc,`mov  ASI_DMMU_TAG_ACCESS_VAL,$2
       ldxa     [$2]ASI_DMMU_TAG_ACCESS,$1')
           
define(wrDtag_acc,`mov  ASI_DMMU_TAG_ACCESS_VAL,$2
       stxa  $1,[$2]ASI_DMMU_TAG_ACCESS
	membar  0x40')
          
define(rdItag_acc,`mov  ASI_IMMU_TAG_ACCESS_VAL,$2
       ldxa     [$2]ASI_IMMU_TAG_ACCESS,$1')
           
define(wrItag_acc,`mov  ASI_IMMU_TAG_ACCESS_VAL,$2
       stxa  $1,[$2]ASI_IMMU_TAG_ACCESS
        membar  0x40')
           
 
define(wrpcontext,`mov  ASI_PRIMARY_CONTEXT_REG_VAL,$2
       stxa  $1,[$2]ASI_PRIMARY_CONTEXT_REG
	membar  0x40')
                  
define(rdpcontext,`mov ASI_PRIMARY_CONTEXT_REG_VAL,$2
       ldxa  [$2]ASI_PRIMARY_CONTEXT_REG,$1')
           
define(wrscontext,`mov  ASI_SECONDARY_CONTEXT_REG_VAL,$2
       stxa  $1,[$2]ASI_SECONDARY_CONTEXT_REG
	membar  0x40')
           
           
define(rdscontext,`mov ASI_SECONDARY_CONTEXT_REG_VAL,$2
       ldxa  [$2]ASI_SECONDARY_CONTEXT_REG,$1')
           
           
define(rdDtsb_8k,`ldxa [%g0]ASI_DMMU_TSB_8KB_PTR_REG,$1')
           
define(rdDtsb_64k,`ldxa [%g0]ASI_DMMU_TSB_64KB_PTR_REG,$1')
          
define(rdItsb_8k,`ldxa [%g0]ASI_IMMU_TSB_8KB_PTR_REG,$1')

define(rdItsb_64k,`ldxa [%g0]ASI_IMMU_TSB_64KB_PTR_REG,$1')

/*3*/      
          
define(wrDdata_acc,`mov $1,$3
       stxa   $2,[$3]ASI_DTLB_DATA_ACCESS_REG
	membar  0x40')
           
define(rdDdata_acc,`mov $1,$3
       ldxa   [$3]ASI_DTLB_DATA_ACCESS_REG,$2')
          
define(wrIdata_acc,`mov $1,$3
       stxa   $2,[$3]ASI_ITLB_DATA_ACCESS_REG
        membar  0x40')

define(rdIdata_acc,`mov $1,$3
       ldxa   [$3]ASI_ITLB_DATA_ACCESS_REG,$2')
 
define(rdDtag_read,`mov $1,$3
        ldxa    [$3]ASI_DTLB_TAG_READ_REG,$2 ')
    
define(rdItag_read,`mov  $1,$3
        ldxa    [$3]ASI_ITLB_TAG_READ_REG,$2 ')
          
define(wrDdemap,`stxa	%g0,[$1]ASI_DMMU_DEMAP
		membar	0x40')

define(wrIdemap,`stxa 	%g0,[$1]ASI_IMMU_DEMAP
		flush	%g0')

#ifndef USER_TEXT_START
#define USER_TEXT_START user_text_start
#endif

#ifndef ENTRY_POINT
#define ENTRY_POINT USER_TEXT_START
#endif

define(SYNC, `.word 0x81b01000')
define(sync, `.word 0x81b01000')

/*
  - clear asynchronous fault status register
  - clr_asy_flt_stat_reg(temp_reg1, temp_reg2, temp_reg3)
*/

define(CLR_ASY_FLT_STAT_REG,`setx  0x0, $1, $2
	setx	0x1ffffffff, $1, $3
	stxa	$3,[$2]ASI_ASYNC_FAULT_STATUS
	membar	MBAR_SYNC')

/*
  - enable d_cache and e_cache by setting ic and dc bits
  - set_lsu_cntl_reg_csh_en(ic_dc_bits, reg_rd, temp1_reg, temp2_reg)
*/

define(SET_LSU_CNTL_REG_CSH_EN,`setx  0x0, $3, $4
	ldxa	[$4]ASI_DCU_CONTROL_REG, $2
	or	$2, $1, $2
	stxa	$2, [$4]ASI_DCU_CONTROL_REG
	membar	MBAR_SYNC')

/* following endif needs to be at very bottom */
#endif

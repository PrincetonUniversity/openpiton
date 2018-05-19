// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dcu_ctrl_reg.h
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

!! WARNING:
!! For bit set/reset masks, use "X * 2**Y" instead of "X * 2^Y".
!! "^" means "exponentiation" under SunOS:/bin/m4, but
!!     means "bitwise xor" under Solaris:/usr/ccs/bin/m4.
!! "**" is acceptable notation for exponentiation with either.

/*                                                          
		      	 DCU_CONTROL_REGISTER                   
+------+--+--+--+--+--+---+---+--+--+-----+-----+--+--+--+--+----------+--+--+--+--+
| ---- |CP|CV|ME|RE|PE|HPE|SPE|SL|WE| PM  |  VM |PR|PW|VR|VW| not used |DM|IM|DC|IC|
+------+--+--+--+--+--+---+---+--+--+-----+-----+--+--+--+--+----------+--+--+--+--+
 63  50 49 48 47 46 45  44  43 42 41 40 33 32 25 24 23 22 21 20       4  3  2  1  0

*/

#define DCU_CP_MASK			0x0002000000000000
#define DCU_CV_MASK			0x0001000000000000
#define DCU_ME_MASK			0x0000800000000000
#define DCU_RE_MASK			0x0000400000000000
#define DCU_PE_MASK			0x0000200000000000
#define DCU_HPE_MASK			0x0000100000000000
#define DCU_SPE_MASK			0x0000080000000000
#define DCU_SL_MASK			0x0000040000000000
#define DCU_WE_MASK			0x0000020000000000
#define	DCU_PM_MASK			0x000001FE00000000
#define	DCU_VM_MASK			0x00000001FE000000
#define	DCU_PR_MASK			0x0000000001000000
#define	DCU_PW_MASK			0x0000000000800000
#define	DCU_VR_MASK			0x0000000000400000
#define	DCU_VW_MASK			0x0000000000200000
#define DCU_CD_MASK			0x0000000000100000
#define	DCU_FM_MASK			0x00000000000FFFF0
#define	DCU_DM_MASK			0x0000000000000008
#define	DCU_IM_MASK			0x0000000000000004
#define	DCU_DC_MASK			0x0000000000000002
#define	DCU_IC_MASK			0x0000000000000001

#define DCU_CP_SHIFT			49
#define DCU_CV_SHIFT			48
#define DCU_ME_SHIFT			47
#define DCU_RE_SHIFT			46
#define DCU_PE_SHIFT			45
#define DCU_HPE_SHIFT			44
#define DCU_SPE_SHIFT			43
#define DCU_SL_SHIFT			42
#define DCU_WE_SHIFT			41
#define	DCU_PM_SHIFT			33
#define	DCU_VM_SHIFT			25
#define	DCU_PR_SHIFT			24
#define	DCU_PW_SHIFT			23
#define	DCU_VR_SHIFT			22
#define	DCU_VW_SHIFT			21
#define DCU_CD_SHIFT			20
#define	DCU_FM_SHIFT			4
#define	DCU_DM_SHIFT			3
#define	DCU_IM_SHIFT			2
#define	DCU_DC_SHIFT			1
#define	DCU_IC_SHIFT			0

#define	DCU_RD(REG) ldxa [%g0]ASI_DCU_CONTROL_REG,REG
#define	DCU_WR(REG) stxa REG,[%g0]ASI_DCU_CONTROL_REG; membar MBAR_SYNC

/* DCU_CONTROL_REG initialization.  See exampleCntrlRegInit.s for	*/
/* how to set these values in a test.*/

#ifndef DCU_CP_INIT
#define DCU_CP_INIT 1 /* Default I/D CP (cacheability) when I/DMU is off */
#endif
#ifndef DCU_CV_INIT
#define DCU_CV_INIT 1 /* Default D CV (cacheability) when DMU is off */
#endif
#ifndef DCU_ME_INIT
#define DCU_ME_INIT 0 /* Default noncachable store merge enable */
#endif
#ifndef DCU_RE_INIT
#define DCU_RE_INIT 1 /* Default RAW bypass enable */
#endif
#ifndef DCU_PE_INIT
#define DCU_PE_INIT 1 /* Default Prefetch cache enable */
#endif
#ifndef DCU_HPE_INIT
#define DCU_HPE_INIT 1 /* Default hardware prefetch enable */
#endif
#ifndef DCU_SPE_INIT
#define DCU_SPE_INIT 1 /* Default software prefetch enable */
#endif
#ifndef DCU_SL_INIT
#define DCU_SL_INIT 1 /* Default second load steering enable */
#endif
#ifndef DCU_WE_INIT
#define DCU_WE_INIT 1 /* Default write cache enable */
#endif
#ifndef DCU_PM_INIT
#define	DCU_PM_INIT 0 /* Default Wtchpt PA Mask value */
#endif
#ifndef DCU_VM_INIT
#define	DCU_VM_INIT 0 /* Default Wtchpt VA Mask value */
#endif
#ifndef DCU_PR_INIT
#define	DCU_PR_INIT 0 /* Default Wtchpt on Rd PA enable value */
#endif
#ifndef DCU_PW_INIT
#define	DCU_PW_INIT 0 /* Default Wtchpt on Wr PA enable value */
#endif
#ifndef DCU_VR_INIT
#define	DCU_VR_INIT 0 /* Default Wtchpt on Rd VA enable value */
#endif
#ifndef DCU_VW_INIT
#define	DCU_VW_INIT 0 /* Default Wtchpt on Wr VA enable value */
#endif
#ifndef DCU_CD_INIT
#define DCU_CD_INIT 0 /* Default store Compression Disable value  */
#endif
#ifndef DCU_FM_INIT
#define	DCU_FM_INIT 0 /* Default Write parity mask value */
#endif

#ifndef DCU_DM_INIT
#define	DCU_DM_INIT MAP_AND_ENABLE_DMU
#endif
#ifndef DCU_IM_INIT
#define	DCU_IM_INIT MAP_AND_ENABLE_IMU
#endif

#ifndef DCU_DC_INIT
#define	DCU_DC_INIT 1 /* Default D-cache enable value */
#endif
#ifndef DCU_IC_INIT
#define	DCU_IC_INIT 1 /* Default I-cache enable value */
#endif

define(DCU_CONTROL_REG_INIT_HI,
 eval(DCU_CP_INIT * 2**(DCU_CP_SHIFT - DCU_VM_SHIFT) +
      DCU_CV_INIT * 2**(DCU_CV_SHIFT - DCU_VM_SHIFT) +
      DCU_ME_INIT * 2**(DCU_ME_SHIFT - DCU_VM_SHIFT) +
      DCU_RE_INIT * 2**(DCU_RE_SHIFT - DCU_VM_SHIFT) +
      DCU_PE_INIT * 2**(DCU_PE_SHIFT - DCU_VM_SHIFT) +
      DCU_HPE_INIT * 2**(DCU_HPE_SHIFT - DCU_VM_SHIFT) +
      DCU_SPE_INIT * 2**(DCU_SPE_SHIFT - DCU_VM_SHIFT) +
      DCU_SL_INIT * 2**(DCU_SL_SHIFT - DCU_VM_SHIFT) +
      DCU_WE_INIT * 2**(DCU_WE_SHIFT - DCU_VM_SHIFT) +
      DCU_PM_INIT * 2**(DCU_PM_SHIFT - DCU_VM_SHIFT) +
      DCU_VM_INIT * 2**(DCU_VM_SHIFT - DCU_VM_SHIFT)))

define(DCU_CONTROL_REG_INIT_LO,
 eval(DCU_PR_INIT * 2**DCU_PR_SHIFT +
      DCU_PW_INIT * 2**DCU_PW_SHIFT +
      DCU_VR_INIT * 2**DCU_VR_SHIFT +
      DCU_VW_INIT * 2**DCU_VW_SHIFT +
      DCU_CD_INIT * 2**DCU_CD_SHIFT +
      DCU_FM_INIT * 2**DCU_FM_SHIFT +
      DCU_DM_INIT * 2**DCU_DM_SHIFT +
      DCU_IM_INIT * 2**DCU_IM_SHIFT +
      DCU_DC_INIT * 2**DCU_DC_SHIFT +
      DCU_IC_INIT * 2**DCU_IC_SHIFT))

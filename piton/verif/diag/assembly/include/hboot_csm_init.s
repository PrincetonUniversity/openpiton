// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


hboot_csm_init:

#ifdef CSM_ENABLE

#define CSM_CONFIG_REG mpeval((PITON_NUM_TILES%64) << 16)
#define COREID_REG     mpeval((PITON_X_TILES-1 + ((PITON_Y_TILES-1) * 256)) << 34)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! set csm config reg
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!check its own lsid based on the content in DATA_CSM page 
csm_get_lsid:
    setx     0xba00000000, %l1, %l2 !Address for config regs containing the current coreid
    ldx    [%l2], %l2            ! has coreid
    setx   0x8150040000, %l5, %l4 !Address for DATA_CSM page
    setx   0x3fffffff, %l1, %l5 !mask for 30-bit coreid
    and    %l2, %l5, %l2
    mov    %g0, %l1  ! clear content
    mov    0x04, %l7
!go through the lsid list and compare 
csm_lsid_loop:
    srlx   %l1, 8, %l6    
    cmp    %l6, %g0
	tne	   %xcc, T_BAD_TRAP
    nop 

    and    %l1, %l7, %l6
    cmp    %l6, %g0
    bne    %xcc, csm_lsid_odd
    nop
csm_lsid_even:
    add    %l1, %l7, %l6
    ba     csm_cond_done
    nop
csm_lsid_odd:
    sub    %l1, %l7, %l6
csm_cond_done:

    add    %l6, %l4, %l6 
    ld     [%l6], %l6
    and    %l6, %l5, %l6
    cmp    %l6, %l2
	bne	   %xcc, csm_lsid_loop
    add    %l1, 0x04, %l1    

    sub    %l1, 0x04, %l1    
    srlx   %l1, 2, %l1 !l1 contains the lsid

    setx    CSM_CONFIG_REG, %g1, %l3
    or     %l3, %l1, %l3 ! l3 has the context for config reg (hdid and sdid are both 0, num_tiles and lsid)
    mov     0x10, %g1
    stxa    %l3, [%g1] 0x1a ! store to itlb config reg
    nop
    nop
    mov     0x18, %g1
    stxa    %l3, [%g1] 0x1a !store to dtlb config reg



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! enable  all L2-cache csm
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    brnz  %l2, skip_l2_csm_loop  !skip this for cores other than the first one
    nop
    setx  PITON_NUM_TILES, %l4, %l2
!enable L2 caches of all cores
l2_csm_loop:
    sub %l2, 1, %l2
    sllx    %l2, 24,  %l4

	setx	cregs_l2_ctl_reg_r64, %g1, %l1  !enable csm
    mov 0xa9, %g1
	sllx	%g1, 32, %g1    !special address for l2 config reg
    or      %g1, %l4, %g1   !add offset starting from 24th bit to control the destination l2
    setx 0x205401, %g2, %g3   !address offset for DATA_CSM page
    sllx    %g3, 32, %g3
    or      %g3, %l1, %g3
    stx %g3, [%g1]

    setx   COREID_REG, %g1, %l1 ! set max number of cores
    mov 0xa7, %g1
	sllx	%g1, 32, %g1    !special address for l2 coreid reg
    or      %g1, %l4, %g1   !add offset starting from 24th bit to control the destination l2
    ldx    [%g1], %g3
    or      %g3, %l1, %g3
    stx     %g3, [%g1]
 
    brnz  %l2, l2_csm_loop
    nop

skip_l2_csm_loop:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! enable L15-cache csm
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!enable csm for the current core only
    setx 0xba00000300, %g2, %g1   !special address for l15 csm base address reg
    setx 0x205401, %g2, %g3       !address offset for DATA_CSM page
    stx %g3, [%g1] 
	setx	cregs_l2_ctl_reg_r64, %g1, %l1 
    setx 0xba00000100, %g2, %g1  !special address for l15 config reg
	stx	%l1, [%g1]

#else

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! set csm config reg
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    setx    0x8000000000000000, %g1, %l2
    mov     0x10, %g1
    stxa    %l2, [%g1] 0x1a
    nop
    nop
    mov     0x18, %g1
    stxa    %l2, [%g1] 0x1a


#endif

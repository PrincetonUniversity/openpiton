! Copyright (c) 2017 Princeton University
! All rights reserved.
! 
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the name of Princeton University nor the
!       names of its contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
! 
! THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

SECTION .DATA_CORE0_0 DATA_VA=0xa8202000
attr_data {
    Name = .DATA_CORE0_0,
    VA = 0xa8202000,
    PA = ra2pa(0xa8202000,0),
    RA = 0xa8202000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_0
data_core_0:
    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_1 DATA_VA=0xa8206000
attr_data {
    Name = .DATA_CORE0_1,
    VA = 0xa8206000,
    PA = ra2pa(0xa8206000,0),
    RA = 0xa8206000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_2 DATA_VA=0xa820a000
attr_data {
    Name = .DATA_CORE0_2,
    VA = 0xa820a000,
    PA = ra2pa(0xa820a000,0),
    RA = 0xa820a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_3 DATA_VA=0xa820e000
attr_data {
    Name = .DATA_CORE0_3,
    VA = 0xa820e000,
    PA = ra2pa(0xa820e000,0),
    RA = 0xa820e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_4 DATA_VA=0xa8212000
attr_data {
    Name = .DATA_CORE0_4,
    VA = 0xa8212000,
    PA = ra2pa(0xa8212000,0),
    RA = 0xa8212000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_5 DATA_VA=0xa8216000
attr_data {
    Name = .DATA_CORE0_5,
    VA = 0xa8216000,
    PA = ra2pa(0xa8216000,0),
    RA = 0xa8216000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_6 DATA_VA=0xa821a000
attr_data {
    Name = .DATA_CORE0_6,
    VA = 0xa821a000,
    PA = ra2pa(0xa821a000,0),
    RA = 0xa821a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_7 DATA_VA=0xa821e000
attr_data {
    Name = .DATA_CORE0_7,
    VA = 0xa821e000,
    PA = ra2pa(0xa821e000,0),
    RA = 0xa821e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_8 DATA_VA=0xa8222000
attr_data {
    Name = .DATA_CORE0_8,
    VA = 0xa8222000,
    PA = ra2pa(0xa8222000,0),
    RA = 0xa8222000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_9 DATA_VA=0xa8226000
attr_data {
    Name = .DATA_CORE0_9,
    VA = 0xa8226000,
    PA = ra2pa(0xa8226000,0),
    RA = 0xa8226000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_10 DATA_VA=0xa822a000
attr_data {
    Name = .DATA_CORE0_10,
    VA = 0xa822a000,
    PA = ra2pa(0xa822a000,0),
    RA = 0xa822a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_11 DATA_VA=0xa822e000
attr_data {
    Name = .DATA_CORE0_11,
    VA = 0xa822e000,
    PA = ra2pa(0xa822e000,0),
    RA = 0xa822e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_12 DATA_VA=0xa8232000
attr_data {
    Name = .DATA_CORE0_12,
    VA = 0xa8232000,
    PA = ra2pa(0xa8232000,0),
    RA = 0xa8232000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_13 DATA_VA=0xa8236000
attr_data {
    Name = .DATA_CORE0_13,
    VA = 0xa8236000,
    PA = ra2pa(0xa8236000,0),
    RA = 0xa8236000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_14 DATA_VA=0xa823a000
attr_data {
    Name = .DATA_CORE0_14,
    VA = 0xa823a000,
    PA = ra2pa(0xa823a000,0),
    RA = 0xa823a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff

    .align  PITON_L2_LOW_SIZE
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff
    .xword 0xffffffffffffffff



SECTION .DATA_CORE0_15 DATA_VA=0xa823e000
attr_data {
    Name = .DATA_CORE0_15,
    VA = 0xa823e000,
    PA = ra2pa(0xa823e000,0),
    RA = 0xa823e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L2_LOW_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0




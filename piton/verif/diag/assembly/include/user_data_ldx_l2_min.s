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

SECTION .DATA_CORE0_0 DATA_VA=0xa8200000
attr_data {
    Name = .DATA_CORE0_0,
    VA = 0xa8200000,
    PA = ra2pa(0xa8200000,0),
    RA = 0xa8200000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_0
data_core_0:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE0_1 DATA_VA=0xa8202000
attr_data {
    Name = .DATA_CORE0_1,
    VA = 0xa8202000,
    PA = ra2pa(0xa8202000,0),
    RA = 0xa8202000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE1_0 DATA_VA=0xa8204000
attr_data {
    Name = .DATA_CORE1_0,
    VA = 0xa8204000,
    PA = ra2pa(0xa8204000,0),
    RA = 0xa8204000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_1
data_core_1:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE1_1 DATA_VA=0xa8206000
attr_data {
    Name = .DATA_CORE1_1,
    VA = 0xa8206000,
    PA = ra2pa(0xa8206000,0),
    RA = 0xa8206000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE2_0 DATA_VA=0xa8208000
attr_data {
    Name = .DATA_CORE2_0,
    VA = 0xa8208000,
    PA = ra2pa(0xa8208000,0),
    RA = 0xa8208000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_2
data_core_2:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE2_1 DATA_VA=0xa820a000
attr_data {
    Name = .DATA_CORE2_1,
    VA = 0xa820a000,
    PA = ra2pa(0xa820a000,0),
    RA = 0xa820a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE3_0 DATA_VA=0xa820c000
attr_data {
    Name = .DATA_CORE3_0,
    VA = 0xa820c000,
    PA = ra2pa(0xa820c000,0),
    RA = 0xa820c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_3
data_core_3:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE3_1 DATA_VA=0xa820e000
attr_data {
    Name = .DATA_CORE3_1,
    VA = 0xa820e000,
    PA = ra2pa(0xa820e000,0),
    RA = 0xa820e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE4_0 DATA_VA=0xa8210000
attr_data {
    Name = .DATA_CORE4_0,
    VA = 0xa8210000,
    PA = ra2pa(0xa8210000,0),
    RA = 0xa8210000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_4
data_core_4:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE4_1 DATA_VA=0xa8212000
attr_data {
    Name = .DATA_CORE4_1,
    VA = 0xa8212000,
    PA = ra2pa(0xa8212000,0),
    RA = 0xa8212000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE5_0 DATA_VA=0xa8214000
attr_data {
    Name = .DATA_CORE5_0,
    VA = 0xa8214000,
    PA = ra2pa(0xa8214000,0),
    RA = 0xa8214000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_5
data_core_5:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE5_1 DATA_VA=0xa8216000
attr_data {
    Name = .DATA_CORE5_1,
    VA = 0xa8216000,
    PA = ra2pa(0xa8216000,0),
    RA = 0xa8216000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE6_0 DATA_VA=0xa8218000
attr_data {
    Name = .DATA_CORE6_0,
    VA = 0xa8218000,
    PA = ra2pa(0xa8218000,0),
    RA = 0xa8218000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_6
data_core_6:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE6_1 DATA_VA=0xa821a000
attr_data {
    Name = .DATA_CORE6_1,
    VA = 0xa821a000,
    PA = ra2pa(0xa821a000,0),
    RA = 0xa821a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE7_0 DATA_VA=0xa821c000
attr_data {
    Name = .DATA_CORE7_0,
    VA = 0xa821c000,
    PA = ra2pa(0xa821c000,0),
    RA = 0xa821c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_7
data_core_7:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE7_1 DATA_VA=0xa821e000
attr_data {
    Name = .DATA_CORE7_1,
    VA = 0xa821e000,
    PA = ra2pa(0xa821e000,0),
    RA = 0xa821e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE8_0 DATA_VA=0xa8220000
attr_data {
    Name = .DATA_CORE8_0,
    VA = 0xa8220000,
    PA = ra2pa(0xa8220000,0),
    RA = 0xa8220000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_8
data_core_8:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE8_1 DATA_VA=0xa8222000
attr_data {
    Name = .DATA_CORE8_1,
    VA = 0xa8222000,
    PA = ra2pa(0xa8222000,0),
    RA = 0xa8222000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE9_0 DATA_VA=0xa8224000
attr_data {
    Name = .DATA_CORE9_0,
    VA = 0xa8224000,
    PA = ra2pa(0xa8224000,0),
    RA = 0xa8224000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_9
data_core_9:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE9_1 DATA_VA=0xa8226000
attr_data {
    Name = .DATA_CORE9_1,
    VA = 0xa8226000,
    PA = ra2pa(0xa8226000,0),
    RA = 0xa8226000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE10_0 DATA_VA=0xa8228000
attr_data {
    Name = .DATA_CORE10_0,
    VA = 0xa8228000,
    PA = ra2pa(0xa8228000,0),
    RA = 0xa8228000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_10
data_core_10:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE10_1 DATA_VA=0xa822a000
attr_data {
    Name = .DATA_CORE10_1,
    VA = 0xa822a000,
    PA = ra2pa(0xa822a000,0),
    RA = 0xa822a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE11_0 DATA_VA=0xa822c000
attr_data {
    Name = .DATA_CORE11_0,
    VA = 0xa822c000,
    PA = ra2pa(0xa822c000,0),
    RA = 0xa822c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_11
data_core_11:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE11_1 DATA_VA=0xa822e000
attr_data {
    Name = .DATA_CORE11_1,
    VA = 0xa822e000,
    PA = ra2pa(0xa822e000,0),
    RA = 0xa822e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE12_0 DATA_VA=0xa8230000
attr_data {
    Name = .DATA_CORE12_0,
    VA = 0xa8230000,
    PA = ra2pa(0xa8230000,0),
    RA = 0xa8230000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_12
data_core_12:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE12_1 DATA_VA=0xa8232000
attr_data {
    Name = .DATA_CORE12_1,
    VA = 0xa8232000,
    PA = ra2pa(0xa8232000,0),
    RA = 0xa8232000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE13_0 DATA_VA=0xa8234000
attr_data {
    Name = .DATA_CORE13_0,
    VA = 0xa8234000,
    PA = ra2pa(0xa8234000,0),
    RA = 0xa8234000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_13
data_core_13:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE13_1 DATA_VA=0xa8236000
attr_data {
    Name = .DATA_CORE13_1,
    VA = 0xa8236000,
    PA = ra2pa(0xa8236000,0),
    RA = 0xa8236000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE14_0 DATA_VA=0xa8238000
attr_data {
    Name = .DATA_CORE14_0,
    VA = 0xa8238000,
    PA = ra2pa(0xa8238000,0),
    RA = 0xa8238000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_14
data_core_14:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE14_1 DATA_VA=0xa823a000
attr_data {
    Name = .DATA_CORE14_1,
    VA = 0xa823a000,
    PA = ra2pa(0xa823a000,0),
    RA = 0xa823a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE15_0 DATA_VA=0xa823c000
attr_data {
    Name = .DATA_CORE15_0,
    VA = 0xa823c000,
    PA = ra2pa(0xa823c000,0),
    RA = 0xa823c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_15
data_core_15:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE15_1 DATA_VA=0xa823e000
attr_data {
    Name = .DATA_CORE15_1,
    VA = 0xa823e000,
    PA = ra2pa(0xa823e000,0),
    RA = 0xa823e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE16_0 DATA_VA=0xa8240000
attr_data {
    Name = .DATA_CORE16_0,
    VA = 0xa8240000,
    PA = ra2pa(0xa8240000,0),
    RA = 0xa8240000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_16
data_core_16:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE16_1 DATA_VA=0xa8242000
attr_data {
    Name = .DATA_CORE16_1,
    VA = 0xa8242000,
    PA = ra2pa(0xa8242000,0),
    RA = 0xa8242000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE17_0 DATA_VA=0xa8244000
attr_data {
    Name = .DATA_CORE17_0,
    VA = 0xa8244000,
    PA = ra2pa(0xa8244000,0),
    RA = 0xa8244000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_17
data_core_17:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE17_1 DATA_VA=0xa8246000
attr_data {
    Name = .DATA_CORE17_1,
    VA = 0xa8246000,
    PA = ra2pa(0xa8246000,0),
    RA = 0xa8246000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE18_0 DATA_VA=0xa8248000
attr_data {
    Name = .DATA_CORE18_0,
    VA = 0xa8248000,
    PA = ra2pa(0xa8248000,0),
    RA = 0xa8248000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_18
data_core_18:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE18_1 DATA_VA=0xa824a000
attr_data {
    Name = .DATA_CORE18_1,
    VA = 0xa824a000,
    PA = ra2pa(0xa824a000,0),
    RA = 0xa824a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE19_0 DATA_VA=0xa824c000
attr_data {
    Name = .DATA_CORE19_0,
    VA = 0xa824c000,
    PA = ra2pa(0xa824c000,0),
    RA = 0xa824c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_19
data_core_19:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE19_1 DATA_VA=0xa824e000
attr_data {
    Name = .DATA_CORE19_1,
    VA = 0xa824e000,
    PA = ra2pa(0xa824e000,0),
    RA = 0xa824e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE20_0 DATA_VA=0xa8250000
attr_data {
    Name = .DATA_CORE20_0,
    VA = 0xa8250000,
    PA = ra2pa(0xa8250000,0),
    RA = 0xa8250000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_20
data_core_20:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE20_1 DATA_VA=0xa8252000
attr_data {
    Name = .DATA_CORE20_1,
    VA = 0xa8252000,
    PA = ra2pa(0xa8252000,0),
    RA = 0xa8252000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE21_0 DATA_VA=0xa8254000
attr_data {
    Name = .DATA_CORE21_0,
    VA = 0xa8254000,
    PA = ra2pa(0xa8254000,0),
    RA = 0xa8254000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_21
data_core_21:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE21_1 DATA_VA=0xa8256000
attr_data {
    Name = .DATA_CORE21_1,
    VA = 0xa8256000,
    PA = ra2pa(0xa8256000,0),
    RA = 0xa8256000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE22_0 DATA_VA=0xa8258000
attr_data {
    Name = .DATA_CORE22_0,
    VA = 0xa8258000,
    PA = ra2pa(0xa8258000,0),
    RA = 0xa8258000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_22
data_core_22:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE22_1 DATA_VA=0xa825a000
attr_data {
    Name = .DATA_CORE22_1,
    VA = 0xa825a000,
    PA = ra2pa(0xa825a000,0),
    RA = 0xa825a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE23_0 DATA_VA=0xa825c000
attr_data {
    Name = .DATA_CORE23_0,
    VA = 0xa825c000,
    PA = ra2pa(0xa825c000,0),
    RA = 0xa825c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_23
data_core_23:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE23_1 DATA_VA=0xa825e000
attr_data {
    Name = .DATA_CORE23_1,
    VA = 0xa825e000,
    PA = ra2pa(0xa825e000,0),
    RA = 0xa825e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE24_0 DATA_VA=0xa8260000
attr_data {
    Name = .DATA_CORE24_0,
    VA = 0xa8260000,
    PA = ra2pa(0xa8260000,0),
    RA = 0xa8260000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_24
data_core_24:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0



SECTION .DATA_CORE24_1 DATA_VA=0xa8262000
attr_data {
    Name = .DATA_CORE24_1,
    VA = 0xa8262000,
    PA = ra2pa(0xa8262000,0),
    RA = 0xa8262000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0
    .xword 0x0




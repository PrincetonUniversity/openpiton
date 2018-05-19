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

hboot_execd_init:

! Only do stuff when ED is enabled
#ifdef ED_ENABLE

! Default sync method is STSM
#ifndef ED_SYNC_METHOD_STSM
#ifndef ED_SYNC_METHOD_RTSM
#ifndef ED_SYNC_METHOD_HTSM
#define ED_SYNC_METHOD_STSM
#endif
#endif
#endif

! Values for accessing and modifying ExecD config registers
#define CFG_REG_ASI                 0x1a
#define ED0_CFG_OFFSET              0x0
#define ED1_CFG_OFFSET              0x8
#define ED_SEED_VALUE_ENABLE_MASK   0xaaaa8
#define ED_SEED_DISABLE_MASK        0xfffffffffff7ffff

! Enable mask based on sync method
#ifdef ED_SYNC_METHOD_STSM 
#define ED_ENABLE_MASK              0x1
#elif ED_SYNC_METHOD_RTSM 
#define ED_ENABLE_MASK              0x3
#elif ED_SYNC_METHOD_HTSM 
#define ED_ENABLE_MASK              0x5
#endif

    ! Set the offset for the ED0 config reg
    mov ED0_CFG_OFFSET, %l1

    ! Load ED0 configuration register default value
    ldxa [%l1] CFG_REG_ASI, %g1
    
#ifndef ED_SYNC_METHOD_STSM
    ! Seed the LFSR if we are using RTSM or HTSM
    set ED_SEED_VALUE_ENABLE_MASK, %g2
    or %g1, %g2, %g1
    stxa %g1, [%l1] CFG_REG_ASI
    setx ED_SEED_DISABLE_MASK, %g3, %g2
    and %g1, %g2, %g1
    stxa %g1, [%l1] CFG_REG_ASI
#endif

    ! Enable ExecD with mask set by sync method
    or %g1, ED_ENABLE_MASK, %g1
    stxa %g1, [%l1] CFG_REG_ASI

#endif ! #ifdef ED_ENABLE



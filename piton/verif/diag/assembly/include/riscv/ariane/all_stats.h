// SPDX-License-Identifier: BSD-3-Clause
//
// Copyright (c) 2024 Barcelona Supercomputing Center
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the authors nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// -----------------------------------------------------------------------------------
// File           : all_stats.h
// Organization   : Barcelona Supercomputing Center
// Author(s)      : Noelia Oliete Escuin
// Email(s)       : noelia.oliete@bsc.es
// Description    : Library that contains the function all_stats. First, this function retrieve 
//                  all the available metrics (cycles, cycles/iter, CPI, L2 access and L2 misses) 
//                  generated by the core (cid) during the execution of code. Finally, prints the
//                  metrics obtained of all the cores involved in the execution in order. 
// ------------------------------------------------------------------------------------

#ifndef __ALL_STATS_H
#define __ALL_STATS_H
#include "cache_metrics.h"
#include "util.h"

#define all_stats(code, iter) do { \
    volatile static uint32_t _amo_cnt = 0; \
    reset_L2_metrics(cid); \
    unsigned long _c = -read_csr(mcycle), _i = -read_csr(minstret); init_L2_metrics(cid); \
    code; \
    stop_L2_metrics(cid); \
    _c += read_csr(mcycle), _i += read_csr(minstret); \
    while(argv[0][0] != _amo_cnt); \
    printf("\n%s: %d cid, %ld cycles, %ld.%ld cycles/iter, %ld.%ld CPI, %ld L2_access, %ld L2_misses\n", \
             stringify(code), cid, _c, _c/iter, 10*_c/iter%10, _c/_i, 10*_c/_i%10, read_L2_access(cid), read_L2_misses(cid)); \
    ATOMIC_OP(_amo_cnt, 1, add, w); \
  } while(0)

#endif   //__ALL_STATS_H
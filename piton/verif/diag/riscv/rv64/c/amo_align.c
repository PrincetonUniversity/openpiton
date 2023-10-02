// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
// Date: 26.11.2018
// Description: Single threaded AMO test, checks for alignment issues with sub
// dword accesses.

#include <stdint.h>
#include <stdio.h>
#include "util.h"

#define NUM_WORDS 16

int main(int argc, char** argv) {

  volatile static uint32_t amo_cnt[NUM_WORDS] = {0x33221100,
                                                 0x77665544,
                                                 0xBBAA9988,
                                                 0xFFEEDDCC,
                                                 0x11111111,
                                                 0x22222222,
                                                 0x33333333,
                                                 0x44444444,
                                                 0x55555555,
                                                 0x66666666,
                                                 0x77777777,
                                                 0x88888888,
                                                 0x99999999,
                                                 0xAAAAAAAA,
                                                 0xBBBBBBBB,
                                                 0xCCCCCCCC};

  const uint32_t golden[NUM_WORDS] = {0x33221100,
                                      0x77665544,
                                      0xBBAA9988,
                                      0xFFEEDDCC,
                                      0x11111111,
                                      0x22222222,
                                      0x33333333,
                                      0x44444444,
                                      0x55555555,
                                      0x66666666,
                                      0x77777777,
                                      0x88888888,
                                      0x99999999,
                                      0xAAAAAAAA,
                                      0xBBBBBBBB,
                                      0xCCCCCCCC};

  for (uint32_t k=0; k<NUM_WORDS; k++) {
    ATOMIC_OP(amo_cnt[k], (k+1), add, w);
  }

  uint32_t check, tmp;
  for (uint32_t k=0; k<NUM_WORDS; k++) {
    ATOMIC_FETCH_OP(tmp, amo_cnt[k], ((k+1)<<8), add, w);

    check = golden[k] + (k+1);
    if(check != tmp) {
      printf("mismatch (%d, pre): exp: %08x, act: %08x\n", k, check, tmp);
      return 1;
    }

    check += ((k+1)<<8);
    if(check != amo_cnt[k]) {
      printf("mismatch (%d, post): exp: %08x, act: %08x\n", k, check, amo_cnt[k]);
      return 1;
    }

    printf("checks for word %d passed\n", k);
  }

  return 0;
}
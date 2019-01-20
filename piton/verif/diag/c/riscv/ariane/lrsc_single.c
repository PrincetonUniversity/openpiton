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
// Description: Simple hello world program that prints the core id.
// Also runs correctly on manycore configs.
//

#include <stdint.h>
#include <stdio.h>
#include "util.h"

void do_work(int n)
{
    if (n==0)
    return;
    else
    do_work(n-1);
}

int main(int argc, char** argv) {

  volatile static uint32_t amo_lrsc[20];

  uint32_t tmp = 1;
        do_work(100);
  
        ATOMIC_OP(amo_lrsc[0], 1, add, w);
        LR_OP(tmp, amo_lrsc[0], w);
        SC_OP(tmp, amo_lrsc[0], 0x123, w);
        printf("First LRSC suc: %d\n", tmp);

        LR_OP(tmp, amo_lrsc[0], w);
        printf("read from [0]: %d\n", tmp);
        tmp += amo_lrsc[512];
        tmp += amo_lrsc[1024];
        tmp += amo_lrsc[1536];
        tmp += amo_lrsc[2048];
        printf("accumulated sum: %d\n", tmp);
        
        SC_OP(tmp, amo_lrsc[0], 0x234, w);
        printf("Second LRSC suc: %d\n", tmp);
  
        LR_OP(tmp, amo_lrsc[0], w);
        printf("read from [0]: %d\n", tmp);
        tmp += amo_lrsc[512];
        tmp += amo_lrsc[1024];
        tmp += amo_lrsc[1536];
        SC_OP(tmp, amo_lrsc[0], 0x345, w);
        printf("Third LRSC suc: %d\n", tmp);
  
  return 0;

}

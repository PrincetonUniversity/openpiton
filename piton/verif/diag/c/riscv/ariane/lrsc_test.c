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

int main(int argc, char** argv) {

  // synchronization variable
  volatile static uint32_t amo_cnt[20];
  volatile static uint32_t amo_lrsc[20];

  uint32_t id, core_num;
  int i;
  // TODO check if argv will be changed on master branch.
  id = argv[0][0];
  core_num = argv[0][1];

  amo_cnt[0] = 0;
  amo_lrsc[0] = 0;
  if(id == 0)
  {
    for (i=1; i<20; i++)
    {
        ATOMIC_OP(amo_cnt[i], 1, add, w);
        ATOMIC_OP(amo_lrsc[i], 1, add, w);
    }
  }

  // synchronize with other cores and wait until it is this core's turn
  while(id != amo_cnt[0]);

  // assemble number and print
  printf("Hello world, this is hart %d of %d harts!\n", id, core_num);

  // increment atomic counter
  ATOMIC_OP(amo_cnt[0], 1, add, w);

  int j = 0, k = 0;
  while(core_num != amo_cnt[0]);


  printf("Core %d entered cal section\n",id);
  uint32_t tmp = 1;

  /*if (id == 0)
  {
        while(tmp != 0)
        {
                LR_OP(tmp, amo_lrsc[0], w);
                SC_OP(tmp, amo_lrsc[0], 1234, w);
                printf("tried \n");
        }
        printf("Suc:%d, Val:%d\n", tmp, amo_lrsc[0]);
        amo_cnt[0] = 2;
  }
  else
  {
        printf("Core 1 does the SC: ");
        SC_OP(tmp, amo_lrsc[0], 0, w);
        printf("Suc:%d, Val:%d\n", tmp, amo_lrsc[0]);
  }

  printf("Hello world, this is hart %d of %d harts!\n", id, core_num);
  ATOMIC_OP(amo_cnt[0], 1, add, w);*/


  //while(amo_cnt != 2*core_num);

  if (id == 0)
  {
    for (i=1; i<10; i++)
    {
        tmp = 1;
        while(tmp != 0)
        {
                LR_OP(tmp, amo_lrsc[0], w);
                if (tmp%2 == 0)
                {
                    SC_OP(tmp, amo_lrsc[0], (2*i-1), w);
                }
                else
                {
                    tmp = 1;
                    printf("#\n");
                }
        }
        //printf("finish %d\n", (2*i-1));
    }
  }
  else
  {
    for (i=1; i<10; i++)
    {
        tmp = 1;
        while(tmp != 0)
        {
                LR_OP(tmp, amo_lrsc[0], w);
                if (tmp%2 == 1)
                {
                    SC_OP(tmp, amo_lrsc[0], (2*i), w);
                }
                else
                {
                    tmp = 1;
                    printf("@\n");
                }
        }
        //printf("finish %d\n", (2*i));
    }

  }
  
  ATOMIC_OP(amo_cnt[0], 1, add, w);
  while(amo_cnt[0] != 2*core_num);

  if (id == 0)
  {
    printf("At last, lrsc variable is %d\n", amo_lrsc[0]);
  }
  
  return 0;

}

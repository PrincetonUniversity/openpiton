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
#include <stdlib.h>
#include "util.h"

void wait(int t)
{
    if (t == 0)
        return;
    else
        wait(t-1);
}

int main(int argc, char** argv) {

  // synchronization variable
  // only use the first element in the array. 
  // purpose of the array is to make them in different l2 cacheline
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

  int j = 0, k = 0, rand = 49;
  while(core_num != amo_cnt[0]);


  printf("Core %d entered cal section\n",id);
  uint32_t tmp = 1;

    for (i=0; i<10; i++)
    {
        tmp = amo_lrsc[0];
        tmp ++;
        amo_lrsc[0] = tmp;
    }
  
  ATOMIC_OP(amo_cnt[0], 1, add, w);
  while(amo_cnt[0] != 2*core_num);

  if (id == 0)
  {
    printf("First round, the counter reaches is %d\n", amo_lrsc[0]);
    amo_lrsc[0] = 0;
  }
  
  ATOMIC_OP(amo_cnt[0], 1, add, w);
  while(amo_cnt[0] != 3*core_num);

  printf("Core %d entered cal section\n",id);
    for (i=0; i<100; i++)
    {
        while(1)
        {
            LR_OP(tmp, amo_lrsc[0], w);
            j = tmp + 1;
            SC_OP(tmp, amo_lrsc[0], j, w);
            if (tmp == 1)
            {
                // wait for a random time
                /*if (id == 0)
                    printf("@\n");
                else
                    printf("#\n");
                */
                wait(rand%100);
                rand = (rand *31586 + 23317) %1000;
                k++;
            }
            else
            {
                break;
            }
        }
        //printf("reach %d\n", j);
    }

  ATOMIC_OP(amo_cnt[0], 1, add, w);
  while(amo_cnt[0] != 4*core_num);

  if (id == 0)
  {
    printf("Second round, the counter reaches is %d, %d times of conflicts\n", amo_lrsc[0], k);
  }
  

  return 0;

}

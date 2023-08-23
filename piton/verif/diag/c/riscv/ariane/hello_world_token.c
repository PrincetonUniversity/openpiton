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
// Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich, Fei Gao <feig@princeton.edu>
// Date: 26.11.2018
// Description: test the data sharing among massive amount of cores.
//

#include <stdint.h>
#include <stdio.h>
#include "util.h"

int main(int argc, char** argv) {

  // synchronization variable
  // amo_cnt[i+1][0] is the token shared by core i and core i+1
  // the length 20 is to make sure that different tokens are stored in different cache lines.
  // Support 128 cores at most
  volatile static uint32_t amo_cnt[128][20] = {0};

  amo_cnt[0][0] = 1;

  uint32_t id, core_num;
  int i;
  id = argv[0][0];
  core_num = argv[0][1];

  // two cores try to edit the same variable
  for (i=0;i<5;i++)
      if (id == 0)
      {
            ATOMIC_OP(amo_cnt[id][8], 1, add, w);
            ATOMIC_OP(amo_cnt[core_num-1][8], 1, add, w);
      }
      else
      {
            ATOMIC_OP(amo_cnt[id][8], 1, add, w);
            ATOMIC_OP(amo_cnt[id-1][8], 1, add, w);
      }

  ATOMIC_OP(amo_cnt[id][16], 1, add, w);

  // synchronize between it's neighbor
  if (id < core_num-1)
  {
      while(amo_cnt[id+1][16] != 1);
  }
  else
  {
      while(amo_cnt[0][16] != 1);
  }


  // synchronize with other cores and wait until it is this core's turn
  while(amo_cnt[id][0] != 1);

  // assemble number and print. Reduce print info length to save time
  // "{id} 10" is expected
  printf("%d %d\n", id, amo_cnt[id][8]);

  // increment atomic counter
  ATOMIC_OP(amo_cnt[id+1][0], 1, add, w);

  return 0;
}


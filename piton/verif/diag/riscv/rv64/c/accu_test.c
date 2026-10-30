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
// Description: Simpe test program that writes a block of data to memory, reads it
// back and checks whether the checksum is correct.
//

#include <stdio.h>

// 64kB of data
#define NUM_WORDS 16*1024

int main(int argc, char ** argv) {

  int tmp[NUM_WORDS];
  int accu;

  for (int k = 0; k < NUM_WORDS; k++) {
    tmp[k] = k;
  }

  accu = 0;
  for (int k = 0; k < NUM_WORDS; k++) {
    accu+=tmp[k];
  }

  int expected = NUM_WORDS*(NUM_WORDS-1)/2;
  printf("exp: %d, act: %d\n", expected, accu);

  return (expected!=accu);
}

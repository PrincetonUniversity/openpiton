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
// Description: Simple hello world program that prints 32 times "hello world".
//

#include <stdio.h>


#define NHARTS       1
#define PLIC_SOURCES 2
#define CLINT_BASE   0xfff1020000ULL
#define PLIC_BASE    0xfff1100000ULL 

int main(int argc, char ** argv) {

  printf("Reading APLIC registers...\n");
  
  // only use core 0 to perform test
  if(argv[0][0] == 0) {

      //uint64_t *addr;
      //// PLIC Register
      //for (uint64_t k = 0; k < NHARTS; k++) {
      //    addr = (uint64_t*)(PLIC_BASE + k*8);
      //    *addr = 0xdeadbeef;
      //    uint64_t val;
      //    val = *addr;
      //    printf("Addr = 0x%x",addr);
      //    printf("Val: result = 0x%x\n",val);
      //}
      //printf("Done!\n");

      uint64_t *addr;
      //int val;
      // APLIC Register
      for (uint64_t k = 0; k < NHARTS; k++) {
          addr = (uint64_t*)(PLIC_BASE + 0x3000);
          *addr = 0x1eff;
          uint64_t val;
          val = *addr;
          printf("ADDR : 0x%lx\n",addr);
          printf("VAL: 0x%x\n",val);

          //if ( val == 0xdeadbeef ){
          //  printf("PASS!");
          //  return 0;
          //}
          //else{
          //  printf("FAILED");
          //  return 1;
          //}
      }
      printf("Done!\n");
  }
      
  return 0;
}

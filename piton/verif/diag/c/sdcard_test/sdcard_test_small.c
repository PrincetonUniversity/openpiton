// Copyright (c) 2016 Princeton University
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

 //========================================================================
 // towers of hanoi
 //======================================================================== 

//#include "ubmark.h"
#include <stdint.h>
#include "libc.h"

// __attribute__ ((noinline))
// void move(int n, int from, int to, int via)
// {
//   if (n > 0) {
//     move(n - 1, from, via, to);
//     move(n - 1, via, to, from);
//   }
// }

void uart_print(char* str){
  static char* uart_base = (char*)(0xfff0c2c000);
  unsigned i = 0;
  while(str[i] != 0){
    *uart_base = str[i];
    ++i;
  }
}

void uart_putchar(char c){
  static char* uart_base = (char*)(0xfff0c2c000);
  *uart_base = c;
}



// int main(int argc, char* argv[]) {
//    uint32_t seed = 0;
//    if (argc == 2)
//       seed = std::atoi(argv[1]);

//    FILE* outfile = nullptr;
//    outfile = std::fopen("outfile", "w");

//    const uint32_t kFileSize = 40*1024*1024; // 100MB
//    const uint32_t kFloatSize = 9; // 7 characters + 1 new line
//    const uint32_t kLineCount = kFileSize / kFloatSize;

//    std::srand(seed);
//    for (uint32_t i = 0; i < kLineCount; ++i) {
//       uint32_t rand_var = std::rand();
//       fprintf(outfile, "%0x\n", rand_var);
//    }
//    std::fclose(outfile);

int main()
{
  // //test_stats_on( 0 );
  // uart_print("Done!");
  // move(7,1,2,3);
  // //test_stats_off( 0 );


  // //test_pass(0);
  // pass();
  // //return 0;


  uart_print("Starting SD card read/write test.");

  const uint32_t kFileSize = 64*1024*1024; 
  const uint32_t kFloatSize = 8;
  // const uint32_t kLineCount = kFileSize / kFloatSize;
  const uint32_t kLineCount = 8;

  const uint32_t seed_a = 16273841;
  const uint32_t seed_b = 82618927;

  const uint64_t kStartSd = 0xfff0000000ULL;
  const uint64_t kEndSd = 0xfff0000000ULL;
  const uint64_t kUARTAddr= 0xfff0c2c000ULL;

  // if (kStartSd + kFileSize >= kUARTAddr) {
  //   uart_print("Error: test address range overlaps UART.");
  //   test_fail(0);
  // }

  uint32_t* mem = (uint32_t*)kStartSd;
  const uint32_t* const kUART = (const uint32_t*)kUARTAddr;

  int j = 0;
  for (j = 0; j < 8; ++j) {
    // WRITE TO SD CARD
    {
      uint32_t a = seed_a;
      uint32_t b = seed_b;
      uint32_t i = 0;
      for (i = 0; i < kLineCount; ++i) {
        if (mem+i == kUART)
          i += 1024;
        uint32_t rand_var = a * b;
        mem[i] = rand_var;
        ++a; ++b;
      }
    }

    // READ FROM SD AND VERIFY
    {
      uint32_t a = seed_a;
      uint32_t b = seed_b;
      // uint32_t error_count = 0;
      uint32_t i = 0;
      for (i = 0; i < kLineCount; ++i) {
        if (mem+i == kUART)
          i += 1024;
        uint32_t rand_var = a * b;
        if (mem[i] != rand_var) {
          uart_print("Error: mismatch");
          fail();
        }
        ++a; ++b;
      }
    }
  }

  pass();
}

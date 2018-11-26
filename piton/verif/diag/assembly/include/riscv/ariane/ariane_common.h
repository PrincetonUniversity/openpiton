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
// Description: Some common helper functions for simple hello world C programs.
//

#pragma once

#define FAKE_UART_ADDRESS 0XFFF0C2C000

// prints a cstring via the fake UART
void printStr(char * str) {
  volatile char * uartAddr = (char*)FAKE_UART_ADDRESS;
  int k=0;
  while(str[k]!='\0') {
    (*uartAddr) = str[k++];
  }
  return;
}

// inserts number with dig digits at position pos in string
void num2str(char * str, int num, int pos, int dig) {
  for (int k=dig-1; k>=0; k--) {
    str[pos+k] = num % 10 + '0';
    num /= 10;
  }
  return;
}

// GOOD pass trap for the TB, do not modify the function name
volatile void pass () {
  return;
}

// BAD fail trap for the TB, do not modify the function name
volatile void fail () {
  return;
}


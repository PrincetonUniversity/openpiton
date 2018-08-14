// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: factorial.c
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
#ifndef ARG
# define ARG 10
#endif

#include "libc.h"
#include "put.h"


int 
factorial_recursive(int f) {
  if(f == 1 || f == 0) {
    return 1;
  } else {
    int result = f * factorial_recursive(f-1);
    return result;
  }
}

int 
factorial_loop(int f) {
  int product = 1;
  while(f >= 1) {
    product *= f;
    f--;
  }
  return product;
}



int main(void) {
  int recursive_result, loop_result;

  recursive_result = factorial_recursive(ARG);
  // printf("%d! = %d (recursive)\n", ARG, recursive_result);
  loop_result      = factorial_loop(ARG);
  // printf("%d! = %d (loop)\n", ARG, loop_result);

  printf("Hello\n\n");
  printf("This\n\n");
  printf("is\n");
  printf("test\n");
  if(recursive_result == loop_result) {
    printf("Test passed :)\n");
    pass();
  } else {
    printf("Test failed :(\n");
    fail();
  }
}

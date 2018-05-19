// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: main.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)main.cc
***
***  Version Date:  05/24/99
***
****************************************************************************
****************************************************************************/
// This is used with the VCS -e option to alter the initialisation sequence
// of VCS. Use this file if there are any C++ PLIs in the simulation
// Use the ifdef'd code to make it easy to attach to a simulation using dbx

//#include<stdio.h>
#include<stdlib.h>
extern "C" int SimvMain(int argc, char *argv[]);
int main (int argc, char *argv[]){
  #ifdef DEBUG_WAIT_FOR_DBX_TO_ATTACH
  FILE *id;
  fprintf(stderr, "DEBUG - waiting for lock file to arrive\n");
  while ((id = fopen("lock.tmp", "r")) == NULL);
  fclose(id);
  #endif
  //printf("=== OpenSPARC T1 PLI Version 1.0 ===\n");
  //printf("Copyright (c) 2001-2006 Sun Microsystems, Inc. All rights reserved.\n");
  //initialise_threads();
  SimvMain(argc, argv);
  return 0;
}

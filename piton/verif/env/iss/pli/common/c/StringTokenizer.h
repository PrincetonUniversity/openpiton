// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: StringTokenizer.h
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
//------------------------------------------------------------------------------
//
// Description:  A string parser class that has similar funcionality as
//               strtok but is nondestructive and has more features.
//
//------------------------------------------------------------------------------

#include <string.h>

#ifndef STRINGTOKENIZER_H
#define STRINGTOKENIZER_H

class StringTokenizer {
private:
  // The original string.
  char *org_string;
  // A copy of the string that can be mutilated.
  char *cpy_string;
  // The current parsing location.
  int curr_loc;
  // The previous parsing location.
  int prev_loc;
  // Delimiter.
  char *delim;

  int countTokens(int);
  int countTokensExact(int);

public:
  StringTokenizer(char *);
  StringTokenizer(char *, char *);
  ~StringTokenizer();

  void Restart();
  char *GetToken();
  char *GetToken(char *);
  char *GetTokenExact();
  char *GetTokenExact(char *);
  int PutToken();
  int HasMoreTokens();

  // Count the number of tokens.
  int NumTokens() { return countTokens(0); }
  int NumTokensExact() { return countTokensExact(0); }
  // Count the number of tokens left.
  int TokensLeft() { return countTokens(curr_loc); }
  int TokensLeftExact() { return countTokensExact(curr_loc); }
  // Get the original string.
  char *GetString() { return org_string; }
  // Get everything left in the string.
  char *GetRest() { return &org_string[curr_loc]; }
};

#endif // STRINGTOKENIZER_H

// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: StringTokenizer.cc
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
//------------------------------------------------------------------------------
//
// Description:  A string parser class that has similar functionality as
//               strtok but is nondestructive and has more features.
//
//------------------------------------------------------------------------------

#include "StringTokenizer.h"


//------------------------------------------------------------------------------
// Constructor.
StringTokenizer::StringTokenizer(char *str)
{
  org_string = new char[strlen(str)+1];
  cpy_string = new char[strlen(str)+1];
  strcpy(org_string, str);
  strcpy(cpy_string, str);
  curr_loc = 0;
  delim = (char *) "";
}


//------------------------------------------------------------------------------
// Constructor.
StringTokenizer::StringTokenizer(char *str, char *new_delim)
{
  org_string = new char[strlen(str)+1];
  cpy_string = new char[strlen(str)+1];
  strcpy(org_string, str);
  strcpy(cpy_string, str);
  curr_loc = 0;
  delim = new char[strlen(new_delim)+1];
  strcpy(delim, new_delim);
}


//------------------------------------------------------------------------------
// Destructor.
StringTokenizer::~StringTokenizer()
{
  delete org_string;
  delete cpy_string;
  if (delim) {
    delete delim;
  }
}


//------------------------------------------------------------------------------
// Start over.
void StringTokenizer::Restart()
{
  delete cpy_string;
  cpy_string = new char[strlen(org_string)+1];
  strcpy(cpy_string, org_string);
  curr_loc = 0;
}


//------------------------------------------------------------------------------
// Get the next token. A token is everything from the current location to the
// next occurance of any character in the delimiter. The location pointer is
// moved to the character following the delimiter.
char *StringTokenizer::GetToken()
{
  if (!HasMoreTokens()) {
    return NULL;
  }

  int tok_end, new_loc = -1;
  char *ret = NULL;

  for (tok_end = curr_loc; org_string[tok_end]; tok_end++) {
    if (strchr(delim, org_string[tok_end])) {
      for (new_loc = tok_end; org_string[new_loc]; new_loc++) {
	if (!strchr(delim, org_string[new_loc])) {
	  break;
	}
      }
      break;
    }
  }
  if (org_string[curr_loc] && (tok_end == curr_loc)) {
    curr_loc++;
    return GetToken(delim);
  }
  cpy_string[tok_end] = NULL;
  ret = &cpy_string[curr_loc];

  if (new_loc < 0) {
    new_loc = tok_end;
  }
  prev_loc = curr_loc;
  curr_loc = new_loc;
//   curr_loc = new_loc + 1;
//   if (!org_string[new_loc]) {
//     curr_loc--;
//   }

  return ret;
}

//------------------------------------------------------------------------------
// Get the next token and reset the delimiter.
char *StringTokenizer::GetToken(char *new_delim)
{
  char *tmp;
  tmp = new char[strlen(new_delim)+1];
  strcpy(tmp, new_delim);
  delete delim;
  delim = tmp;
  return GetToken();
}


//------------------------------------------------------------------------------
// Get the next token. The delimiter is treated as a single entity.
char *StringTokenizer::GetTokenExact()
{
  if (!HasMoreTokens()) {
    return NULL;
  }

  int new_loc, i, endpoint = -1;
  char *ret = NULL;
  int len = strlen(delim);
  for (new_loc = curr_loc; org_string[new_loc]; new_loc++) {
    if (org_string[new_loc] == delim[0]) {
      endpoint = new_loc;
      for (i = 1; i < len; i++) {
	if (org_string[++new_loc]) {
	  if (org_string[new_loc] != delim[i]) {
	    break;
	  }
	} else {
	  new_loc--;
	  break;
	}
      }
      if (i == len) {
	break;
      }
    }
  }
  if (org_string[curr_loc] && (new_loc == curr_loc)) {
    curr_loc++;
    return GetTokenExact(delim);
  }
  if (endpoint < 0) {
    endpoint = new_loc;
  }
  cpy_string[endpoint] = NULL;
  ret = &cpy_string[curr_loc];

  prev_loc = curr_loc;
  curr_loc = new_loc +1;
  if (!org_string[new_loc]) {
    curr_loc--;
  }

  return ret;
}


//------------------------------------------------------------------------------
// Get the next token and reset the delimiter.
char *StringTokenizer::GetTokenExact(char *new_delim)
{
  delete delim;
  delim = new char[strlen(new_delim)+1];
  strcpy(delim, new_delim);
  return GetTokenExact();
}


//------------------------------------------------------------------------------
// Put back the last token. Returns 1 if successful, 0 otherwise.
int StringTokenizer::PutToken()
{
  if (curr_loc == prev_loc) {
    return 0;
  }
  curr_loc = prev_loc;
  return 1;
}


//------------------------------------------------------------------------------
// Returns 1 if the location pointer is at the end of the string. Returns 0
// otherwise.
int StringTokenizer::HasMoreTokens()
{
  if (org_string[curr_loc] == NULL) {
    return 0;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Count the number of tokens, starting at a particular point.
int StringTokenizer::countTokens(int start)
{
  int cnt = 0;
  for (int i = start; org_string[i]; i++) {
    if (!strchr(delim, org_string[i])) {
      cnt++;
      for (i; org_string[i]; i++) {
	if (strchr(delim, org_string[i])) {
	  break;
	}
      }
    }
  }
  return cnt;
}


//------------------------------------------------------------------------------
// Count the number of tokens, using the delimiter as a single entity.
int StringTokenizer::countTokensExact(int start)
{
  int i, j, cnt = 0;
  int len = strlen(delim);
  for (i = start; org_string[i]; i++) {
    if (org_string[i] != delim[0]) {
      cnt++;
      for (i; org_string[i]; i++) {
	if (org_string[i] == delim[0]) {
	  for (j = 1; j < len; j++) {
	    if (org_string[++i]) {
	      if (org_string[i] != delim[j]) {
		break;
	      }
	    }
	  }
	  if (j == len) {
	    break;
	  }
	}
      }
    }
  }

  return cnt;
}

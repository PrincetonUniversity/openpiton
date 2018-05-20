// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: TverLine.H
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
//----------------------------------------------------------------------
// File                 :  TverLine.H
// Creation Date        :  Wed Jun  7 09:03:05 PDT 1995
// Description          :  Header file for TverLine class (utility class for
//			   TRE configuration search program)
// History              :  Enhanced with bug fixes (04/14/04)
//----------------------------------------------------------------------

#include <stdlib.h>
#include <iostream>
#include <ctype.h>
#include <Configsrch.H>

using namespace std;

//  Class TverLine provides a clean interface to the entries in a Tool
//  Release Engineering (TRE) Tool Version (.tver) file.  The purpose of
//  developing this class is to allow future development of more robust
//  handling of .tver file entries without needing to change programs
//  that use these entries (such as the configsrch program).

class TverLine {

  public:

    TverLine(void) { }

    //  Tue Jul 18 15:26:26 PDT 1995   Add copy constructor and operator=
    //  to support the "entrypoint backtracking" feature (see configsrch.C)

    TverLine(const TverLine& source) { Copy(source); }

    TverLine& operator=(const TverLine& source) {
	if (this != &source) Copy(source);
	return *this;
    }

    //  Method FirstChar() accesses the first non-whitespace char in the
    //  line.  If it is '#' the line is a comment.  If it is a null char,
    //  the line was probably empty - app should probably skip it.  Otherwise
    //  the first char of the line (and hence, of the tool or toolset name)
    //  is useful as a quick screening value.

    char FirstChar(void) { return (NameField != NULL) ? *NameField : '\0'; }

    //  Method IsGood() verifies three valid fields were found in the line.
    //  Since operator>> in processing lines read, initializes each of the
    //  three field pointers to NULL, this accessor simply tells whether or
    //  not that method found three distinct fields in the line just read.
    //  It will not have bothered to do this if the first non-whitespace
    //  char was the comment indicator ('#').

    int IsGood(void) {
	return ((NameField    != NULL) &&
		(EntryField   != NULL) &&
		(VersionField != NULL));
    }

    // Accessor functions
    char* GetName(void)    const { return NameField;    }
    char* GetEntry(void)   const { return EntryField;   }
    char* GetVersion(void) const { return VersionField; }

    const char* GetLine(void) const { return FileLine; }

  private:
    char  FileLine[MAXSIZE];

    void  Copy(const TverLine& source);
    char  LineBuffer[MAXSIZE];
    char* NameField;
    char* EntryField;
    char* VersionField;

  friend istream& operator>>(istream& is, TverLine& tLine);
};

// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: TreSearch.H
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
//----------------------------------------------------------------------
// File                 :  TreSearch.H
// Creation Date        :  Fri Jun  9 11:28:31 PDT 1995
// Description          :  Header file for TreSearch class (utility class for
//			   TRE configuration search program)
// History              :  Enhanced with bug fixes (04/14/04)
//----------------------------------------------------------------------

#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include <Configsrch.H>

//  Class TreSearch provides a clean interface to the environment variable
//  TRE_SEARCH, which stores a list of (possibly relative-path) .iver file
//  names.  Functionality of this class is that, upon construction from
//  a const char* parameter, an array of expanded .iver filenames and a
//  count of how many of these such names are in the array, are built.

class TreSearch {

  public:

    TreSearch(const char* envString);

    int NumIverFiles(void) { return numFilenames; }

    const char* operator[](int FileNum) const { return FilenameArray[FileNum]; }

  private:

    // CONSTRUCTOR
    TreSearch(const TreSearch& TS) { }

    // OVERLOAD '='
    TreSearch& operator=(const TreSearch& TS) { return *this; }

    //  Helper methods

    //  ->FirstWord()
    const char* FirstWord(void) {
	for (trakPtr = LineBf; isspace(*trakPtr); trakPtr++) ;
	MoveAndSetEndPtr();
	return trakPtr;
    }

    //  ->NextWord()
    const char* NextWord(void);

    //  ->MoveAndSetEndPtr()
    void MoveAndSetEndPtr(void);

    //  ->Expand()
    const char* Expand(const char* relativeIverFilNam);

    //  variables
    char  FilenameArray[MAXFILES][MAXNAMESIZE];
    int   numFilenames;
    char* trakPtr;
    char* endPtr;
    char  LineBf[MAXENVSIZE];
    char  expandBuf[MAXNAMESIZE];
};

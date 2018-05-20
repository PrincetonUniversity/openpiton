// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: TverLine.C
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
//----------------------------------------------------------------------
// File                 :  TverLine.C
// Creation Date        :  Fri Jun  9 10:36:04 PDT 1995
// Description          :  TverLine class operator>> implementation.
// History              :  Enhanced with bug fixes (04/14/04)
//----------------------------------------------------------------------

#include <string.h>
#include <stdio.h>
#include <TverLine.H>
#include <iostream>

using namespace std;

// define the read operator:  '>>' ...
istream& operator>>(istream& is, TverLine& tLine) {

    tLine.NameField = tLine.EntryField = tLine.VersionField = NULL;

    //  This usage of getline will stop reading at a '\n' char and replace
    //  it with a '\0' char

    is.getline(tLine.LineBuffer, MAXSIZE);
    strcpy(tLine.FileLine, tLine.LineBuffer);
    char* cptr;

    //  NAME FIELD ...
    //  NOTE multiple return points below, for convenience and robustness.

    //  First, skip any leading whitespace
    for (cptr = tLine.LineBuffer; (*cptr != '\0') && (isspace(*cptr)); cptr++) ;

    if (*cptr == '\0') return is;	// Premature null char!
    tLine.NameField = cptr;
    if (*cptr == '#') return is;        // Line is a comment.



    //  ENTRY FIELD ...
    //  Skip tool (or toolset) name, then terminate it

    for (cptr++; (*cptr != '\0') && (! isspace(*cptr)); cptr++) ;

    if (*cptr == '\0') return is;	// Premature null char!
    else *cptr = '\0';			// Terminate name field

    //  Skip whitespace

    for (cptr++; (*cptr != '\0') && (isspace(*cptr)); cptr++) ;

    if (*cptr == '\0') return is;       // Premature null char!
    tLine.EntryField = cptr;



    //  VERSION FIELD ...
    //  Skip Entry String then terminate it
    int isquote=0;

    for (cptr++; (*cptr != '\0') && (! isspace(*cptr)); cptr++) ;  // skip to first NULL OR SPACE position

    if (*cptr == '\0') return is;	//  Premature null char!
    else *cptr = '\0';			//  Terminate entry field

    //  Skip whitespace

    for (cptr++; (*cptr != '\0') && (isspace(*cptr)); cptr++) ;

    if (*cptr == '\0') return is;	//  Premature null char!
    tLine.VersionField = cptr;


    //  Skip to end of Version String then terminate it
    //for (cptr++; (*cptr != '\0') && (! isspace(*cptr)); cptr++) ; // skip to first NULL OR SPACE position

    // skip to NULL (or #) position (string may contain spaces...
    int k=0;
    for (cptr++; (*cptr != '\0') && (isquote || *cptr != '#'); cptr++) {

        //printf("[%02d]:  (QUOTE=%d)  %c\n", k++, isquote, *cptr);
        if (*cptr == '\'') isquote = (isquote == 0) ? 1 : 0;
    }

    // if found a comment string or EOL, backup the pointer over any spaces...
    if (*cptr == '#' || *cptr == '\0') {
       for ( ; isspace(*(cptr-1)); cptr--);      // cptr now points to last non-space char
    }
    *cptr = '\0';
    return is;
}

//  Tue Jul 18 15:26:26 PDT 1995  Implement Copy() private helper method for
//  copy-constructor and operator=, to support the "entrypoint backtracking"
//  feature (see configsrch.C)

void TverLine::Copy(const TverLine& source) {

    if (source.NameField == NULL) {
	NameField = NULL;
    } else {
	NameField = &(LineBuffer[source.NameField - source.LineBuffer]);
	strcpy(NameField, source.NameField);
    }
    if (source.EntryField == NULL) {
	EntryField = NULL;
    } else {
	EntryField = &(LineBuffer[source.EntryField - source.LineBuffer]);
	strcpy(EntryField, source.EntryField);
    }
    if (source.VersionField == NULL) {
	VersionField = NULL;
    } else {
	VersionField = &(LineBuffer[source.VersionField - source.LineBuffer]);
	strcpy(VersionField, source.VersionField);
    }
}

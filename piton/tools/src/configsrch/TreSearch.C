// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: TreSearch.C
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
// File                 :  TreSearch.C
// Creation Date        :  Fri Jun  9 11:28:31 PDT 1995
// Description          :  Implementations of the bigger TreSearch class methods
//                      :  These routines search the environment variable TRE_SEARCH
//                      :  for valid names of .iver files...
//------------------------------------------------------------------------------

#include <TreSearch.H>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

char* resolveFileName(char []);
extern char  PROGRAM[MAXSIZE];                    // program name


//  CONSTRUCTOR ...
TreSearch::TreSearch(const char* envString) : numFilenames(0) {
    // initialize the LineBf to all NULL chars...
    for (int i = 0; i < MAXNAMESIZE; i++) LineBf[i] = '\0';

    // copy the environment variable value to the LineBf
    strcpy(LineBf, envString);

    // read through each word in TRE_SEARCH, and store in the FilenameArray ...
    for (const char* chrPtr = FirstWord(); chrPtr; chrPtr= NextWord()) {
	*endPtr = '\0';
	strcpy(FilenameArray[numFilenames++], Expand(chrPtr));
    }
}

//  NextWord()  function:  return the pointer to the beginning of the next word in the string...
const char* TreSearch::NextWord(void) {
    // do nothing while incrementing the trakPtr value to the first non-NULL and non-space char...
    for (trakPtr = endPtr + 1; (*trakPtr != '\0') && (isspace(*trakPtr));
	trakPtr++) ;
    if (*trakPtr == '\0') return NULL;
    MoveAndSetEndPtr();
    return trakPtr;
}

//  MoveAndSetEndPtr()  function...
void TreSearch::MoveAndSetEndPtr(void) {
    for (endPtr = trakPtr + 1; (*endPtr != '\0') && (! isspace(*endPtr));
	endPtr++) ;
    if (*endPtr == '\0') {
	assert((endPtr - LineBf) < (MAXENVSIZE - 1));
	*(endPtr + 1) = '\0';
    }
}

//  Expand()  function...
const char* TreSearch::Expand(const char* relativeIverFilNam) {
    int   debug = 0;
    char* tmpPtr;
    char* tmp2Ptr;
    char  tmpBuf[MAXNAMESIZE];
    int   strlen;

    if ((tmpPtr = (char*) getenv("CONFIGSRCHDEBUG")) != NULL) debug=atoi(tmpPtr);

    if (debug>1) fprintf(stderr,"\nTRESEARCH:: PARSING TRE_SEARCH IVER PATH:  %s\n", relativeIverFilNam);

    if ((tmpPtr = resolveFileName( (char*) relativeIverFilNam )) == NULL ) {
       fprintf(stdout,"%s-ERROR:  Couldn't resolve the TRE_SEARCH pathname:  \"%s\".\n", PROGRAM, relativeIverFilNam);
       exit(1);
    }
    else {
       if (debug>1) fprintf(stderr,"TRESEARCH::Expand::  tmpPtr = %s\n", (!tmpPtr) ? "NULL" : tmpPtr);
    }

    if (debug>1) fprintf(stderr,"TRESEARCH[A]: RESOLVED FILENAME:  %s\n", tmpPtr);
    strcpy(expandBuf, tmpPtr);

    if (debug>1) fprintf(stderr,"TRESEARCH[B]: EXPANDED IVER PATH:  \"%s\"\n", expandBuf);
    return expandBuf;
}




//---------------------------------------------------------------------------
// 
//  resolveFileName()
//
//  This function is to scan the TVerFileName and expand if it contains
//  env var, which starts with '$'.
// 
//---------------------------------------------------------------------------
#include <assert.h>
#include <stdlib.h>

char* resolveFileName( char FileName[] )
{
   char* tmpPtr;
   char* str;
   char* pbrk;
   int   debug = 0;
   if ((tmpPtr = (char*) getenv("CONFIGSRCHDEBUG")) != NULL) debug=atoi(tmpPtr);

   static char  retStr[MAXSIZE];
   char  tmpStr[MAXSIZE];

   if (debug>1) fprintf(stderr,"\n    +[resolveFileName]:  \"%s\"\n", FileName);

   //
   // Pre-process the filename, by resolving leading "~", "./" and "~name" strings...
   //

   // First, match pattern: "./foo/blue" ...
   if (FileName[0] == '.' && FileName[1] == '/') {

      // Use (char *) getcwd() in place of getenv("PWD").  The latter is unreliable...
      assert((tmpPtr = (char*) ( getcwd(retStr,MAXSIZE-1) )) != NULL);
      strcpy(retStr, tmpPtr);

      // Find the LEFT-MOST '/' char...
      //if (pbrk = strpbrk(FileName, "/")) {

         assert((tmpPtr = (char *) strchr(FileName,'/')) != NULL);
         strcat(retStr, tmpPtr);

      //}
      //else {
      //   strcpy(retStr, FileName);
      //}
   }

   // Else, resolve any initial occurences of '~'
   //else if ((FileName[0] == '~' && FileName[1] == '/') || strncmp( FileName, "$HOME",5 )==0) {        //}
   else if (FileName[0] == '~' && FileName[1] == '/') {

      // get the ptr to first char of the $HOME environment string...
      assert((tmpPtr = (char*) ( getenv("HOME"))) != NULL);

      // copy the $HOME environment string into expandBuf...
      strcpy(retStr, tmpPtr);

      // set the tmpPtr to the '/' char in the FileName...
      assert((tmpPtr = (char *) strchr(FileName,'/')) != NULL);
      strcat(retStr, tmpPtr);
   }

   //  match pattern "~name/foo" ...
   else if (FileName[0] == '~' && FileName[1] != '/') {

      // get the ptr to first char after the "~"
      assert((tmpPtr = (char *) strchr(FileName,'~')) != NULL);
      tmpPtr++;

      // replace the "~" with "/home/", and copy the remaining path into buf...
      strcpy(retStr, "/home/");
      strcat(retStr, tmpPtr);
   }
   else {
      strcpy(retStr, FileName);
   }

   if (debug>1) fprintf(stderr,"    +[resolveFileName]:  retStr=\"%s\"\n", retStr);


   //
   //  Now that the preprocessing is done, search for environment variables in the pathname...
   //
   int   token=0;
   int   strlen;
   char* envStr;
   char  newBuf[MAXSIZE];
   //strcpy(newBuf, FileName);
   strcpy(newBuf, retStr);
   if (debug>1) fprintf(stderr,"    +[resolveFileName]:  retStr=\"%s\"\n", retStr);

   // tmpStr will store the environment variable string...
   strcpy(tmpStr, "");
   strcpy(retStr, "");

   // get pointer to first '$' char...
   if (pbrk = strpbrk(newBuf, "$")) {

      tmpPtr=newBuf;

      do {
         strlen = pbrk - tmpPtr;
         strncat(retStr, tmpPtr, strlen);
         if (debug>1) fprintf(stderr,"    +[resolveFileName]:  strlen=%d,  pbrk=%s,  retStr=\"%s\"\n", strlen, pbrk, retStr);

         tmpPtr = pbrk+1;
         // if the variable is enclosed in curly braces ({ENVDIR}) step over the first curly...
         if ( tmpPtr[0] == '{' ) tmpPtr++;

         // get the number of chars until one of [.,-/] chars...
         int envlen = strcspn(tmpPtr, ".,-/$}");
         char* envEndPtr = tmpPtr+envlen;
         if ( envEndPtr[0] == '}' ) envEndPtr++;
         strncpy(tmpStr, tmpPtr, envlen);
         tmpStr[envlen] = '\0';

         if (debug>1)    fprintf(stderr,"    +[resolveFileName]:  envlen=%d, envEndPtr=%s, tmpStr=%s, retStr=%s\n",
                            envlen, envEndPtr, tmpStr, retStr);

         if ( envStr = getenv(tmpStr) ) {
            if (debug>1) fprintf(stderr,"    +[resolveFileName]:  envStr=%s\n", envStr);

            strcat(retStr, envStr);
            if (debug>1) fprintf(stderr,"    +[resolveFileName]:  retStr=%s\n", retStr);

            //if (envEndPtr[0] != '\0') strcat(retStr, envEndPtr);
            //if (debug>1) fprintf(stderr,"    +[resolveFileName]:  envEndPtr=%s, retStr=%s\n", envEndPtr, retStr);
         }
         else {
            fprintf(stderr,"%s-ERROR:  Undefined environment variable \"%s\" in filename \"%s\".\n",
               PROGRAM, tmpStr, FileName);
            if (debug>1) fprintf(stderr,"    +[resolveFileName]:   returning NULL\n");
            return NULL;
         }

         tmpPtr = envEndPtr;
         if (debug>1) fprintf(stderr,"    +[resolveFileName:  tmpPtr=%s,  tmpStr=%s,  retStr=%s\n", tmpPtr, tmpStr, retStr);

      } while (pbrk = strpbrk(tmpPtr, "$"));

      // tack on any remaining chars at the end of the string (if string ended in $VAR, tmpPtr=="")
      strcat(retStr, tmpPtr);
      if (debug>1) fprintf(stderr,"    +[resolveFileName:  tmpPtr=%s,  retStr=%s\n", tmpPtr, retStr);

   }
   else {
      strcpy(retStr, newBuf);
   }


   if (debug>1) fprintf(stderr,   "    +[resolveFileName]:  returning \"%s\"\n", retStr);

   if ( retStr == "" ) {
      fprintf(stderr,"%s-ERROR: resolveFileName FAILED:  retStr=\"%s\"\n", PROGRAM, retStr);
   }
   return (retStr);
}


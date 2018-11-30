// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: configsrch.C
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
// File                 :  configsrch++.C
// Creation Date        :  Apr 13 13:47:01 PDT 2004
// Description          :  TRE Configuration search program:  Given a tool
//                           (or toolset) name, and a control entry point,
//                           return the version, as specified in the TRE
//                           configuration.
//
// Input:
//      Environment Vars:  $TRE_SEARCH  -  (mandatory) list of iver file paths.
//                         $TRE_ENTRY   -  (optional)  default entry point for the lookup
//      Parameters:        <name>       -  (mandatory) name of entity to search for
//                         <entry>      -  (optional)  table entry point (overrides $TRE_ENTRY)
//
// Output:  
//      version number     - version of the <name> found in the tre tables, or
//                           configsrch-ERROR:  error finding version for <foobootoo> </>
//---------------------------------------------------------------------------

#include <fstream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#include <Configsrch.H>
#include <TreSearch.H>
#include <TverLine.H>
#include <cCollection.H>

// using namespace std;

#ifndef DATE
#define DATE ""
#endif

//int             getopt(int argc, char* const argv[], const char* optstring);
extern char*    optarg;
extern int      optind, opterr, optopt;

char  PROGRAM[MAXSIZE];                    // program name
char  TRE_ENTRY[MAXSIZE];                  // holder for $TRE_ENTRY
char  tool_name[MAXSIZE];                  // holder for tool/toolset name

char* TRE_SEARCH;
char* HOME;
char* USER;
int debug = 0;

char  retStr[MAXSIZE];
char  tmpStr[MAXSIZE];

extern char* resolveFileName( char [] );
char* ParseTreEntry( const char* );

char  version[]     = "2.3";
char  date[]        = DATE;
static int version_found = FALSE;

inline void pr_usage(int rv=1) {
    fprintf(stderr, "\a%s %s (%s)\n", PROGRAM, version, date);
    fprintf(stderr,   "Usage:  %s [options] <tool_name> [<entry>]\n", PROGRAM);
    fprintf(stderr,   "           options:  -all  --  list all (duplicate) versions of <tool_name>\n");
    fprintf(stderr,   "                     -list --  list tver filepath that matched <tool_name>\n");
    fprintf(stderr,   "                     -ver  --  print current version of configsrch\n");
    fprintf(stderr,   "                     -h    --  list this help output\n");
    exit(rv);
}

inline void fatal(const char *s)
{
    fprintf(stderr, "%s-ERROR:  %s\n", PROGRAM, s);
    exit(1);
}



//---------------------------------------------------------------------------
// Main()
//---------------------------------------------------------------------------
int main (int argc, char* argv[]) {
   char* tmpPtr;
   char* envp;
   char* tverName;
   char* pbrk;
   char  tmpTver[MAXSIZE];

   int showall=0;
   int showdup=0;
   int listtverfile=0;

   //  set the debug flag, if found...
   if ((envp = (char*) getenv("CONFIGSRCHDEBUG")) != NULL) debug=atoi(envp);

   //  query environment variables
   if ((envp = (char*) getenv("TRE_ENTRY")) == NULL) {
       strcpy(TRE_ENTRY, "/");
   } else if ( strcmp(envp, "") == 0 ) {
       strcpy(TRE_ENTRY, "/");
   } else {
       strcpy(TRE_ENTRY, envp);
   }

   TRE_SEARCH = getenv("TRE_SEARCH");
   USER       = getenv("USER");
   HOME       = getenv("HOME");

   // what is my PROGRAM name???
   if (tmpPtr = (char *) strrchr(argv[0],'/')) {
      strcpy(PROGRAM,tmpPtr+1);
   } else {
      strcpy(PROGRAM,argv[0]);
   }

   //  look at configsrch arguments...
   char* arg;
   int errflg=0;
   int optind=1;
   int i;
   for (i = 1; i < argc; i++) {
       arg = argv[i];                   // set ptr arg to the first argument
       if (arg[0] == '-') {
           optind++;
           arg++;
           if ( strcmp(arg, "v")==0 ||
                strcmp(arg, "ve")==0 ||
                strcmp(arg, "ver")==0 ) {

              cout << "configsrch version " << version << endl;
              exit(0);
           }
           else if ( strcmp(arg, "a")==0 ||
                     strcmp(arg, "al")==0 ||
                     strcmp(arg, "all")==0 ) {

              showdup=1;
              listtverfile=1;
           }
           else if ( strcmp(arg, "h")==0 ) {
              pr_usage(0);
           }
           else if ( strcmp(arg, "l")==0 ||
                     strcmp(arg, "li")==0 ||
                     strcmp(arg, "lis")==0 ||
                     strcmp(arg, "list")==0 ) {

              listtverfile=1;
           }
           else {
              fprintf(stderr, "Unrecognized option: -%s\n", arg);
              errflg++;
           }
       }
   }
   if (errflg) pr_usage(2);


   //for ( ; optind < argc; optind++) {
   //    if (access(argv[optind], R_OK)) {
   //    }
   //}

   //if (debug>0) {
   //    fprintf(stderr,"GETOPT:  optind = %d\n", optind);
   //    fprintf(stderr,"GETOPT:  argc   = %d\n", argc);
   //}

   if(debug>1) fprintf(stderr,"argc = %d; optind = %d\n", argc, optind);

   // now assign the positional parameters:  <name> <entry> ...
   // Check the number of parameters (must be either 1 or 2 args)
   if ( (argc-optind) != 1 && (argc-optind) != 2) pr_usage(1);

   // assign the tool_name
   strcpy(tool_name, argv[optind]);

   //  the TRE_ENTRY is optional.  If given on the commandline, then
   //  it overrides any setting from the environment.
   //  if not defined in the environment, then error.
   if ((argc-optind) == 2)  strcpy(TRE_ENTRY, argv[optind+1]);
   
   if (TRE_ENTRY[0] != '/') {
      fatal("The TRE_ENTRY value must begin with '/'.");
   }

   //  check that TRE_SEARCH has valid values
   if ((envp = (char*) getenv("TRE_SEARCH")) == NULL) {
      fatal("The TRE_SEARCH environment variable is undefined.");
   }
   else if ( strcmp(envp,"") == 0 ) {
      fatal("The TRE_SEARCH environment variable is empty.");
   }

   // Look for some typical bad delimiters in TRE_SEARCH:  ":" or "," ...
   // ## remove the comma test from this test:  breaks check on flows in /import/datools/release/flows/*,vers/...
   // if ((pbrk = strpbrk(TRE_SEARCH, ":,")) != NULL) {
   if ((pbrk = strpbrk(TRE_SEARCH, ":")) != NULL) {
      strncpy(tmpStr,pbrk,1);
      char str[256];
      sprintf(str, "The TRE_SEARCH environment has a BAD DELIMITER:  \"%s\".", tmpStr);
      fatal(str);
   }


   if (debug) {
      fprintf(stderr,"\nPROGRAM:  %s\n", PROGRAM);
      fprintf(stderr,"\tTRE_SEARCH = %s\n", TRE_SEARCH);
      fprintf(stderr,"\tTRE_ENTRY  = %s\n", TRE_ENTRY );
      fprintf(stderr,"\tHOME       = %s\n", HOME );
      fprintf(stderr,"\tUSER       = %s\n", USER );
      fprintf(stderr,"\tTOOLNAME   = %s\n", tool_name);
      //if (optind)       fprintf(stderr,"GETOPT optind=%d\n", optind);
      //if (opterr)       fprintf(stderr,"GETOPT opterr=%d\n", opterr);
      //if (showall)      fprintf(stderr,"OPTION SHOWALL      =%d\n", showall);
      //if (showdup)      fprintf(stderr,"OPTION SHOWDUP      =%d\n", showdup);
      //if (listtverfile) fprintf(stderr,"OPTION LISTTVERFILES=%d\n", listtverfile);
      fprintf(stderr,"\tDEBUG      = %d\n", debug);
      fprintf(stderr,"\n");
   }

   //
   //
   //  END OF COMMAND PARSING...
   //
   //


   //
   //  ## what we need to do here...
   //
   //  repeat until TRE_ENTRY == "/", or match:
   //  {
   //     foreach iver filename from $TRE_SEARCH
   //     {
   //        remember iver filename 
   //        fatal if tver filename not found
   //        open each tver file
   //           read each line looking for <tool_name> <tre_entry>
   //           quit if found
   //           store in list if <tool_name> matches
   //
   //     }
   //     strip tailing path from TRE_ENTRY
   //  }
   //


   //
   //  Construct a TreSearch object from the pointer to $TRE_SEARCH
   //
   TreSearch IverFiles(TRE_SEARCH);



   //
   //  Initialize success flag, used to gracefully control loops and
   //  to indicate whether the end result is success or not.
   //

   //
   //  Main Loop: For each .iver file name found in $TRE_SEARCH, ...
   //
   if (debug>0) fprintf(stderr, "\n\nNUM IVER FILES = %d\n", IverFiles.NumIverFiles());

   for (i = 0; i < IverFiles.NumIverFiles(); i++) {
      if (debug>0) fprintf(stderr,"IVER file [%d] == %s\n", i, IverFiles[i]);
   }

   char* currentTreEntry;
   do {
      currentTreEntry = ParseTreEntry(TRE_ENTRY);
      //cCollection<TverLine*> toolLines;

      for (int i = 0; i < IverFiles.NumIverFiles(); i++) {
   
         //  The flexibility of TRE is implemented by allowing a local .iver
         //  file to be present, and if so, to pick it up and use it to point
         //  to special .tver files.  For this reason, the existence of any
         //  particular .iver file is intended to be optional.
   
         if (debug>0) fprintf(stderr," Scanning IVER file %s\n", IverFiles[i]);
   
         ifstream curIverFile(IverFiles[i]);
         if (! curIverFile) {
            if (debug>0) fprintf(stderr," -- curIverFile %s == NULL:  continue...\n", IverFiles[i]);
            continue;
         }
   
         //  Secondary Loop:  For each .tver file listed in the .iver file...
   
         while (curIverFile.good()) {
   
            ws(curIverFile);
            if (curIverFile.peek() == EOF) break;
            char TverName[MAXSIZE];
   
            // read the next space-separated string of chars...
            curIverFile >> TverName;
   
   
   
            //  ignore comment lines
            if (TverName[0] == '#') {
               // read to end of this line
               // This fixes Metrax #44745 (HFB:  03/18/03)
               curIverFile.getline( TverName, MAXSIZE );
               continue;                                    
            }
            if (debug>0) fprintf(stderr," -- CHECKING[A] TVER file %s\n", TverName);
   
            // get the fully resolved and expanded filename...
            tverName = resolveFileName(TverName);
            if (debug>1) fprintf(stderr,"    :  (%s) => \"%s\"\n", TverName, tverName);
   
            if (!tverName || tverName == "") {
               fprintf(stderr,"%s-ERROR:  Error parsing iver file \"%s\".\n", PROGRAM,IverFiles[i]);
               exit(1);
            }
   
            if (debug>1) {
               fprintf(stderr,   "    : returned \"%s%s\"\n",  PROGRAM, tverName);
               if ( tverName != "" && access( tverName, R_OK ) != 0 )
                  fprintf(stderr,"    :  File \"%s%s\" read access error:  %s\n", PROGRAM, tverName, strerror(errno));
               if ( tverName != "" && access( tverName, F_OK ) != 0 )
                  fprintf(stderr,"    :  File \"%s%s\" existance access error:  %s\n", PROGRAM, tverName, strerror(errno));
               fprintf(stderr,   "    : tverName=\"%s%s\"\n", PROGRAM, tverName);
            }
   
            // initialize a collection of TverLine object pointers...
            cCollection<TverLine*> toolLines;

            // open the IO Stream (ifstream) curTverFile (handle) for file "tverName"...
            strcpy(tmpTver, tverName);
            ifstream curTverFile(tmpTver);
   
            if (debug>1) fprintf(stderr,"%s   :[B] tverName=\"%s\",  tmpTver=\"%s\"\n", PROGRAM, tverName, tmpTver);
   
            if ( !curTverFile ) {
   
               if (debug>2) {
                  fprintf(stderr,"%s-DEBUG:  [C] tverName=\"%s\"\n", PROGRAM, tverName);

                  if ( tverName != "" && access( tverName, R_OK ) != 0 )
                     fprintf(stderr,"%s-DEBUG:  File \"%s\" read access error:  %s\n", PROGRAM, tverName, strerror(errno));

                  if ( tverName != "" && access( tverName, F_OK ) != 0 )
                     fprintf(stderr,"%s-DEBUG:  File \"%s\" existance access error:  %s\n", PROGRAM, tverName, strerror(errno));
   
                  fprintf(stderr, "%s-DEBUG:  ifstream failed to open the tver file \"%s\":  %s\n",
                     PROGRAM, tverName, errno ? strerror(errno) : "NULL");
               }
   
               fprintf(stderr,"%s-ERROR:  Error opening the tver file \"%s\": %s.\n", PROGRAM,tverName,strerror(errno));
               exit(1);
            }
   
            //  Innermost Loop:  For each line in the .tver file, screen it
            //  based on it's first non-blank char.  If it's a possible match,
            //  then just compare the two keys.  If they match, we're done!
            //
            //  Tue Jul 18 15:26:26 PDT 1995  Implement the "entrypoint
            //  backtracking" feature, which requires that we save all tver
            //  lines with matching tool name.  The match on the entry-point
            //  field, then is not required to be exact.  The first choice is
            //  an exact match, but as long as the value includes a
            //  subdirectory, a new value formed by deleting that subdirectory
            //  name is a match candidate until only "/" remains.
   
            for (int j = 1; curTverFile.good(); j++) {
               if (curTverFile.peek() == EOF) break;
               TverLine TLine;
               curTverFile >> TLine;
   
               if ((! TLine.FirstChar()) || (TLine.FirstChar() == '#'))
                   continue;
               if (! TLine.IsGood()) {
                  fprintf(stderr,"%s-ERROR:  Found bad line (%d) in tver file (%s).  Skipping.\n", PROGRAM,j,tverName);
                  exit(1);
               }
   
               if (debug>1) fprintf(stderr,"    %s: line %02d:  %s\n", tverName, j, TLine.GetLine()); 
   
               if (tool_name[0] == TLine.FirstChar()) {
                  if ( strcmp(TLine.GetName(),tool_name)==0 ) {
   
                     //  tool name matches, so copy this line and add a
                     //  pointer to the copy to the collection
   
                     TverLine* tmpLine = new TverLine(TLine);
                     toolLines.AddElem(tmpLine);
                  }
               }
   
               // !! These lines were found by Paul Fornari, and when deleted
               // !! removes the alpha-sorted prerequisite for the tver files.
               // !! (HFB:  03/13/03)
               //else if ((unsigned)TLine.FirstChar() > (unsigned)tool_name[0])
               //    break;
   
               //if (debug>0) fprintf(stderr,"TVER LINE=%s\n", TLine.GetName() );
   
            }  // end "for each line of this tver file"
   
   
            // now scan all the lines in the tver file (stored in (cCollections) toolLines (array)...
            for (int i = 0; i < toolLines.Length(); i++) {
               if (! strcmp (toolLines[i]->GetEntry(), currentTreEntry)) {
                  version_found = TRUE;

                  if (listtverfile)
                     cout << tool_name << "  " ;

                  cout << toolLines[i]->GetVersion();

                  if (listtverfile)
                     cout << "  " << tverName ;

                  cout << endl;
   
                  if (!showdup) return(0);  // DONE!
               }
            }
         }  
      }  
   } while ( strcmp(currentTreEntry, "/") != 0 && !version_found );



   //if(debug>0) fprintf(stderr,"FINAL TRE ENTRY = %s\n", currentTreEntry);

   if (! version_found) {
        fprintf(stderr,"%s-ERROR:  error finding version for <%s> <%s>.\n",
           PROGRAM, tool_name, TRE_ENTRY);
        //cerr << argv[0] << ": error finding version for <" << tool_name <<
        //    "> <" << TRE_ENTRY << ">" << endl;
        exit(1);
   }

   return 0;                // Success!
}


//=========================  subroutines ====================================
//---------------------------------------------------------------------------
//
//  ParseTreEntry()
//
//  The following function accepts a character string that is a TRE_ENTRY
//  value.  It parses the TRE_ENTRY value by successively stripping off the
//  trailing "subdir" component of the path, and returning the "dirname"
//  component.  The routine remembers what was parsed the previous time, 
//  and re-uses the previously parsed string on successive calls.
//  E.g.  if TRE_ENTRY == /foo/boo/shoo, ParseTreEntry will return as follows:
//
//  ParseTreEntry( *entryString )  ==>  "/foo/boo/shoo"
//  ParseTreEntry( *entryString )  ==>  "/foo/boo"
//  ParseTreEntry( *entryString )  ==>  "/foo"
//  ParseTreEntry( *entryString )  ==>  "/"
//
//---------------------------------------------------------------------------
char* ParseTreEntry(const char* passedString)
{
    static int  treTimes;
    static char entryString[MAXSIZE];        // for local copy of passed string
    size_t len = strlen( entryString );

    if (len == 0) {
       treTimes=1;
       strcpy(entryString, passedString);
       if (debug>0) fprintf(stderr,"\n[parseTreEntry]:  SEARCH TRE_ENTRY=%s\n", entryString);
       return(entryString);
    }

    if (! strcmp(entryString, "/")) return(NULL); // also done, but not successfully!

    // lastSlash is a pointer to the last '/' char in the string...
    char* lastSlash = (char *) strrchr(entryString, '/');
    if (lastSlash == NULL) {
        fprintf(stderr,"ERROR:  Invalid TRE_ENTRY value <%s>.\n", entryString);
        exit(1);
    }
    int newLength = lastSlash - entryString;

    if (newLength == 0) {
        *(lastSlash+1) = '\0';
    }
    else {
        *lastSlash = '\0';
    }
    treTimes++;
    if (debug>0) fprintf(stderr,"\n[parseTreEntry]:  (%d) PERMUTE TRE_ENTRY=%s\n", treTimes, entryString);
    return(entryString);
}


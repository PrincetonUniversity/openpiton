// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: goldfinger.c
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


/*
 * goldfinger.c
 *
 * main routine
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "tsb.h"
#include "tsb_link.h"
#include "gf_error.h"
#include "vector.h"
#include "app.h"
#include "physmap.h"
#include "split.h"
#include "block.h"


extern int yyparse(void); /* parser */
extern FILE *yyin;        /* input stream for input file */

char *startdir;
#define MAX_DIR_SIZE 1024

#ifndef VERSION
# define VERSION "0.00"
#endif

typedef struct cmdline_args_s {
  char *in;
  char *splitsec;
  char *destdir;
  char *srcdir;


  char *imagefile;
  char *symtabfile;
  char *midasfile;

  int genimage;
  int gensymtab;
  int gentsbs;

  int debug;        /* Enable debug mode */
  int nooutput;

} cmdline_args_t;


static void process_cmdline(int argc, char *argv[], cmdline_args_t *args);
static void usage(int status, char *fmt, ...);

static void init_image_file_data_structures(void);
static void finish_image_file_init(void);

static void process_goldfinger_file(cmdline_args_t *args);

/******************************************************************************
 *
 * main(argc, argv)
 * 
 * Main routine.  Process command-line and act accdordingly.
 * 
 *****************************************************************************/


int
main(int argc, char *argv[]) {
  cmdline_args_t args;

  if(!(startdir = getcwd(NULL, MAX_DIR_SIZE))) {
    gf_error(M_FILE, "Cannot get cwd.: %s\n", strerror(errno));
  }

  process_cmdline(argc, argv, &args);

  gf_say(VERBOSE_DEBUG, "CWD is '%s'\n", startdir);

  if(args.splitsec) {
    splitsec(args.splitsec, args.destdir, args.midasfile);
  }

  if(args.in) {
    process_goldfinger_file(&args);
  }



  return 0;
}

/******************************************************************************
 *
 * process_goldfinger_file(args)
 * 
 * User specified a goldfinger file (for linked-executable
 * operations).  Parse it, and do what the args say to do.
 * 
 *****************************************************************************/

static void
process_goldfinger_file(cmdline_args_t *args) {
  process_app_args_t process_args;
  FILE *ifh = NULL;
      
  if(args->in) {
    Srcfile = strdup(args->in);
    if(!strcmp(args->in, "-")) {
      yyin = stdin;
    } else {
      gf_say(VERBOSE_NORMAL, "Opening file '%s' for input.\n", Srcfile);
      if(!(ifh = fopen(Srcfile, "r"))) {
	gf_error(M_FILE, "Error opening '%s' for input: %s\n",
		 Srcfile, strerror(errno));
      }
      yyin = ifh;
    }
  }


  if(args->srcdir) {
    if(chdir(args->srcdir)) {
      gf_error(M_FILE, "Can't cd to '%s': %s\n",
		   args->srcdir, strerror(errno));
    }
  }


  init_image_file_data_structures();

  yyparse();  

  if(ifh) {
    fclose(ifh);
  }

  finish_image_file_init();

  if(args->debug) {
    print_vector(&App_vector);
  }

  process_args.genimage  = args->genimage;
  process_args.image_fh  = stdout;

  if(args->imagefile) {
    if(!(process_args.image_fh = fopen(args->imagefile, "w"))) {
      gf_error(M_FILE, "Error opening '%s' for writing: %s\n",
	       args->imagefile, strerror(errno));
    }
  }

  /* calculates sizes of everything.  If genimage is set, writes the
     data portion of the mem.image */
  process_app_elf_files(&process_args);

  /* now append TSB info, if gentsbs is set */
  if(args->gentsbs) {
    
    add_apps_to_tsbs();

    add_apps_to_tsbcsms();

    fprintf(process_args.image_fh, "\n\n// MMU IMAGE\n\n");
    write_tsbs(process_args.image_fh);

    write_tsb_links(process_args.image_fh);

    write_tsbcsms(process_args.image_fh);

    write_tsbcsm_links(process_args.image_fh);

  }

  if(args->gensymtab) {
    FILE *symtab_fh = stdout;

    if(args->symtabfile) {
      if(!(symtab_fh = fopen(args->symtabfile, "w"))) {
	gf_error(M_FILE, "Error opening '%s' for writing: %s\n",
		 args->symtabfile, strerror(errno));
      }
    }

    print_symtab(symtab_fh);

  }


  if(args->debug) {
    print_vector(&App_vector);
    print_vector(&Tsb_vector);
    print_vector(&Tsb_link_vector);
  }

}


/******************************************************************************
 *
 * init_image_file_data_structures()
 * 
 * Initialize structures that will be used in dealing with goldfinger files.
 * 
 *****************************************************************************/

static void
init_image_file_data_structures(void) {
  clear_app_vector();
  init_physmap(&Physmap);
  clear_tsb_vector();
  clear_tsb_link_vector();
  clear_tsbcsm_vector();
  clear_tsbcsm_link_vector();


}

/******************************************************************************
 *
 * finish_image_file_init()
 * 
 * After image file is parsed and all objects are created, hook up pointers.
 * 
 *****************************************************************************/

static void
finish_image_file_init(void) {
  finish_app_init();

  finish_tsb_init();

  finish_tsb_link_init();

  finish_tsbcsm_init();

  finish_tsbcsm_link_init();


}


/******************************************************************************
 *
 * process_cmdline(argc, argv, args)
 * 
 * Process the command line and fill up *args with values.
 * 
 *****************************************************************************/


static void
process_cmdline(int argc, char *argv[], cmdline_args_t *args) {
  argc--; argv++;


  args->destdir     = NULL;
  args->srcdir      = NULL;

  args->in   = NULL;
  args->imagefile    = NULL;
  args->symtabfile   = NULL;
  args->midasfile    = NULL;
  args->gentsbs      = 0;
  args->genimage    = 0;
  args->gensymtab   = 0;
  args->splitsec     = NULL;
  args->debug       = 0;
  args->nooutput    = 0;

  while(argc) {
    if(!strcmp(*argv, "-destdir")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG, "Option -destdir must have an argument!\n");
      }
      args->destdir = strdup(*argv);
    } else if(!strcmp(*argv, "-srcdir")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG, "Option -srcdir must have an argument!\n");
      }
      args->srcdir = strdup(*argv);

    } else if(!strcmp(*argv, "-in")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG,
		 "Option -in must have an argument!\n");
      }
      args->in = strdup(*argv);
    } else if(!strcmp(*argv, "-imagefile")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG,
		 "Option -imagefile must have an argument!\n");
      }
      args->imagefile = strdup(*argv);
    } else if(!strcmp(*argv, "-symtabfile")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG,
		 "Option -symtabfile must have an argument!\n");
      }
      args->symtabfile = strdup(*argv);
    } else if(!strcmp(*argv, "-prefix")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG, "Option -prefix must have an argument!\n");
      }
      Prefix = strdup(*argv);
    } else if(!strcmp(*argv, "-noprint_errors") ||
              !strcmp(*argv, "-NOPRINT_ERRORS")) {
      disable_error_print(); 
    } else if(!strcmp(*argv, "-allow_duplicate_tags")) {
      disable_dup_tags_error();
    } else if(!strcmp(*argv, "-gentsbs")) {
      args->gentsbs = 1;
    } else if(!strcmp(*argv, "-genimage")) {
      args->genimage = 1;
    } else if(!strcmp(*argv, "-gensymtab")) {
      args->gensymtab = 1;
    } else if(!strcmp(*argv, "-splitsec")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG, "Option -splitsec must have an argument!\n");
      }
      args->splitsec = strdup(*argv);
    } else if(!strcmp(*argv, "-midasfile")) {
      argc--; argv++;
      if(!argc) {
        gf_error(M_GOLDFINGERARG,
		 "Option -midasfile must have an argument!\n");
      }
      args->midasfile = strdup(*argv);
    } else if(!strcmp(*argv, "-debug") || !strcmp(*argv, "-d") ) {
      args->debug = 1;
      set_verbose_level(VERBOSE_DEBUG);
    } else if(!strcmp(*argv, "-verbose") || !strcmp(*argv, "-v") ) {
      set_verbose_level(VERBOSE_CHATTY);
    } else if(!strcmp(*argv, "-silent")) {
      set_verbose_level(VERBOSE_SILENT);
    } else if(!strcmp(*argv, "-version")) {
      printf("%s\n", VERSION);
      exit(0);
    } else if(!strcmp(*argv, "-nocompress")) {
      Suppress_zero = 0;
      Compress = 0;
    } else if(!strcmp(*argv, "-noenvzero")) {
      EnvZero = 0;
    } else if(!strcmp(*argv, "-allow_tsb_conflicts")) {
      Allow_tsb_conflicts = 1;
    } else if(!strcmp(*argv, "-nooutput") || !strcmp(*argv, "-n") ) {
      args->nooutput = 1;
    } else if(!strcmp(*argv, "-help") || !strcmp(*argv, "-h") ) {
      usage(M_NOERROR, "Help\n");
    } else {
      usage(M_GOLDFINGERARG, "Unrecognized option '%s'!\n", *argv);
    }

    argc--; argv++;
  }
  
}

/******************************************************************************
 *
 * usage(status, fmt, ...)
 * 
 * Do a printf on fmt and args.  Then exit with the specified status.
 * 
 *****************************************************************************/

static void 
usage(int status, char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  fprintf(stderr, "goldfinger: "/*, status*/);
  vfprintf(stderr, fmt, ap);
  va_end(ap);

  fprintf(stderr, "Usage: goldfinger [options]\n");

  fprintf(stderr, "\n");
  fprintf(stderr, "See man page for full details.\n");
  fprintf(stderr, "\n");
  fprintf(stderr, "Global options:\n");
  fprintf(stderr, "\n");
  fprintf(stderr,
	  "-h                    Print this message.\n");
  fprintf(stderr,
	  "-version              Print version number and exit.\n");
  fprintf(stderr,
	  "-v or -verbose        Be chatty.\n");
  fprintf(stderr,
	  "-d or -debug          Be very chatty.\n");
  fprintf(stderr,
	  "-silent               Say nothing unless there's an error.\n");
  fprintf(stderr,
	  "-noprint_errors       Suppress error messages.\n");
  fprintf(stderr,
	  "-prefix <str>         Prepend to normal output lines.\n");
  fprintf(stderr,
	  "-destdir <dir>        Generate files here.\n");
  fprintf(stderr,
	  "-srcdir <dir>         Look for source files here.\n");
  fprintf(stderr,
	  "\n");
  fprintf(stderr,
	  "Section splitting options:\n");
  fprintf(stderr,
	  "\n");
  fprintf(stderr,
	  "-splitsec <file>      Split file into section .s files.\n");
  fprintf(stderr,
	  "-midasfile <file>     Write midas directives here.\n");
  fprintf(stderr,
	  "\n");
  fprintf(stderr,
	  "Linked executable options:\n");
  fprintf(stderr,
	  "\n");
  fprintf(stderr,
	  "-in <f>               .goldfinger file to use.\n");
  fprintf(stderr,
	  "-genimage             Generate memory image.\n");
  fprintf(stderr,
	  "-imagefile <f>        File to write memory image.\n");
  fprintf(stderr,
	  "-gensymtab            Generate symbol table.\n");
  fprintf(stderr,
	  "-symtabfile <f>       File to write symbolt table.\n");
  fprintf(stderr,
	  "-gentsbs              Write TSB programming.\n");
  fprintf(stderr,
	  "-allow_tsb_conflicts  No error if collision in TSB.\n");
  fprintf(stderr,
	  "-allow_duplicate_tags No error if duplicate tags in TSB.\n");
  fprintf(stderr,
	  "-nocompress           Do not do any mem image compression.\n");
  fprintf(stderr,
	  "\n");
    
  exit(status);

}



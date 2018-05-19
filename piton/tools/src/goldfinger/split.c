// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: split.c
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
 * split.c
 *
 * Implement splitsec, as described in split.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

#include "gf_error.h"

#define MAX_LINE 2048
#define MAX_SECTIONS 4096 * 2
#define START_TEMPFILE "sec_temp.s"


typedef struct section_descr_s {
  char *app_name;
  char *section_name;
  char *orig_section_name;
  char *file_name;
} section_descr_t;

typedef struct section_lookup_s {
  char *file_name;
  FILE *fh;
} section_lookup_t;

section_descr_t Section_table[MAX_SECTIONS];
int Section_table_len = 0;


static void section_lookup(char *appname, char *secname,
			   section_lookup_t *lookup);
static void write_section_map(FILE *ofh);


/******************************************************************************
 *
 * splitsec(input_file, dest_dir, midas_file)
 * 
 * Splits input_file into sections, which are each written as an
 * assembly file in dest_dir.  All midas directives are written to
 * midas_file, also in dest_dir.
 *
 * A midas directive is any line where the first non-whitespace
 * characters are MIDAS_ or SECTION.  Also, if the first whitespace
 * characters are attr_<something> followed by a curly-brace-delimited
 * block (which may span multiple lines), it is also considered a
 * midas directive.
 *
 * At the end of midas_file, write lines beginning with SPLITSEC that
 * describe the file names to which it wrote each section.
 * 
 *****************************************************************************/

void
splitsec(char *input_file, char *dest_dir, char *midas_file) {
  FILE *input_fh = NULL;
  char *output_src_filename   = START_TEMPFILE;
  FILE *midas_fh = NULL;
  FILE *src_fh   = NULL;
  char buf[MAX_LINE];
  FILE *last_fh;
  int  line_num = 0;
  int section_num = 0;
  int in_block = 0;
  int in_multi_line_dir = 0;
  char *appname = strdup("default");

  if(!(input_fh = fopen(input_file, "r"))) {
    gf_error(M_FILE, "Can't open '%s' for reading: %s\n", 
		   input_file, strerror(errno));
  }

  if(dest_dir) {
    gf_say(VERBOSE_CHATTY, "Changing directory to '%s'.\n", dest_dir);
    if(chdir(dest_dir)) {
      gf_error(M_FILE, "Can't cd to '%s': %s\n", dest_dir,
	       strerror(errno));
    }
  }

  gf_say(VERBOSE_NORMAL, "Writing midas directives to %s\n", midas_file);
  if(!(midas_fh = fopen(midas_file, "w"))) {
    gf_error(M_FILE, "Can't open '%s' for writing: %s\n", 
		   midas_file, strerror(errno));
  }
  if(!(src_fh = fopen(output_src_filename, "w"))) {
    gf_error(M_FILE, "Can't open '%s' for writing: %s\n", 
		   output_src_filename, strerror(errno));
  }

  last_fh = src_fh;

  while(fgets(buf, MAX_LINE, input_fh)) {
    char *non_white = NULL;
    int i = 0;


    line_num++;
    while(buf[i]) {
      if(!isspace(buf[i])) {
	non_white = buf + i;
	break;
      }
      i++;
    }

    if(!non_white) {
      /* line is all whitespace */
      fprintf(last_fh, "%s", buf);
      continue;
    }


    if(in_multi_line_dir) {
      int linelen;
      fprintf(midas_fh, "%s", buf);

      linelen = strlen(buf);
      if((linelen > 2) && (buf[linelen-2] == '\\')) {
	in_multi_line_dir = 1;
      } else {
	in_multi_line_dir = 0;
      }
    } else if(!strncmp(non_white, "attr_", 5)) {
      char *end_block = NULL;
      if(last_fh != midas_fh) {
	fprintf(midas_fh, "#line %d \"%s\"\n", line_num, input_file);
      }
      fprintf(midas_fh, "%s", buf);

      end_block = strchr(non_white, '}');
      if(!end_block) {
	in_block = 1;
      }

      last_fh = midas_fh;
    } else if(!strncmp(non_white, "goldfinger_", 11)) {
      char *end_block = NULL;
      if(last_fh != midas_fh) {
	fprintf(midas_fh, "#line %d \"%s\"\n", line_num, input_file);
      }
      fprintf(midas_fh, "%s", buf);

      end_block = strchr(non_white, '}');
      if(!end_block) {
	in_block = 1;
      }

      last_fh = midas_fh;
    } else if(in_block) {
      char *end_block = NULL;
      fprintf(midas_fh, "%s", buf);

      end_block = strchr(non_white, '}');
      if(end_block) {
	in_block = 0;
      }
    } else if(!strncmp(non_white, "SECTION", 7)) {
      int i;
      char *secname;
      char *orig_secname;
      section_lookup_t lookup;
      int linelen;
  

      if(last_fh != midas_fh) {
	fprintf(midas_fh, "#line %d \"%s\"\n", line_num, input_file);
      }
      fprintf(midas_fh, "%s", buf);

      linelen = strlen(buf);
      if((linelen > 2) && (buf[linelen-2] == '\\')) {
	in_multi_line_dir = 1;
      }

      if(!(secname = strtok(non_white + 7, " \t\n"))) {
	gf_error(M_GOLDFINGERPARSE,
		 "Cannot find name for SECTION at file='%s', line=%d\n",
		 input_file, line_num);
      }
      orig_secname = malloc(strlen(secname) + 1);
      strcpy(orig_secname, secname);
      
      fclose(src_fh);
      section_lookup(appname, secname, &lookup);
      output_src_filename = lookup.file_name;
      src_fh              = lookup.fh;


      last_fh = midas_fh;
    } else if(!strncmp(non_white, "MIDAS_", 6)) {
      int linelen;

      if(last_fh != midas_fh) {
	fprintf(midas_fh, "#line %d \"%s\"\n", line_num, input_file);
      }
      fprintf(midas_fh, "%s", buf);
      last_fh = midas_fh;

      linelen = strlen(buf);
      if((linelen > 2) && (buf[linelen-2] == '\\')) {
	in_multi_line_dir = 1;
      }

    } else if(!strncmp(non_white, "APPLICATION", 11)) {
      int linelen;
      char *orig_appname;

      if(!(orig_appname = strtok(non_white + 11, " \t\n"))) {
	gf_error(M_GOLDFINGERPARSE,
		 "Cannot find name for APPLICATION at file='%s', line=%d\n",
		 input_file, line_num);
      }

      appname = gf_malloc(strlen(orig_appname)+1);
      strcpy(appname, orig_appname);

      if(last_fh != midas_fh) {
	fprintf(midas_fh, "#line %d \"%s\"\n", line_num, input_file);
      }
      fprintf(midas_fh, "%s", buf);
      last_fh = midas_fh;

      linelen = strlen(buf);
      if((linelen > 2) && (buf[linelen-2] == '\\')) {
	in_multi_line_dir = 1;
      }


    } else {
      last_fh = src_fh;
      fprintf(src_fh, "%s", buf);

    }    

  }

  fclose(src_fh);

  write_section_map(midas_fh);

  fclose(midas_fh);
  fclose(input_fh);
}



/******************************************************************************
 *
 * section_lookup(secname, lookup)
 * 
 * Returns a filename and open file handle for secname.  If secname
 * has been seen before, it return the same file name and a file
 * handle that is open to append to the original.  If secname has not
 * been seen before, it creates a new file and opens it for writing
 * The lookpu parameter is a pointer to where to write the multiple
 * return values.
 * 
 *****************************************************************************/


static void
section_lookup(char *appname, char *secname, section_lookup_t *lookup) {
  int i;
  char *orig_secname = secname;

  if(secname[0] == '.' && secname[1] != '\0') {
    secname++;
  }

  if(appname[0] == '.' && appname[1] != '\0') {
    appname++;
  }


  /* found already */
  for(i=0; i<Section_table_len; i++) {
    if(!strcmp(secname, Section_table[i].section_name) &&
       !strcmp(appname, Section_table[i].app_name)
       ) 
      {
	lookup->file_name = Section_table[i].file_name;

	gf_say(VERBOSE_NORMAL, "Appending section %s to %s\n",
	       secname, lookup->file_name);
	if(!(lookup->fh = fopen(lookup->file_name, "a"))) {
	  gf_error(M_FILE, "Can't open '%s' for writing: %s\n", 
		   lookup->file_name, strerror(errno));
	}
	return;
      }
  }

  lookup->file_name = (char *)malloc(strlen(secname) + 50);
  sprintf(lookup->file_name, "sec%d.%s.s", Section_table_len, secname);
  for(i=0; i<strlen(lookup->file_name); i++) {
    lookup->file_name[i] = tolower(lookup->file_name[i]);
  }

  gf_say(VERBOSE_NORMAL, "Writing section %s to %s\n",
	 secname, lookup->file_name);

  if(Section_table_len == 0) {
    /* erase lookup->file_name if it exists */
    unlink(lookup->file_name);
    /*  add a hard link from START_TEMPFILE to lookup->file_name */
    if(link(START_TEMPFILE, lookup->file_name)) {
      gf_error(M_FILE, "Can't link %s to %s: %s\n", 
		     START_TEMPFILE, lookup->file_name, strerror(errno));
    }
    /* erase old link */
    if(unlink(START_TEMPFILE)) {
      gf_error(M_FILE, "Can't remove %s: %s\n", 
		     START_TEMPFILE, strerror(errno));
    }


    if(!(lookup->fh = fopen(lookup->file_name, "a"))) {
      gf_error(M_FILE, "Can't open '%s' for writing: %s\n", 
		     lookup->file_name, strerror(errno));
    }
  } else {

    if(!(lookup->fh = fopen(lookup->file_name, "w"))) {
      gf_error(M_FILE, "Can't open '%s' for writing: %s\n", 
		     lookup->file_name, strerror(errno));
    }
  }

  if(Section_table_len == MAX_SECTIONS) {
    gf_error(M_MEMORY, "Too many sections (max = %d)\n", MAX_SECTIONS);
  }

  Section_table[Section_table_len].section_name = malloc(strlen(secname)+1);
  strcpy(Section_table[Section_table_len].section_name, secname);
  Section_table[Section_table_len].orig_section_name =
    malloc(strlen(orig_secname)+1);
  strcpy(Section_table[Section_table_len].orig_section_name, orig_secname);
  Section_table[Section_table_len].file_name = lookup->file_name;
  Section_table[Section_table_len].app_name = malloc(strlen(appname)+1);
  strcpy(Section_table[Section_table_len].app_name, appname);

  Section_table_len++;

}



/******************************************************************************
 *
 * write_section_map(ofh)
 * 
 * Writes a map of which sections went to which files to the specified
 * file handle.
 * 
 *****************************************************************************/


static void
write_section_map(FILE *ofh) {
  int i;
  for(i=0; i<Section_table_len; i++) {
    fprintf(ofh, "SPLITSEC APP=%s SECTION=%s FILE=%s\n",
	    Section_table[i].app_name,
	    Section_table[i].orig_section_name,
	    Section_table[i].file_name);
  }
}


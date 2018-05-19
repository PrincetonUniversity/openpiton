// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: monitor.cc
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
***  Program File:  @(#)monitor.cc
***
***  Version Date:  08/30/99
***
****************************************************************************
****************************************************************************/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include "vcsconst.h"
#include <stdarg.h>

#define MAXUNITS		100
#define MAXTAGS			50
#define MAXRETYPES		5
#define BUFFER_INCREMENT	1000
/* Make sure there is space for any resonable size printed text */
#define BUFFER_INCREMENT_PLI	5000
#define BUFFER_LIMIT		10

#define WARNING		1
#define ERROR		2
#define GENERAL		3
#define DEBUG		4
#define MONITOR1	5
#define MONITOR2	6

#define BLOCK_COUNT	0x1
#define BLOCK_TIME	0x2
#define FORCE		0x4
#define WRITEMON        0x8

#define CIAM_QUIT "print -v executed_count; expr -d executed_count; print -v intr_count; expr -d intr_count; print -v trap_count; expr -d trap_count; quit; wait"

extern "C" char * mc_scan_plusargs(char *);
extern "C" char * tf_getcstringp(int);
extern "C" char * tf_strgetp(int, char);
extern "C" char *tf_mipname();
extern "C" char *tf_strgettime();
extern "C" int tf_getp(int);
extern "C" int tf_putp(int, int);
extern "C" int tf_typep(int);
extern "C" int tf_nump();
extern "C" int io_printf(...);
extern "C" int tf_gettime();
#ifndef NOCIAM
extern "C" void pli_ciam_command(char *);
#endif
extern "C" int tf_dostop();
extern "C" int tf_dofinish();

static int global_errors = 0;
static int global_warnings = 0;
static int max_warnings = 1;
static int max_errors = 1;
static int max_warning_stop_type = 1;
static int max_error_stop_type = 1;
static int last_mon = 1;
static int max_instance_len = 30;
static int external_finish = 0;
static int finish_pending = 0;

static int err_wrn_enable = 1;
static int num_modules = 0;
static int monitors_initialized = 0;

static char *output_buffer;
static int output_buffer_size = 0;

static int wm, pli=1;

int strip;

static char modulename[] = "monitor.cc";

#define NOTIME_FLAG	1
#define NOCOUNT_FLAG	2
#define RESET_FLAG 	4

static struct MonitorEnables {
	char unit[50];
	char instance[201];
	unsigned int type[MAXTAGS];
	unsigned int enable[MAXTAGS];
	
} MonitorEnables[MAXUNITS];

static char display_format[] = "bBoOdDhHxXmts%";
static char displayfix_format[] = "oOdDhHxX";

// Ex: maxwarnings(<warnings>, <action>);
// <action: 0=$stop on max warnings, 1=$finish on max warnings>

// Tag values are defined as follows:
// 0-10 default enabled, displays: <time>: <module>: formatted_data
// 11-20 default disabled, displays: <time>: <module>: formatted_data
// 21-30 default disabled, displays: <time>: DBG: <unit>(<module>): formatted_data
// 31-35 default disabled, displays: <time>: <unit>(<module>): formatted_data
// 36-40 default enabled, displays: <time>: <unit>(<module>): formatted_data
// 48 default enabled, displays: <time>: WARNING: <unit>(<module>): formatted_data
// 49 default enabled, displays: <time>: ERROR: <unit>(<module>): formatted_data

/*
Usage: 

	Old Format:
	$dispmon("{-|@|%}unit", tag, "printf-style-format", reg-or-int, reg-or-int);
	$writemon("{-|@|%}unit", tag, "printf-style-format", reg-or-int, reg-or-int);

	Specifing a unit name with a tag starting with the following
	characters causes special actions:

	-<unit>: Do not increment error or warning counter for
		 a tag of 48 or 49.
	@<unit>: Do not prepend time information to the display output.
	%<unit>: Perform actions of both - and @.

	New Format:
	$dispmon("unit", tag, FLAGS, "printf-style-format", reg-or-int, reg-or-int);
	$writemon("unit", tag, FLAGS, "printf-style-format", reg-or-int, reg-or-int);

	Specifing a unit name with a tag starting with the following
	characters causes special actions:

	-<unit>: Do not increment error or warning counter for
		 a tag of 48 or 49.
	@<unit>: Do not prepend time information to the display output.
	%<unit>: Perform actions of both - and @.
	FLAGS: A new 32 bit integer field currently undefined.
*/

int do_init() {
char *cp, arg_buffer[200], *tmp;
char unit[200], instance[201];
int i, j, k, mons, tags, tage;
int warning, error, gen, dbg;
int monenable;

	// monitors may be initialized via $initmon or by
	// the first call to $dispmon or $writemon. If both
	// occur, only initialize once.
	if (monitors_initialized) return(0);
	for(i = 0; i < MAXUNITS; ++i) {
	    // enable tag 0-10
	    *MonitorEnables[i].unit = NULL;
	    *MonitorEnables[i].instance = NULL;
	    MonitorEnables[i].type[0] = GENERAL;
	    MonitorEnables[i].enable[0] = 1;
	    for(j = 1; j <= 10; ++j) {
	        MonitorEnables[i].type[j] = GENERAL;
	        MonitorEnables[i].enable[j] = 1;
	    }
	    for(j = 11; j <= 20; ++j) {
	        MonitorEnables[i].type[j] = GENERAL;
	        MonitorEnables[i].enable[j] = 0;
	    }
	    for(j = 21; j <= 30; ++j) {
	        MonitorEnables[i].type[j] = DEBUG;
	        MonitorEnables[i].enable[j] = 0;
	    }
	    for(j = 31; j <= 35; ++j) {
	        MonitorEnables[i].type[j] = MONITOR1;
	        MonitorEnables[i].enable[j] = 0;
	    }
	    for(j = 31; j <= 35; ++j) {
	        MonitorEnables[i].type[j] = MONITOR2;
	        MonitorEnables[i].enable[j] = 1;
	    }
	    for(j = 40; j < MAXTAGS-2; ++j) {
	        MonitorEnables[i].type[j] = GENERAL;
	        MonitorEnables[i].enable[j] = 0;
	    }
	    MonitorEnables[i].type[48] = WARNING;
	    MonitorEnables[i].enable[48] = 1;
	    MonitorEnables[i].type[49] = ERROR;
	    MonitorEnables[i].enable[49] = 1;
	}
	strcpy(MonitorEnables[0].unit, "default");
	cp = mc_scan_plusargs((char *)"monnum");
	if (cp != NULL ) {
	    mons = atoi(cp);
	} else {
	    printf("INFO(%s): No +monnum arg found, setting to +monnum0\n", modulename);
	    mons = 0;
	}
	for(i = 0; i < mons; ++i) {
	    sprintf(arg_buffer, "unit[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp == NULL) {
		io_printf("ERROR(%s): No +unit specified with +monnum\n", modulename);
		return(1);
	    }
	    // If specified monitor unit is "all" kerword, then set the enabled
	    // in the special "all" positon of the MonitorEnables structure
	    // array, index 0.
	    if (!strcmp(cp, "all")) {
		io_printf("INFO(%s): All units added to monitor list\n", modulename);
		j = -1;
	    }
	    // Look through MonitorEnables to find first non used init position.
	    else {
		*instance = NULL;
		if ( (tmp = strchr(cp, ':')) != NULL ) {
		    *tmp = NULL;
		    strcpy(instance, cp);
		    strcpy(unit, tmp+1);
		}
		else strcpy(unit, cp);
	    	for(j = 1; j < MAXUNITS; ++j) {
		    if ((strcmp(unit, MonitorEnables[j].unit) == 0) &&
			(((*instance == NULL) && 
			  (*MonitorEnables[j].instance == NULL)) ||
			 ((*instance != NULL) && 
			  (strstr(instance, MonitorEnables[j].instance))))) {
		    	break;
		    }

		    if (*MonitorEnables[j].unit == NULL) {
		    	strcpy(MonitorEnables[j].unit, unit);
			if (*instance != NULL)
			{
		    	    strcpy(MonitorEnables[j].instance, instance);
		    	    io_printf("INFO(%s): Unit <%s:%s> added to monitor list\n", 
				modulename, instance,unit);
			}
			else io_printf("INFO(%s): Unit <%s> added to monitor list\n", 
			    modulename, unit);
		    	break;
		    }
		}
	    	if (j == MAXUNITS) {
		    io_printf("ERROR(%s): No more monitor units available\n", modulename);
		    return(1);
	    	}
	    }

	    sprintf(arg_buffer, "tags[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp == NULL) {
	    	io_printf("ERROR(%s): No +tags specified with +monnum\n", modulename);
	    	return(1);
	    }
	    tags = atoi(cp);
	    sprintf(arg_buffer, "tage[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp == NULL) {
		io_printf("ERROR(%s): No +tage specified with +monnum\n", modulename);
		return(1);
	    }
	    tage = atoi(cp);
	    if (tage < tags) {
		io_printf("ERROR(%s): tage < tags for +monnum\n", modulename);
		return(1);
	    }
	    warning = 0;
	    error = 0;
	    gen = 0;
	    dbg = 0;
	    sprintf(arg_buffer, "montypewarn[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp != NULL) warning = 1;
	    sprintf(arg_buffer, "montypeerr[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp != NULL) error = 1;
	    sprintf(arg_buffer, "montypegen[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp != NULL) gen = 1;
	    sprintf(arg_buffer, "montypedbg[%d]", i);
	    cp = mc_scan_plusargs(arg_buffer);
	    if (cp != NULL) dbg = 1;
	    if (warning) {
		if (j == -1) {
		    io_printf("INFO(%s): Assigning all monitors %d-%d to WARNING\n",
		    	modulename, tags, tage);
		}
		else {
		    io_printf("INFO(%s): Assigning monitor <%s> %d-%d to WARNING\n",
		    	modulename, MonitorEnables[j].unit, tags, tage);
		}
	    }

	    if (error) {
		if (j == -1) {
		    io_printf("INFO(%s): Assigning all monitors %d-%d to ERROR\n",
		    	modulename, tags, tage);
		}
		else {
		    io_printf("INFO(%s): Assigning monitor <%s> %d-%d to ERROR\n",
		    	modulename, MonitorEnables[j].unit, tags, tage);
		}
	    }

	    if (gen) {
		if (j == -1) {
		    io_printf("INFO(%s): Assigning all monitors %d-%d to GENERAL\n",
		    	modulename, tags, tage);
		}
		else {
		    io_printf("INFO(%s): Assigning monitor <%s> %d-%d to GENERAL\n",
		    	modulename, MonitorEnables[j].unit, tags, tage);
		}
	    }
	    if (dbg) {
		if (j == -1) {
		    io_printf("INFO(%s): Assigning all monitors %d-%d to DBG\n",
		    	modulename, tags, tage);
		}
		else {
		    io_printf("INFO(%s): Assigning monitor <%s> %d-%d to DBG\n",
		    	modulename, MonitorEnables[j].unit, tags, tage);
		}
	    }

	    sprintf(arg_buffer, "monenable[%d]", i);
	    if ( (cp = mc_scan_plusargs(arg_buffer)) == NULL) {
	    	// This is the old +arg, keep it for compatability
	    	if ( (cp = mc_scan_plusargs((char *)"monenable")) == NULL ) {
	    	    io_printf("ERROR(%s): Can't find +monenable or +monenable[<index>] arg, setting to on\n", modulename);
		}
	    }

	    if (cp != NULL) {
	        if (!strcmp(cp, "on")) monenable = 1;
	    	else if (!strcmp(cp, "off")) monenable = 0;
	    	else {
	    	    io_printf("ERROR(%s): Illegal monenable setting, setting to on\n", modulename);
		    monenable = 1;
	    	}
	    } else monenable = 1;

	    if (j == -1) {
		if (monenable) 
		    io_printf("INFO(%s): Enabling tags %d-%d\n", modulename, tags, tage);
		else io_printf("INFO(%s): Disable tags %d-%d\n", modulename, tags, tage);
		for(j = 0; j < MAXUNITS; ++j) {
	    	    for(k = tags; k <= tage; ++k) {
		    	if (warning) MonitorEnables[j].type[k] = WARNING;
		    	if (error) MonitorEnables[j].type[k] = ERROR; 
		    	if (gen) MonitorEnables[j].type[k] = GENERAL;
		    	if (dbg) MonitorEnables[j].type[k] = DEBUG;
		    	MonitorEnables[j].enable[k] = monenable;
	            }
		}
	    }
	    else {
		if (monenable) io_printf("INFO(%s): Enabling tags %d-%d\n", modulename, tags, tage);
		else io_printf("INFO(%s): Disable tags %d-%d\n", modulename, tags, tage);
	    	for(k = tags; k <= tage; ++k) {
		    if (warning) MonitorEnables[j].type[k] = WARNING;
		    if (error) MonitorEnables[j].type[k] = ERROR; 
		    if (gen) MonitorEnables[j].type[k] = GENERAL;
		    if (dbg) MonitorEnables[j].type[k] = DEBUG;
		    MonitorEnables[j].enable[k] = monenable;
	        }
	    }
	}
	cp = mc_scan_plusargs((char *)"maxerror");
	if (cp == NULL) {
	    io_printf("INFO(%s): Can't find +maxerror arg, setting to 1\n", modulename);
	    max_errors = 1;
	} else sscanf(cp, "%d", &max_errors);
	cp = mc_scan_plusargs((char *)"doerror");
	if (cp == NULL) {
	    io_printf("INFO(%s): Can't find +doerror arg, setting to finish\n", modulename);
	    max_error_stop_type = 1;
	} else {
	    if (strcmp(cp, "finish") == 0) max_error_stop_type = 1;
	    else max_error_stop_type = 0;
	}
	io_printf("INFO(%s): Max ERRORS set to %d\n", modulename, max_errors);
	if (!max_error_stop_type)
	    io_printf("INFO(%s): Max ERRORS action set to $stop\n", modulename);
	else io_printf("INFO(%s): Max ERRORS action set to $finish\n", modulename);

	cp = mc_scan_plusargs((char *)"maxwarning");
	if (cp == NULL) {
	    printf("INFO(%s): Can't find +maxwarning arg, setting to 5\n", modulename);
	    max_warnings = 5;
	} else sscanf(cp, "%d", &max_warnings);
	cp = mc_scan_plusargs((char *)"dowarning");
	if (cp == NULL) {
	    printf("INFO(%s): Can't find +dowarning arg, setting to $finish\n", modulename);
	    max_warning_stop_type = 0;
	}
	else {
	    if (strcmp(cp, "finish") == 0) max_warning_stop_type = 1;
	    else max_warning_stop_type = 0;
	}
	io_printf("INFO(%s): Max WARNINGS set to %d\n", modulename, max_warnings);
	if (!max_warning_stop_type)
	    io_printf("INFO(%s): Max WARNINGS action set to $stop\n", modulename);
	else 
	    io_printf("INFO(%s): Max WARNINGS action set to $finish\n", modulename);

	cp = mc_scan_plusargs((char *)"maxinstancelen");
	if (cp != NULL) {
	    sscanf(cp, "%d", &max_instance_len);
	    if (max_instance_len > 50) max_instance_len = 50; /* set top limit */
	} else max_instance_len = 50;
	monitors_initialized = 1;
	return(0);
}

// $dispmon("unit", TAG, {FLAGS,} "format", parms, ...);
// $writemon("unit", TAG, {FLAGS,} "format", parms, ...);
// dprintf("unit", TAG, FLAGS, "format", parms, ...);
#ifdef LINUX
void dprintf(const char *mod_name, ...)
#else
void dprintf(...)
#endif
{
int i, j, k, input_parms, input_flags, start;
int tag, index;
char unit[51];
char unit_tmp[51];
char *data, *tf_chars, *parms;
char instance[201];
char modname[201];
char *pt1, *pt2;
char *cp;
int block_counters;
int block_time;
va_list ap;
char *vs_format;

	if (!output_buffer_size) {
	    if (!pli) output_buffer_size = BUFFER_INCREMENT;
	    else output_buffer_size = BUFFER_INCREMENT_PLI;
	    output_buffer = (char *)calloc(output_buffer_size, sizeof(char));
	    if (!output_buffer) {
		io_printf("INFO(%s): ERROR(%s): Can't allocate output buffer\n", modulename);
		return;
	    }
	}

	if (!monitors_initialized) {
	    io_printf("INFO(%s): Auto initilize dispmon pli\n", modulename);
	    if (do_init()) {
		cp = mc_scan_plusargs((char *)"ciam");
		// This may be a problem if the first $dispmon is called before
		// ciam PLI init and do_init returns an error. This is not likely
		// but possible.
		if (cp != NULL) {
#ifndef NOCIAM
		    io_printf("INFO(%s): QUITTING CIAM\n", modulename);
		    pli_ciam_command(CIAM_QUIT);
#endif
		}
		tf_dofinish();
	    }
	} 
	// If called from dprintf, then the user is at their own risk if the parms are not correct.
	if (!pli) {
	    if (tf_nump() < 3) {
	    	io_printf("ERROR(%s): Usage: $dispmon(\"unit\", tag, \"printf-style-format\", modulename, reg-or-int, reg-or-int);\n", modulename);
	    	io_printf("ERROR(%s): in instance %s\n", modulename, tf_mipname());
	    	return;
	    }
	    if (tf_typep(1) != tf_string) {
	    	io_printf("ERROR(%s): dispmon unit name is not a string\n", modulename);
	    	return;
	    }
	}
	if (!pli) strncpy(unit_tmp, tf_getcstringp(1), 49);
	else {
#ifdef LINUX
	    va_start(ap,mod_name);
	    strcpy(unit_tmp, mod_name);
#else
	    va_start(ap,void);
	    strcpy(unit_tmp, va_arg(ap, char *));
#endif
	}
	unit_tmp[50] = NULL;

	if (!pli) tag = tf_getp(2);
	else tag = va_arg(ap, int);
	
	if (!strcmp(unit_tmp, "-")) {
	    io_printf("ERROR(%s): invalid unit name for $dispmon\n", modulename);
	    return;
	}
	else if (!strcmp(unit_tmp, "@")) {
	    io_printf("ERROR(%s): invalid unit name for $dispmon\n", modulename);
	    return;
	}
	else if (!strcmp(unit_tmp, "%")) {
	    io_printf("ERROR(%s): invalid unit name for $dispmon\n", modulename);
	    return;
	}
	else if (*unit_tmp == '-') {
	    strcpy(unit, unit_tmp+1);
	    block_counters = 1;
	    block_time = 0;
	}
	else if (*unit_tmp == '@') {
	    strcpy(unit, unit_tmp+1);
	    block_time = 1;
	    block_counters = 0;
	}
	else if (*unit_tmp == '%') {
	    strcpy(unit, unit_tmp+1);
	    block_counters = 1;
	    block_time = 1;
	}
	else {
	    strcpy(unit, unit_tmp);
	    block_counters = 0;
	    block_time = 0;
	}
	if ( !strcmp(unit, "all") ) {
	    // "all" is not a valid unit name in $dispmon call
	    io_printf("ERROR(%s): <all> is not a valid unit name for $dispmon\n", modulename);
	    return;
	}
	// If in PLI this would be the instance name of the module which called the origianl PLI
	// which called dprintf.
	strncpy(instance, tf_mipname(), 200);
	instance[201] = NULL;
	i = 0;
	if (monitors_initialized) {
	    // Remember, UNIT 0 is the default unit, so start at unit 1 and check
	    // for match of unit name
	    for(i = 1; i < MAXUNITS; ++i) {
		/* Unit name match? */
	    	if ( !strcmp(MonitorEnables[i].unit, unit) &&
		     ((*MonitorEnables[i].instance == NULL) ||
		      ((*MonitorEnables[i].instance != NULL) &&
	    		strstr(instance, MonitorEnables[i].instance))) ) {
		    /* Tag for this $dispmon enabled? */
		    if (MonitorEnables[i].enable[tag]) break;
		    else return;
	    	}
		// Early exit, we have no more units to check when we hit the 
		// the first NULL unit name. If unit not found and default unit
		// not enabled for tag, then do not display.
		else if (*MonitorEnables[i].unit == NULL) {
		    if (MonitorEnables[0].enable[tag]) break;
		    else return;
		}
	    }
	}
	index = i;
	// Unit not found and list is full, check default unit.
	if (i == MAXUNITS) {
	    if (!MonitorEnables[0].enable[tag]) return;
	    else index = 0;
	}
	if (!pli) input_parms = tf_nump();
	else input_parms = 0;
	if (!pli) {
	    if (tf_typep(3) != tf_string) {
	    	// New dispmon format, get flags
	    	input_flags = tf_getp(3);
	    	start = 4;
	    	if (tf_typep(4) != tf_string) {
	    	    io_printf("ERROR(%s): dispmon format field is not a string\n", modulename);
	            ++global_errors;
	            return;
	    	}
	    	else parms = tf_getcstringp(4); 
	    } else {
	    	parms = tf_getcstringp(3); /* Old format */
	    	start = 3;
	    	input_flags = 0;
	    }
	} else input_flags = va_arg(ap, int);

	if (input_flags & BLOCK_COUNT) block_counters = 1;
	if (input_flags & BLOCK_TIME) block_time = 1;
	if (input_flags&WRITEMON) wm = 1;
        else {
          if (pli) wm = 0;
        }
	// Display this $dismon call
	if (!pli) {
	    output_buffer[0] = NULL;
	    for(j = 0, k = start+1, i = 0; parms[i] != NULL; ++i) {
	    	if (parms[i] != '%') {
		    if (j >= (output_buffer_size-BUFFER_LIMIT)) {
		    	output_buffer_size = output_buffer_size+BUFFER_LIMIT+BUFFER_INCREMENT;
		    	output_buffer = (char *) realloc(output_buffer, output_buffer_size);
		    	if (!output_buffer) {
			    io_printf("INFO(%s): ERROR(%s): Can't allocate output buffer\n", modulename);
			    return;
		    	}
		    }
	    	    output_buffer[j++] = parms[i];
	    	    output_buffer[j] = NULL;
	    	}
	    	else {
	    	    ++i;
		    if (parms[i] == '0') {
		        strip = 1;
		        ++i;
		    }
		    else strip = 0;

		    if ((parms[i] != 'm') && (parms[i] != 't') && (parms[i] != '%') && (k > input_parms)) {
		    	io_printf("ERROR(%s): insufficient parameters for format string in $dispmon\n", modulename);
		    	io_printf("     : <%s>\n", parms);	
		    	return;
		    }
	    	    if (strchr(display_format, parms[i]) != NULL) {
		    	data = NULL;
		    	if (parms[i] == 'm') tf_chars = tf_mipname();
		    	else if (parms[i] == 't') tf_chars = tf_strgettime();
		    	else if (parms[i] == 's') {
			    tf_chars = tf_getcstringp(k);
		            ++k;
		    	}
		    	else if (parms[i] == '%') {
		            if ( (data=(char *)calloc(16, sizeof(char))) == NULL ) {
			    	io_printf("INFO(%s): ERROR(%s): Can't allocate output buffer\n", modulename);
			    	return;
		    	    }
			    strcpy(data, "%");
		    	}
		    	else {
	     	    	    tf_chars = tf_strgetp(k, parms[i]);
			    // if format is octal, hex or decimal and a %0 format 
			    // was specified, then strip off leading 0's
	    		    if (strip && strchr(displayfix_format, parms[i]) != NULL) {
			    	while(*tf_chars != NULL && *tf_chars == '0') ++tf_chars;
			    	if (*tf_chars == NULL) --tf_chars;
			    }
		            ++k;
		    	}
		    	if (data == NULL) {
		            if ( (data=(char *)calloc(strlen(tf_chars)+1, sizeof(char))) == NULL ) {
			    	io_printf("INFO(%s): ERROR(%s): Can't allocate output buffer\n", modulename);
			    	return;
		    	    }
			    strcpy(data, tf_chars);
		    	}
	     	    	j += strlen(data);
		    	if (j >= (output_buffer_size-BUFFER_LIMIT)) {
		            output_buffer_size = output_buffer_size+BUFFER_LIMIT+BUFFER_INCREMENT+strlen(data);
		    	    output_buffer = (char *) realloc(output_buffer, output_buffer_size);
		    	    if (!output_buffer) {
			    	io_printf("INFO(%s): ERROR(%s): Can't allocate output buffer\n", modulename);
			    	return;
		    	    }
		    	}
	     	    	strcat(output_buffer, data);
	     	    	output_buffer[j] = NULL;
		    	free(data);
		    }
		    else {
		    	io_printf("ERROR(%s): Invalid format character <%s>: dispmon unit <%s>\n", modulename, parms, unit);
		    	return;
	    	    }
	    	}
	    }
	} else {
	    vs_format = (char *) va_arg(ap, char *);
	    vsprintf(output_buffer, vs_format, ap);
	}

	// get the module instance name.
	// Generally, ch_sys.cheetah_mod.cpu.....
	// Display as: (<mod>...<end_path_name>)
	if ( (pt1 = strchr(instance, '.')) == NULL ) {
	    // No module
	    strncpy(modname, instance, 49);
	    modname[50] = NULL;
	}
	else if ( (pt2 = strchr(pt1+1, '.')) == NULL ) {
	    // Extract the module name
	    strncpy(modname, pt1+1, 49);
	    modname[50] = NULL;
	}
	else {
	    // If more then the module name is available, take
	    // only the module name for GENERAL display format.
	    ++pt1;
	    if (MonitorEnables[index].type[tag] == GENERAL) {
	    	*pt2 = NULL;
	    	strncpy(modname, pt1, 49);
	    	modname[50] = NULL;
	    }
	    else {
	    	// If more then the module name is available, take
	    	// the full instance name if the length is less then
		// the programable parameter, or take the first and
		// last half of the instance name if it is too long
		// and display it seperated with three dots.

		if (strlen(pt1) < max_instance_len) {
	    	    strcpy(modname, pt1);
		}
		else {
		    strncpy(modname, pt1, max_instance_len/2);
		    *(modname+(max_instance_len/2)) = NULL;
		    strcat(modname, "...");
		    strcat(modname, pt1+strlen(pt1)-(max_instance_len/2));
		}
	    }
	}

	if (MonitorEnables[index].type[tag] == GENERAL) {
	    if (!wm) {
		last_mon = 1;
		if (!block_time) io_printf("%06d: %s(%s): %s\n", tf_gettime(), modname, unit, output_buffer);
		else io_printf("%s\n", output_buffer);
	    }
	    else {
		if (last_mon) {
		    if (!block_time) io_printf("%06d: %s(%s): %s", tf_gettime(), modname, unit, output_buffer);
		    else io_printf("%s", output_buffer);
		}
		else io_printf("%s", output_buffer);

		if (output_buffer[strlen(output_buffer)-1] == '\n') last_mon = 1;
		else last_mon = 0;
	    }
	}
	else if (MonitorEnables[index].type[tag] == WARNING) {
		if (err_wrn_enable || (input_flags&FORCE)) {
		    if (!wm) {
			last_mon = 1;
			if (!block_time) io_printf("%06d: WARNING: %s(%s): %s\n", tf_gettime(), unit, modname, output_buffer);
			else io_printf("%s\n", output_buffer);
		    }
		    else {
			if (last_mon) io_printf("%06d: WARNING: %s(%s): %s", tf_gettime(), unit, modname, output_buffer);
			else io_printf("%s", output_buffer);

			if (output_buffer[strlen(output_buffer)-1] == '\n') last_mon = 1;
			else last_mon = 0;
		    }
	    	    if (!block_counters) ++global_warnings;
	    	    if (global_warnings >= max_warnings) {
		    	if (max_warning_stop_type) {
		            io_printf("\nINFO(%s): MAX WARNINGS REACHED - SIMULATION TERMINATED\n", modulename);
			    io_printf("INFO(%s): TIME %d, ABNORMAL END--MONITOR CAUSED END OF SIMULATION\n", modulename, tf_gettime()); 
			    if (!external_finish) {
		    	    	cp = mc_scan_plusargs((char *)"ciam");
		    	    	if (cp != NULL) {
#ifndef NOCIAM
		            	    io_printf("INFO(%s): QUITTING CIAM\n", modulename);
			    	    pli_ciam_command(CIAM_QUIT);
#endif
		    	    	}
			    	tf_dofinish();
			    }
			    else {
				// termination pending due to max error
				// disable further errors till external	
				// verilog shuts down simulator.
				for(i = 0; i < MAXUNITS; ++i) 
				{
	    			    MonitorEnables[i].enable[48] = 0;
	    			    MonitorEnables[i].enable[49] = 0;
				}
				finish_pending = 1;
			    }
		    	}
		    	else {
		            io_printf("INFO(%s): MAX WARNINGS REACHED - SIMULATION STOPPED\n", modulename);
			    tf_dostop();
		    	}
		    }
	    	}
	}
	else if (MonitorEnables[index].type[tag] == ERROR) {
		if (err_wrn_enable || (input_flags&FORCE)) {
		    if (!wm) {
			last_mon = 1;
			if (!block_time) io_printf("%06d: ERROR: %s(%s): %s\n", tf_gettime(), unit, modname, output_buffer);
			else io_printf("%s\n", output_buffer);
		    }
		    else {
			if (last_mon) io_printf("%06d: ERROR: %s(%s): %s", tf_gettime(), unit, modname, output_buffer);
			else io_printf("%s", output_buffer);

			if (output_buffer[strlen(output_buffer)-1] == '\n') last_mon = 1;
			else last_mon = 0;
		    }
	    	    if (!block_counters) ++global_errors;
	    	    if (global_errors >= max_errors) {
		    	if (max_error_stop_type) {
		            io_printf("INFO(%s): MAX ERRORS REACHED - SIMULATION TERMINATED\n", modulename);
			    io_printf("INFO(%s): TIME %d, ABNORMAL END--MONITOR CAUSED END OF SIMULATION\n", modulename, tf_gettime()); 
			    if (!external_finish) {
		    	    	cp = mc_scan_plusargs((char *)"ciam");
		    	    	if (cp != NULL) {
#ifndef NOCIAM
		            	    io_printf("INFO(%s): QUITTING CIAM\n", modulename);
			    	    pli_ciam_command(CIAM_QUIT);
#endif
		    	    	}
			    	tf_dofinish();
			    }
			    else {
				// termination pending due to max error
				// disable further errors till external	
				// verilog shuts down simulator.
				for(i = 0; i < MAXUNITS; ++i) 
				{
	    			    MonitorEnables[i].enable[48] = 0;
	    			    MonitorEnables[i].enable[49] = 0;
				}
				finish_pending = 1;
			    }
		    	}
		    	else {
		            io_printf("INFO(%s): MAX ERRORS REACHED - SIMULATION STOPPED\n", modulename);
			    tf_dostop();
		    	}
		    }
	    	}
	}
	else if (MonitorEnables[index].type[tag] == DEBUG) {
		if (!wm) {
		    last_mon = 1;
		    if (!block_time) io_printf("%06d: DBG: %s(%s): %s\n", tf_gettime(), unit, modname, output_buffer);
		    else io_printf("%s\n", output_buffer);
		}
		else
		{
		    if (last_mon) io_printf("%06d: DBG: %s(%s): %s", tf_gettime(), unit, modname, output_buffer);
		    else io_printf("%s", output_buffer);

		    if (output_buffer[strlen(output_buffer)-1] == '\n') last_mon = 1;
		    else last_mon = 0;
		}
	}
	else if ((MonitorEnables[index].type[tag] == MONITOR1) || 
		 (MonitorEnables[index].type[tag] == MONITOR2)) {
		if (!wm) {
		    last_mon = 1;
		    if (!block_time) io_printf("%06d: %s(%s): %s\n", tf_gettime(), unit, modname, output_buffer);
		    else io_printf("%s\n", output_buffer);
		}
		else {
		    if (last_mon) io_printf("%06d: %s(%s): %s", tf_gettime(), unit, modname, output_buffer);
		    else io_printf("%s", output_buffer);

		    if (output_buffer[strlen(output_buffer)-1] == '\n') last_mon = 1;
		    else last_mon = 0;
		}
	}
}

extern "C" void dispmon() {
	pli = 0;
	wm = 0;
	dprintf("dispmon");
	// When we exit $dispmon or $writemon, reenable PLI mode for the dprintf function
	pli = 1;
	wm = 0;
}

extern "C" void writemon() {
	// special form to reset the nl detect.
	if (tf_nump() == 0) {
	    last_mon = 1;
	    return;
	}
	pli = 0;
	wm = 1;
	// When we exit $dispmon or $writemon, reenable PLI mode for the dprintf function
	dprintf("dispmon");
	pli = 1;
	wm = 0;
}

// Obsolete.
extern "C" void initmon() {
	io_printf("INFO(%s): $initmon PLI is now obsolete and ignored\n", modulename);
}

extern "C" void enable_errwarnmon() {
	err_wrn_enable = 1;
	io_printf("INFO(%s): Enable ERROR and WARNING $dispmons from (%s) at time %s\n",
		  modulename, tf_mipname(), tf_strgettime());
	
}

extern "C" void disable_errwarnmon() {
	err_wrn_enable = 0;
	io_printf("INFO(%s): Disable ERROR and WARNING $dispmons from (%s) at time %s\n",
		  modulename, tf_mipname(), tf_strgettime());
}

extern "C" void dispmon_status() {
	tf_putp(0, monitors_initialized);
}

extern "C" void check_mon() {
	if (!external_finish) {
	    io_printf("INFO(%s): Enabling $dispmon EXTERNAL FINISH DETECTION via $check_mon call.\n", modulename);
	    external_finish = 1;
	}
	tf_putp(0, finish_pending);
}

extern "C" void module_start() {
	++num_modules;
	io_printf("INFO(%s): Total Modules = %d\n", modulename, num_modules);
}

extern "C" void module_end() {
  if (num_modules > 0) {
    io_printf("INFO(%s): Total Modules = %d\n", modulename, num_modules);
    --num_modules;
  } else {
    io_printf("%06d: ERROR: %s(%s): %s\n", tf_gettime(),
	      modulename, "module_end", "Module count is negative");
    tf_dofinish();
  }
}

extern "C" void modules_done() {
	if (!num_modules) tf_putp(0, 1);
	else tf_putp(0, 0);
}

extern int PLIModulesDone(void) {
	if (!num_modules) return(1);
	else return(0);
}

extern "C" char *reason_str(int reason) {
    switch(reason) {
	case reason_checktf: return((char *)"reason_checktf");
	case reason_sizetf: return((char *)"reason_sizetf");
	case reason_calltf: return((char *)"reason_calltf");
	case reason_save: return((char *)"reason_save");
	case reason_restart: return((char *)"reason_restart");
	case reason_disable: return((char *)"reason_disable");
	case reason_paramvc: return((char *)"reason_paramvc");
	case reason_synch: return((char *)"reason_synch");
	case reason_finish: return((char *)"reason_finish");
	case reason_reactivate: return((char *)"reason_reactivate");
	case reason_rosynch: return((char *)"reason_rosynch");
	case reason_paramdrc: return((char *)"reason_paramdrc");
	case reason_endofcompile: return((char *)"reason_endofcompile");
	case reason_scope: return((char *)"reason_scope");
	case reason_interactive: return((char *)"reason_interactive");
	case reason_reset: return((char *)"reason_reset");
	case reason_endofreset: return((char *)"reason_endofreset");
	case reason_force: return((char *)"reason_force");
	case reason_release: return((char *)"reason_release");
	case reason_startofsave: return((char *)"reason_startofsave");
	case reason_startofrestart: return((char *)"reason_startofrestart");
	default: return((char *)"reason_type_not_known");
    }
}

extern "C" void dispmon_misc(int data, int reason) {
long long int time = atoll(tf_strgettime());
static long long int nextevent = 0;

    switch (reason) {
	case reason_finish: {
	    static int reported = 0;
	    if (! reported) {
	    	io_printf("$dispmon : misc routine with data %x reason %s at time %lld\n", data, reason_str(reason), time);
    	    }
	    reported++;
	    break;
    	}
	case reason_reactivate:
	case reason_rosynch:
	case reason_synch: 
	case reason_endofcompile:
	case reason_checktf:
	case reason_sizetf:
	case reason_calltf:
	case reason_save:
	case reason_restart:
	case reason_disable:
	case reason_paramvc:
	case reason_paramdrc:
	case reason_scope:
	case reason_interactive:
	case reason_reset:
	case reason_endofreset:
	case reason_force:
	case reason_release:
	case reason_startofsave:
	case reason_startofrestart:
	break;
    }
}

extern "C" void get_no_of_modules() {
        tf_putp(0,num_modules);
}

# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Makefile
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================

include ${DV_ROOT}/tools/env/Makefile.system

.KEEP_STATE:
PROJECT:sh = printenv PROJECT | tr "[:upper:]" "[:lower:]"
CP = cp
RM = rm

CPPFLAGS = -g -w -I. -DNOCIAM
AR = ar
OS=`uname -r | cut -f1 -d.`

############################################################
lib:
	rm -f $(LIB)
	make ${LIB}
############################################################

# C source files to be linted.
CSRCS 	 = monitor.c
monitor.cc: vcsconst.h
vcsconst.h: ${VCS_HOME}/include/vcsuser.h
	grep -w define $? > $@

# Object files to go into the library.
LIB_OBJS = ${CSRCS:%.c=%.o}
TEMPLATE_OBJS = ./Templates.DB/*.o
TEMPLATE_DIRS =  ./Templates.DB

# library
LIB      = libmonitor.a

# table file
TAB      = monitor.tab

############################################################
# below here only generic rules which depend on
# LIB TAB etc.

LOCAL = $(LIB) $(TAB) 
local: $(LOCAL)
kill_local:
	rm -f $(LOCAL)
INSTALL = $(LOCAL:%=../lib/%)
install: $(INSTALL)
kill_install:
	rm -f $(INSTALL)

../lib/%.a: %.a
	$(CP) -f $< $@
	$(AR) -s $@

../lib/%.tab: %.tab
	$(CP) -f $< $@

$(LIB_OBJS):
	$(CCC) $(CPPFLAGS) -c $(CFLAGS) -o $*.o $*.cc

${LIB}: ${LIB_OBJS}
	@if [ $(OS) -ne 5 ]; then $(AR) -s $@; fi; \
	ar rv ${LIB} $(LIB_OBJS)
	rm -rf $(LIB_OBJS) 

#${LIB}: ${LIB}(${LIB_OBJS})
#	$(RANLIB) $@

${VER_LIB}:	${VER_LIB}(${LIB_OBJS})

pli_clean clean:
	${RM} -f ${LIB_OBJS} ${LIB} vcsconst.h

hak:
	set
	env
	echo $(MAKEFLAGS)

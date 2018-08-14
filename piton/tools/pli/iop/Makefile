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

AR = ar
OS=`uname -r | cut -f1 -d.`
CPPFLAGS = -w  -DFIFO_METHOD
CFLAGS += -I${VCS_HOME}/include
CSRCS = iob_main.cc cpx.cc pcx.cc iob.cc
CSRCC = b_ary.c bw_lib.c
# Object files to go into the library.
LIB_OBJS = ${CSRCS:%.cc=%.o}
LIB_OBJC = ${CSRCC:%.c=%.o}
TEMPLATE_OBJS = ./Templates.DB/*.o
TEMPLATE_DIRS = ./Templates.DB
LIB           = libiob.a

all:	$(LIB)
	@if [ -d Templates.DB ]; then make development ; fi
	rm -rf *.o

lib:
	@if [ ! -d Templates.DB ]; then mkdir Templates.DB; fi
	rm -f $(LIB)
	make ${LIB}
$(LIB_OBJC):
	$(CCC) $(CPPFLAGS) -c  $(CFLAGS) -o $*.o $*.c
	ar rv $(LIB) $*.o
$(LIB_OBJS):
	$(CCC) $(CPPFLAGS) -c  $(CFLAGS)  -o $*.o $*.cc
	ar rv $(LIB) $*.o
$(LIB): $(LIB_OBJC) $(LIB_OBJS)
	@if [ $(OS) -ne 5 ]; then $(RANLIB) $@; fi; \
	ar rv $(LIB) $(LIB_OBJC) $(LIB_OBJS)
development: ${LIB}
	ar rv ${LIB} ${TEMPLATE_OBJS}
	rm -rf *.o ${TEMPLATE_DIRS}
clean:
	rm -rf *.o ${LIB} ${TEMPLATE_DIRS}

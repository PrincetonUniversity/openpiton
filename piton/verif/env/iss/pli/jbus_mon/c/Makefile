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

INC_DIR=${DV_ROOT}/verif/env/iss/pli/common/c
CCOPTS=-g -I${INC_DIR} -I${VCS_HOME}/include $(CFLAGS)
DEBUG_OPTS= #-DDBX_DEBUG

libjbus_mon.a : jbus_mon.o jbus.o jbus_interface.o  jbus_tasks.o threaded_pli.o jbus_checker.o
	 rm -f libjbus_mon.a
	 ar rv libjbus_mon.a  threaded_pli.o jbus_mon.o jbus_interface.o jbus_tasks.o jbus.o jbus_checker.o
	 rm -f *.o

build :
	 rm -f *.o
	 make libjbus_mon.a
clean :
	 rm -f *.o
	 rm -f libjbus_mon.a

jbus_mon.o  :     jbus_mon.cc  jbus_tasks.h threaded_pli.h  jbus_mon.h
	 $(CCC) jbus_mon.cc -c   $(CCOPTS) -DD_REENTRANT

jbus_checker.o  :     jbus_checker.cc  jbus_tasks.h threaded_pli.h jbus_checker.h
	 $(CCC) -c jbus_checker.cc  $(CCOPTS) -DD_REENTRANT

jbus.o    :  jbus.cc jbus.h
	 $(CCC) jbus.cc -c   $(CCOPTS) -DD_REENTRANT

jbus_interface.o    :  jbus_interface.cc jbus.h jbus_mon.h jbus_checker.h  jbus_tasks.h
	 $(CCC) jbus_interface.cc -c   $(CCOPTS) -DD_REENTRANT

threaded_pli.o     : threaded_pli.cc
	$(CCC)  -c threaded_pli.cc $(CCOPTS) -DD_REENTRANT

jbus_tasks.o       : jbus_tasks.cc jbus_tasks.h
	$(CCC)  -c jbus_tasks.cc $(CCOPTS) -DD_REENTRANT


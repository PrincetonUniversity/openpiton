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

# Directory paths

TOOL_PLI_DIR = ${DV_ROOT}/tools/pli
VERI_PLI_DIR = ${DV_ROOT}/verif/env/iss/pli

OS = `/bin/uname -s`
CPU = `/bin/uname -p`
BIN_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)
LIB_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)/lib

VERA_INCLUDE = ${DV_ROOT}/tools/pli/get_vera_i
VERA_LINK = ${DV_ROOT}/tools/pli/get_vera_l

# VCS .a libraries

LIB_A	=	$(TOOL_PLI_DIR)/mem/libmem_pli.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli.a \
		$(TOOL_PLI_DIR)/utility/libutility_pli.a \
		$(TOOL_PLI_DIR)/iop/libiob.a \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon.a \
		$(VERI_PLI_DIR)/monitor/c/libmonitor.a \
		$(VERI_PLI_DIR)/sjm/c/libsjm.a \
		$(VERI_PLI_DIR)/common/c/libjpcommon.a \
		$(TOOL_PLI_DIR)/simpledram/libsimpledram.a # trin: new PLI library, fake memory model

# ncverilog .a libraries

LIB_A_NCV=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.a \
		$(TOOL_PLI_DIR)/utility/libutility_ncv.a \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.a \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.a \
		$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.a \
		$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.a \
		$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.a

# ncverilog .so libraries

LIB_SO	=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.so \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.so \
		$(TOOL_PLI_DIR)/utility/libutility_ncv.so \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.so \
		$(TOOL_PLI_DIR)/libpli.so \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.so \
		$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.so \
		$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.so \
		$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.so

NCV_EXE = 	ncsim ncelab


# VCS targets 

vcspli: $(LIB_A)

# NC-Verilog targets 

ncvexe: $(NCV_EXE)
ncvpli: $(LIB_SO) $(NCV_EXE)

# VCS .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli.a:
	(cd $(TOOL_PLI_DIR)/mem; make)
	(rm -f $(LIB_PATH)/libmem_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli.a:
	(cd $(TOOL_PLI_DIR)/socket; make)
	(rm -f $(LIB_PATH)/libsocket_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/utility/libutility_pli.a:
	(cd $(TOOL_PLI_DIR)/utility; make)
	(rm -f $(LIB_PATH)/libutility_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob.a:
	(cd $(TOOL_PLI_DIR)/iop; make)
	(rm -f $(LIB_PATH)/libiob.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon.a:
	(cd $(VERI_PLI_DIR)/jbus_mon/c; make)
	(rm -f $(LIB_PATH)/libjbus_mon.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/monitor/c/libmonitor.a:
	(cd $(VERI_PLI_DIR)/monitor/c; make)
	(rm -f $(LIB_PATH)/libmonitor.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/sjm/c/libsjm.a:
	(cd $(VERI_PLI_DIR)/sjm/c; make)
	(rm -f $(LIB_PATH)/libsjm.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/common/c/libjpcommon.a:
	(cd $(VERI_PLI_DIR)/common/c; make)
	(rm -f $(LIB_PATH)/libjpcommon.a)
	cp $@ $(LIB_PATH)

# princeton trin new
$(TOOL_PLI_DIR)/simpledram/libsimpledram.a:
	(cd $(TOOL_PLI_DIR)/simpledram; make)
	(rm -f $(LIB_PATH)/libsimpledram.a)
	cp $@ $(LIB_PATH)

# ncverilog .so libraries

$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.so:
	(cd $(TOOL_PLI_DIR)/mem; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libmem_pli_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.so:
	(cd $(TOOL_PLI_DIR)/socket; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libsocket_pli_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/utility/libutility_ncv.so:
	(cd $(TOOL_PLI_DIR)/utility; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libutility_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob_ncv.so:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libiob_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.so:
	(cd $(VERI_PLI_DIR)/jbus_mon/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libjbus_mon_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.so:
	(cd $(VERI_PLI_DIR)/monitor/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libmonitor_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.so:
	(cd $(VERI_PLI_DIR)/sjm/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libsjm_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.so:
	(cd $(VERI_PLI_DIR)/common/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libjpcommon_ncv.so)
	cp $@ $(LIB_PATH)

clean:
	make clean_vcs 
	make clean_ncv

clean_vcs:
	rm -rf $(LIB_A)

clean_ncv:
	rm -rf $(LIB_SO) $(LIB_A_NCV) $(NCV_EXE) veriuser.o
	rm -rf $(BIN_PATH)/ncelab $(BIN_PATH)/ncsim

	
ncelab: 
	$(CCC) -o ncelab \
	${NCV_HOME}/tools/inca/lib/ncelab.o \
	-L$(LIB_PATH) -lsocket_pli_ncv \
	-lpli \
	-lutility_ncv \
	-ljbus_mon_ncv \
	-lmonitor_ncv \
	-lmem_pli_ncv \
	-liob_ncv \
	-lsjm_ncv \
	-ljpcommon_ncv \
	-L${NCV_HOME}/tools/inca/lib -lvoids \
	`$(VERA_LINK)` \
	-L${CC_BIN}/../lib/CC4 \
	-L/usr/lib $(NCV_LD_LIBS) -lnsl -ldl -lelf \
	-L/lib -lm -lrt -lc
	(rm -f $(BIN_PATH)/ncelab)
	cp $@ $(BIN_PATH)
	(rm -f ncelab)

ncsim:  
	$(CCC)  -o ncsim \
	${NCV_HOME}/tools/inca/lib/ncsim.o \
	main.cc \
	-L$(LIB_PATH) -lsocket_pli_ncv \
	-lpli \
	-lutility_ncv \
	-ljbus_mon_ncv \
	-lmonitor_ncv \
	-lmem_pli_ncv \
	-liob_ncv \
	-lsjm_ncv \
	-ljpcommon_ncv \
	-L${NCV_HOME}/tools/lib -ludm -lsimcontrol \
	-L${NCV_HOME}/tools/inca/lib -lvoids \
	`$(VERA_LINK)` \
	-L${CC_BIN}/../lib/CC4 \
	-L/usr/lib $(NCV_LD_LIBS) -lnsl -ldl -lelf \
	-L/lib -lm -lrt -lc 
	(rm -f $(BIN_PATH)/ncsim)
	cp $@ $(BIN_PATH)
	(rm -f ncsim)

veriuser.o:	veriuser.c
	$(CC) -c -o veriuser.o veriuser.c -I${NCV_HOME}/tools/include \
	`$(VERA_INCLUDE)` $(NCV_CC_OPTS)

$(TOOL_PLI_DIR)/libpli.so:	veriuser.o
	$(LD) $(NCV_LD_OPTS) -o libpli.so veriuser.o
	(rm -f $(LIB_PATH)/libpli.so)
	cp $@ $(LIB_PATH)

vpi_user.o:	vpi_user.c
	$(CC) -c -o vpi_user.o vpi_user.c -I${NCV_HOME}/tools/include \
	`$(VERA_INCLUDE)` $(NCV_CC_OPTS)

libvpi.so:	vpi_user.o
	$(LD) $(NCV_LD_OPTS) -o libvpi.so vpi_user.o
	(rm -f $(LIB_PATH)/libvpi.so)
	cp $@ $(LIB_PATH)

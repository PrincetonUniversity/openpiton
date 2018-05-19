
include ${DV_ROOT}/tools/env/Makefile.system

AR = ar
OS=`uname -r | cut -f1 -d.`
CPPFLAGS = -w  -DFIFO_METHOD
CFLAGS += -I${VCS_HOME}/include -I../iop
CSRCS = simpledram.cc

LIB_OBJS = ${CSRCS:%.cc=%.o}
LIB_OBJC = ${CSRCC:%.c=%.o}
TEMPLATE_OBJS = ./Templates.DB/*.o
TEMPLATE_DIRS = ./Templates.DB
LIB           = libsimpledram.a

all: $(LIB)
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




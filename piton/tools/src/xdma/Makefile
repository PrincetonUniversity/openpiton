
F1_INCLUDES = -I$(SDK_DIR)/userspace/include

CFLAGS = -D_GNU_SOURCE -std=gnu11 -g -Wall -Werror 
LDLIBS = -lpthread -lbsd -lutil
F1_LDLIBS = -lfpga_mgmt 
INCLUDES = -I./

all: dma_os f1_uart

dma_os: dma_os.c
	gcc $(CFLAGS) -o $@ dma_os.c -lrt  $(LDLIBS) $(INCLUDES)

f1_uart: f1_uart.c f1_uart.h check_f1_env 
	gcc $(CFLAGS) -o $@ f1_uart.c $(F1_LDLIBS) $(LDLIBS) $(F1_INCLUDES) $(INCLUDES) 



check_f1_env:
ifndef SDK_DIR
    $(error SDK_DIR is undefined. Try "source sdk_setup.sh" to set the software environment)
endif

clean:
	rm -rf dma_os f1_uart 



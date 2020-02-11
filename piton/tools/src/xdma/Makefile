CC ?= gcc

all: dma_os

dma_os: dma_os.c
	$(CC) -lrt -o $@ $< -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_LARGE_FILE_SOURCE

clean:
	rm -rf dma_os 


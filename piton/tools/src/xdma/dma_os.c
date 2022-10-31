// Amazon FPGA Hardware Development Kit
//
// Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.

// Modified by Princeton University

#define _XOPEN_SOURCE 500
#include <assert.h>
#include <fcntl.h>
#include <getopt.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

static struct option const long_opts[] = {
    {"data infile", required_argument, NULL, 'f'},
    {"board boardname", required_argument, NULL, 'b'},
    {"help", no_argument, NULL, 'h'},
    {"verbose", no_argument, NULL, 'v'},
    {0, 0, 0, 0}
};

static int verbose = 0;

#define WR_DEVICE "/dev/xdma0_h2c_0"
#define RD_DEVICE "/dev/xdma0_c2h_0"
#define SIZE_DEFAULT (1048576ULL * 8)
#define REVERSE_BYTES_NUM 8

static int dma_file(uint64_t addr, char *filename);
void timespec_sub(struct timespec *t1, struct timespec *t2);
static void usage(const char *name);
uint64_t get_address(char* boardname);
int reverse_bytes(char* array, uint64_t len);

int main(int argc, char *argv[])
{
    int cmd_opt;
    char *infname = NULL;
    char *boardname = NULL;

    while ((cmd_opt =
        getopt_long(argc, argv, "vhf:b:", long_opts,
                NULL)) != -1) {
        switch (cmd_opt) {
        case 0:
            /* long option */
            break;
        case 'f':
            infname = strdup(optarg);
            break;
        case 'b':
            boardname = strdup(optarg);
            break;
        case 'v':
            verbose = 1;
            break;
        case 'h':
        default:
            usage(argv[0]);
            exit(0);
            break;
        }
    }

    if (!infname) {
        fprintf(stderr, "input file name not provided.\n");
        usage(argv[0]);
        return -EINVAL;
    }
    
    if (!boardname) {
        fprintf(stderr, "board name not provided.\n");
        usage(argv[0]);
        return -EINVAL;
    }

    
    uint64_t address = get_address(boardname);
    if (address == -1) {
        fprintf(stderr, "could not detemine offset address in fpga.\n");
        return -EINVAL; 
    }
    
    int rc = dma_file(address, infname);
    if (!rc) {
        fprintf(stdout, "operation completed successfully!\n");
    } else {
        fprintf(stdout, "operation encountered errors, error code %d: %s\n", rc, strerror(-rc));
    }
}

static int dma_file(uint64_t addr, char *infname)
{
    ssize_t rc;
    uint64_t size = SIZE_DEFAULT;

    int fpga_wr_fd = open(WR_DEVICE, O_WRONLY);
    if (fpga_wr_fd < 0) {
        fprintf(stderr, "unable to open device %s.\n", WR_DEVICE);
        perror("open device");
        rc = -EINVAL;
        goto out;
    }

    int fpga_rd_fd = open(RD_DEVICE, O_RDONLY);
    if (fpga_rd_fd < 0) {
        fprintf(stderr, "unable to open device %s.\n", RD_DEVICE);
        perror("open device");
        rc = -EINVAL;
        goto out;
    }

    int infile_fd = open(infname, O_RDONLY);
    if (infile_fd < 0) {
        fprintf(stderr, "unable to open input file %s.\n", infname);
        perror("open input file");
        rc = -EINVAL;
        goto out;
    }

    struct stat stat_buf;
    if (fstat(infile_fd, &stat_buf)) {
        fprintf(stderr, "unable determine size of input file %s.\n", infname);
        perror("input file size");
        rc = -errno;
        goto out;
    }
    uint64_t fsize = stat_buf.st_size;

    char *write_buffer = NULL;
    char *read_buffer = NULL;
    posix_memalign((void **)&write_buffer, 4096 /*alignment */ , size + 4096);
    posix_memalign((void **)&read_buffer, 4096 /*alignment */ , size + 4096);
    if (!read_buffer || !write_buffer) {
        fprintf(stderr, "OOM %lu.\n", size + 4096);
        perror("memory allocation");
        rc = -ENOMEM;
        goto out;
    }
    
    uint64_t file_offset = 0;
    uint64_t remaining = fsize;
    long total_time = 0;
    struct timespec ts_start, ts_end;
    while(remaining) {
        size = remaining > SIZE_DEFAULT ? SIZE_DEFAULT : remaining; 
        remaining -= size;

        rc = pread(infile_fd, write_buffer, size, file_offset);
        if (rc < 0) {
            fprintf(stderr, "couldn't read %ld bytes from infile offset %ld.\n", size, file_offset);
            goto out;
        }

        if (size % REVERSE_BYTES_NUM != 0) {
            size = size + REVERSE_BYTES_NUM - (size % REVERSE_BYTES_NUM);
        }
        rc = reverse_bytes(write_buffer, size);
        if (rc < 0) {
            fprintf(stderr, "couldn't reverse bytes in file.\n");
            goto out;
        }
        
        rc = clock_gettime(CLOCK_MONOTONIC, &ts_start);

        rc = pwrite(fpga_wr_fd, write_buffer, size, addr);
        if (rc < 0) {
            fprintf(stderr, "couldn't write %ld bytes to FPGA address 0x%lx.\n", size, addr);
            goto out;
        }

        rc = clock_gettime(CLOCK_MONOTONIC, &ts_end);
        /* subtract the start time from the end time */
        timespec_sub(&ts_end, &ts_start);
        total_time += ts_end.tv_nsec;
        /* a bit less accurate but side-effects are accounted for */
        if (verbose)
        fprintf(stdout,
            "CLOCK_MONOTONIC %ld.%09ld sec. write %ld bytes to address 0x%lx\n",
            ts_end.tv_sec, ts_end.tv_nsec, size, addr); 
       
        /* verify the correctness of written data */ 
        rc = pread(fpga_rd_fd, read_buffer, size, addr);
        if (rc < 0) {
            fprintf(stderr, "couldn't read %ld bytes from FPGA address 0x%lx.\n", size, addr);
            goto out;
        }
        
        if (memcmp(read_buffer, write_buffer, size)) {
	    printf("%d %d \n", read_buffer[0], write_buffer[0]);
            fprintf(stderr, "read and written data inconsistent.\n");
            rc = -EINVAL;
            goto out;
        }

        addr += size;
        file_offset += size;
    }

    float bw = ((float)fsize)/total_time * 1e9 / (1024ULL * 1024 * 1024);
    if (verbose) {
        printf("** Total time %ld nsec, BW = %f GB/sec \n",
            total_time, bw);
    }
    rc = 0;

out:
    if (fpga_rd_fd >= 0) 
        close(fpga_rd_fd);
    
    if (fpga_wr_fd >= 0) 
        close(fpga_wr_fd);
    
    if (infile_fd >= 0)
        close(infile_fd);
    
    if (read_buffer)
        free(read_buffer);

    if (write_buffer)
        free(write_buffer);

    return rc;
}


static int timespec_check(struct timespec *t)
{
    if ((t->tv_nsec < 0) || (t->tv_nsec >= 1000000000))
        return -1;
    return 0;

}

void timespec_sub(struct timespec *t1, struct timespec *t2)
{
    if (timespec_check(t1) < 0) {
        fprintf(stderr, "invalid time #1: %lld.%.9ld.\n",
            (long long)t1->tv_sec, t1->tv_nsec);
        return;
    }
    if (timespec_check(t2) < 0) {
        fprintf(stderr, "invalid time #2: %lld.%.9ld.\n",
            (long long)t2->tv_sec, t2->tv_nsec);
        return;
    }
    t1->tv_sec -= t2->tv_sec;
    t1->tv_nsec -= t2->tv_nsec;
    if (t1->tv_nsec >= 1000000000) {
        t1->tv_sec++;
        t1->tv_nsec -= 1000000000;
    } else if (t1->tv_nsec < 0) {
        t1->tv_sec--;
        t1->tv_nsec += 1000000000;
    }
}


static void usage(const char *name)
{
    int i = 0;

    fprintf(stdout, "%s\n\n", name);
    fprintf(stdout, "usage: %s [OPTIONS]\n\n", name);
    fprintf(stdout, 
        "Write via SGDMA input from a file.\n\n");

    fprintf(stdout, "  -%c (--%s) filename to read the data from (required).\n",
        long_opts[i].val, long_opts[i].name);
    i++;
    fprintf(stdout, "  -%c (--%s) board (required).\n",
        long_opts[i].val, long_opts[i].name);
    i++;
    fprintf(stdout, "  -%c (--%s) print usage help and exit\n",
        long_opts[i].val, long_opts[i].name);
    i++;
    fprintf(stdout, "  -%c (--%s) verbose output\n",
        long_opts[i].val, long_opts[i].name);
    i++;
}

uint64_t get_address(char* boardname) {
    if (!strcmp("xupp3r", boardname)) {
        return 16ULL * 1024 * 1024 * 1024;
    } else if (!strcmp("f1", boardname)) {
        return 8ULL * 1024 * 1024 * 1024;
    } else {
        fprintf(stderr, "unsupported board: %.10s\n", boardname);
        return -1;
    }
}

void swap_chars(char* a, char* b) {
    char tmp = *a;
    *a = *b;
    *b = tmp;
}

int reverse_bytes(char* array, uint64_t len) {
    if (len % REVERSE_BYTES_NUM != 0) {
        fprintf(stderr, "len not divisible by 8 in reverse_bytes().\n");
        return -EINVAL;
    }
    char* endptr = array + len;
    for(char* ptr = array; ptr < endptr; ptr += REVERSE_BYTES_NUM) {
        swap_chars(ptr+0, ptr+7);
        swap_chars(ptr+1, ptr+6);
        swap_chars(ptr+2, ptr+5);
        swap_chars(ptr+3, ptr+4);
    }
    return 0;
}

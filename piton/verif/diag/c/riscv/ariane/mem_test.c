// On-chip Static memory test
// Author: Alexander Kropotov, Barcelona Supercomputing Center

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// #include <fcntl.h>
// #include <sys/mman.h>

#include "util.h" // for multi-core support

int main(int argc, char ** argv) {

  // synchronization variable
  volatile static uint32_t amo_cnt = 0;
  // synchronize with other cores and wait until it is this core's turn
  while(argv[0][0] != amo_cnt);

  enum {
    RTL_SIMUL = 0,
    MEM_BASEADDR = 0x8040000000,
    MEM_ADRRANGE = RTL_SIMUL ? 512 : 0x00080000,
    ETH_SYST_BASEADDR = 0xfff0800000,
    TX_MEM_CPU_BASEADDR = ETH_SYST_BASEADDR + 0x00100000,
    RX_MEM_CPU_BASEADDR = ETH_SYST_BASEADDR + 0x00200000

    // SDRAM access; to exclude UART access read check below should be changed to "=="
    // MEM_BASEADDR = 0x1ADD0000,
    // MEM_ADRRANGE = 0x4000
  };

  uint8_t volatile* memPtr8 = (uint8_t*)MEM_BASEADDR; //TX_MEM_CPU_BASEADDR, RX_MEM_CPU_BASEADDR
  // int fid = open("/dev/mem", O_RDWR);
  // if( fid < 0 ) {
  //   printf("Could not open /dev/mem \n");
  //   exit(1);
  // }
  // memPtr8 = (uint8_t*)mmap(0, MEM_ADRRANGE, PROT_READ|PROT_WRITE, MAP_SHARED, fid, MEM_BASEADDR);
  // if (memPtr8 == MAP_FAILED) {
  //   printf("Memory mapping of On-chip Static memory failed.\n");
  //   exit(1);
  // }
  uint16_t volatile* memPtr16 = (uint16_t*)memPtr8;
  uint32_t volatile* memPtr32 = (uint32_t*)memPtr8;
  uint64_t volatile* memPtr64 = (uint64_t*)memPtr8;

  size_t const memBytes = MEM_ADRRANGE / sizeof(uint8_t);
  size_t const axiWidth = 512 / 8;

  if (!RTL_SIMUL) {
  printf("-- MEM test --\n");
  printf("-- Hart %d of %d: Test of MEM at addr 0x%lx(virt: 0x%lx) with size %d -- \n",
         argv[0][0], argv[0][1], MEM_BASEADDR, (size_t)memPtr8, MEM_ADRRANGE);
  // printf(" Checking memory with random values from %x to %x \n", 0, RAND_MAX);
  // first clearing previously stored values
  for (size_t addr = 0; addr < memBytes; ++addr) memPtr8 [addr] = 0;
  }

  // filling the memory with some adddress function
  uint64_t val = 0;
  for (uint64_t addr = 0; addr < memBytes; addr += (RTL_SIMUL ? axiWidth:1)) {
    val = (val >> 8) | ((addr ^ (~addr >> 8)) << 56);
    size_t axiWordIdx = addr/axiWidth;
    // changing written data type every wide AXI word
    if (axiWordIdx%4 == 0) memPtr8 [addr  ] = val >> 56;
    if (axiWordIdx%4 == 1) memPtr16[addr/2] = val >> 48;
    if (axiWordIdx%4 == 2) memPtr32[addr/4] = val >> 32;
    if (axiWordIdx%4 == 3) memPtr64[addr/8] = val;
  }

  // checking written values
  val = 0;
  size_t simulInc = 0;
  for (uint64_t addr = 0; addr < memBytes; addr += (RTL_SIMUL ? simulInc:1) ) {
    simulInc = axiWidth+1 + ((addr&4) ? 0 : (addr&3));
    val = (val >> 8) | ((addr ^ (~addr >> 8)) << 56);
    // checking readback using different data types
    if ((addr%8) == 7 && memPtr64[addr/8] !=  val)        {
      printf("ERR:HRT=%d ADR=%lx W64=%lx ", argv[0][0], addr, memPtr64[addr/8]);
      if (RTL_SIMUL) continue;
      printf(" expected = %lx \n", val);
      exit(1);
    }
    if ((addr%4) == 3 && memPtr32[addr/4] != (val >> 32)) {
      printf("ERR:HRT=%d ADR=%lx W32=%x ", argv[0][0], addr, memPtr32[addr/4]);
      if (RTL_SIMUL) continue;
      printf(" expected = %lx \n", val >> 32);
      exit(1);
    }
    if ((addr%2) == 1 && memPtr16[addr/2] != (val >> 48)) {
      printf("ERR:HRT=%d ADR=%lx W16=%x ", argv[0][0], addr, memPtr16[addr/2]);
      if (RTL_SIMUL) continue;
      printf(" expected = %lx \n", val >> 48);
      exit(1);
    }
    if (                 memPtr8 [addr  ] != (val >> 56)) {
      printf("ERR:HRT=%d ADR=%lx BYTE=%x ", argv[0][0], addr, memPtr8[addr]);
      if (RTL_SIMUL) continue;
      printf(" expected = %lx \n", val >> 56);
      exit(1);
    }
  }

  if (!RTL_SIMUL)
  printf("-- MEM test on hart %d of %d harts Passed --\n", argv[0][0], argv[0][1]);


  if (!RTL_SIMUL && 0) {
  printf("-- Hart %d of %d: BW measurement of memcpy() of MEM at addr 0x%lx(virt: 0x%lx) with size %d (100Gb Eth core is required)-- \n",
         argv[0][0], argv[0][1], MEM_BASEADDR, (size_t)memPtr8, MEM_ADRRANGE);

  // Using Timer in 100Gb Eth core
  enum {
    TMRCTR_BASEADDR = ETH_SYST_BASEADDR + 0x00015000,
    XTC_MAX_LOAD_VALUE = 0xFFFFFFFF, // Max supported load value for timer/counter
    // Register Offset Definitions
    // Register offsets within a timer counter, there are multiple timer counters within a single device
    XTC_TCSR_OFFSET = 0 / sizeof(uint32_t),	// Control/Status register
    XTC_TLR_OFFSET  =	4 / sizeof(uint32_t),	// Load register
    XTC_TCR_OFFSET	=	8 / sizeof(uint32_t),	// Timer counter register
    // Control Status Register Bit Definitions
    // Control Status Register bit masks, Used to configure the timer counter device.
    XTC_CSR_CASC_MASK         =	0x00000800, // Cascade Mode
    XTC_CSR_ENABLE_ALL_MASK	  =	0x00000400, // Enables all timer counters 
    XTC_CSR_ENABLE_PWM_MASK   =	0x00000200, // Enables the Pulse Width Modulation
    XTC_CSR_INT_OCCURED_MASK  =	0x00000100, // If bit is set, an interrupt has occured.
							                              // If set and '1' is written to this bit position, bit is	cleared.
    XTC_CSR_ENABLE_TMR_MASK	  =	0x00000080, // Enables only the	specific timer
    XTC_CSR_ENABLE_INT_MASK	  =	0x00000040, // Enables the interrupt output.
    XTC_CSR_LOAD_MASK		      = 0x00000020, // Loads the timer using the load value provided earlier in the Load Register, XTC_TLR_OFFSET.
    XTC_CSR_AUTO_RELOAD_MASK  =	0x00000010, // In compare mode,	configures the timer counter to	reload from the	Load Register.
                                            // The default mode	causes the timer counter to hold when the compare	value is hit.
                                            // In capture	mode, configures the timer counter to not	hold the previous	capture value
                                            // if a new event occurs.
                                            // The default mode cause the	timer counter to hold the capture value until	recognized.
    XTC_CSR_EXT_CAPTURE_MASK  = 0x00000008, // Enables the external input	to the timer counter.
    XTC_CSR_EXT_GENERATE_MASK = 0x00000004, // Enables the external generate output	for the timer.
    XTC_CSR_DOWN_COUNT_MASK		= 0x00000002, // Configures the timer	counter to count down	from start value, the	default is to count	up
    XTC_CSR_CAPTURE_MODE_MASK	= 0x00000001  // Enables the timer to	capture the timer	counter value when the external capture line is	asserted.
                                            // The default mode is compare mode.
  };
  uint32_t volatile* timerPtr = (uint32_t*)TMRCTR_BASEADDR;
  float const TIMER_TICK = 1e-2; //us
  // Timer initialization
  timerPtr[XTC_TLR_OFFSET]  = 0; // Set the compare register to 0.
  timerPtr[XTC_TCSR_OFFSET] = XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK; // Reset the timer and the interrupt.
  timerPtr[XTC_TCSR_OFFSET] = 0; // Release the reset.

  // first clearing previously stored values
  for (size_t addr = 0; addr < memBytes; ++addr) memPtr8 [addr] = 0;
  // filling 1st half of the memory with some adddress function
  uint64_t val = 0;
  for (uint64_t addr = 0; addr < memBytes/2; ++addr) {
    val = (val >> 8) | ((addr ^ (~addr >> 8)) << 56);
    memPtr8[addr] = val >> 56;
  }

  // Resetting and starting Timer
	// Read the current register contents such that only the necessary bits of the register are modified in the following operations
	uint32_t timerCSR = timerPtr[XTC_TCSR_OFFSET];
	// Reset the timer counter such that it reloads from the compare register and the interrupt is cleared simultaneously,
  // the interrupt can only be cleared after reset such that the interrupt condition is cleared
	timerPtr[XTC_TCSR_OFFSET] = XTC_CSR_LOAD_MASK;
  // Remove the reset condition such that the timer counter starts running with the value loaded from the compare register
	timerPtr[XTC_TCSR_OFFSET] = timerCSR | XTC_CSR_ENABLE_TMR_MASK;

  // copying 1st half to the 2nd
  memcpy((void*)(memPtr8 + MEM_ADRRANGE/2), (const void*)(memPtr8), MEM_ADRRANGE/2);

  float ownTime = timerPtr[XTC_TCR_OFFSET] * TIMER_TICK; // Get time
  if (0) {
  // Stop Timer, not needed if time is already captured
  timerCSR = timerPtr[XTC_TCSR_OFFSET]; // Read the current register contents
  timerCSR &= (uint32_t)(~(XTC_CSR_ENABLE_TMR_MASK)); // Disable the timer counter such that it's not running
  timerPtr[XTC_TCSR_OFFSET] = timerCSR; //Write out the updated value to the actual register.
  }

  // checking copied values
  val = 0;
  for (uint64_t addr = 0; addr < memBytes/2; ++addr) {
    val = (val >> 8) | ((addr ^ (~addr >> 8)) << 56);
    if (memPtr8[addr + memBytes/2] !=  (val >> 56)) {
      printf("ERROR memcpy low->high:HRT=%d ADR=%lx BYTE=%x ", argv[0][0], addr + memBytes/2, memPtr8[addr + memBytes/2]);
      printf(" expected = %lx \n", val >> 56);
      exit(1);
    }
  }
  float ownSpeed = memBytes/2 / ownTime * 1e6 / 1024;
  printf("Low->High memcpy time: %ld us, Speed: %ld kB/s \n", (uint64_t)ownTime, (uint64_t)ownSpeed);

  // clearing 1st half of the memory
  for (size_t addr = 0; addr < memBytes/2; ++addr) memPtr8 [addr] = 0;

  // Resetting and starting Timer
	timerCSR = timerPtr[XTC_TCSR_OFFSET];
	timerPtr[XTC_TCSR_OFFSET] = XTC_CSR_LOAD_MASK;
	timerPtr[XTC_TCSR_OFFSET] = timerCSR | XTC_CSR_ENABLE_TMR_MASK;
  // copying 2nd half to the 1st
  memcpy((void*)(memPtr8), (const void*)(memPtr8 + MEM_ADRRANGE/2), MEM_ADRRANGE/2);
  ownTime = timerPtr[XTC_TCR_OFFSET] * TIMER_TICK; // Get time

  // checking copied values
  val = 0;
  for (uint64_t addr = 0; addr < memBytes/2; ++addr) {
    val = (val >> 8) | ((addr ^ (~addr >> 8)) << 56);
    if (memPtr8[addr] !=  (val >> 56)) {
      printf("ERROR memcpy high->low:HRT=%d ADR=%lx BYTE=%x ", argv[0][0], addr, memPtr8[addr]);
      printf(" expected = %lx \n", val >> 56);
      exit(1);
    }
  }
  ownSpeed = memBytes/2 / ownTime * 1e6 / 1024;
  printf("High->Low memcpy time: %ld us, Speed: %ld kB/s \n", (uint64_t)ownTime, (uint64_t)ownSpeed);

  printf("-- BW measurement on hart %d of %d harts Passed --\n", argv[0][0], argv[0][1]);
  }

  // increment atomic counter
  ATOMIC_OP(amo_cnt, 1, add, w);

  return 0;
}

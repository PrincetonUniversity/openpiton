#ifndef _UART_H
#define _UART_H

/*
 * Hypervisor UART console definitions
 */

#define RBR_ADDR UINT32_C(0x1000)
#define THR_ADDR UINT32_C(0x1000)
#define IER_ADDR UINT32_C(0x1004)
#define IIR_ADDR UINT32_C(0x1008)
#define FCR_ADDR UINT32_C(0x1008)
#define LCR_ADDR UINT32_C(0x100c)
#define MCR_ADDR UINT32_C(0x1010)
#define LSR_ADDR UINT32_C(0x1014)
#define MSR_ADDR UINT32_C(0x1018)
#define SCR_ADDR UINT32_C(0x101c)
#define DLL_ADDR UINT32_C(0x1000)
#define DLM_ADDR UINT32_C(0x1004)

/*                      
 * Some Line Status Register (FCR) bits
 */

#define LSR_DRDY UINT32_C(0x1)
#define LSR_BINT UINT32_C(0x10)
#define LSR_THRE UINT32_C(0x20)
#define LSR_TEMT UINT32_C(0x40)

/*
 * Some FIFO Control Register (FCR) bits
 */

#define FCR_FIFO_ENABLE UINT32_C(0x1)
#define FCR_RCVR_RESET  UINT32_C(0x2)
#define FCR_XMIT_RESET  UINT32_C(0x4)

/*
 * Line Control Register settings
 */

#define LCR_DLAB UINT32_C(0x80)
#define LCR_8N1  UINT32_C(0x3)

/*
 * Baud rate settings for Divisor Latch Low (DLL) and Most (DLM)
 */

#define DLL_9600 UINT32_C(0x24)
#define DLM_9600 UINT32_C(0x0)

#define DLL_115200 UINT32_C(0x01)
#define DLM_115200 UINT32_C(0x0)

#endif /* _UART_H */               

// Modified by Princeton University on May 24, 2017
// ------------------------ spiMaster_defines.v ----------------------
// Version 0.0 - April 2008. Created
// Version 1.0 - 3rd June 2008. Fixed synchronisation issue between busClk and
//               spiSysClk. Fixed bug in bus accessible reset. Changed names of
//               fifo related modules to avoid conflict with other IP cores.
// Version 1.1 - 23rd August 2008. Modified reset synchronisation. Fixed bug
//               in wb_ack. Fixed file headers, and added description
// Version 1.2 - 25th October 2008. Modified readWriteSPIWireData to clock data
//               from the SPI bus on the rising edge of SCLK. This increases the
//               tsetup timing margin when reading SPI data. It turns out that the timing
//               was marginal for some SD cards when using a 24Mhz SPI clock.
//               Problem was exacerbated by the fact that the design prevents the
//               final SPI interface Flipflops being pushed into the IO blocks.

`define SPI_MASTER_VERSION_NUM 8'h12

//memoryMap
`define CTRL_STS_REG_BASE 8'h00
`define RX_FIFO_BASE 8'h10
`define TX_FIFO_BASE 8'h20
`define ADDRESS_DECODE_MASK 8'hf0
`define SPI_MASTER_VERSION_REG 8'h00
`define SPI_MASTER_CONTROL_REG 8'h01
`define TRANS_TYPE_REG 8'h02
`define TRANS_CTRL_REG 8'h03
`define TRANS_STS_REG 8'h04
`define TRANS_ERROR_REG 8'h05
`define DIRECT_ACCESS_DATA_REG 8'h06
`define SD_ADDR_7_0_REG 8'h07
`define SD_ADDR_15_8_REG 8'h08
`define SD_ADDR_23_16_REG 8'h09
`define SD_ADDR_31_24_REG 8'h0a
`define SPI_CLK_DEL_REG 8'h0b


//FifoAddresses
`define FIFO_DATA_REG 3'b000
`define FIFO_STATUS_REG 3'b001
`define FIFO_DATA_COUNT_MSB 3'b010
`define FIFO_DATA_COUNT_LSB 3'b011
`define FIFO_CONTROL_REG 3'b100

// MODIFY THIS IF YOU CHANGE SPI LOGIC CLOCK SPEED
`define SLOW_SPI_CLK 8'h18     // startup SPI clk adjuster, aim @ 400KHz.
                               // SLOW_SPI_CLK = (spi_sys_clk / (2 * target_freq)) - 1
`define FAST_SPI_CLK 8'h00     // data SPI clk adjuster, aim @ 20MHz.
                               // FAST_SPI_CLK = (spi_sys_clk / (2 * target_freq)) - 1
`define TWO_MS 10'h9B         // TWO_MS = ((2ms * spi_sys_clk) / 256) - 1
`define TWO_FIFTY_MS 12'h4B   // TWO_FIFTY_MS = ((250ms * spi_sys_clk) / 65536) - 1
`define ONE_HUNDRED_MS 12'h1E // ONE_HUNDRED_MS = ((100ms * spi_sys_clk) / 65536) - 1

`define SD_INIT_START_SEQ_LEN 8'ha0
`define MAX_8_BIT 8'hff

`define WR_RESP_TOUT 12'hf00

`define NO_BLOCK_REQ 2'b00
`define WRITE_SD_BLOCK 2'b01
`define READ_SD_BLOCK 2'b10

`define READ_ERR_SLOT 3:2
`define READ_NO_ERROR 2'b00
`define READ_CMD_ERROR 2'b01
`define READ_TOKEN_ERROR 2'b10

`define WRITE_ERR_SLOT 5:4
`define WRITE_NO_ERROR 2'b00
`define WRITE_CMD_ERROR 2'b01
`define WRITE_DATA_ERROR 2'b10
`define WRITE_BUSY_ERROR 2'b11

`define TRANS_NOT_BUSY 1'b0
`define TRANS_BUSY 1'b1

`define TRANS_START 1'b1
`define TRANS_STOP 1'b0

`define DIRECT_ACCESS 2'b00
`define INIT_SD 2'b01
`define RW_READ_SD_BLOCK 2'b10
`define RW_WRITE_SD_BLOCK 2'b11

`define INIT_ERR_SLOT 1:0
`define INIT_NO_ERROR 2'b00
`define INIT_CMD0_ERROR 2'b01
`define INIT_CMD1_ERROR 2'b10

`define TX_FIFO_DEPTH 512
`define TX_FIFO_ADDR_WIDTH 9
`define RX_FIFO_DEPTH 512
`define RX_FIFO_ADDR_WIDTH 9


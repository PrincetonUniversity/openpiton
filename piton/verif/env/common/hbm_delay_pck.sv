/****************************************************************************
 * hbm_delay_pck.sv
 ****************************************************************************/

package hbm_delay_pck;

	`include "define.tmp.h"
	
	/*
	 * Design						Write Latency (clock cycles)	Read Latency (clock cycles)	Write Throughput (GB/s)	Read Throughput (GB/s)	Bandwidth (GB/s)
HBM in AXI 0 accessing PSCH0	14	                            48	                          0.58	4.65	
HBM in AXI 0 accessing PSCH4	16	                            50	                          0.52	4.65	
HBM in AXI 0 accessing PSCH8	18	                            52	                          0.46	4.65	
HBM in AXI 0 accessing PSCH12	20	                            54	                          0.42	4.65	
HBM in AXI 0 accessing PSCH16	31	                            67	                          0.28	4.65	
HBM in AXI 0 accessing PSCH20	33	                            69	                          0.27	4.65	
HBM in AXI 0 accessing PSCH24	35	                            71	                          0.25	4.65	
HBM in AXI 0 accessing PSCH28	37	                            73	                          0.24	4.65	
	 */	
	
	typedef enum bit [1:0] {HEADER, BODY,TAIL} flit_type_t; 
	
	
	localparam TOTAL_CHAN_NUM = 32;
	localparam CHANNEL_WITH_SAME_DELAY=4;
	localparam TIMERw=10;
	
	localparam INTERLEAVE_ADDR_RANGE= 'h1000_0000;                 //
	/*
	  'h1000_0000;   //256 M (default no interlevaing)
	  'h100_000;     //1   M
	  
	*/
	
	
	
	
    localparam CHAN_GROUP= TOTAL_CHAN_NUM/CHANNEL_WITH_SAME_DELAY;
    localparam MAX_RD_DELAY = 73;  // maximum RD pipeline stage delay	
    localparam DELAYw = $clog2(MAX_RD_DELAY);
	localparam CHAN_GROUPw= $clog2(CHAN_GROUP);	
	localparam CHAN_BASE_ADDR = $clog2(INTERLEAVE_ADDR_RANGE*4); //Each four phy chan has same lat
	
	localparam [DELAYw-1 : 0] HBM_CHAN_DELAYS [CHAN_GROUP-1 : 0]='{73,71,69,67,54,52,50,48};   
	localparam DELAY_FIFO_NUM = 2;
	localparam DELAY_FIFO_DEPTH = 200; // 200/9 = 22 packets 
	
	localparam MIN_LAT = HBM_CHAN_DELAYS [0];
	localparam MAX_LAT = HBM_CHAN_DELAYS [CHAN_GROUP-1];
	localparam LAT_STEP= (MAX_LAT - MIN_LAT)/DELAY_FIFO_NUM; 
	
	
	
	typedef struct packed {
		logic [`NOC_DATA_WIDTH-1:0] flit;
		bit head;
		bit tail;
		logic [TIMERw-1:0] exp_time;		
	} fifo_dat_t ;		
	localparam FIFO_DW = $bits(fifo_dat_t);
	
	
	

endpackage

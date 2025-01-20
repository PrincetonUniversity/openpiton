/* -----------------------------------------------
* Organization   : Barcelona Supercomputing Center
* Author(s)      : Alexander Kropotov
* Email(s)       : alexander.kropotov@bsc.es
* -----------------------------------------------
* Revision History
*  Revision   | Author          | Commit | Description
* -----------------------------------------------
*/


module nocs_axist_bridge #(
  parameter NOC_DAT_WIDTH = 64,
  parameter NOCS = 1,
  parameter AXI_DAT_WIDTH = 256
) (
  input clk, 
  input rst_n, 

  input  [NOCS * NOC_DAT_WIDTH -1:0] dat_in,
  input  [NOCS                 -1:0] dat_in_val,
  output [NOCS                 -1:0] dat_in_yum,

  output [AXI_DAT_WIDTH  -1:0] dat_out,
  output                       dat_out_val,
  output                       dat_out_last,
  output [AXI_DAT_WIDTH/8-1:0] dat_out_keep,
  input                        dat_out_rdy
);


  wire [NOC_DAT_WIDTH -1:0] flit[NOCS],
  wire flit_val[NOCS],

  localparam MAX_NOC_LEN = (1 << `MSG_DATA_SIZE_64B) * 8 / NOC_DAT_WIDTH; //Header length is accounted by effectively doubling max data size
  localparam AXI_NOC_RATIO = AXI_DAT_WIDTH / NOC_DAT_WIDTH;
  assert(AXI_NOC_RATIO > 1); // so far AXI should be at least 2 times wider than NOC  
  localparam FIFO_DEPTH = MAX_NOC_LEN / AXI_NOC_RATIO;

  reg [$clog2(FIFO_DEPTH) :0] wr_ptr[NOCS];
  reg [$clog2(FIFO_DEPTH) :0] rd_ptr[NOCS];
  wire fifos_empt[NOCS];
  wire fifos_full[NOCS];

  generate
  for(genvar noc=0; noc<NOCS; noc=noc+1) begin: yums2rdys
    credit_to_valrdy yum2rdy(
      .clk(clk),
      .reset(~rst_n),

      .data_in (dat_in    [noc * NOC_DAT_WIDTH +: NOC_DAT_WIDTH]),
      .valid_in(dat_in_val[noc]),
      .yummy_in(dat_in_yum[noc]),

      .data_out (flit       [noc]),
      .valid_out(flit_val   [noc]),
      .ready_out(~fifos_full[noc])
    );

    assign fifos_empt[noc] = (wr_ptr[noc] ==  rd_ptr[noc]);
    assign fifos_full[noc] = (wr_ptr[noc] == (rd_ptr[noc] ^ FIFO_DEPTH));
  end
  endgenerate


  reg [AXI_NOC_RATIO][NOC_DAT_WIDTH-1:0] fifos[NOCS][FIFO_DEPTH];
  reg [$clog2(AXI_NOC_RATIO)   :0] flit_num[NOCS];
  reg [$clog2(MAX_NOC_LEN)   -1:0] remain_wrflits[NOCS]; //flits remaining in current packet
  reg [$clog2(NOCS)            :0] noc4wr;

  always_ff @(posedge clk)
    if(~rst_n) begin
      flit_num <= '0;
      remain_wrflits <= '0;
      wr_ptr <= '0;
    end
    else for(noc4wr=0; noc4wr<NOCS; noc4wr=noc4wr+1)
      if (flit_val[noc4wr] & ~fifos_full[noc4wr]) begin
        fifos[noc4wr][wr_ptr[noc4wr]][flit_num[noc4wr]] <= flit[noc4wr];
        if (remain_wrflits[noc4wr] == '0) begin
          remain_wrflits[noc4wr] <= flit[noc4wr][`MSG_LENGTH];
          if (flit[noc4wr][`MSG_LENGTH] == '0) wr_ptr[noc4wr] <= wr_ptr[noc4wr]+1;
        end else begin
          remain_wrflits[noc4wr] <= remain_wrflits[noc4wr] - 1;
          if (remain_wrflits[noc4wr] == 'h1 || flit_num[noc4wr] == AXI_NOC_RATIO-1) begin
            flit_num[noc4wr] <= '0;
            wr_ptr  [noc4wr] <= wr_ptr[noc4wr]+1;
          end
          else flit_num[noc4wr] <= flit_num[noc4wr]+1;
        end
      end


  reg  [$clog2(MAX_NOC_LEN) -1:0] remain_rdflits;
  reg  [$clog2(NOCS)        -1:0] noc4rd;

  always_ff @(posedge clk)
    if(~rst_n) begin
      noc4rd <= '0;
      remain_rdflits <= '0;
      rd_ptr <= '0;
    end
    else
      if (dat_out_val) begin
        if (dat_out_rdy) begin
          if (remain_rdflits == '0)
            remain_rdflits <= fifos[noc4rd][rd_ptr[noc4rd]][0][`MSG_LENGTH]+1;
          else begin 
            rd_ptr[noc4rd] <= rd_ptr[noc4rd]+1;
            if (remain_rdflits > AXI_NOC_RATIO)
              remain_rdflits <= remain_rdflits - AXI_NOC_RATIO;
            else begin
              remain_rdflits <= '0;
              noc4rd <= (noc4rd == NOCS-1) ? '0 : noc4rd+1;
            end
          end
        end
      end else if (remain_rdflits == '0) noc4rd <= (noc4rd == NOCS-1) ? '0 : noc4rd+1;

  assign dat_out = (remain_rdflits == '0) ? noc4rd : fifos[noc4rd][rd_ptr[noc4rd]];  // first goes NOC channel id
  assign dat_out_val = ~fifos_empt[noc4rd];
  assign dat_out_last = (remain_rdflits != '0) && (remain_rdflits <= AXI_NOC_RATIO);
  assign dat_out_keep = ({{(AXI_DAT_WIDTH/8){1'b0}},1'b1} << (remain_rdflits * NOC_DAT_WIDTH/8)) - 'h1;

endmodule

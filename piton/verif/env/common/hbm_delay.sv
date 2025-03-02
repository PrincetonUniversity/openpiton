/****************************************************************************
 * hbm_delay.sv
 ****************************************************************************/

`include "define.tmp.h" 
 
module hbm_delay
        import hbm_delay_pck::*;    
    #(
        parameter HMB_CHAN_NUM=0    
    )(
        input wire clk,
        input wire rst_n,

        input wire noc_valid_in,
        input wire [`NOC_DATA_WIDTH-1:0] noc_data_in,
        output noc_ready_in,
    
        input  [`PHY_ADDR_WIDTH-1:0] msg_addr,
        output reg noc_valid_out,
        output reg [`NOC_DATA_WIDTH-1:0] noc_data_out,
        input wire noc_ready_out
    );
    
    
    
    //calculate  expected read delay based on HBM-Chanel number and message address
    wire [DELAYw-1 : 0] rd_delay;    
    expected_delay #( 
            .HMB_CHAN_NUM(HMB_CHAN_NUM)            
        ) exp_delay (
            .msg_addr_i(msg_addr),
            .rd_delay_o(rd_delay)        
        );    
    
    //get the incomming pck flit type
    wire head_in,tail_in;
    flit_type_detect type_detect (
            .clk           (clk          ), 
            .rst_n         (rst_n        ), 
            .noc_valid_in  (noc_valid_in & noc_ready_in ), 
            .noc_data_in   (noc_data_in  ), 
            .flit_type_o   ({head_in,tail_in} ));
    
    
    // A global clock counter 
    reg [TIMERw-1:0] timer, expected_time_in, rd_delay_tmp,largest_delay_tmp;
    always @(posedge clk) begin 
        if(~rst_n) timer<={TIMERw{1'b0}};
        else  timer <= timer+1'b1;        
    end
    
    always @(*) begin 
        rd_delay_tmp = {TIMERw{1'b0}};
        rd_delay_tmp[DELAYw-1 : 0] = rd_delay;
        largest_delay_tmp = {TIMERw{1'b0}};
        largest_delay_tmp[DELAYw-1 : 0]= MAX_LAT;        
    end
    
    //Expected packet inject time is current time + expected delay
    assign expected_time_in = timer + rd_delay_tmp;

    
    // save input flit in FIFOs according to delay time and FIFO num
    // make sure the selcted fifo wont change until getting the entire packets
    logic [DELAY_FIFO_NUM-1 : 0] fifo_wr,fifo_in_sel, fifo_in_sel1 ,  fifo_in_sel2 ;    
    assign fifo_in_sel = (head_in)? fifo_in_sel1 : fifo_in_sel2; 
    
    
    fifo_dat_t  fifo_in;
    assign fifo_in = '{
            flit: noc_data_in,
            head:head_in,
            tail:tail_in,
            exp_time:expected_time_in
        };
        
    fifo_dat_t  fifo_out [DELAY_FIFO_NUM-1 : 0];
    
        
    
    wire  [DELAY_FIFO_NUM-1 : 0]  granted_queue,inject_rdy,full,not_empty;
    logic [DELAY_FIFO_NUM-1 : 0] fifo_rd;
    
    wire any_grant;
    
    assign noc_ready_in = |(~full & fifo_in_sel);
    
    
    
    genvar i;
    generate 
        for (i=0;i<DELAY_FIFO_NUM;i++) begin : fifo_
            
            //Select FIFO according to delay
            if (DELAY_FIFO_NUM ==1 ) assign fifo_in_sel1[i] = 1'b1;
            else if(i==0)  assign fifo_in_sel1[i] = (rd_delay <  MIN_LAT+ LAT_STEP);
            else if(i!=DELAY_FIFO_NUM-1)    assign fifo_in_sel1[i] = (rd_delay >=  MIN_LAT + (LAT_STEP*i)) && (rd_delay <  MIN_LAT+(LAT_STEP*(i+1)));
            else assign fifo_in_sel1[i] = (rd_delay >=  MIN_LAT+(LAT_STEP*i));
            
            assign fifo_wr[i]= noc_valid_in & fifo_in_sel[i] & noc_ready_in;
        
            /*
            When should injecte the incomming packet:
            1- exp_time <= timer. Expected packet injection time is smaller than current time
            2- exp_time is larger than  current time but its difference is larger than the largest
               expected latency.Here a timer overfllow happend. 
            */    
                
            assign inject_rdy [i] = 
                (fifo_out[i].exp_time <= timer)? 1'b1 : 
                (fifo_out[i].exp_time -timer > largest_delay_tmp)? 1'b1 : 1'b0; 
            
            
            
        
            hbm_delay_fwft_fifo_bram #(
                    .DATA_WIDTH                     (FIFO_DW                ), 
                    .MAX_DEPTH                      (DELAY_FIFO_DEPTH       ), 
                    .IGNORE_SAME_LOC_RD_WR_WARNING  ("NO" )
                ) fwft_fifo (
                    .din                            (fifo_in), 
                    .wr_en                          (fifo_wr[i]                    ), 
                    .rd_en                          (fifo_rd[i]                    ), 
                    .dout                           (fifo_out[i] ), 
                    .full                           (full [i]                      ), 
                    .nearly_full                    (                               ), 
                    .recieve_more_than_0            (not_empty[i]                   ), 
                    .recieve_more_than_1            (                              ), 
                    .reset                          (~rst_n                        ), 
                    .clk                            (clk                           )
                );
        end 
    endgenerate
    
    localparam SELw = $clog2(DELAY_FIFO_NUM);
    wire [SELw-1 : 0] granted_bin;
    
    //If there are more than one FIFO ready to inject packets 
    //arbitrate between them
    thermo_arbiter #(
            .ARBITER_WIDTH(DELAY_FIFO_NUM)
        )
        arbiter
        (
            .request(inject_rdy & not_empty),
            .grant(granted_queue),
            .any_grant(any_grant),
            .clk(clk),
            .reset(~rst_n)
        );
    
    hbm_one_hot_to_bin #(
            .ONE_HOT_WIDTH  (DELAY_FIFO_NUM ), 
            .BIN_WIDTH      (SELw     )
        ) hbm_one_hot_to_bin (
            .one_hot_code   (granted_queue  ), 
            .bin_code       (granted_bin    )
        );
    
    enum bit {IDEAL, LOCK} ps, ns;
    reg [SELw-1 : 0] fifo_out_sel_next,fifo_out_sel;
        
    always @(*) begin
        fifo_rd={DELAY_FIFO_NUM{1'b0}};
        fifo_out_sel_next= fifo_out_sel;
        noc_valid_out=1'b0;
        ns =ps;
        noc_data_out=fifo_out[fifo_out_sel].flit;
        
            case(ps) 
            IDEAL: begin 
                if( any_grant)begin 
                    if(noc_ready_out)begin
                        fifo_out_sel_next = granted_bin;
                        fifo_rd[granted_bin]=1'b1;
                         if(fifo_out[granted_bin].tail==1'b0) ns = LOCK;
                    end                             
                    noc_valid_out=1'b1;
                    noc_data_out=fifo_out[granted_bin].flit;
                        
                end
            end
            LOCK: begin //lock to fifo until sending the entire packet 
                if(not_empty[fifo_out_sel]) begin 
                    if(noc_ready_out)begin
                        fifo_rd[fifo_out_sel]=1'b1;
                        if(fifo_out[fifo_out_sel].tail) ns =IDEAL;
                    end                        
                    noc_valid_out=1'b1;
                    noc_data_out=fifo_out[fifo_out_sel].flit;
                    
                end
            end            
            endcase
        
        
        assert ($onehot0(fifo_wr)) else begin 
           $error("Only one bit in fifo_wr (%b) should be asserted",fifo_wr);
           $stop;     
        end
        
        assert (~(fifo_wr==0 && noc_valid_in===1'b1 && noc_ready_in===1'b1))  else begin 
           $error("No fifo_wr is selected when noc_valid_in is one");
           $stop;     
        end    
    end
    
    
    always @(posedge clk ) begin
        if(~rst_n) begin 
            ps<=IDEAL;
            fifo_out_sel<= 0;
            fifo_in_sel2<= 1;        
        end else begin 
            ps<=ns;    
            fifo_out_sel<= fifo_out_sel_next;
            if (head_in) fifo_in_sel2 <= fifo_in_sel1; 
        end

        if((noc_valid_in & noc_ready_in)==1'b1 && ~$onehot(fifo_in_sel)) begin 
           $error("fifo_in_sel (%b) should be onehot coded when noc_valid_in (%b) is asserted",fifo_in_sel,noc_valid_in);
           $stop;     
        end

        if (noc_valid_out==1'b1 && noc_ready_out==1'b0 && fifo_rd>0 )begin 
           $error("write to NoC when it was not ready");
           $stop;
        end
    end
    
endmodule



module flit_type_detect
        import hbm_delay_pck::*;

    (
        input wire clk,
        input wire rst_n,
        input wire noc_valid_in,
        input wire [`NOC_DATA_WIDTH-1:0] noc_data_in,
        output [1:0]  flit_type_o
    );
        
    flit_type_t flit_type,flit_type_next;
    
    
    
    wire [`MSG_LENGTH_WIDTH-1    :0] length      = noc_data_in [ `MSG_LENGTH ];
    reg [`MSG_LENGTH_WIDTH-1     :0] counter, counter_next;
    reg tail,head;        
        assign flit_type_o = {head,tail};    


    always @ (*) begin 
        counter_next = counter;
        flit_type_next =flit_type;
        tail=1'b0;
        head=1'b0;
        if(noc_valid_in)begin 
            case(flit_type) 
                HEADER:begin                         
                    counter_next = length;
                    head=1'b1;
                    if(length == 0)begin
                        tail=1'b1;
                    end else if (length == 1) begin 
                        flit_type_next = TAIL;
                    end else begin 
                        flit_type_next = BODY;
                    end 
                end
                BODY: begin 
                    counter_next = counter -1'b1;
                    if(counter == 2) begin 
                        flit_type_next = TAIL;
                    end
                end
                TAIL: begin 
                    flit_type_next = HEADER;
                    tail=1'b1;
                end
                default: begin 
                    
                end
            endcase
                    
        end
    end
    
    always @ (posedge clk) begin 
        if(~rst_n) begin 
            flit_type<=HEADER;
            counter<=0;
        end else begin 
            flit_type<=flit_type_next;
            counter<=counter_next;
        end
    end
    
    
    
endmodule    




/****************************
 *         expected_delay
 * *************************/
 
module expected_delay
        import hbm_delay_pck::*;
    #( 
        parameter HMB_CHAN_NUM= 0  
    )(
        input  [`PHY_ADDR_WIDTH-1:0] msg_addr_i,
        output [DELAYw-1 : 0] rd_delay_o        
    );    

    /* verilator lint_off WIDTH */
    localparam [CHAN_GROUPw-1 : 0] HMB_CHAN_GROUP_NUM = HMB_CHAN_NUM/CHANNEL_WITH_SAME_DELAY;
    /* verilator lint_on WIDTH */
    
    logic [DELAYw-1 : 0] delays [CHAN_GROUP-1:0];
    
    assign delays = HBM_CHAN_DELAYS;
      
    
    wire [CHAN_GROUPw-1 : 0] input_chan_num = msg_addr_i[CHAN_BASE_ADDR+ CHAN_GROUPw-1 :CHAN_BASE_ADDR];
    wire [CHAN_GROUPw-1 : 0] channel_distance;
    wire [DELAYw-1 : 0] diff;
    
    /* verilator lint_off CMPCONST */
    assign diff = (input_chan_num > HMB_CHAN_GROUP_NUM)? delays[input_chan_num]-delays[HMB_CHAN_GROUP_NUM] : delays[HMB_CHAN_GROUP_NUM]- delays[input_chan_num];
    /* verilator lint_on CMPCONST */
    
        
    assign rd_delay_o =  delays[0] + diff;

endmodule    



/***********************************

        module bin_to_one_hot 
        

 ************************************/


module hbm_bin_to_one_hot #(
        parameter BIN_WIDTH     =   2,
        parameter ONE_HOT_WIDTH =   2**BIN_WIDTH
    
        )
        (
        input   [BIN_WIDTH-1            :   0]  bin_code,
        output  [ONE_HOT_WIDTH-1        :   0] one_hot_code
        );

    genvar i;
    generate 
        for(i=0; i<ONE_HOT_WIDTH; i=i+1) begin :one_hot_gen_loop
            assign one_hot_code[i] = (bin_code == i[BIN_WIDTH-1         :   0]);
        end
    endgenerate
 
endmodule

/***********************************

        one_hot_to_binary

 ************************************/



module hbm_one_hot_to_bin #(
        parameter ONE_HOT_WIDTH =   4,
        parameter BIN_WIDTH     =  (ONE_HOT_WIDTH>1)? log2(ONE_HOT_WIDTH):1
        )
        (
        input   [ONE_HOT_WIDTH-1        :   0] one_hot_code,
        output  [BIN_WIDTH-1            :   0]  bin_code

        );

  
    function integer log2;
        input integer number; begin   
            log2=(number <=1) ? 1: 0;    
            while(2**log2<number) begin    
                log2=log2+1;    
            end        
        end   
    endfunction // log2 

    localparam MUX_IN_WIDTH =   BIN_WIDTH* ONE_HOT_WIDTH;

    wire [MUX_IN_WIDTH-1        :   0]  bin_temp ;

    genvar i;
    generate 
        if(ONE_HOT_WIDTH>1)begin :if1
            for(i=0; i<ONE_HOT_WIDTH; i=i+1) begin :mux_in_gen_loop
                assign bin_temp[(i+1)*BIN_WIDTH-1 : i*BIN_WIDTH] =  i[BIN_WIDTH-1:0];
            end


            hbm_one_hot_mux #(
                    .IN_WIDTH   (MUX_IN_WIDTH),
                    .SEL_WIDTH  (ONE_HOT_WIDTH)
            
                )
                one_hot_to_bcd_mux
                (
                    .mux_in     (bin_temp),
                    .mux_out        (bin_code),
                    .sel            (one_hot_code)
    
                );
        end else begin :els
            // assign  bin_code = one_hot_code;
            assign  bin_code = 1'b0;
        end

    endgenerate

endmodule


module hbm_one_hot_mux #(
        parameter   IN_WIDTH      = 20,
        parameter   SEL_WIDTH =   5, 
        parameter   OUT_WIDTH = IN_WIDTH/SEL_WIDTH

        )
        (
        input [IN_WIDTH-1       :0] mux_in,
        output[OUT_WIDTH-1  :0] mux_out,
        input[SEL_WIDTH-1   :0] sel

        );

    wire [IN_WIDTH-1    :0] mask;
    wire [IN_WIDTH-1    :0] masked_mux_in;
    wire [SEL_WIDTH-1:0]    mux_out_gen [OUT_WIDTH-1:0]; 
    
    genvar i,j;
    
    //first selector masking
    generate    // first_mask = {sel[0],sel[0],sel[0],....,sel[n],sel[n],sel[n]}
        for(i=0; i<SEL_WIDTH; i=i+1) begin : mask_loop
            assign mask[(i+1)*OUT_WIDTH-1 : (i)*OUT_WIDTH]  =   {OUT_WIDTH{sel[i]} };
        end
        
        assign masked_mux_in    = mux_in & mask;
        
        for(i=0; i<OUT_WIDTH; i=i+1) begin : lp1
            for(j=0; j<SEL_WIDTH; j=j+1) begin : lp2
                assign mux_out_gen [i][j]   =   masked_mux_in[i+OUT_WIDTH*j];
            end
            assign mux_out[i] = | mux_out_gen [i];
        end
    endgenerate
    
endmodule




/*******************
 *
 *    thermo_arbiter RRA
 *
 ********************/

module thermo_gen #(
        parameter WIDTH=16


        )(
        input  [WIDTH-1    :    0]in,
        output [WIDTH-1    :    0]out
        );
    genvar i;
    generate
        for(i=0;i<WIDTH;i=i+1)begin :lp
            assign out[i]= | in[i    :0];    
        end
    endgenerate

endmodule
 
 
 
 
module thermo_arbiter #(
        parameter    ARBITER_WIDTH    =4
        
        )
        (    
        clk, 
        reset, 
        request, 
        grant,
        any_grant
        );

        

    
    input     [ARBITER_WIDTH-1             :    0]    request;
    output    [ARBITER_WIDTH-1            :    0]    grant;
    output                                            any_grant;
    input                                                reset,clk;
    
    
    wire        [ARBITER_WIDTH-1             :    0]    termo1,termo2,mux_out,masked_request,edge_mask;
    reg        [ARBITER_WIDTH-1             :    0]    pr;


    thermo_gen #(
            .WIDTH(ARBITER_WIDTH)
        ) tm1
        (
            .in(request),
            .out(termo1)
        );




    thermo_gen #(
            .WIDTH(ARBITER_WIDTH)
        ) tm2
        (
            .in(masked_request),
            .out(termo2)
        );

    
    assign mux_out=(termo2[ARBITER_WIDTH-1])? termo2 : termo1;
    assign masked_request= request & pr;
    assign any_grant=termo1[ARBITER_WIDTH-1];
    
    always @ (posedge clk )begin 
        if(reset) pr<= {ARBITER_WIDTH{1'b1}};
        else begin 
            if(any_grant) pr<= edge_mask;
        end
    
    end
    
    assign edge_mask= {mux_out[ARBITER_WIDTH-2:0],1'b0};
    assign grant= mux_out ^ edge_mask;



endmodule









/******************
hbm_delay_fwft_fifo_bram
 ********************/

module hbm_delay_fwft_fifo_bram #(
        parameter DATA_WIDTH = 2,
        parameter MAX_DEPTH = 2,
        parameter IGNORE_SAME_LOC_RD_WR_WARNING="YES" // "YES" , "NO"
        )
        (
        input [DATA_WIDTH-1:0] din,     // Data in
        input          wr_en,   // Write enable
        input          rd_en,   // Read the next word
        output [DATA_WIDTH-1:0]  dout,    // Data out
        output         full,
        output         nearly_full,
        output         recieve_more_than_0,
        output         recieve_more_than_1,
        input          reset,
        input          clk

        );


    function integer log2;
        input integer number; begin
            log2=(number <=1) ? 1: 0;
            while(2**log2<number) begin
                log2=log2+1;
            end
        end
    endfunction // log2



    localparam DEPTH_DATA_WIDTH = log2(MAX_DEPTH +1);

    reg  valid_next;
    wire valid;
    wire pass_din_to_out_reg, out_reg_wr_en, bram_out_is_valid_next;
    wire bram_out_is_valid;
    wire bram_empty, bram_rd_en, bram_wr_en;
    wire [DATA_WIDTH-1 : 0] bram_dout;
    wire [DATA_WIDTH-1 : 0] out_reg;
    reg  [DATA_WIDTH-1 : 0] out_reg_next;

    assign dout = (bram_out_is_valid)?  bram_dout : out_reg;


    assign  pass_din_to_out_reg = (wr_en & ~valid)| // a write has been recived while the reg_flit is not valid
        (wr_en & valid & bram_empty & rd_en); //or its valid but bram is empty and its got a read request

    assign bram_rd_en = (rd_en & ~bram_empty);
    assign bram_wr_en = (pass_din_to_out_reg)?  1'b0 :wr_en ; //make sure not write on the Bram if the reg fifo is empty


    assign  out_reg_wr_en = pass_din_to_out_reg | bram_out_is_valid;

    assign  bram_out_is_valid_next = (bram_rd_en )? (rd_en &  ~bram_empty): 1'b0;


    


    hbm_delay_bram_based_fifo  #(
            .Dw(DATA_WIDTH),//data_width
            .B(MAX_DEPTH)// buffer num
        )bram_fifo(
            .din(din),
            .wr_en(bram_wr_en),
            .rd_en(bram_rd_en),
            .dout(bram_dout),
            .full(),
            .nearly_full(),
            .empty(bram_empty),
            .reset(reset),
            .clk(clk)
        );

    wire [DEPTH_DATA_WIDTH-1         :   0]  depth;
    reg  [DEPTH_DATA_WIDTH-1         :   0]  depth_next;


    hbm_delay_register #(.W(DATA_WIDTH)      ) reg1 (.in(out_reg_next           ), .out(out_reg), .reset(reset), .clk(clk));
    hbm_delay_register #(.W(1)               ) reg2 (.in(valid_next             ), .out(valid), .reset(reset), .clk(clk));
    hbm_delay_register #(.W(1)               ) reg3 (.in(bram_out_is_valid_next ), .out(bram_out_is_valid), .reset(reset), .clk(clk));
    hbm_delay_register #(.W(DEPTH_DATA_WIDTH)) reg4 (.in(depth_next             ), .out(depth), .reset(reset), .clk(clk));

   always @(*) begin
        valid_next = valid;
        if(depth_next == {DEPTH_DATA_WIDTH{1'b0}}) valid_next =1'b0;
        else if(out_reg_wr_en) valid_next =1'b1;
        else if( bram_empty & rd_en) valid_next =1'b0;
    end


    always @(*) begin
        out_reg_next = out_reg;
        depth_next   = depth;
        if (wr_en & ~rd_en) depth_next =   depth + 1'h1;
        else if (~wr_en & rd_en) depth_next  = depth - 1'h1;
        if(pass_din_to_out_reg) out_reg_next = din;
        else if(bram_out_is_valid)   out_reg_next = bram_dout;
    end




    wire empty;
    assign full                         = depth == MAX_DEPTH [DEPTH_DATA_WIDTH-1            :   0];
    assign nearly_full              = depth >= MAX_DEPTH [DEPTH_DATA_WIDTH-1            :   0] -1'b1;
    assign empty     = depth == {DEPTH_DATA_WIDTH{1'b0}};
    assign recieve_more_than_0  = ~ empty;
    assign recieve_more_than_1  = ~( depth == {DEPTH_DATA_WIDTH{1'b0}} ||  depth== 1 );




    //synthesis translate_off
    //synopsys  translate_off
    always @(posedge clk)
    begin
        if (wr_en & ~rd_en & full) begin
            $display("%t: ERROR: Attempt to write to full FIFO:FIFO size is %d. %m",$time,MAX_DEPTH);
            $finish;
        end
        /* verilator lint_off WIDTH */
        if (rd_en & !recieve_more_than_0 & IGNORE_SAME_LOC_RD_WR_WARNING == "NO") begin
            $display("%t ERROR: Attempt to read an empty FIFO: %m", $time);
            $finish;
        end
        if (rd_en & ~wr_en & !recieve_more_than_0 & (IGNORE_SAME_LOC_RD_WR_WARNING == "YES")) begin
            $display("%t ERROR: Attempt to read an empty FIFO: %m", $time);
            $finish;
        end
        /* verilator lint_on WIDTH */
    end // always @ (posedge clk)

    //synopsys  translate_on
    //synthesis translate_on




endmodule



/**********************************

            bram_based_fifo

 *********************************/


module hbm_delay_bram_based_fifo  #(
        parameter Dw = 72,//data_width
        parameter B  = 10// buffer num
        )(
        din,
        wr_en,
        rd_en,
        dout,
        full,
        nearly_full,
        empty,
        reset,
        clk
        );


    function integer log2;
        input integer number; begin
            log2=(number <=1) ? 1: 0;
            while(2**log2<number) begin
                log2=log2+1;
            end
        end
    endfunction // log2

    localparam  B_1 = B-1,
        Bw = log2(B),
        DEPTHw=log2(B+1);
    localparam  [Bw-1   :   0] Bint =   B_1[Bw-1    :   0];

    input [Dw-1:0] din;     // Data in
    input          wr_en;   // Write enable
    input          rd_en;   // Read the next word

    output reg [Dw-1:0]  dout;    // Data out
    output         full;
    output         nearly_full;
    output         empty;

    input          reset;
    input          clk;



    reg [Dw-1       :   0] queue [B-1 : 0] /* synthesis ramstyle = "no_rw_check" */;
    reg [Bw- 1      :   0] rd_ptr;
    reg [Bw- 1      :   0] wr_ptr;
    reg [DEPTHw-1   :   0] depth;

    // Sample the data
    always @(posedge clk)
    begin
        if (wr_en)
            queue[wr_ptr] <= din;
        if (rd_en)
            dout <=   queue[rd_ptr];
    end

    always @(posedge clk)
    begin
        if (reset) begin
            rd_ptr <= {Bw{1'b0}};
            wr_ptr <= {Bw{1'b0}};
            depth  <= {DEPTHw{1'b0}};
        end
        else begin
            if (wr_en) wr_ptr <= (wr_ptr==Bint)? {Bw{1'b0}} : wr_ptr + 1'b1;
            if (rd_en) rd_ptr <= (rd_ptr==Bint)? {Bw{1'b0}} : rd_ptr + 1'b1;
            if (wr_en & ~rd_en) depth <=  depth + 1'b1;
            else if (~wr_en & rd_en) depth <=  depth - 1'b1;
        end
    end

    //assign dout = queue[rd_ptr];
    localparam  [DEPTHw-1   :   0] Bint2 =   B_1[DEPTHw-1   :   0];


    assign full = depth == B [DEPTHw-1   :   0];
    assign nearly_full = depth >=Bint2; //  B-1
    assign empty = depth == {DEPTHw{1'b0}};

    //synthesis translate_off
    //synopsys  translate_off
    always @(posedge clk)
    begin
        if(~reset)begin
            if (wr_en && depth == B[DEPTHw-1   :   0] && !rd_en) begin
                $display(" %t: ERROR: Attempt to write to full FIFO: %m",$time);
                $finish;
            end
            if (rd_en && depth == {DEPTHw{1'b0}}) begin
                $display("%t: ERROR: Attempt to read an empty FIFO: %m",$time);
                $finish;
            end
        end//~reset
    end
    //synopsys  translate_on
    //synthesis translate_on

endmodule // fifo



module hbm_delay_register
        #(
        parameter W=1,
        parameter  RESET_TO={W{1'b0}}

        )(
        input [W-1:0] in,
        input reset,
        input clk,
        output [W-1:0] out
        );

    hbm_register_reset_init #(
            .W(W)
        )reg1(
            .in(in),
            .reset(reset),
            .clk(clk),
            .out(out),
            .reset_to(RESET_TO[W-1 : 0])
        );
endmodule





module hbm_register_reset_init 
        #(
        parameter W=1       
        )( 
        input [W-1:0] in,
        input reset,    
        input clk,      
        output reg [W-1:0] out,
        input [W-1 : 0] reset_to
        );
    
    
    always @ (posedge clk )begin 
        if(reset)   out<=reset_to;
        else        out<=in;
    end   
        
endmodule










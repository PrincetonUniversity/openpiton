`include "uart16550_define.vh"

module uart_reseter(
(* mark_debug = "true" *)	input axi_clk, 
(* mark_debug = "true" *)	input axi_rst_n, 

	(* mark_debug = "true" *) input [31:0] axi_rdata,
	(* mark_debug = "true" *) input        axi_rvalid,
	(* mark_debug = "true" *) input        axi_rready,
	(* mark_debug = "true" *) 	input [12:0] axi_araddr, 
	(* mark_debug = "true" *) 	input axi_arvalid, 
	(* mark_debug = "true" *) 	input axi_arready, 

	(* mark_debug = "true" *) output uart_rst_out_n
);

localparam reset_sequence = 64'h9a337213af278f34;

wire axi_rgo = axi_rvalid & axi_rready;
wire axi_argo = axi_arvalid & axi_arready;

(* mark_debug = "true" *) reg [4:0] state;
localparam IDLE = 4'd0;
localparam BYTE1 = 4'd1;
localparam BYTE2 = 4'd2;
localparam BYTE3 = 4'd3;
localparam BYTE4 = 4'd4;
localparam BYTE5 = 4'd5;
localparam BYTE6 = 4'd6;
localparam BYTE7 = 4'd7;
localparam RESET = 4'd8;

(* mark_debug = "true" *) reg waiting;

assign uart_rst_out_n = !(state == RESET);

always @(posedge axi_clk) begin
	if(~axi_rst_n) begin
		state <= 0;
	end 
	else begin
		if (waiting & axi_rgo) begin
			case (state)
				IDLE: begin
					if (axi_rdata[7:0] == reset_sequence[7:0])
						state <= BYTE1;
					else 
						state <= IDLE;
				end
				BYTE1: begin
					if (axi_rdata[7:0] == reset_sequence[15:8])						
						state <= BYTE2;
					else 
						state <= IDLE;
				end
				BYTE2: begin
					if (axi_rdata[7:0] == reset_sequence[23:16])
						state <= BYTE3;
					else 
						state <= IDLE;
				end
				BYTE3: begin
					if (axi_rdata[7:0] == reset_sequence[31:24])
						state <= BYTE4;
					else 
						state <= IDLE;
				end
				BYTE4: begin
					if (axi_rdata[7:0] == reset_sequence[39:32])
						state <= BYTE5;
					else 
						state <= IDLE;
				end
				BYTE5: begin
					if (axi_rdata[7:0] == reset_sequence[47:40])
						state <= BYTE6;
					else 
						state <= IDLE;
				end
				BYTE6: begin
					if (axi_rdata[7:0] == reset_sequence[55:48])
						state <= BYTE7;
					else 
						state <= IDLE;
				end
				BYTE7: begin
					if (axi_rdata[7:0] == reset_sequence[63:56])
						state <= RESET;
					else 
						state <= IDLE;
				end
				RESET: begin
					state <= RESET;
				end
				default: begin
					state <= IDLE;
				end
			endcase // state
		end
		else begin
			state <= state;
		end
	end
end



always @(posedge axi_clk) begin
	if(~axi_rst_n) begin
		waiting <= 0;
	end 
	else begin
		if (axi_argo & (axi_araddr == `UART_RBR) & !waiting) 
			waiting <= 1;
		else if (axi_rgo & waiting)
			waiting <= 0;
		else
			waiting <= waiting; //should never be here
	end
end

endmodule
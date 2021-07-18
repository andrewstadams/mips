module PC
(
	input wire clk,
	input wire [31:0]in_counter,
	output reg [31:0]out_counter
);

	always @(posedge clk)
		begin
			out_counter <= in_counter;
		end
		
	initial
		begin
			out_counter <= 32'd0;
		end
		
endmodule 
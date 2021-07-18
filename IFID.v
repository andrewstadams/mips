module IFID
(
	input wire clk,
	input wire [31:0]in_AddFour,
	input wire [31:0]in_Instruction,
	output reg [31:0]out_AddFour,
	output reg [31:0]out_Instrucion
);

	always @(posedge clk)
		begin
			out_AddFour    <= in_AddFour;
			out_Instrucion <= in_Instruction;
		end

endmodule 
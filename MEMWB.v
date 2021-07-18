module MEMWB
(
	input wire clk,
	input wire in_Jump,
	input wire in_MemtoReg,
	input wire in_RegWrite,
	input wire [27:0]in_JumpAddress,
	input wire [31:0]in_AddFour,
	input wire [31:0]in_Adder,
	input wire in_ANDGate,
	input wire [31:0]in_ReadData,
	input wire [31:0]in_ALU,
	input wire [ 4:0]in_WriteRegister,
	output reg out_Jump,
	output reg out_MemtoReg,
	output reg out_RegWrite,
	output reg [27:0]out_JumpAddress,
	output reg [31:0]out_AddFour,
	output reg [31:0]out_Adder,
	output reg out_ANDGate,
	output reg [31:0]out_ReadData,
	output reg [31:0]out_ALU,
	output reg [ 4:0]out_WriteRegister
);

	always @(posedge clk)
		begin
			out_Jump          <= in_Jump;
			out_MemtoReg      <= in_MemtoReg;
			out_RegWrite      <= in_RegWrite;
			out_JumpAddress   <= in_JumpAddress;
			out_AddFour       <= in_AddFour;
			out_Adder         <= in_Adder;
			out_ANDGate       <= in_ANDGate;
			out_ReadData      <= in_ReadData;
			out_ALU           <= in_ALU;
			out_WriteRegister <= in_WriteRegister;
		end

endmodule 
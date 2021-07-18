module EXMEM
(
	input wire clk,
	input wire in_Jump,
	input wire in_Branch,
	input wire in_MemRead,
	input wire in_MemtoReg,
	input wire in_MemWrite,
	input wire in_RegWrite,
	input wire [27:0]in_JumpAddress,
	input wire [31:0]in_AddFour,
	input wire [31:0]in_Adder,
	input wire in_Zero,
	input wire [31:0]in_ALU,
	input wire [31:0]in_ReadData2,
	input wire [ 4:0]in_WriteRegister,
	output reg out_Jump,
	output reg out_Branch,
	output reg out_MemRead,
	output reg out_MemtoReg,
	output reg out_MemWrite,
	output reg out_RegWrite,
	output reg [27:0]out_JumpAddress,
	output reg [31:0]out_AddFour,
	output reg [31:0]out_Adder,
	output reg out_Zero,
	output reg [31:0]out_ALU,
	output reg [31:0]out_ReadData2,
	output reg [ 4:0]out_WriteRegister
);

	always @(posedge clk)
		begin
			out_Jump          <= in_Jump;
			out_Branch        <= in_Branch;
			out_MemRead       <= in_MemRead;
			out_MemtoReg      <= in_MemtoReg;
			out_MemWrite      <= in_MemWrite;
			out_RegWrite      <= in_RegWrite;
			out_JumpAddress   <= in_JumpAddress;
			out_AddFour       <= in_AddFour;
			out_Adder         <= in_Adder;
			out_Zero          <= in_Zero;
			out_ALU           <= in_ALU;
			out_ReadData2     <= in_ReadData2;
			out_WriteRegister <= in_WriteRegister;
		end

endmodule 
module IDEX
(
	input wire clk,
	input wire in_Jump,
	input wire in_Branch,
	input wire in_MemRead,
	input wire in_MemtoReg,
	input wire [ 5:0]in_ALUOp,
	input wire in_MemWrite,
	input wire in_ALUSrc,
	input wire in_RegWrite,
	input wire [27:0]in_JumpAddress,
	input wire [31:0]in_AddFour,
	input wire [31:0]in_ReadData1,
	input wire [31:0]in_ReadData2,
	input wire [31:0]in_SignExtend,
	input wire [ 4:0]in_WriteRegister,
	input wire [ 5:0]in_Function,
	output reg out_Jump,
	output reg out_Branch,
	output reg out_MemRead,
	output reg out_MemtoReg,
	output reg [ 5:0]out_ALUOp,
	output reg out_MemWrite,
	output reg out_ALUSrc,
	output reg out_RegWrite,
	output reg [27:0]out_JumpAddress,
	output reg [31:0]out_AddFour,
	output reg [31:0]out_ReadData1,
	output reg [31:0]out_ReadData2,
	output reg [31:0]out_SignExtend,
	output reg [ 4:0]out_WriteRegister,
	output reg [ 5:0]out_Function
);

	always @(posedge clk)
		begin
			out_Jump          <= in_Jump;
			out_Branch        <= in_Branch;
			out_MemRead       <= in_MemRead;
			out_MemtoReg      <= in_MemtoReg;
			out_ALUOp         <= in_ALUOp;
			out_MemWrite      <= in_MemWrite;
			out_ALUSrc        <= in_ALUSrc;
			out_RegWrite      <= in_RegWrite;
			out_JumpAddress   <= in_JumpAddress;
			out_AddFour       <= in_AddFour;
			out_ReadData1     <= in_ReadData1;
			out_ReadData2     <= in_ReadData2;
			out_SignExtend    <= in_SignExtend;
			out_WriteRegister <= in_WriteRegister;
			out_Function      <= in_Function;
		end

endmodule 
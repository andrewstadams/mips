module Control
(
	input wire [5:0]Opcode,
	output reg RegDst,
	output reg Jump,
	output reg Branch,
	output reg MemRead,
	output reg MemtoReg,
	output reg [5:0]ALUOp,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite
);

	always @(*)
		begin
			case (Opcode)
				6'b000000: // R-Type Instructions
					begin
						RegDst   <= 1'b1;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp    <= 6'b000000;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b0;
						RegWrite <= 1'b1;
					end
				6'b001000: // ADDI
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp    <= 6'b100000;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b1;
					end
				6'b001100: // ANDI
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp    <= 6'b100100;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b1;
					end
				6'b001111: // ORI
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp    <= 6'b100101;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b1;
					end
				6'b001010: // SLTI
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b0;
						ALUOp    <= 6'b101010;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b1;
					end
				6'b100011: // LW
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b1;
						MemtoReg <= 1'b1;
						ALUOp    <= 6'b100000;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b1;
					end
				6'b101011: // SW
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b1;
						ALUOp    <= 6'b100000;
						MemWrite <= 1'b1;
						ALUSrc   <= 1'b1;
						RegWrite <= 1'b0;
					end
				6'b000100: // BEQ
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b1;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b1;
						ALUOp    <= 6'b100010;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b0;
						RegWrite <= 1'b0;
					end
				6'b000101: // BNE
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b0;
						Branch   <= 1'b1;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b1;
						ALUOp    <= 6'b111111;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b0;
						RegWrite <= 1'b0;
					end
				6'b000010: // J
					begin
						RegDst   <= 1'b0;
						Jump     <= 1'b1;
						Branch   <= 1'b0;
						MemRead  <= 1'b0;
						MemtoReg <= 1'b1;
						ALUOp    <= 6'b100000;
						MemWrite <= 1'b0;
						ALUSrc   <= 1'b0;
						RegWrite <= 1'b0;
					end
				default: // Undefined
					begin
						RegDst   <= 1'bx;
						Jump     <= 1'bx;
						Branch   <= 1'bx;
						MemRead  <= 1'bx;
						MemtoReg <= 1'bx;
						ALUOp    <= 6'bxxxxxx;
						MemWrite <= 1'bx;
						ALUSrc   <= 1'bx;
						RegWrite <= 1'bx;
					end
			endcase
		end

endmodule 
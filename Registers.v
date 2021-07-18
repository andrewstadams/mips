module Registers
(
	input  wire RegWrite,
	input  wire [ 4:0]ReadRegister1,
	input  wire [ 4:0]ReadRegister2,
	input  wire [ 4:0]WriteRegister,
	input  wire [31:0]WriteData,
	output wire [31:0]ReadData1,
	output wire [31:0]ReadData2
);

	reg [31:0] Registers [0:31];
	reg [ 4:0] address_reg_1;
	reg [ 4:0] address_reg_2;
	
	always @(*)
		begin
			if (RegWrite)
				begin
					Registers[WriteRegister] <= WriteData;
					address_reg_1 <= ReadRegister1;
					address_reg_2 <= ReadRegister2;
				end
			else
				begin
					address_reg_1 <= ReadRegister1;
					address_reg_2 <= ReadRegister2;
				end
		end
		
	assign ReadData1 = Registers[address_reg_1];
	assign ReadData2 = Registers[address_reg_2];
	
	initial
		begin
			Registers[0] <= 32'd0;
		end

endmodule 
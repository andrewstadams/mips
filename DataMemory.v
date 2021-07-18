module DataMemory
(
	input  wire MemWrite,
	input  wire MemRead,
	input  wire [31:0]Address,
	input  wire [31:0]WriteData,
	output wire [31:0]ReadData
);

	reg [31:0] Memory [0:63];
	reg [31:0] address_reg;
	 
	always @(*)
		begin
			if (MemWrite) 
				begin
					Memory[Address] <= WriteData;
				end
			if (MemRead) 
				begin
					address_reg <= Address;
				end
		end
	
	assign ReadData = Memory[address_reg];
	
	initial
		begin
			Memory[0] <= -32'd1;
			Memory[1] <= -32'd4;
			Memory[2] <= -32'd5;
		end
		
endmodule 
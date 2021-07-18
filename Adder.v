module Adder
(
	input wire [31:0]addend1,
	input wire [31:0]addend2,
	output reg [31:0]sum
);

	always @(*)
		begin
			sum <= addend1 + addend2;
		end
		
endmodule 
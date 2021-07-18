module Add4
(
	input wire [31:0]addend,
	output reg [31:0]sum
);

	always @(*)
		begin
			sum <= addend + 32'd4;
		end

endmodule 
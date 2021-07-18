module ShiftLeft32
(
	input wire [31:0]number,
	output reg [31:0]number_shifted
);

	always @(*)
		begin
			number_shifted <= number * 32'd4;
		end

endmodule 
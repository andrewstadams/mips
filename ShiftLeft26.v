module ShiftLeft26
(
	input wire [25:0]number,
	output reg [27:0]number_shifted
);

	always @(*)
		begin
			number_shifted <= number * 26'd4;
		end

endmodule 
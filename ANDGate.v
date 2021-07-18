module ANDGate
(
	input wire input1,
	input wire input2,
	output reg result
);

	always @(*)
		begin
			result <= input1 & input2;
		end

endmodule 
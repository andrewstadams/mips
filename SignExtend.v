module SignExtend
(
	input wire [15:0]number,
	output reg [31:0]number_extended
);

	always @(*)
		begin
			if (number[15] == 0) 
				begin
					number_extended <= {16'b0000000000000000, number};
				end
			else if (number[15] == 1) 
				begin
					number_extended <= {16'b1111111111111111, number};
				end
			else 
				begin
					number_extended <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
				end
		end

endmodule 
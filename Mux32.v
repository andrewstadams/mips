module Mux32
(
	input wire selector,
	input wire [31:0]input0,
	input wire [31:0]input1,
	output reg [31:0]result
);

	always @(*)
		begin
			case (selector)
				1'b0: 
					begin
						result <= input0;
					end
				1'b1: 
					begin
						result <= input1;
					end
				default:
					begin
						result <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
					end
			endcase
		end

endmodule 
module Mux5
(
	input wire selector,
	input wire [4:0]input0,
	input wire [4:0]input1,
	output reg [4:0]result
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
						result <= 5'bxxxxx;
					end
			endcase
		end

endmodule 
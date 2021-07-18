module ALUControl
(
	input wire [5:0]Function,
	input wire [5:0]ALUOp,
	output reg [5:0]selector
);

	always @(*)
		begin
			case (ALUOp)
				6'b000000: 
					begin
						selector <= Function;
					end
				default:
					begin
						selector <= ALUOp;
					end
			endcase
		end

endmodule 
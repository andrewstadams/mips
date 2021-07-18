module ALU
(
	input wire [ 5:0]selector,
	input wire [31:0]input1,
	input wire [31:0]input2,
	output reg [31:0]result,
	output reg zero
);
	
	always @(*)
		begin
			case (selector)
				6'b100000: // ADD
					begin
						result <=   input1 + input2;
					end
				6'b100010: // SUB
					begin
						result <=   input1 - input2;
					end
				6'b011010: // DIV
					begin
						result <=   input1 / input2;
					end
				6'b011000: // MULT
					begin
						result <=   input1 * input2;
					end
				6'b100100: // AND
					begin
						result <=   input1 & input2;
					end
				6'b100101: // OR
					begin
						result <=   input1 | input2;
					end
				6'b100111: // NOR
					begin
						result <= ~(input1 | input2);
					end
				6'b100110: // XOR
					begin
						result <=   input1 ^ input2;
					end
				6'b101010: // SLT
					begin 										
						if (input1 < input2) 
							begin
								result <= 32'b1;
							end
						else 
							begin
								result <= 32'b0;
							end
					end
				6'b111111: // EQ
					begin
						if (input1 == input2) 
							begin
								result <= 32'b1;
							end
						else 
							begin
								result <= 32'b0;
							end
					end
				default: // Undefined
					begin
						result <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
					end
			endcase
		end
		
	always @(result)
		begin
			if (result == 32'b0)
				begin
					zero <= 1'b1;
				end
			else 
				begin
					zero <= 1'b0;
				end
		end

endmodule 
`timescale 1ns/1ns

module MIPS_tb();

	reg clk;
	
	MIPS duv
	(
		.clk (clk)
	);
	
	initial
		begin
			clk = 1'b0;
			forever #50 clk = ~clk;
		end
		
	initial
		begin
			#20000
			$stop;
		end

endmodule 
module InstructionMemory
(
	input wire [31:0]counter,
	output reg [31:0]instruction
);

	reg [7:0] Memory [0:511];
	
	always @(*)
		begin
			instruction <= {Memory[counter], Memory[counter+1], Memory[counter+2], Memory[counter+3]};
		end
		
	initial
		begin
			/* FILE */
			// $readmemb("C:\\Users\\...\\DataInit.list", Memory);
			
			/* LOCAL */
			// ADDI $1 $0 #1
			Memory[0]   <= 8'b00100000;
			Memory[1]   <= 8'b00000001;
			Memory[2]   <= 8'b00000000;
			Memory[3]   <= 8'b00000001;
			// LW $2 $0 #2
			Memory[4]   <= 8'b10001100;
			Memory[5]   <= 8'b00000010;
			Memory[6]   <= 8'b00000000;
			Memory[7]   <= 8'b00000010;
			// ADDI $3 $0 #6
			Memory[8]   <= 8'b00100000;
			Memory[9]   <= 8'b00000011;
			Memory[10]  <= 8'b00000000;
			Memory[11]  <= 8'b00000110;
			// LW $4 $0 #0
			Memory[12]  <= 8'b10001100;
			Memory[13]  <= 8'b00000100;
			Memory[14]  <= 8'b00000000;
			Memory[15]  <= 8'b00000000;
			// ADDI $5 $0 #2
			Memory[16]  <= 8'b00100000;
			Memory[17]  <= 8'b00000101;
			Memory[18]  <= 8'b00000000;
			Memory[19]  <= 8'b00000010;
			// LW $6 $0 #1
			Memory[20]  <= 8'b10001100;
			Memory[21]  <= 8'b00000110;
			Memory[22]  <= 8'b00000000;
			Memory[23]  <= 8'b00000001;
			// MULT $7 $4 $2
			Memory[24]  <= 8'b00000000;
			Memory[25]  <= 8'b01000100;
			Memory[26]  <= 8'b00111000;
			Memory[27]  <= 8'b00011000;
			// MULT $8 $2 $2
			Memory[28]  <= 8'b00000000;
			Memory[29]  <= 8'b01000010;
			Memory[30]  <= 8'b01000000;
			Memory[31]  <= 8'b00011000;
			// MULT $9 $1 $2
			Memory[32]  <= 8'b00000000;
			Memory[33]  <= 8'b00100011;
			Memory[34]  <= 8'b01001000;
			Memory[35]  <= 8'b00011000;
			// MULT $10 $5 $1
			Memory[36]  <= 8'b00000000;
			Memory[37]  <= 8'b00100101;
			Memory[38]  <= 8'b01010000;
			Memory[39]  <= 8'b00011000;
			// MULT $11 $6 $9
			Memory[40]  <= 8'b00000000;
			Memory[41]  <= 8'b11001001;
			Memory[42]  <= 8'b01011000;
			Memory[43]  <= 8'b00011000;
			// ADD $12 $8 $11
			Memory[44]  <= 8'b00000001;
			Memory[45]  <= 8'b00001011;
			Memory[46]  <= 8'b01100000;
			Memory[47]  <= 8'b00100000;
			// J #32
			Memory[48]  <= 8'b00001000;
			Memory[49]  <= 8'b00000000;
			Memory[50]  <= 8'b00000000;
			Memory[51]  <= 8'b00100000;
			// ADD $14 $7 $13
			Memory[52]  <= 8'b00000000;
			Memory[53]  <= 8'b11101101;
			Memory[54]  <= 8'b01110000;
			Memory[55]  <= 8'b00100000;
			// SUB $15 $7 $13
			Memory[56]  <= 8'b00000000;
			Memory[57]  <= 8'b11101101;
			Memory[58]  <= 8'b01111000;
			Memory[59]  <= 8'b00100010;
			// DIV $16 $14 $10
			Memory[60]  <= 8'b00000001;
			Memory[61]  <= 8'b11001010;
			Memory[62]  <= 8'b10000000;
			Memory[63]  <= 8'b00011010;
			// DIV $17 $15 $10
			Memory[64]  <= 8'b00000001;
			Memory[65]  <= 8'b11101010;
			Memory[66]  <= 8'b10001000;
			Memory[67]  <= 8'b00011010;
			// DIV $18 $7 $1
			Memory[68]  <= 8'b00000000;
			Memory[69]  <= 8'b11100001;
			Memory[70]  <= 8'b10010000;
			Memory[71]  <= 8'b00011010;
			// DIV $19 $3 $1
			Memory[72]  <= 8'b00000000;
			Memory[73]  <= 8'b01100001;
			Memory[74]  <= 8'b10011000;
			Memory[75]  <= 8'b00011010;
			// MULT $20 $5 $9
			Memory[76]  <= 8'b00000001;
			Memory[77]  <= 8'b00100101;
			Memory[78]  <= 8'b10100000;
			Memory[79]  <= 8'b00011000;
			// SUB $21 $8 $20
			Memory[80]  <= 8'b00000001;
			Memory[81]  <= 8'b00010100;
			Memory[82]  <= 8'b10101000;
			Memory[83]  <= 8'b00100010;
			// MULT $22 $1 $1
			Memory[84]  <= 8'b00000000;
			Memory[85]  <= 8'b00100001;
			Memory[86]  <= 8'b10110000;
			Memory[87]  <= 8'b00011000;
			// DIV $23 $21 $22
			Memory[88]  <= 8'b00000010;
			Memory[89]  <= 8'b10110110;
			Memory[90]  <= 8'b10111000;
			Memory[91]  <= 8'b00011010;
			// SW $1 $0 #10
			Memory[92]  <= 8'b10101100;
			Memory[93]  <= 8'b00000001;
			Memory[94]  <= 8'b00000000;
			Memory[95]  <= 8'b00001010;
			// SW $2 $0 #11
			Memory[96]  <= 8'b10101100;
			Memory[97]  <= 8'b00000010;
			Memory[98]  <= 8'b00000000;
			Memory[99]  <= 8'b00001011;
			// SW $3 $0 #12
			Memory[100] <= 8'b10101100;
			Memory[101] <= 8'b00000011;
			Memory[102] <= 8'b00000000;
			Memory[103] <= 8'b00001100;
			// SW $16 $0 #13
			Memory[104] <= 8'b10101100;
			Memory[105] <= 8'b00010000;
			Memory[106] <= 8'b00000000;
			Memory[107] <= 8'b00001101;
			// SW $17 $0 #14
			Memory[108] <= 8'b10101100;
			Memory[109] <= 8'b00010001;
			Memory[110] <= 8'b00000000;
			Memory[111] <= 8'b00001110;
			// SW $18 $0 #15
			Memory[112] <= 8'b10101100;
			Memory[113] <= 8'b00010010;
			Memory[114] <= 8'b00000000;
			Memory[115] <= 8'b00001111;
			// SW $19 $0  #16
			Memory[116] <= 8'b10101100;
			Memory[117] <= 8'b00010011;
			Memory[118] <= 8'b00000000;
			Memory[119] <= 8'b00010000;
			// SW $23 $0 #17
			Memory[120] <= 8'b10101100;
			Memory[121] <= 8'b00010111;
			Memory[122] <= 8'b00000000;
			Memory[123] <= 8'b00010001;
			// J #50
			Memory[124] <= 8'b00001000;
			Memory[125] <= 8'b00000000;
			Memory[126] <= 8'b00000000;
			Memory[127] <= 8'b00110010;
			// SLT $13 $1 $2
			Memory[128] <= 8'b00000000;
			Memory[129] <= 8'b00100000;
			Memory[130] <= 8'b01101000;
			Memory[131] <= 8'b00101010;
			// BEQ $12 $13 #15
			Memory[132] <= 8'b00010001;
			Memory[133] <= 8'b10001101;
			Memory[134] <= 8'b00000000;
			Memory[135] <= 8'b00001111;
			// ADDI $13 $0 #1
			Memory[136] <= 8'b00100000;
			Memory[137] <= 8'b00001101;
			Memory[138] <= 8'b00000000;
			Memory[139] <= 8'b00000001;
			// BEQ $12 $13 #13
			Memory[140] <= 8'b00010001;
			Memory[141] <= 8'b10001101;
			Memory[142] <= 8'b00000000;
			Memory[143] <= 8'b00001101;
			// ADDI $13 $0 #2
			Memory[144] <= 8'b00100000;
			Memory[145] <= 8'b00001101;
			Memory[146] <= 8'b00000000;
			Memory[147] <= 8'b00000010;
			// ADDI $31 $0 #4
			Memory[148] <= 8'b00100000;
			Memory[149] <= 8'b00011111;
			Memory[150] <= 8'b00000000;
			Memory[151] <= 8'b00000100;
			// BEQ $12 $31 #10
			Memory[152] <= 8'b00010001;
			Memory[153] <= 8'b10011111;
			Memory[154] <= 8'b00000000;
			Memory[155] <= 8'b00001010;
			// ADDI $13 $0 #3
			Memory[156] <= 8'b00100000;
			Memory[157] <= 8'b00001101;
			Memory[158] <= 8'b00000000;
			Memory[159] <= 8'b00000011;
			// ADDI $31 $0 #9
			Memory[160] <= 8'b00100000;
			Memory[161] <= 8'b00011111;
			Memory[162] <= 8'b00000000;
			Memory[163] <= 8'b00001001;
			// BEQ $12 $31 #7
			Memory[164] <= 8'b00010001;
			Memory[165] <= 8'b10011111;
			Memory[166] <= 8'b00000000;
			Memory[167] <= 8'b00000111;
			// ADDI $13 $0 #4
			Memory[168] <= 8'b00100000;
			Memory[169] <= 8'b00001101;
			Memory[170] <= 8'b00000000;
			Memory[171] <= 8'b00000100;
			// ADDI $31 $0 #16
			Memory[172] <= 8'b00100000;
			Memory[173] <= 8'b00011111;
			Memory[174] <= 8'b00000000;
			Memory[175] <= 8'b00010000;
			// BEQ $12 $31 #4
			Memory[176] <= 8'b00010001;
			Memory[177] <= 8'b10011111;
			Memory[178] <= 8'b00000000;
			Memory[179] <= 8'b00000100;
			// ADDI $13 $0 #5
			Memory[180] <= 8'b00100000;
			Memory[181] <= 8'b00001101;
			Memory[182] <= 8'b00000000;
			Memory[183] <= 8'b00000101;
			// ADDI $31 $0 #25
			Memory[184] <= 8'b00100000;
			Memory[185] <= 8'b00011111;
			Memory[186] <= 8'b00000000;
			Memory[187] <= 8'b00011001;
			// BEQ $12 $31 #1
			Memory[188] <= 8'b00010001;
			Memory[189] <= 8'b10011111;
			Memory[190] <= 8'b00000000;
			Memory[191] <= 8'b00000001;
			// J #50
			Memory[192] <= 8'b00001000;
			Memory[193] <= 8'b00000000;
			Memory[194] <= 8'b00000000;
			Memory[195] <= 8'b00110010;
			// J #13
			Memory[196] <= 8'b00001000;
			Memory[197] <= 8'b00000000;
			Memory[198] <= 8'b00000000;
			Memory[199] <= 8'b00001101;			
		end

endmodule 
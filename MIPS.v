module MIPS
(
	input wire clk
);


	/* INTERNAL MIPS WIRES */
	// Name format: <original_module>_<previous_module>
	
	// IF
	wire [31:0]MuxPC_MuxPC;
	wire [31:0]PC_PC;
	wire [31:0]AddFour_AddFour;
	wire [31:0]InstructionMemory_InstructionMemory;
	
	// ID
	wire [31:0]AddFour_IFID;
	wire [31:0]InstructionMemory_IFID;
	wire [27:0]ShiftLeftJA_ShiftLeftJA;
	wire CtrlRegDst_Control;
	wire CtrlJump_Control;
	wire CtrlBranch_Control;
	wire CtrlMemRead_Control;
	wire CtrlMemtoReg_Control;
	wire [ 5:0]CtrlALUOp_Control;
	wire CtrlMemWrite_Control;
	wire CtrlALUSrc_Control;
	wire CtrlRegWrite_Control;
	wire [ 4:0]MuxWriteRegister_MuxWriteRegister;
	wire [31:0]RegReadData1_Registers;
	wire [31:0]RegReadData2_Registers;
	wire [31:0]SignExtend_SignExtend;
	
	// EX
	wire CtrlJump_IDEX;
	wire CtrlBranch_IDEX;
	wire CtrlMemRead_IDEX;
	wire CtrlMemtoReg_IDEX;
	wire [ 5:0]CtrlALUOp_IDEX;
	wire CtrlMemWrite_IDEX;
	wire CtrlALUSrc_IDEX;
	wire CtrlRegWrite_IDEX;
	wire [27:0]ShiftLeftJA_IDEX;
	wire [31:0]AddFour_IDEX;
	wire [31:0]RegReadData1_IDEX;
	wire [31:0]RegReadData2_IDEX;
	wire [31:0]SignExtend_IDEX;
	wire [ 4:0]MuxWriteRegister_IDEX;
	wire [ 5:0]InstructionMemory_IDEX;
	wire [31:0]ShiftLeftBA_ShiftLeftBA;
	wire [31:0]Adder_Adder;
	wire [31:0]MuxALU_MuxALU;
	wire [ 5:0]ALUControl_ALUControl;
	wire [31:0]ALUResult_ALU;
	wire ALUZero_ALU;
	
	// MEM
	wire CtrlJump_EXMEM;
	wire CtrlBranch_EXMEM;
	wire CtrlMemRead_EXMEM;
	wire CtrlMemtoReg_EXMEM;
	wire CtrlMemWrite_EXMEM;
	wire CtrlRegWrite_EXMEM;
	wire [27:0]ShiftLeftJA_EXMEM;
	wire [31:0]AddFour_EXMEM;
	wire [31:0]Adder_EXMEM;
	wire ALUZero_EXMEM;
	wire [31:0]ALUResult_EXMEM;
	wire [31:0]RegReadData2_EXMEM;
	wire [ 4:0]MuxWriteRegister_EXMEM;
	wire ANDGate_ANDGate;
	wire [31:0]DataMemReadData_DataMemory;
	
	// WB
	wire CtrlJump_MEMWB;
	wire CtrlMemtoReg_MEMWB;
	wire CtrlRegWrite_MEMWB;
	wire [27:0]ShiftLeftJA_MEMWB;
	wire [31:0]AddFour_MEMWB;
	wire [31:0]Adder_MEMWB;
	wire ANDGate_MEMWB;
	wire [31:0]DataMemReadData_MEMWB;
	wire [31:0]ALUResult_MEMWB;
	wire [ 4:0]MuxWriteRegister_MEMWB;
	wire [31:0]MuxWriteData_MuxWriteData;
	wire [31:0]MuxJumpAddress_MuxJumpAddress;
	
	
	/* MODULE INSTANCES */
	
	PC PC
	(
		.clk               (clk),
		.in_counter        (MuxPC_MuxPC),
		.out_counter       (PC_PC)
	);
	
	Add4 Add_4
	(
		.addend            (PC_PC[31:0]),
		.sum               (AddFour_AddFour)
	);
	
	InstructionMemory Instruction_Memory
	(
		.counter           (PC_PC[31:0]),
		.instruction       (InstructionMemory_InstructionMemory)
	);
	
	IFID IF_ID
	(
		.clk               (clk),
		.in_AddFour        (AddFour_AddFour),
		.in_Instruction    (InstructionMemory_InstructionMemory),
		.out_AddFour       (AddFour_IFID),
		.out_Instrucion    (InstructionMemory_IFID)
	);
	
	ShiftLeft26 ShiftLeft2_JumpAddress
	(
		.number            (InstructionMemory_IFID[25:0]),
		.number_shifted    (ShiftLeftJA_ShiftLeftJA)
	);
	
	Control Control
	(
		.Opcode            (InstructionMemory_IFID[31:26]),
		.RegDst            (CtrlRegDst_Control),
		.Jump              (CtrlJump_Control),
		.Branch            (CtrlBranch_Control),
		.MemRead           (CtrlMemRead_Control),
		.MemtoReg          (CtrlMemtoReg_Control),
		.ALUOp             (CtrlALUOp_Control),
		.MemWrite          (CtrlMemWrite_Control),
		.ALUSrc            (CtrlALUSrc_Control),
		.RegWrite          (CtrlRegWrite_Control)
	);
	
	Mux5 Mux_WriteRegister
	(
		.selector          (CtrlRegDst_Control),
		.input0            (InstructionMemory_IFID[20:16]),
		.input1            (InstructionMemory_IFID[15:11]),
		.result            (MuxWriteRegister_MuxWriteRegister)
	);
	
	Registers Registers
	(
		.RegWrite          (CtrlRegWrite_MEMWB),
		.ReadRegister1     (InstructionMemory_IFID[25:21]),
		.ReadRegister2     (InstructionMemory_IFID[20:16]),
		.WriteRegister     (MuxWriteRegister_MEMWB),
		.WriteData         (MuxWriteData_MuxWriteData),
		.ReadData1         (RegReadData1_Registers),
		.ReadData2         (RegReadData2_Registers)
	);
	
	SignExtend Sign_Extend
	(
		.number            (InstructionMemory_IFID[15:0]),
		.number_extended   (SignExtend_SignExtend)
	);
	
	IDEX ID_EX
	(
		.clk               (clk),
		.in_Jump           (CtrlJump_Control),
		.in_Branch         (CtrlBranch_Control),
		.in_MemRead        (CtrlMemRead_Control),
		.in_MemtoReg       (CtrlMemtoReg_Control),
		.in_ALUOp          (CtrlALUOp_Control),
		.in_MemWrite       (CtrlMemWrite_Control),
		.in_ALUSrc         (CtrlALUSrc_Control),
		.in_RegWrite       (CtrlRegWrite_Control),
		.in_JumpAddress    (ShiftLeftJA_ShiftLeftJA),
		.in_AddFour        (AddFour_IFID),
		.in_ReadData1      (RegReadData1_Registers),
		.in_ReadData2      (RegReadData2_Registers),
		.in_SignExtend     (SignExtend_SignExtend),
		.in_WriteRegister  (MuxWriteRegister_MuxWriteRegister),
		.in_Function       (InstructionMemory_IFID[5:0]),
		.out_Jump          (CtrlJump_IDEX),
		.out_Branch        (CtrlBranch_IDEX),
		.out_MemRead       (CtrlMemRead_IDEX),
		.out_MemtoReg      (CtrlMemtoReg_IDEX),
		.out_ALUOp         (CtrlALUOp_IDEX),
		.out_MemWrite      (CtrlMemWrite_IDEX),
		.out_ALUSrc        (CtrlALUSrc_IDEX),
		.out_RegWrite      (CtrlRegWrite_IDEX),
		.out_JumpAddress   (ShiftLeftJA_IDEX),
		.out_AddFour       (AddFour_IDEX),
		.out_ReadData1     (RegReadData1_IDEX),
		.out_ReadData2     (RegReadData2_IDEX),
		.out_SignExtend    (SignExtend_IDEX),
		.out_WriteRegister (MuxWriteRegister_IDEX),
		.out_Function      (InstructionMemory_IDEX)
	);
	
	ShiftLeft32 ShiftLeft2_BranchAddress
	(
		.number            (SignExtend_IDEX[31:0]),
		.number_shifted    (ShiftLeftBA_ShiftLeftBA)
	);
	
	Adder Adder
	(
		.addend1           (AddFour_IDEX[31:0]),
		.addend2           (ShiftLeftBA_ShiftLeftBA),
		.sum               (Adder_Adder)
	);
	
	Mux32 Mux_ALU
	(
		.selector          (CtrlALUSrc_IDEX),
		.input0            (RegReadData2_IDEX[31:0]),
		.input1            (SignExtend_IDEX[31:0]),
		.result            (MuxALU_MuxALU)
	);
	
	ALUControl ALU_Control
	(
		.Function          (InstructionMemory_IDEX),
		.ALUOp             (CtrlALUOp_IDEX),
		.selector          (ALUControl_ALUControl)
	);
	
	ALU ALU
	(
		.selector          (ALUControl_ALUControl),
		.input1            (RegReadData1_IDEX),
		.input2            (MuxALU_MuxALU),
		.result            (ALUResult_ALU),
		.zero              (ALUZero_ALU)
	);
	
	EXMEM EX_MEM
	(
		.clk               (clk),
		.in_Jump           (CtrlJump_IDEX),
		.in_Branch         (CtrlBranch_IDEX),
		.in_MemRead        (CtrlMemRead_IDEX),
		.in_MemtoReg       (CtrlMemtoReg_IDEX),
		.in_MemWrite       (CtrlMemWrite_IDEX),
		.in_RegWrite       (CtrlRegWrite_IDEX),
		.in_JumpAddress    (ShiftLeftJA_IDEX),
		.in_AddFour        (AddFour_IDEX[31:0]),
		.in_Adder          (Adder_Adder),
		.in_Zero           (ALUZero_ALU),
		.in_ALU            (ALUResult_ALU),
		.in_ReadData2      (RegReadData2_IDEX[31:0]),
		.in_WriteRegister  (MuxWriteRegister_IDEX),
		.out_Jump          (CtrlJump_EXMEM),
		.out_Branch        (CtrlBranch_EXMEM),
		.out_MemRead       (CtrlMemRead_EXMEM),
		.out_MemtoReg      (CtrlMemtoReg_EXMEM),
		.out_MemWrite      (CtrlMemWrite_EXMEM),
		.out_RegWrite      (CtrlRegWrite_EXMEM),
		.out_JumpAddress   (ShiftLeftJA_EXMEM),
		.out_AddFour       (AddFour_EXMEM),
		.out_Adder         (Adder_EXMEM),
		.out_Zero          (ALUZero_EXMEM),
		.out_ALU           (ALUResult_EXMEM),
		.out_ReadData2     (RegReadData2_EXMEM),
		.out_WriteRegister (MuxWriteRegister_EXMEM)
	);
	
	ANDGate AND_Gate
	(
		.input1            (CtrlBranch_EXMEM),
		.input2            (ALUZero_EXMEM),
		.result            (ANDGate_ANDGate)
	);
	
	DataMemory Data_Memory
	(
		.MemWrite          (CtrlMemWrite_EXMEM),
		.MemRead           (CtrlMemRead_EXMEM),
		.Address           (ALUResult_EXMEM[31:0]),
		.WriteData         (RegReadData2_EXMEM),
		.ReadData          (DataMemReadData_DataMemory)
	);
	
	MEMWB MEM_WB
	(
		.clk               (clk),
		.in_Jump           (CtrlJump_EXMEM),
		.in_MemtoReg       (CtrlMemtoReg_EXMEM),
		.in_RegWrite       (CtrlRegWrite_EXMEM),
		.in_JumpAddress    (ShiftLeftJA_EXMEM),
		.in_AddFour        (AddFour_EXMEM),
		.in_Adder          (Adder_EXMEM),
		.in_ANDGate        (ANDGate_ANDGate),
		.in_ReadData       (DataMemReadData_DataMemory),
		.in_ALU            (ALUResult_EXMEM[31:0]),
		.in_WriteRegister  (MuxWriteRegister_EXMEM),
		.out_Jump          (CtrlJump_MEMWB),
		.out_MemtoReg      (CtrlMemtoReg_MEMWB),
		.out_RegWrite      (CtrlRegWrite_MEMWB),
		.out_JumpAddress   (ShiftLeftJA_MEMWB),
		.out_AddFour       (AddFour_MEMWB),
		.out_Adder         (Adder_MEMWB),
		.out_ANDGate       (ANDGate_MEMWB),
		.out_ReadData      (DataMemReadData_MEMWB),
		.out_ALU           (ALUResult_MEMWB),
		.out_WriteRegister (MuxWriteRegister_MEMWB)
	);
	
	Mux32 Mux_WriteData
	(
		.selector          (CtrlMemtoReg_MEMWB),
		.input0            (ALUResult_MEMWB),
		.input1            (DataMemReadData_MEMWB),
		.result            (MuxWriteData_MuxWriteData)
	);
	
	Mux32 Mux_JumpAddress
	(
		.selector          (ANDGate_MEMWB),
		.input0            (AddFour_MEMWB),
		.input1            (Adder_MEMWB),
		.result            (MuxJumpAddress_MuxJumpAddress)
	);
	
	Mux28 Mux_PC
	(
		.selector          (CtrlJump_MEMWB),
		.input0            (MuxJumpAddress_MuxJumpAddress),
		.input1            (ShiftLeftJA_MEMWB),
		.result            (MuxPC_MuxPC)
	);
	
endmodule 
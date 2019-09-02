module instruction_memory(input logic [21:0] a,
								  output logic [21:0] rd);								  
								  
  logic [21:0] memory [100:0];  
  
  /*assign memory[0] = 22'b1001101000000010001000; // MOVER R1, #8
  assign memory[1] = 22'b1001101000000010001000; // MOVER R1, #8
  assign memory[2] = 22'b1001101000000100001001; // MOVER R2, #9
  assign memory[3] = 22'b1000000000100000010000; // SUM R0, R1, R2
  assign memory[4] = 22'b1000110000100000010000; // COMP R1, R2
  assign memory[5] = 22'b1000000000000000010000; // SUM R0, R0, R2*/
  
  assign memory[0] = 22'b1001101000000010001000; // MOVER R1, #8
  assign memory[1] = 22'b1001101000000010001000; // MOVER R1, #8
  assign memory[2] = 22'b1001101000000100001001; // MOVER R2, #9
  assign memory[3] = 22'b1000000000100000010000; // SUM R0, R1, R2
  assign memory[4] = 22'b1011100000100000010000; // STORE R0, [R1, R2]
  assign memory[5] = 22'b1011101000100000000111; // STORE R0, [R1, #7]
  assign memory[6] = 22'b1011110000100110010000; // LOAD R3, [R1, R2]
  assign memory[7] = 22'b1011111000101000000111; // LOAD R4, [R1, #7]
  assign memory[8] = 22'b1000000001101010100000; // SUM R5, R4, R3  
	 
  assign rd = memory[a[21:2]]; // word aligned
			  
endmodule 
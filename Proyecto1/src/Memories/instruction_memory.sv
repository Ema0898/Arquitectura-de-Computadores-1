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
  assign memory[9] = 22'b1000001010101010001111; // SUM R5, R5, #15
  assign memory[10] = 22'b1001000010101100001000;  // MUL R6, R5, R1
  assign memory[11] = 22'b1001001010001110000011; //MUL R7, R4, #3
  assign memory[12] = 22'b1000111011100000110010; // CMP R7, #50
  assign memory[13] = 22'b1001101000010000000000; // MOVER R8, #0
  assign memory[14] = 22'b0000001011110000000010; // SUMIG R8, R7, #2 // Si se ejecuta
  assign memory[15] = 22'b1000001100010000000001; // SUM R8, R8, #1
  
  /*assign memory[0] = 22'b1001101000000110000000; // MOVER R3, #0 : Init
  assign memory[1] = 22'b1001101000000010000000; // MOVER R1, #0
  assign memory[2] = 22'b1001101000000100000001; // MOVER R2, #1
  assign memory[3] = 22'b1000110000100000010000; // COMP R1, R2
  assign memory[4] = 22'b0101111111111111101000; // SALTOIG Init
  assign memory[5] = 22'b1000001000100010000100; // SUM R1, R1, #4
  assign memory[6] = 22'b1000001001000100000101; // SUM R2, R2, #5 : Hola
  assign memory[7] = 22'b1000001000100010000111; // SUM R1, R1, #7 : Adios*/
	 
  assign rd = memory[a[21:2]]; // word aligned
			  
endmodule 

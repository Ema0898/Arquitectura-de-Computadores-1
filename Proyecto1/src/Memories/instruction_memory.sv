module instruction_memory(input logic [21:0] a,
								  output logic [21:0] rd);								  
								  
  logic [21:0] memory [100:0];  
  
  assign memory[0] = 22'b0001101000000010001000;
  assign memory[1] = 22'b0001101000000100001001;
  assign memory[2] = 22'b0000000000100000010000;  
	 
  assign rd = memory[a[21:2]]; // word aligned
			  
endmodule 
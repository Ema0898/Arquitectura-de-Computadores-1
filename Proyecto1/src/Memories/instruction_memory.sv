module instruction_memory(input logic [21:0] a,
								  output logic [21:0] rd);								  
								  
  logic [21:0] memory [100:0];  
	 
  assign rd = memory[a[21:2]]; // word aligned
			  
endmodule 
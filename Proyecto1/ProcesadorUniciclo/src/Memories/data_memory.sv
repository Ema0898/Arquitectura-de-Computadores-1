module data_memory(input logic clk, we,
						 input logic [23:0] a, wd,
						 output logic [23:0] rd);
						 
  logic [23:0] RAM [27];
  assign rd = RAM[a]; // word aligned
    
  always_ff @(negedge clk)
    if (we) RAM[a] <= wd;		
	
endmodule 
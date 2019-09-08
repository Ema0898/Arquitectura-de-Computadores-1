module image_memory(input logic clk, we,
						 input logic [21:0] a, 
						 input logic [7:0] wd,
						 output logic [7:0] rd);
						 
  logic [7:0] RAM [100:0];
  assign rd = RAM[a[21:2]]; // word aligned
  
  always_ff @(negedge clk)
   if (we) RAM[a[21:2]] <= wd;
	
endmodule 
module image_memory(input logic clk, we,
						 input logic [23:0] a, 
						 input logic [7:0] wd,
						 output logic [7:0] rd);
						 
  logic [7:0] RAM [127:0];
  //assign rd = RAM[a]; // word aligned
  
  always_ff @(negedge clk)
   if (we) RAM[a] <= wd;
	
  always_ff @(negedge clk)
   if (!we) rd <= RAM[a];
	
endmodule 
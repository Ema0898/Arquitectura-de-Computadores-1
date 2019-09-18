module image_memory2
	#(parameter path = "")
						(input logic clk, we,
						 input logic [17:0] a, 
						 input logic [7:0] wd,
						 output logic [7:0] rd);
						 
  logic [7:0] RAM [40000];
  //assign rd = RAM[a]; // word aligned
  
  initial
  if (path != "")
	$readmemb(path, RAM);
  
  always_ff @(negedge clk)
   if (we) RAM[a] <= wd;
	
  always_ff @(negedge clk)
   if (!we) rd <= RAM[a];
	
endmodule 
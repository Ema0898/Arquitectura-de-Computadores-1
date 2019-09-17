module data_memory(input logic clk, we,
						 input logic [21:0] a, wd,
						 output logic [21:0] rd);
						 
  logic [21:0] RAM [127:0];
  //assign rd = RAM[a]; // word aligned
    
  always_ff @(posedge clk)
    if (we) RAM[a] <= wd;
	 
  always_ff @(posedge clk)
    if (!we) rd <= RAM[a]; 

		
	
endmodule 
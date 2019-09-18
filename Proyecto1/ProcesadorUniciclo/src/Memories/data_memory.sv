module data_memory(input logic clk, we,
						 input logic [21:0] a, wd,
						 output logic [21:0] rd);
						 
  logic [21:0] RAM [27];
  initial
	$readmemb("kernels.dat", RAM);
		
  assign rd = RAM[a]; // word aligned
    
  always_ff @(negedge clk)
    if (we) RAM[a] <= wd;
	
endmodule 
module data_memory(input logic clk, we,
						 input logic [21:0] a, wd,
						 output logic [21:0] rd);
						 
  logic [21:0] RAM [127:0];
  assign rd = RAM[a[21:2]]; // word aligned
  
  always_ff @(negedge clk)
    if (we) RAM[a[21:2]] <= wd;
	
endmodule 
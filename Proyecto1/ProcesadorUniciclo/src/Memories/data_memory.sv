module data_memory(input logic clk, we,
						 input logic [23:0] a, wd,
						 output logic [23:0] rd);
						 
<<<<<<< HEAD
  logic [23:0] RAM [27];
  assign rd = RAM[a]; // word aligned
    
  always_ff @(negedge clk)
    if (we) RAM[a] <= wd;		
=======
  logic [23:0] RAM [26:0];
  //initial
	//$readmemb("kernels.dat", RAM);	
  
  
  assign RAM[0] = 24'b000000000000000000000000;
  assign RAM[1] = 24'b111111111111111111111111;
  assign RAM[2] = 24'b000000000000000000000000;
  assign RAM[3] = 24'b111111111111111111111111;
  assign RAM[4] = 24'b000000000000000000000101;
  assign RAM[5] = 24'b111111111111111111111111;
  assign RAM[6] = 24'b000000000000000000000000;
  assign RAM[7] = 24'b111111111111111111111111;
  assign RAM[8] = 24'b000000000000000000000000;
  assign RAM[9] = 24'b111111111111111111111111;
  assign RAM[10] = 24'b111111111111111111111111;
  assign RAM[11] = 24'b111111111111111111111111;
  assign RAM[12] = 24'b111111111111111111111111;
  assign RAM[13] = 24'b000000000000000000001001;
  assign RAM[14] = 24'b111111111111111111111111;
  assign RAM[15] = 24'b111111111111111111111111;
  assign RAM[16] = 24'b111111111111111111111111;
  assign RAM[17] = 24'b111111111111111111111111;
  assign RAM[18] = 24'b000000000000000000000000;
  assign RAM[19] = 24'b000000000000000000000000;
  assign RAM[20] = 24'b000000000000000000000000;
  assign RAM[21] = 24'b000000000000000000000000;
  assign RAM[22] = 24'b000000000000000000000000;
  assign RAM[23] = 24'b000000000000000000000000;
  assign RAM[24] = 24'b000000000000000000000000;
  assign RAM[25] = 24'b000000000000000000000000;
  assign RAM[26] = 24'b000000000000000000000000;
		
  assign rd = RAM[a]; // word aligned
    
  //always_ff @(negedge clk)
    //if (we) RAM[a] <= wd;
>>>>>>> c9ba90840e60ad14c5f5ff539c15feeba067e3e4
	
endmodule 
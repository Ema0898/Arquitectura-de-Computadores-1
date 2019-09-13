module image_memory_part
		#(parameter N = 76800)
		 (input logic clk, we,
		 input logic [N-1:0] a, 
		 input logic [7:0] wd,
			 output logic [7:0] rd););
		 
  logic [N-1:0] memory[7:0]
		 
  initial
		$readmemh("image_1.dat", memory);
		
	always_ff @(negedge clk) 
	begin
		if(we) memory[a] <= wd;
	end
	
	always_ff @(negedge clk)
begin
		if (!we) rd <= memory[a];
	end
	
endmodule 
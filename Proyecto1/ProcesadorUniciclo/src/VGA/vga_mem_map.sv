module vga_mem_map( input logic [9:0] hCounter, vCounter, 
						  output logic [18:0] out);						  
	
	assign out = hCounter + (10'b1010000000 * vCounter) + 1'b1; // hCounter + (640 * vCounter) + 1

endmodule 
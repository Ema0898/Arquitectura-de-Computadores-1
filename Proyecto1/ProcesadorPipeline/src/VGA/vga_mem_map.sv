module vga_mem_map( input logic [9:0] hCounter, vCounter, 
						  output logic [17:0] out);						  
	
	assign out = hCounter[8:0] + (9'b110010000 * vCounter[8:0]) + 1'b1; // hCounter + (400 * vCounter) + 1

endmodule 
module offset_image_mem(input logic [21:0] address, 
								output logic [18:0] original_image_adress, process_image_address);
								
								
	logic [21:0] sub1, sub2;
	
	assign sub1 = address - 7'd120;
	assign sub2 = address - 19'd307320;
	
	assign original_image_adress = sub1[18:0];
	assign process_image_address = sub2[18:0];


endmodule 
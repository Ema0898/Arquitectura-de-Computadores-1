module offset_image_mem(input logic [23:0] address, 
								output logic [17:0] original_image_adress, process_image_address);
								
								
	logic [23:0] sub1, sub2;
	
	assign sub1 = address - 7'd120;
	assign sub2 = address - 18'd160120;
	
	assign original_image_adress = sub1[17:0];
	assign process_image_address = sub2[17:0];


endmodule 
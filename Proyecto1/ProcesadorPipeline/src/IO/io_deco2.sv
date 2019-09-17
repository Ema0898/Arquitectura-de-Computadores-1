module io_deco2(input logic [21:0] direction, output logic mem_enb, show_enb);

	logic mem_condition, show_contidion;
	
	assign mem_condition = (direction <= 100);
	assign show_contidion = (direction > 100);
	
	mux_2_x_1 #(1) mux0(1'b0, 1'b1, mem_condition, mem_enb);
	mux_2_x_1 #(1) mux1(1'b0, 1'b1, show_contidion, show_enb);	


endmodule 
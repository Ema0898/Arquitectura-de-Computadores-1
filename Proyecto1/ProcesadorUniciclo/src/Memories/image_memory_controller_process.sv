module image_memory_controller_process(input logic clk, we,
						 input logic [17:0] a, 
						 input logic [7:0] wd,
						 output logic [7:0] rd);
						 
	logic ram1, ram2, ram3, ram4;
	logic [7:0] rd1, rd2, rd3, rd4;
	logic [7:0] mux0_out, mux1_out, mux2_out;

	assign ram1 = (a >= 0 & a < 40000);
	assign ram2 = (a >= 40000 & a < 80000);
	assign ram3 = (a >= 80000 & a < 120000);
	assign ram4 = (a >= 120000 & a < 160000);
	
	image_memory3 image1(clk, we & ram1, a, wd, rd1);
	image_memory3 image2(clk, we & ram2, (a - 18'd40000), wd, rd2);
	image_memory3 image3(clk, we & ram3, (a - 18'd80000), wd, rd3);
	image_memory3 image4(clk, we & ram4, (a - 18'd120000), wd, rd4);
	
	mux_2_x_1 #(8) mux0(8'b0, rd1, ram1, mux0_out);
	mux_2_x_1 #(8) mux1(mux0_out, rd2, ram2, mux1_out);
	mux_2_x_1 #(8) mux2(mux1_out, rd3, ram3, mux2_out);
	mux_2_x_1 #(8) mux3(mux2_out, rd4, ram4, rd);	


endmodule 
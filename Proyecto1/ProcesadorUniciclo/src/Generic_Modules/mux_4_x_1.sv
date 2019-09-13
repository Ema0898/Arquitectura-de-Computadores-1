module mux_4_x_1
	#(parameter N = 8)
	(input [N - 1 : 0] a, b, c, d, input logic [1:0] selec, output logic [N - 1 : 0] z);
	
	logic [N - 1 : 0] m0, m1;
	
	mux_2_x_1 #(N) mux0(a, b, selec[0], m0);
	mux_2_x_1 #(N) mux1(c, d, selec[0], m1);
	
	mux_2_x_1 #(N) mux2(m0, m1, selec[1], z);
	
endmodule 
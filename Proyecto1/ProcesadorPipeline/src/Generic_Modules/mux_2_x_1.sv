module mux_2_x_1
	#(parameter N = 8)
	(input [N - 1 : 0] a, b, input logic s, output [N - 1 : 0] z);
		
	assign z = s ? b : a;
endmodule

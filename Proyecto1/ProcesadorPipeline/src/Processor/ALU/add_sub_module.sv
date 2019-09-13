module add_sub_module
	#(parameter N = 4)
	(input [N - 1 : 0] a, b, input logic s, output [N - 1 : 0] z, output carry_out);
	
	logic [N - 1 : 0] m0;
	
	mux_2_x_1 #(N) mux0(b, ~b, s, m0);
		
	adder #(N) fa(a, m0, s, z, carry_out);
	
endmodule

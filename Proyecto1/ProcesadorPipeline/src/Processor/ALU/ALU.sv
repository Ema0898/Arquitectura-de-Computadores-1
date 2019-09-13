module ALU
	#(parameter N = 8)
	(input logic [N - 1 : 0] a, b, input logic [1:0] s, output logic [N - 1 : 0] z, output logic [3:0] flags);
	
	logic [N-1:0] d0, d1, d2, d3;
	logic carry_out, msb_result;
	
	arithmetic_module #(N) arithmetic(a, b, s[0], d0, d1, d2, d3, carry_out, msb_result);
	mux_4_x_1 #(N) mux0(d0, d1, d2, d3, s, z); 
	
	flag_module #(N) flag_mod(a[N - 1], b[N - 1], msb_result, carry_out, z, s, flags);
	
endmodule 
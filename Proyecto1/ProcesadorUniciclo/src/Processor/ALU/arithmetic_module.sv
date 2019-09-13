module arithmetic_module
	#(parameter N = 8)
	(input logic [N - 1 : 0] a, b, input s, output logic [N - 1 : 0] d0, d1, d2, d3, output carry_out, msb_result);
	
	logic [N - 1 : 0] sum_wire;
	logic cout1, cout2;
		
	add_sub_module #(N) adder(a, b, s, sum_wire, cout1);		
	
	assign msb_result = sum_wire[N - 1];	
	assign d0 = sum_wire;
	assign d1 = sum_wire;
		
	multiplier #(N) mul(a, b, d2, cout2);

	assign carry_out = cout1 | cout2;
	assign d3 = 'b0;
	
	
endmodule 
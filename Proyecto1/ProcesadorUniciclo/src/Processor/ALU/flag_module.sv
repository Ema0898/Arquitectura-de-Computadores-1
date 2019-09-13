module flag_module	
	#(parameter N = 8)
	(input a, b, msb_sum, carry_out, input logic [N - 1 : 0] result, input logic [1:0] selector, output logic [3:0] z);
	
	assign z[3] = result[N - 1]; // N
	assign z[2] = &(~result);	  // Z
	assign z[1] = carry_out;		// C
	assign z[0] = (a ^ msb_sum) & (~(a ^ b ^ selector[0])); // V
	
endmodule 
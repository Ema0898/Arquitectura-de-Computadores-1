module cond_check(input logic cond, input logic zero_flag, output logic cond_ex);
	
	always_comb
		case(cond)
			1'b0: cond_ex = zero_flag; // EQ
			1'b1: cond_ex = 1'b1; // always
		default: cond_ex = 1'bx; // undefined
		endcase
endmodule 
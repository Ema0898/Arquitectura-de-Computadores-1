module cond_check2(input logic [2:0] cond, input logic [3:0] flags, output logic cond_ex);

	logic neg, zero, _carry, overflow, ge;
	
	assign {neg, zero, _carry, overflow} = flags;
	assign ge = (neg == overflow);
	
	always_comb
		case(cond)
			3'b000: cond_ex = zero; // EQ
			3'b001: cond_ex = neg;       // MI
			3'b010: cond_ex = ~zero & ge;  // GT
			3'b111: cond_ex = 1'b1; // always
		default: cond_ex = 1'bx; // undefined
		endcase
endmodule 
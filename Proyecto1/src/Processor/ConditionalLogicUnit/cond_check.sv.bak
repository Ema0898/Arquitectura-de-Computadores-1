module cond_check(input logic [3:0] cond, input logic [3:0] flags, output logic cond_ex);

	logic neg, zero, _carry, overflow, ge;
	
	assign {neg, zero, _carry, overflow} = flags;
	assign ge = (neg == overflow);
	
	always_comb
		case(cond)
			4'b0000: cond_ex = zero; // EQ
			4'b0001: cond_ex = ~zero; // NE
			4'b0010: cond_ex = _carry; // CS
			4'b0011: cond_ex = ~_carry; // CC
			4'b0100: cond_ex = neg; //MI
			4'b0101: cond_ex = ~neg; //PL
			4'b0110: cond_ex = overflow; // VS
			4'b0111: cond_ex = ~overflow; // VC
			4'b1000: cond_ex = _carry & ~zero; //HI
			4'b1001: cond_ex = ~(_carry & ~zero); //LS
			4'b1010: cond_ex = ge; //GE
			4'b1011: cond_ex = ~ge; //LT
			4'b1100: cond_ex = ~zero & ge; //GT
			4'b1101: cond_ex = ~(~zero & ge); //LE
			4'b1110: cond_ex = 1'b1; // always
		default: cond_ex = 1'bx; // undefined
		endcase
endmodule 
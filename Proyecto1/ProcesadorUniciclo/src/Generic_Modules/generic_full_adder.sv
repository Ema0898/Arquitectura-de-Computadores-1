module generic_full_adder(input x, y, c_in, output s, c_out);
	assign s = (x ^ y) ^ c_in;
	assign c_out = (y & c_in) | (x & y) | (x & c_in);
endmodule 
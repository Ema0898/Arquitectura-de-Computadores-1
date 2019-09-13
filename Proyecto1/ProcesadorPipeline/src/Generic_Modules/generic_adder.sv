module generic_adder
 #(parameter N = 20)
 (input logic [N - 1 : 0] a, b, input carry_in, output logic [N - 1 : 0] s, output carry_out);	
   logic [N - 1:0] carry_arr;
	
   genvar i;
   generate for(i = 0; i < N; i = i + 1)
     begin: generate_N_bit_Adder
	  
		if(i == 0) 
			generic_full_adder f(a[0], b[0], carry_in, s[0], carry_arr[0]);
		else
			generic_full_adder f(a[i], b[i], carry_arr[i - 1], s[i], carry_arr[i]);
     end
	  
	  assign carry_out = carry_arr[N - 1];
   endgenerate
endmodule  

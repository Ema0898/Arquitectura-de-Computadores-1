module deco_buttons(input logic [6:0] direction, 
						  output logic [1:0] mux_selec);
						  
  always_comb
		case(direction)		
			7'd104: 
				mux_selec = 2'b00;
			7'd108:
				mux_selec = 2'b01;
			7'd112:
				mux_selec = 2'b10;
		default:
				mux_selec = 2'b11;
		endcase


endmodule 
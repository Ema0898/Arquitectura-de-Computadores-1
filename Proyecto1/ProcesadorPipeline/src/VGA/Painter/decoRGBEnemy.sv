module decoRGBEnemy(input logic [2:0] codedColor, output logic [23:0] RGB);

	always_comb
		case(codedColor)		
			3'b000: 
				RGB = 24'hABFFFB;
			3'b001:
				RGB = 24'h191919;
			3'b010:
				//Combinacion ganadora, poner aqui el fondo
				RGB = 24'h0CEA26;
			3'b011:
				RGB = 24'h4700FF;
			3'b100:
				RGB = 24'hFF0000;
		default:
				RGB = 24'b0;
		endcase

endmodule 
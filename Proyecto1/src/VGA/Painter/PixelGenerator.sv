module PixelGenerator(input logic [9:0] posX, posY, pixelX, pixelY, output logic [23:0] RGB);

   logic spriteActive, enemyActive0, enemyActive1, enemyActive2;
	logic [23:0] spriteColor, enemyColor0, enemyColor1, enemyColor2, mux0_w, mux1_w, mux2_w;
	logic [23:0] background = 24'b101010111111111111111011;
		
	Enemy enemy0(200, 300, pixelX, pixelY, enemyColor0, enemyActive0);
	Enemy enemy1(200, 150, pixelX, pixelY, enemyColor1, enemyActive1);
	Enemy enemy2(200, 450, pixelX, pixelY, enemyColor2, enemyActive2);
	Sprite sprite(posX, posY, pixelX, pixelY, spriteColor, spriteActive);
	
	mux_2_x_1 #(24) mux0(background, spriteColor, spriteActive, mux0_w);
	mux_2_x_1 #(24) mux1(mux0_w, enemyColor0, enemyActive0, mux1_w);
	mux_2_x_1 #(24) mux2(mux1_w, enemyColor1, enemyActive1, mux2_w);
	mux_2_x_1 #(24) mux3(mux2_w, enemyColor2, enemyActive2, RGB);

endmodule 

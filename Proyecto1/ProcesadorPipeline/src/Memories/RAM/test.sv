`timescale 1 ps / 1 ps

//`include "../pkg/utils_pkg.sv"
module test();

	logic	[18:0]  A;
	logic	  CLK;
	logic	[7:0]  D;
	logic	  RD;
	logic	  WR;
	logic	[7:0]  S;

	
	RAM DUT(A, CLK,D, RD, WR, S);
	
	initial begin
		

		CLK = 0; A = 19'h0; WR = 0; D = 19'h0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;

		
		

		CLK =  1; A = 19'h0; WR = 0; D = 19'h0; RD = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		
		CLK = 0; A = 19'h15762; WR = 0; D = 19'h0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;

		
		CLK =  1; A = 19'h15762; WR = 0; D = 19'h0; RD = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;
		CLK = 0; #10;
		CLK = 1; #10;


		// CLK = 1; #10;
		// WE = 0;
		// CLK = 0; #10;

		// CLK = 0; WE = 0; WD = 12'hBBB; A = 17'h7; #10;//el dato que escribe es este 
		// CLK = 1; #10;
		// CLK = 0; #10;

		// CLK = 0; WE = 0; WD = 12'hEEE; A = 17'h7; #10;
		// CLK = 1; WE = 0; WD = 12'hDDD; A = 17'h7; #10;//lo escribe al rise edge de este clk
		
		// CLK = 0; WE = 1; WD = 12'hCCC; A = 17'd39000; #10;
		// CLK = 1; WE = 0; WD = 12'hFFF; A = 17'd39000; #10;//el dato que escribe es este
		// CLK = 0; WE = 0; WD = 12'hCCC; A = 17'd39000; #10;
		// CLK = 1; WE = 0; WD = 12'h999; A = 17'd39000; #10;//lo escribe al rise edge este clk
		
	
	end

	
endmodule 
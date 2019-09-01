module decode_unit(input logic [1:0] op,
						input logic [3:0] funct,
						input logic [3:0] rd,
						output logic pc_src, reg_write, mem_write, mem_reg, alu_src, no_write, mov_src, reg_src, flag_write,
						output logic [1:0] alu_control, imm_src);
						
						
	logic [1:0] mux0_out;
	logic mem_op, rd11, dataprocess_op, branch_op, flag_write_previous;
						
	assign rd11 = rd[3] & ~rd[2] & rd[1] & rd[0];
	assign mem_op = ~op[1] & op[0];
	assign dataprocess_op = ~op[1] & ~op[0];
	assign branch_op = op[1] & ~op[0];
	
	// Asigna las señales de control para el datapath
	assign mem_reg = mem_op & funct[1]; // Hace un LOAD
	assign mem_write = mem_op & ~funct[1]; // Hace un STORE
	assign alu_src = ((mem_op | dataprocess_op) & funct[0]) | branch_op;
	assign reg_write = dataprocess_op | mem_reg; // Escribe en registros si hace un LOAD o una operacion de datos
	assign pc_src = branch_op | (rd11 & reg_write);
	assign imm_src = op;
	assign reg_src = branch_op;
	
	assign flag_write_previous = funct[1];
  
   mux_2_x_1 #(1) mux_flags(1'b0, flag_write_previous, dataprocess_op, flag_write);	

	assign no_write = (~funct[3] & funct[2]) & dataprocess_op; // Si estoy haciendo un COMP
	assign mov_src = (funct[0] & funct[3] & funct[2]) & dataprocess_op; // Si estoy haciendo MOVER
	
	mux_2_x_1 #(2) mux0(2'b0, {funct[3] , funct[2]}, dataprocess_op, mux0_out); // Si no es de datos, pone el alu a sumar
	mux_2_x_1 #(2) mux1(mux0_out, 2'b0, mov_src, alu_control); // Si es un MOVER, pone el alu a sumar

endmodule 
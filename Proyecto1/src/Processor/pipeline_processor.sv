module pipeline_processor(input logic clk, rst,
			  output logic mem_write,
			  output logic [21:0] write_data, data_adr);
			  
	logic pc_src, reg_src, alu_src, mov_src, mem_reg, reg_write, pc_src_previous, reg_write_previous, mem_write_previous;
	logic [1:0] imm_src, alu_control;
	logic [3:0] alu_flags;
			  
	// Declaracion logics para la etapa de Fetch	
	logic [21:0] pc_plus_4_fetch, instruction_fetch, read_data_mux, pc, pc_mux;
	logic carry_out;
	
	// Declaracion logics para la etapa de decode
	logic [21:0] instruction_decode, rd1_decode, rd2_decode, rd3_decode, imm_ext;
	logic [21:0] rd1, rd2, rd3;
	logic [3:0] reg1_in;
	
	// Declaracion logics para la etapa de execute
	logic [21:0] rd1_execute, rd2_execute, rd3_execute, extened_execute, mux2_out, mov_mux_out, alu_result_execute;
	logic [3:0] write_register_execute;
	
	// Declaracion logics para la etapa de memory
	logic [21:0] alu_result_memory, write_data_memory, read_data_memory;
	logic [3:0] write_register_memory;
	
	// Declaracion logics para la etapa de writeback
	logic [21:0] alu_result_write_back, read_data_write_back;
	logic [3:0] write_register_write_back;
	
	// Primer etapa del pipeline Fetch	
	generic_adder #(22) adder1(pc, 22'b0000000000000000000100, 1'b0, pc_plus_4_fetch, carry_out);
	
	mux_2_x_1 #(22) mux0(pc_plus_4_fetch, read_data_mux, pc_src, pc_mux);
	flip_flop_D #(22) ff(clk, rst, 1'b1, pc_mux, pc); 	
	instruction_memory im(pc, instruction_fetch);
	
	flip_flop_D #(22) fetch_pipe(clk, rst, 1'b1, {instruction_fetch}, {instruction_decode});
	
	// Segunda etapa del pipeline Decode
	
	/*decode_unit decode(instruction_decode[20:19], instruction_decode[18:15], instruction_decode[10:7],
							 pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, no_write_d, mov_src_d,
							 reg_src_d, flag_write_d, alu_control_d, imm_src_d);*/
	
	mux_2_x_1 #(4) mux_reg1(instruction_decode[14:11], 4'b1011, reg_src, reg1_in);
	
	register_file rf(clk, rst, reg_write, reg1_in, instruction_decode[6:3], write_register_write_back, 
						  write_register_write_back, read_data_mux, pc_plus_4_fetch, rd1, rd2, rd3);
						  
	extend ext(instruction_decode[18:0], imm_src, imm_ext);
	
	flip_flop_D #(92) decode_pipe(clk, rst, 1'b1, {rd1, rd2, rd3, imm_ext, instruction_decode[10:7]}, 
											{rd1_execute, rd2_execute, rd3_execute, extened_execute, write_register_execute});

	// Tercera etapa del pipeline Execute
	mux_2_x_1 #(22) mux2(rd2_execute, extened_execute, alu_src, mux2_out);
	mux_2_x_1 #(22) mux3(rd1_execute, 22'b0, mov_src, mov_mux_out); // Si esta haciendo mov, pone un 0 para que el alu 
	// sume con 0 y el inmediato
	
	ALU #(22) alu(mov_mux_out, mux2_out, alu_control, alu_result_execute, alu_flags);	
	flip_flop_D #(48) execute_pipe(clk, rst, 1'b1, {alu_result_execute, rd3_execute, write_register_execute}, 
											{alu_result_memory, write_data_memory, write_register_memory});
	
	// Cuarta etapa del pipeline Memory
	data_memory dm(clk, mem_write, alu_result_memory, write_data_memory, read_data_memory);
	
	flip_flop_D #(48) memory_pipe(clk, rst, 1'b1, {read_data_memory, alu_result_memory, write_register_memory}, 
											{read_data_write_back, alu_result_write_back, write_register_write_back});
	
	// Quinta etapa del pipeline Writeback
	mux_2_x_1 #(22) mux_wb(alu_result_write_back, read_data_write_back, mem_reg, read_data_mux);
	
	assign write_data = rd3_execute;
	assign data_adr = alu_result_write_back;
			  
endmodule 
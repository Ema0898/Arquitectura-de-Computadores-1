module pipelined_processor(input logic clk, rst,
			  output logic mem_write,
			  output logic [21:0] write_data, data_adr);		
		
	
	logic [21:0] result_write_back;
	logic [3:0] register_write_back;
	logic reg_write_write_back;
	logic pc_src_write_back;

	// Declaracion logics para la etapa de Fetch	
	logic [21:0] instruction_fetch;	
	
	// Declaracion logics para la etapa de Decode
	logic [21:0] instruction_decode, pc_plus_8, rd1, rd2, rd3, imm_ext, rd1_out, rd2_out, rd3_out, imm_ext_out;
	logic [3:0] wrd_out;
	logic pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, no_write_d, mov_src_d, flag_write_d;
	logic [1:0] alu_control_d;
	logic pc_src_d_o, reg_write_d_o, mem_write_d_o, mem_reg_d_o, alu_src_d_o, no_write_d_o, mov_src_d_o; 
	logic flag_write_d_o, cond_d_o;
	logic [1:0] alu_control_d_o;	
	logic flag_zero_p_d, branch_d;
	
	// Declaracion logics para la etapa de Execute
	logic [21:0] alu_result_execute, alu_exec_out, data_exec_out;
	logic [3:0] wre_out;
	logic pc_src_e, reg_write_e, mem_write_e, pc_src_e_o, reg_write_e_o, mem_reg_e_o, mem_write_e_o;
	logic flag_zero_p_e, branch_e, branch_taken_e;
	
	// Declaracion logics para la etapa de Memory
	logic [21:0] read_data_memory, read_out, alu_out_mem;
	logic [3:0] wrm_out;
	logic pc_src_m_o, reg_write_m_o, mem_reg_m_o;
	
	fetch ft(pc_src_write_back, branch_taken_e, clk, rst, result_write_back, alu_result_execute, instruction_fetch, pc_plus_8);
	flip_flop_D #(22) first(clk, rst, 1'b1, instruction_fetch, instruction_decode);
	
	decode dcd(clk, rst, reg_write_write_back, instruction_decode, pc_plus_8, result_write_back, register_write_back, 
				  rd1, rd2, rd3, imm_ext, pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, 
				  no_write_d, mov_src_d, flag_write_d, alu_control_d, branch_d);			  
	
				  
	flip_flop_D #(105) second(clk, rst, 1'b1, 
	{rd1, rd2, rd3, imm_ext, instruction_decode[10:7],
	pc_src_d, reg_write_d, mem_write_d, mem_reg_d, alu_src_d, no_write_d, mov_src_d, flag_write_d, alu_control_d, 
	instruction_decode[21], flag_zero_p_d, branch_d}, 
	{rd1_out, rd2_out, rd3_out, imm_ext_out, wrd_out, 
	pc_src_d_o, reg_write_d_o, mem_write_d_o, mem_reg_d_o, alu_src_d_o, no_write_d_o, mov_src_d_o, flag_write_d_o, alu_control_d_o, 
	cond_d_o, flag_zero_p_e, branch_e});
									 
	execute ex(clk, rst, flag_zero_p_e, branch_e, pc_src_d_o, reg_write_d_o, mem_write_d_o, alu_src_d_o, 
				  no_write_d_o, mov_src_d_o, flag_write_d_o,
				  cond_d_o, alu_control_d_o, rd1_out, rd2_out, imm_ext_out, alu_result_execute, 
				  pc_src_e, reg_write_e, mem_write_e, flag_zero_p_d, branch_taken_e);
				  
	flip_flop_D #(52) third(clk, rst, 1'b1, 
	{rd3_out, alu_result_execute, wrd_out, pc_src_e, reg_write_e, mem_reg_d_o, mem_write_e},
	{data_exec_out, alu_exec_out, wre_out, pc_src_e_o, reg_write_e_o, mem_reg_e_o, mem_write_e_o});
									
	memory mm(clk, mem_write_e_o, alu_exec_out, data_exec_out, read_data_memory);
				 
	flip_flop_D #(51) four(clk, rst, 1'b1, 
	{read_data_memory, alu_exec_out, wre_out, pc_src_e_o, reg_write_e_o, mem_reg_e_o}, 
	{read_out, alu_out_mem, wrm_out, pc_src_m_o, reg_write_m_o, mem_reg_m_o});
								  
	write_back wb(read_out, alu_out_mem, wrm_out, mem_reg_m_o, result_write_back, register_write_back);
	
	
	assign reg_write_write_back = reg_write_m_o;
	assign pc_src_write_back = pc_src_m_o;
	
	assign mem_write = mem_write_e_o;	
	assign write_data = result_write_back;
	assign data_adr = alu_exec_out;
	
			  
endmodule 
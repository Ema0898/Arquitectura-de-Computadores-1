module processor_memories(input logic clk, reset,
			  output logic mem_write,
			  output logic [21:0] write_data, data_adr);
			  
  logic [21:0] pc, instr, read_data;
  
  data_path CPU(clk, reset, instr, read_data, mem_write, pc, data_adr, write_data);
  instruction_memory im(pc, instr);
  data_memory dm(clk, mem_write, data_adr, write_data, read_data);
  
endmodule 
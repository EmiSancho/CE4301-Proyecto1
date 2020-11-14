module instruction_memory(
	input clk,
	input [7:0] address,
	output logic [31:0] data);
						
	instr_mem ROM (address, clk, data);
endmodule
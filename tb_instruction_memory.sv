// Modelsim-ASE requires a timescale directive
`timescale 1 ps / 1 ps

module tb_instruction_memory();

logic[7:0] a;
logic[31:0] d;
logic clk;

instruction_memory UUT(clk,a,d);

initial begin 
	$display("Instruction memory TB...");
	a = 0;
	clk <= 0;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	
	a = 4;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;
	#5 clk <= ~clk;

end
endmodule


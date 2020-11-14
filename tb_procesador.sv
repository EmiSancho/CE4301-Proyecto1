// Modelsim-ASE requires a timescale directive
`timescale 1 ps / 1 ps

module tb_procesador();
	logic clk, rst;
	
	PROCESADOR UUT(clk,rst);
	
	initial begin
	clk = 0;
	rst = 1;
	
	#1
	clk =~ clk;
	rst =~ rst;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	#1
	clk =~ clk;
	
	
	
	end


endmodule
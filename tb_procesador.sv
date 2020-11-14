// Modelsim-ASE requires a timescale directive
`timescale 1 ps / 1 ps

module tb_procesador();
	logic clk, rst;
	
	PROCESADOR UUT(clk,rst);
	
	 
	always #1 clk = ~clk;

	initial begin
		clk = 0;
		rst = 1;
		
		#1
		rst =~ rst;
	end


endmodule
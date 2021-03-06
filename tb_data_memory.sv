module tb_data_memory();
	logic clk, we;
	logic[7:0] a; 
	logic[31:0] wd, rd;
	
	data_memory UUT(clk, we,a,wd,rd);
	
	always #1 clk = ~clk;
	
	initial begin
		$display("Data memory TB...");
		clk <= 0;
		
		#10
		a = 0;
		we = 1;
		wd = 16;
		
		#10
		a = 4;
		wd = 9;
		
		#10
		a = 0;
		we = 0;
		
	end
	
endmodule
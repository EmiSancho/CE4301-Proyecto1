module tb_image_memory();
	logic clk, we;
	logic[31:0] a; 
	logic[7:0] wd, rd;
	
	image_memory UUT(clk, we,a,wd,rd);
	
	always #1 clk = ~clk;
	
	initial begin
		$display("Image memory TB...");
		clk <= 0;
		
		#5
		a = 0;
		we = 0;
		
		#1
		we = 1;
		wd = rd;
		 
		#5
		we = 0;
		

		
	end
	
endmodule
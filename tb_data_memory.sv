module tb_data_memory();
	logic clk, we;
	logic[15:0] a, wd, rd;
	logic[15:0] mem [254:0];
	//logic[15:0] mem [152099:0];
	logic sig;
	logic [31:0] cont;

	data_memory UUT(clk, we,a,wd,rd,mem,sig,cont);
	
	initial begin
		$display("Data memory TB...");
		clk <= 0;
		we = 1;
		a = 0;
		wd = 16;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;
		#5 clk <= ~clk;

//		a = 4;
//		wd = 17;
//		#5 clk <= ~clk;
//		#5 clk <= ~clk;
//		
//		a = 8;
//		wd = 17;
//		#5 clk <= ~clk;
//		#5 clk <= ~clk;
		
	end
	
endmodule
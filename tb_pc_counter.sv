module tb_pc_counter();
logic clk, rst;
logic[31:0] actual, next;

_pc_counter UUT(clk,rst,next,actual);
_pc_counter_4 UUT2(actual, next);

initial begin
	clk = 0;
	rst = 1;
	next = 0;
	
	#5
	clk=~clk;
	rst=~rst;
	
	#5
	clk=~clk;
	
	#5
	clk=~clk;
	
	#5
	clk=~clk;
	
	#5
	clk=~clk;
	
	#5
	clk=~clk;
	
	#5
	clk=~clk;
	
	
end

endmodule
module _register_TB();
	logic clk =  0;
	logic rst, WE3;
	logic [2:0] A1, A2, A3;
	logic [31:0] WD3, R15;
	logic [31:0] RD1, RD2;

_register_file DUT (clk, rst, WE3,A1, A2, A3, WD3, R15, RD1, RD2);
initial begin 
		rst = 1;
		#6;
		rst = 0;
		A1 = 4'b1111;
		R15 = 32'b1000;
		assert (RD1 == 32'b1000) $display("Reg ok");
		 else $error("RF not ok");
		#14;

		
end

		always
		#5 clk = !clk;
endmodule
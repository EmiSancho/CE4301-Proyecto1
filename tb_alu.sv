module tb_alu();

logic[31:0] a;
logic[31:0] b;
logic[5:0] control;
logic c,n,z,v;
logic[31:0] salida;

alu#(32)  UUT(a,b,control,c,n,z,v,salida);

initial begin
	a = 2;
	b = 2;
	control = 1;
	
	#5
	a = 5;
	b = 2;
	control = 2;
	
	#5
	a = 2;
	b = 4;
	control = 2;
	
	#5
	a = 2;
	b = 2;
	control = 2;

end

endmodule
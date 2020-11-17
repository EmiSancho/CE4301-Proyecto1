//vsim -gui -l msim_transcript work.tb_procesador -Lf altera_mf_ver

// Modelsim-ASE requires a timescale directive
`timescale 1 ps / 1 ps

module tb_procesador();
	logic clk, rst;
	
	PROCESADOR UUT(clk,rst);
	
	 
	always #1 clk = ~clk;

	initial begin
	$display("Processing image...");
	$display("Please wait.");
		clk = 0;
		rst = 1;
		
		#1
		rst = ~rst;
	end


endmodule

//add wave -position 1  sim:/tb_procesador/UUT/instruccion
//add wave -position end  sim:/tb_procesador/UUT/clk
//add wave -position end  sim:/tb_procesador/UUT/aluControl
//add wave -position end  sim:/tb_procesador/UUT/r1
//add wave -position end  sim:/tb_procesador/UUT/r2
//add wave -position end  sim:/tb_procesador/UUT/rDestino
//add wave -position end  sim:/tb_procesador/UUT/i1
//add wave -position end  sim:/tb_procesador/UUT/i2
//add wave -position end  sim:/tb_procesador/UUT/A
//add wave -position end  sim:/tb_procesador/UUT/B
//add wave -position end  sim:/tb_procesador/UUT/aluResult
//add wave -position end  sim:/tb_procesador/UUT/imWe
//add wave -position end  sim:/tb_procesador/UUT/imRAddress
//add wave -position end  sim:/tb_procesador/UUT/imWAddress
//add wave -position end  sim:/tb_procesador/UUT/imWd
//add wave -position end  sim:/tb_procesador/UUT/imRd
//add wave -position end  sim:/tb_procesador/UUT/imRd2
//add wave -position 17  sim:/tb_procesador/UUT/regFile/WE3
//add wave -position 18  sim:/tb_procesador/UUT/regFile/WD3
//add wave -position end  sim:/tb_procesador/UUT/regFile/register_file


//add wave -position end  sim:/tb_procesador/UUT/aluControl
//add wave -position end  sim:/tb_procesador/UUT/r1
//add wave -position end  sim:/tb_procesador/UUT/r2
//add wave -position end  sim:/tb_procesador/UUT/rDestino
//add wave -position end  sim:/tb_procesador/UUT/i1
//add wave -position end  sim:/tb_procesador/UUT/i2
//add wave -position end  sim:/tb_procesador/UUT/A
//add wave -position end  sim:/tb_procesador/UUT/B
//add wave -position end  sim:/tb_procesador/UUT/aluResult
//add wave -position end  sim:/tb_procesador/UUT/dmWe
//add wave -position end  sim:/tb_procesador/UUT/regFile/register_file
//add wave -position end  sim:/tb_procesador/UUT/dmRd

//add wave -position end  sim:/tb_procesador/UUT/instruccion
//add wave -position end  sim:/tb_procesador/UUT/r1
//add wave -position end  sim:/tb_procesador/UUT/r2
//add wave -position end  sim:/tb_procesador/UUT/rDestino
//add wave -position end  sim:/tb_procesador/UUT/i1
//add wave -position end  sim:/tb_procesador/UUT/i2
//add wave -position end  sim:/tb_procesador/UUT/A
//add wave -position end  sim:/tb_procesador/UUT/B
//add wave -position end  sim:/tb_procesador/UUT/aluResult
//add wave -position end  sim:/tb_procesador/UUT/imWe
//add wave -position end  sim:/tb_procesador/UUT/imRAddress
//add wave -position end  sim:/tb_procesador/UUT/imRAddress4
//add wave -position end  sim:/tb_procesador/UUT/imWAddress
//add wave -position end  sim:/tb_procesador/UUT/imWd
//add wave -position end  sim:/tb_procesador/UUT/imRd
//add wave -position end  sim:/tb_procesador/UUT/imRd2
//add wave -position end  sim:/tb_procesador/UUT/imRe
//add wave -position end  sim:/tb_procesador/UUT/regFile/register_file

module PROCESADOR(
	input logic clk,
	input logic rst
);

//---------	VARIABLES
	logic[7:0] pc = 0; // program counter
	logic[7:0] pc4 = 0; // program counter + 4
	logic[31:0] instruccion = 0; //viene de la memoria de instrucciones
	logic[5:0] aluControl = 0; // señal de control de la alu
	logic[2:0] r1 = 0; // primer registro 
	logic[2:0] r2 = 0; // segundo registro
	logic[2:0] rDestino = 0; //registro destino
	logic[7:0] i1, i2 = 0; //inmediatos
	logic[31:0] A,B,aluResult = 0; //Primer, segundo operando y resultado de ALU 
	logic imWe = 0; //image memory write enable
	logic dmWe = 0; //data memory write enable
	logic weIm = 0; // write enable data en registro PARA IMAGE MEMORY
	logic Rwe = 0; //Register write enable
	logic Rwe2 = 0; //i2 write enable in register
	logic[31:0] imRAddress = 0;	//image memory address for read
	logic[31:0] imWAddress = 0;	//image memory address for write
	logic[31:0] dmAddress = 0; //data memory address
	logic[31:0] dmRd = 0; //data memory read data
	logic[31:0] dmWd = 0; //data memory to write data
	logic[7:0] imWd = 0; // image memory to write data
	logic[7:0] imRd = 0; //image memory read data 
	logic[7:0] imRd2 = 0;
	
	
//--------- LLAMADAS
_pc_counter 				pcCounter(clk,rst,pc4,pc);
_pc_counter_4 				pcCouterMas4(pc, pc4);
instruction_memory 		instMem(clk,pc,instruccion);
_control_unit				contUnit(instruccion,imWAddress,imRAddress,aluControl,r1,r2,rDestino,i1,i2,imWe, dmWe, Rwe,Rwe2,imWAddress,imRAddress);
_register_file				regFile(clk,rst,Rwe,Rwe2,weIm,r1,r2,rDestino,aluResult,i2,imRd,A,B,dmWd,dmAddress, imWd);
data_memory					dataMemory(clk,dmWe, dmAddress, dmWd, dmRd);
image_cruda_memory		icm(clk,0,imRAddress,0,imRd);
image_procesada_memory	ipm(clk,imWe,imWAddress,imWd,imRd2);
alu							myAlu(A,B,aluControl,dmRd,imRd,aluResult);		


endmodule

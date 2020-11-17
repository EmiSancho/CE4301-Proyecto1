
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
	
	logic Rwe = 0; //Register write enable
	logic Rwe2 = 0; //i2 write enable in register
	logic[31:0] imRAddress = 0;	//image memory address for read
	logic[31:0] imRAddress4 = 0;	//image memory address for read
	
	logic[31:0] imWAddress = 0;	//image memory address for write
	logic[31:0] imWAddress4 = 0;	//image memory address for write
	
	logic[31:0] dmAddress = 0; //data memory address
	
	logic[31:0] dmWd = 0; //data memory to write data
	logic[7:0] imWd = 0; // image memory to write data
	logic[7:0] imRd = 0; //image memory read data 
	logic[7:0] imRd2 = 0;
	logic[31:0] dmRd = 0; //dato leido de la memoria de datos
	logic	imRe = 0; //bandera para aumentar la posicion en la memoria de imagen
	logic cero = 0;
	logic imWdB = 0;
	
	logic s = 0;

	logic slt = 0;
	logic sle = 0;
	logic sgt = 0;
	logic sge = 0;
	logic slt2 = 0;
	logic slt3 = 0;
	logic slt4 = 0;
	logic slt5 = 0;
	logic slt6 = 0;
	logic slt7 = 0;
	logic slt8 = 0;
	
//--------- LLAMADAS
_pc_counter 				pcCounter(clk,rst,s,se,slt,sle,sgt,sge,slt2,slt3,slt4,slt5,slt6,slt7,slt8,pc4,pc);
_pc_counter_4 				pcCouterMas4(pc, pc4);
instruction_memory 		instMem(clk,pc,instruccion);

_control_unit				contUnit(instruccion, aluControl,r1,r2,rDestino,i1,i2,imWe, dmWe, Rwe,Rwe2,imRe,imWdB);
_register_file				regFile(clk,rst,imWdB,imWe,Rwe,Rwe2,r1,r2,rDestino,aluResult,i2,imRd,dmRd,A,B,dmWd,dmAddress,imWd);
data_memory					dataMemory(clk,dmWe, dmAddress, dmWd, dmRd);

image_cruda_memory		icm(clk,cero,imRAddress4,imRAddress4,cero,imRAddress,imRd);
imRAddress4					imRA(clk,imRAddress,imRe,imRAddress4);

image_procesada_memory	ipm(clk,imWdB,imWAddress4,imWAddress4,imWd,imWAddress,imRd2);
imRAddress4					imWA(clk,imWAddress,imWdB, imWAddress4);


alu							myAlu(A,B,aluControl,aluResult,s,se,slt,sle,sgt,sge,slt2,slt3,slt4,slt5,slt6,slt7,slt8);		


endmodule

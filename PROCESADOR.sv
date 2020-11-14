
module PROCESADOR(
	input logic clk,
	input logic rst
);

//---------	VARIABLES
	logic[31:0] pc = 0;
	logic[31:0] pc4 = 0;
	logic[31:0] instruccion = 0;
	logic[5:0] aluControl = 0;
	logic[2:0] r1 = 0;
	logic[2:0] r2 = 0;
	logic[2:0] rDestino = 0;
	logic[7:0] i1, i2 = 0; //inmediatos
	logic[31:0] A,B,S = 0; //Primer, segundo operando y resultado de ALU 
	logic N,Z,C,V = 0; // Negativo, Cero, Carry, Desbordamiento
	logic Rwe = 0; //Register write enable
	


//--------- LLAMADAS
_pc_counter 				pcCounter(clk,rst,pc4,pc);
_pc_counter_4 				pcCouterMas4(pc, pc4);
instruction_memory 		instMem(clk,pc,instruccion);
_control_unit				contUnit(instruccion,aluControl,r1,r2,rDestino,i1,i2);

_register_file				regFile(clk,Rwe,r1,r2,rDestino,S, rst,A,B);

alu							myAlu(A,B,aluControl,N,Z,C,V,S);


endmodule
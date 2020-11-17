module _control_unit(input logic [31:0]instruccion,
							//input logic [31:0]imRAddress, // imWAddress, 
							output logic [5:0]AluControl,
							output logic [2:0]R1,
							output logic [2:0]R2,
							output logic [2:0]RDestino,
							output logic [7:0]i1,//inmediatos
							output logic [7:0]i2, //inmediatos
							output logic imWe, //image memory data write enable
							output logic dmWe, //data memory write enable
							output logic Rwe, //Register write enable
							output logic Rwe2, //i2 write enable in register SOLO PARA MOV
							output logic imRa, // para aumentar el valor de la direccion de la IM
							output logic imWd //IMAGE memory write dato
							);
							
	logic[5:0] aux_operacion = 0;
	logic[2:0] aux_destino = 0;
	logic[2:0] aux_r1 = 0;
	logic[2:0] aux_r2 = 0;
	logic[7:0] aux_i1 = 0;
	logic[7:0] aux_i2 = 0;	
	logic[5:0] aux_alu_control = 0;
	
	logic aux_imWe = 0;
	logic aux_dmWe = 0;
	logic aux_Rwe = 0;
	logic aux_Rwe2 = 0;
	logic	aux_imRa = 0;
	logic	aux_imWd = 0;
	
	muxControl mc(instruccion, aux_operacion, aux_r1,aux_r2,aux_destino,aux_i1,aux_i2);
	
	
	always @(*) begin
		case (aux_operacion)
			6'b000001 : begin  //SUMA
									aux_alu_control = 6'b000001;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
									
							end
						
						
			6'b000010 : begin  //RESTA
									aux_alu_control = 6'b0000010;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b000011 : begin //MOV 
									aux_alu_control = 6'b0;
									aux_Rwe2 = 1;
									aux_Rwe = 0;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b000100 : begin //DIV 
									aux_alu_control = 6'b000100;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end	
			
			6'b000101 : begin //MUL
									aux_alu_control = 6'b000101;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b000110 : begin //AND 
									aux_alu_control = 6'b000110;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b000111 : begin //OR 
									aux_alu_control = 6'b000111;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b001000 : begin //STR en la memoria de datos
									aux_alu_control = 6'b0;
									aux_Rwe2 = 0;
									aux_Rwe = 0;
									aux_imWe = 0;
									aux_dmWe = 1;
									aux_imRa = 0;
									aux_imWd = 0;
							end
							
			6'b001001 : begin //LDR desde la memoria de datos
									aux_alu_control = 6'b0;
									aux_Rwe2 = 0;
									aux_Rwe = 1;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 0;
									
							end
							
			6'b001010 : begin //STR en la imagen procesada
									aux_alu_control = 6'b0;
									aux_Rwe2 = 0;
									aux_Rwe = 0;
									aux_imWe = 0;
									aux_dmWe = 0;
									aux_imRa = 0;
									aux_imWd = 1;
							end
							
			6'b001011 : begin //LDR desde la imagen cruda
									aux_alu_control = 6'b0;
									aux_Rwe2 = 0;
									aux_Rwe = 0;
									aux_imWe = 1;
									aux_dmWe = 0;
									aux_imRa = 1;
									aux_imWd = 0;
							end
							
			default: aux_alu_control = 6'b000000;				
			
		endcase
						  
	end
	
	assign AluControl = aux_alu_control;
	assign RDestino = aux_destino;
	assign R1 = aux_r1;
	assign R2 = aux_r2;
	assign i1 = aux_i1;
	assign i2 = aux_i2;
	assign imWe = aux_imWe;
	assign dmWe = aux_dmWe;
	assign Rwe = aux_Rwe;
	assign Rwe2 = aux_Rwe2;
   assign imRa = 	aux_imRa;
	assign imWd = aux_imWd;

endmodule 
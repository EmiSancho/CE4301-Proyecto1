module _control_unit(input logic [31:0]instruccion,
							output logic [5:0]AluControl,
							output logic [2:0]R1,
							output logic [2:0]R2,
							output logic [2:0]RDestino,
							output logic Mwe,
							output logic [7:0] i1,//inmediatos
							output logic [7:0] i2, //inmediatos
							output Rwe,
							output Rwe2
//							output logic PCsrc,
//							output logic MemtoReg,
//							output logic AluSrc,
//							output logic RegWrite,
//							output logic SelB,
//							output logic [1:0]RegSrc,
//							input logic [63:0]FlagsCmp 
							);
							
	logic[5:0] aux_operacion;
	logic[2:0] aux_destino;
	logic[2:0] aux_r1;
	logic[2:0] aux_r2;
	logic[7:0] aux_i1;
	logic[7:0] aux_i2;
	logic[5:0] aux_alu_control;
	logic aux_Rwe = 0;
	logic aux_Rwe2 = 0;
	logic aux_Mwe = 0;
	
	
	muxControl mc(instruccion, aux_operacion, aux_r1,aux_r2,aux_destino,aux_i1,aux_i2);
	
	
	always @(*) begin
		case (aux_operacion)
			6'b000001 : begin  //SUMA
									aux_alu_control = 6'b000001;
									aux_Rwe = 1;
							end
						
						
			6'b000010 : begin  //RESTA
									aux_alu_control = 6'b0000010;
									aux_Rwe = 1;
							end
							
			6'b000011 : begin //MOV 
									aux_alu_control = 6'b0;
									aux_Rwe2 = 1;
							end
							
			6'b000100 : begin //DIV 
									aux_alu_control = 6'b000100;
									aux_Rwe = 1;
							end	
			
			6'b000101 : begin //MUL
									aux_alu_control = 6'b000101;
									aux_Rwe = 1;
							end
							
			6'b000110 : begin //AND 
									aux_alu_control = 6'b000110;
									aux_Rwe = 1;
							end
							
			6'b000111 : begin //OR 
									aux_alu_control = 6'b000111;
									aux_Rwe = 1;
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
	assign Rwe = aux_Rwe;
	assign Mwe = aux_Mwe;
	assign Rwe2 = aux_Rwe2;

endmodule 
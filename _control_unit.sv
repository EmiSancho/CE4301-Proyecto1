module _control_unit(input logic [31:0]instruccion,
							output logic [5:0]AluControl,
							output logic [2:0]R1;
							output logic [2:0]R2;
							output logic [2:0]RDestino,
							output logic MemWrite,
							output logic [7:0] i1,//inmediatos
							output logic [7:0] i2;//inmediatos
							
//							output logic PCsrc,
//							output logic MemtoReg,
//							output logic AluSrc,
//							output logic RegWrite,
//							output logic SelB,
//							output logic [1:0]RegSrc,
//							input logic [63:0]FlagsCmp 
							);
							
	logic[5:0] aux_operacion = instruccion[31:26];
	logic[2:0] aux_destino = instruccion[24:22];
	logic[2:0] aux_r1 = instruccion[21:19];
	logic[2:0] aux_r2 = instruccion[18:16];
	logic[7:0] aux_i1 = instruccion[15:8];
	logic[7:0] aux_i2 = instruccion[7:0];
	logic[5:0] aux_alu_control;
	
	
	
	always @(*) begin
		case (aux_operacion)
			6'b000001 : begin  //SUMA
									aux_alu_control = 6'b000001;
						
							end
						
						
			6'b000010 : begin  //RESTA
									aux_alu_control = 6'b0000010;
							end
							
			default: aux_alu_control = 6'b000000;				
			
		endcase
						  
	end
	
	assign AluControl = aux_alu_control;
	assign RDestino = aux_destino;
	assign R1 = aux_r1;
	assign R2 = aux_r2;
	assign i1 = auxi1;
	assign i2 = auxi2;

endmodule 
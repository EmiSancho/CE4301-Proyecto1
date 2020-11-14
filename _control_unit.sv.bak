module _control_unit(input logic [5:0]Cond,
							input logic [3:0]Op,
							input logic [5:0]Funct,
							
							output logic [5:0]AluControl,
							output logic PCsrc,
							output logic MemtoReg,
							output logic MemWrite,
							output logic AluSrc,
							output logic RegWrite,
							output logic SelB,
							output logic [1:0]RegSrc,
							input logic [63:0]FlagsCmp 
							);
							
	assign AluControl = Funct;
	
	always @(Op,PCsrc,MemtoReg,MemWrite,AluSrc,RegWrite,Cond,FlagsCmp) begin
		case (Op)
			4'b0000 : begin  
						RegSrc=2'b11;
						PCsrc=1;
						AluSrc=1;
						RegWrite=1;
						MemtoReg=0;
						MemWrite=0;
						SelB=0;
						end
			4'b0001 : begin  
						RegSrc=2'b11;
						PCsrc=1;
						AluSrc=0;
						RegWrite=1;
						MemtoReg=0;
						MemWrite=0;
						SelB=0;
						end			
		endcase
						  
	end
	
	

endmodule 
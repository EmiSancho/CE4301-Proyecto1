module data_memory #(parameter IMAGE_WIDTH=15,IMAGE_HEIGHT=15,PIX_SIZE=16)
						(input logic CLK, WE,
						input logic [PIX_SIZE-1:0] A, WD,
						output logic [PIX_SIZE-1:0] RD,
						output logic [PIX_SIZE-1:0] memory[(255)-1:0],//IMAGE_WIDTH*IMAGE_HEIGHT
						//output logic [PIX_SIZE-1:0] memory[(152100)-1:0],//IMAGE_WIDTH*IMAGE_HEIGHT
						output logic signal,
						output logic [31:0] contador);
	
	logic [31:0] cond=0;

		
	initial

	$readmemh("C:/Users/emily/Desktop/CE4301-Proyecto1/data_memory.img", memory);

	assign RD = memory[A[PIX_SIZE-1:0]];
	
	always_ff @(negedge CLK) 
	begin
		if(WE == 1)begin
			memory[A] <= WD;	
			cond=cond+1;
		end
		if(cond==2)
			signal<=1'b1;
		$writememh("C:/Users/emily/Desktop/CE4301-Proyecto1/data_memory.img", memory);

	end
	assign contador=cond;
endmodule



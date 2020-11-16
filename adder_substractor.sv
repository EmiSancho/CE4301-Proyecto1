


module adder_substractor #(parameter WIDTH = 32)( 
//El parámetro WIDTH define la cantidad de bits de entrada

	input [WIDTH-1:0] A,// Primero numero binario de entrada
	input [WIDTH-1:0] B,//segundo numero binario de entrada, se le aplica el complemento si la bandera SUBS es 1
	input SUBS, //Bandera que corresponde aal funcionamieto del sumador, en caso de ser 1 resta
	output [WIDTH-1:0] S
	
	);
	genvar i;
	genvar j;

	logic [WIDTH:0] AuxCarry = 0;
	logic [WIDTH-1:0] AuxB = 0;
	logic [WIDTH-1:0] AuxZero =0;

	generate

	//Se genera el complemento a la base del numero B
	complement  #(.WIDTH( WIDTH)) FullComplement (B,SUBS,AuxB);

	//Se genera el sumador en la etapa de generate
	for ( i  = 0 ; i <WIDTH ;i++ ) begin: generate_Adder_Substractor

		 if (i==0) begin
		 //En casi de ser uno se suma SUBS como el carryIn y se asigan las salidads a variables logicas auxiliates
		 
			  full_adder bitAdder(A[i],AuxB[i],SUBS,S[i],AuxCarry[i]);
			  //Se agrega una compuerta OR al final para crear la compuerta Z
			  or (AuxZero[i],S[i],0);
		 end
		 else begin
		 
		 //Se toman los valores de la iteracion anterior y se aliementan al circuito 
			  full_adder bitAdder(A[i],AuxB[i],AuxCarry[i-1],S[i],AuxCarry[i]);
			  //or (AuxZero[i],S[i],AuxZero[i-1]);
		 end	
	end
	
		//Se asigna Cout a la variable auxiliar de carry
		 //assign Cout = AuxCarry[WIDTH-1];
			//Se calcula si el numero de salida es Z
		 //not  (Z,AuxZero[WIDTH-1]);
		 
		 //El negativo se da si se tiene 0 como carry y está en modo de resta
		 //and Negative (N,SUBS,~Cout);
		 
		 //Overflow se da cuando está en modo de sum y tenemos un carryOut
		 //and Overflow(V,~SUBS,Cout);
	 
	endgenerate

endmodule



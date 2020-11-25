`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:38 11/18/2020
// Design Name:   my_ALU
// Module Name:   C:/Users/User/AppData/Verilog_Shev/ALU/my_ALU_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module my_ALU_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg [2:0] op;

	// Outputs
	wire [3:0] c;
	wire co;
	
	

	// Instantiate the Unit Under Test (UUT)
	my_ALU uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.c(c), 
		.co(co)
	);
	
		integer i = 0;
		
	
	
	initial begin
	   
		
		a = 4'b1110;
		b = 4'b0000;
		op = 3'b000;

		#5;
		if (c == ~a && co == 1'b0)
		i = i+1;
		
		
		
		
		a = 4'b1111;
		b = 4'b1000;
		op = 3'b001;
		#5;
		if (c == 4'b1000 && co == 1'b0)
		i = i+1;
		
		
		a = 4'b1010;
		b = 4'b0001;
		op = 3'b010;
		#5;
		if (c == a|b && co ==1'b0)
		i = i+1;
		
		a = 4'b1110;
		b = 4'b1000;
		op = 3'b011;
		#5;
		if (c == a^b && co ==1'b0)
		i = i+1;
		
		a = 4'b1110;
		b = 4'b0100;
		op = 3'b100;
		#5;
		if ({co, c}==a+b)
		i = i+1;
		
		a = 4'b1001;
		b = 4'b0001;
		op = 3'b111;
		#5;
		if ({co, c}==5'b00000)
		i = i+1;
		
		
		if ( i== 6)
		$display("Test completed succesfully!");
		else
		$display("Something's wrong!");
        
		
		$finish;
		
		

	end
      
endmodule


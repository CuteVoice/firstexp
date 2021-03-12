`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:21 03/09/2021
// Design Name:   Counter_8bit
// Module Name:   C:/Users/User/Documents/Verilog_projects/Counter_8bit/Counter_8bit_tb.v
// Project Name:  Counter_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counter_8bit_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	Counter_8bit uut (
		.clk(clk), 
		.led(led)
	);
	
	always 
			begin
				clk <= 1'b0;
				#10;
				clk <= 1'b1;
				#10;
			end
			
	initial begin
	
		
	

		
		#1000;
		$finish;
        
		

	end
      
endmodule


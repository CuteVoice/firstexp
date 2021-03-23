`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:37:04 03/23/2021
// Design Name:   Debounce_switch_module
// Module Name:   C:/Users/User/Documents/Verilog_projects/Debounce_Switch/module_tb.v
// Project Name:  Debounce_Switch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Debounce_switch_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module module_tb;

	// Inputs
	reg clk;
	reg i_switch;

	// Outputs
	wire LED;

	// Instantiate the Unit Under Test (UUT)
	Debounce_switch_module uut (
		.clk(clk), 
		.i_switch(i_switch), 
		.LED(LED)
	);
	
	always 
		begin
			clk = 0; 
			#10;
			clk = 1;
			#10;
		end
	
	

	initial begin
		clk = 0;
		

		i_switch = 1;
		#5000000;
		i_switch = 0;
		#1000000;
		i_switch = 1;
		#1000000;
		i_switch = 0;
		#1000000;
		i_switch = 1;
		#1000000;
		i_switch = 0;
		#5000000;
		

		
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule


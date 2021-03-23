`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:42 03/23/2021 
// Design Name: 
// Module Name:    Debounce_switch_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Debounce_switch_module
	(input clk,
	 input i_switch,
	 output LED);
	 
	 reg r_LED = 1'b0;
	 reg r_switch = 1'b0;
	 
	 wire w_switch;
	 
	 Debounce_filter Instance
		(.clk(clk),
		 .i_switch(i_switch),
		 .o_switch(w_swich));
	 
	 
	 always @(posedge clk)
		begin
			r_switch <= w_switch;
			
			if (w_switch == 1'b0 && r_switch == 1'b1)
				begin
					r_LED <= ~r_LED;
				end
		end
		
	 assign LED = r_LED;


endmodule

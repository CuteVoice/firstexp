`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:31 03/23/2021 
// Design Name: 
// Module Name:    Debounce_filter 
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
module Debounce_filter
	(input clk,
	 input i_switch,
	 output o_switch);
	 
	 parameter c_DEBOUNCE_LIMIT = 500000;//10ms at 50MHz
	 
	 reg r_state = 1'b0;
	 reg [19:0] r_count = 0;
	
    always @(posedge clk)
		begin
			if (i_switch !== r_state && r_count < c_DEBOUNCE_LIMIT)
				r_count <= r_count + 1;
				
			else if(r_count == c_DEBOUNCE_LIMIT)
				begin
					r_count <= 0;
					r_state <= i_switch;
				end
				
			else
				r_count <= 0;
		end
	  
	  assign o_switch = r_state;

endmodule

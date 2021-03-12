`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:08 03/09/2021 
// Design Name: 
// Module Name:    Counter_8bit 
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
module Counter_8bit(
    input wire clk,
    output reg [7:0] led = 8'b0
    );
	 
	 reg [22:0] counter = 23'b0;
	 always @(posedge clk)
	 begin
		if(counter == 23'b10011000100101100111111)
		begin
		led = led + 8'b1;
		counter <= 0;
		end
		else counter <= counter + 1'b1;
	 
	 end
	 


endmodule

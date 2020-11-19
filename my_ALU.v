`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:07 11/18/2020 
// Design Name: 
// Module Name:    my_ALU 
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
module my_ALU(
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,
    output reg [3:0] c,
    output reg co
    );
	 
	 always @(a or b or op)
	 begin
		case (op)
			3'b000: c = ~a;
			3'b001: c = a&b;
			3'b010: c = a|b;
			3'b011: c = a^b;
			3'b100: {co , c} = a + b;
		endcase
	 end


endmodule

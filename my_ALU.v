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
			3'b000: begin 
						c <= ~a;
						co <= 1'b0;
					  end
			3'b001: begin 
						c <= a&b;
						co <= 1'b0;
					  end						
			3'b010: begin 
						c <= a|b;
						co <= 1'b0;
					  end
			3'b011: begin 
						c <= a^b;
						co <= 1'b0;
					  end
			3'b100: {co , c} <= a + b;
			default: {co , c} <= 5'b00000;//Поставил нули, потому что при проверке в testbench "if" не реагировала на if({co,c}==5'bxxxxx)
		endcase
	 end


endmodule

`timescale 1ns / 1ps

module LCD_test( clk, sf_e, e, rs, rw, d, c, b, a );

	(* LOC = "C9" *) input clk; // pin C9 is the 50-MHz on-board clock
	(* LOC = "D16" *) output reg sf_e = 0; // 1 LCD access (0 StrataFlash access)
	(* LOC = "M18" *) output reg e = 0; // enable (1)
	(* LOC = "L18" *) output reg rs = 0; // Register Select 
													 // 0: Instruction register during write operations. Busy Flash during read operations 
													 // 1: Data for read or write operations
	(* LOC = "L17" *) output reg rw = 0; // Read/Write, 1/0
	(* LOC = "M15" *) output reg d = 0; // 4th data bits 
	(* LOC = "P17" *) output reg c = 0; // 3rd data bits 
	(* LOC = "R16" *) output reg b = 0; // 2nd data bits 
	(* LOC = "R15" *) output reg a = 0; // 1st data bits 
	
	reg [ 26 : 0 ] count = 0;	// 27-bit count
	reg [ 5 : 0 ] code;			// 6-bit different signals
	reg refresh;					// refresh LCD
	
	always @ (posedge clk) begin
		count <= count +1;
		
		case ( count[ 26 : 21 ] )
//Initializing the Display(just like in tutorial - page 53):
			0: code <= 6'b000011;			
			1: code <= 6'b000011;			
			2: code <= 6'b000011;			
			3: code <= 6'b000010;			
			
//Function Set:
			4: code <= 6'b000010;			// upper nibble 
			5: code <= 6'b001000;			// lower nibble 
			
//Entry Mode

			6: code <= 6'b000000; 		// upper nibble 
			7: code <= 6'b000110;		// lower nibble: cursor moves to right(the 2nd bit is 1)
			
// Table 5-3, Display On/Off
// send 00 and upper nibble 0000, then 00 and lower nibble 1DCB:
// D: 1, show char represented by code in DDR, 0 don't, but code remains
// C: 1, show cursor, 0 don't
// B: 1, cursor blinks (if shown), 0 don't blink (if shown)
			8: code <= 6'b000000;			//Display On/Off, upper nibble 0000
			9: code <= 6'b001100;			//lower nibble 1100 (1 D C B)
			
//Clear Display, 00 and upper nibble 0000, 00 and lower nibble 0001
			10: code <= 6'b000000;		//upper nibble
			11: code <= 6'b000001;		//lower nibble


//Write Data to DD RAM (or CG RAM)

			12: code <= 6'b100100;		// 'H' high nibble
			13: code <= 6'b101000;		// 'H' low nibble
			
			14: code <= 6'b100110;		// e
			15: code <= 6'b100101;
			
			16: code <= 6'b100110;		// l
			17: code <= 6'b101100
			;
			18: code <= 6'b100110;		// l
			19: code <= 6'b101100;
			
			20: code <= 6'b100110;		// o
			21: code <= 6'b101111;
			
			22: code <= 6'b100010;		// ,
			23: code <= 6'b101100;
			
// pos cursor to 2nd line
			24: code <= 6'b001100;	
			25: code <= 6'b000000;	
			
// 2nd line:
			26: code <= 6'b100101;		// V
			27: code <= 6'b100110;
			
			28: code <= 6'b100110;		// l
			29: code <= 6'b101100;
			
			30: code <= 6'b100110;		// a
			31: code <= 6'b100001;
			
			32: code <= 6'b100110;		// d
			33: code <= 6'b100100;
			
			34: code <= 6'b100110;		// i
			35: code <= 6'b101001;
			
			36: code <= 6'b100110;		// m
			37: code <= 6'b101101;
			
			38: code <= 6'b100110;     // i
			39: code <= 6'b101001;
			
			40: code <= 6'b100111;     // r
			41: code <= 6'b100010;
			
			42: code <= 6'b100010;     // !
			43: code <= 6'b100001;
			
// Read Busy Flag and Address
// send 01 BF (Busy Flag) x x x, then 01xxxx

			default: code <= 6'b010000;	// the rest un-used time
		endcase

// refresh (enable) the LCD 

			refresh <= count[ 20 ]; //  read/write enables when: count[20] = 1
			sf_e <= 1;
			{ e, rs, rw, d, c, b, a } <= { refresh, code };
			
	end 

endmodule

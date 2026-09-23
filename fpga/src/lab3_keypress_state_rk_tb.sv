//	lab3_keypress_state_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify the keypresses exerted match the keypad

`timescale 1 ns/1 ns

module lab3_keypress_state_rk_tb();
	logic			  enable;
	logic			   reset;
	logic    	   	 	 clk;    
	logic    	  [3:0] rows;   
	logic      	  [3:0] cols;
	logic    		   press;
	logic    	[3:0] switch;
	logic 		  [15:0] map;

    lab3_keypress_state_rk dut (
		.clk(clk),
		.reset(reset),
		.enable(enable),
		.rows(rows),
		.columns(cols),
		.one_key(press),
		.switch(switch),
		.keymap(map)
    );
	
  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

initial begin
	// initialize	
	reset = 0;
	#15
	reset = 1;
	#5
	enable = 0;
	#15
	enable = 1;
	#5
	rows = 4'b0000;
	#5
	cols = 4'b1111;
	#5


	// check each single press
	// 1
		// check each single press
	// 1
	rows = 4'b0001;
	cols = 4'b1110;
	#900000
	rows = 4'b0010;
	cols = 4'b1111;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	#900000
	
	//2
	rows = 4'b0001;
	cols = 4'b1101;
	#900000
	rows = 4'b0010;
	cols = 4'b1111;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	#900000
	
	//3
	rows = 4'b0001;
	cols = 4'b1011;
	#900000
	rows = 4'b0010;
	cols = 4'b1111;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	#900000
	
	//A
	rows = 4'b0001;
	cols = 4'b0111;
	#900000
	rows = 4'b0010;
	cols = 4'b1111;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	#900000
	
	//4
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	cols = 4'b1110;
	#900000
	rows = 4'b0100;
	cols = 4'b1111;
	#900000
	rows = 4'b1000;
	#900000
	
	
	//5
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	cols = 4'b1101;
	#900000
	rows = 4'b0100;
	cols = 4'b1111;
	#900000
	rows = 4'b1000;
	#900000
	
	
	//6
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	cols = 4'b1011;
	#900000
	rows = 4'b0100;
	cols = 4'b1111;
	#900000
	rows = 4'b1000;
	#900000
	
	
	//B
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	cols = 4'b0111;
	#900000
	rows = 4'b0100;
	cols = 4'b1111;
	#900000
	rows = 4'b1000;
	#900000
	
	
	//7
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	cols = 4'b1110;
	#900000
	rows = 4'b1000;
	cols = 4'b1111;
	#900000

	
	//8
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	cols = 4'b1101;
	#900000
	rows = 4'b1000;
	cols = 4'b1111;
	#900000
	
	//9
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	cols = 4'b1011;
	#900000
	rows = 4'b1000;
	cols = 4'b1111;
	#900000
	
	//C
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	cols = 4'b0111;
	#900000
	rows = 4'b1000;
	cols = 4'b1111;
	#900000
	
	//F
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	cols = 4'b1110;
	#900000
	
	//0
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	cols = 4'b1101;
	#900000
	
	//E
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	cols = 4'b1011;
	#900000
	
	//D
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0010;
	#900000
	rows = 4'b0100;
	#900000
	rows = 4'b1000;
	cols = 4'b0111;
	#900000
	
	

	// multiple presses
	rows = 4'b0001;
	cols = 4'b0010;
	#900000
	rows = 4'b0010;
	cols = 4'b1001;
	#900000
	rows = 4'b0100;
	cols = 4'b1101;
	#900000
	rows = 4'b1000;
	cols = 4'b1011;
	#900000
	
	
	// enable verification
	enable = 0;
	#5
	rows = 4'b0001;
	cols = 4'b1111;
	#900000
	rows = 4'b0100;
	cols = 4'b1010;
	#900000
	
	enable = 1;
	#20
	rows = 4'b1000;
	cols = 4'b1011;
	#900000
	
	
	reset = 0;
	#50
	reset = 1;
	#5
	enable = 0;
	#50
	rows = 4'b1000;
	cols = 4'b1011;
	#900000
	
    #100 $stop;
  end
endmodule
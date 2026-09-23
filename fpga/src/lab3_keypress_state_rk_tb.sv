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
	#5
	//reset = 1;
	#5
	enable = 0;
	#5
	//enable = 1;
	#5
	rows = 4'b0000;
	#5
	cols = 4'b1111;
	#5


	// check each single press
	// 1
	rows = 4'b0001;
	#5
	cols = 4'b1110;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//2
	rows = 4'b0001;
	#5
	cols = 4'b1101;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//3
	rows = 4'b0001;
	#5
	cols = 4'b1011;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//A
	rows = 4'b0001;
	#5
	cols = 4'b01111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//4
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1110;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//5
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1101;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//6
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1011;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//B
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b0111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//7
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1110;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//8
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1101;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//9
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1011;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//C
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b0111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1111;
	#5
	
	//F
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1110;
	#5
	
	//0
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1101;
	#5
	
	//E
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1011;
	#5
	
	//D
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b0111;
	#5
	
	
	

	// multiple presses
	rows = 4'b0001;
	#5
	cols = 4'b0010;
	#5
	rows = 4'b0010;
	#5
	cols = 4'b1001;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1101;
	#5
	rows = 4'b1000;
	#5
	cols = 4'b1011;
	#5
	
	
	// enable verification
	enable = 0;
	#5
	rows = 4'b0001;
	#5
	cols = 4'b1111;
	#5
	rows = 4'b0100;
	#5
	cols = 4'b1010;
	#5
	
	enable = 1;
	#20
	rows = 4'b1000;
	#5
	cols = 4'b1011;
	#5
	
	
	reset = 0;
	#50
	reset = 1;
	#5
	enable = 0;
	#50
	rows = 4'b1000;
	#5
	cols = 4'b1011;
	#5
	
	
    #100 $stop;
  end
endmodule
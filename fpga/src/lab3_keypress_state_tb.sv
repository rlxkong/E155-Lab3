//	lab3_keypress_state_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify the keypresses exerted match the keypad

`timescale 1 ns/1 ns

module lab3_keypress_state_rk_tb();
  logic    	   	 clk;    
  logic    [3:0] rows;   
  logic    [3:0] cols;
  logic    		 press;
  logic    [3:0] switch;
  logic	   [1:0] col_idx;


    lab3_keypress_state_rk dut (
		.clk(clk),
		.rows(rows),
		.columns(cols),
		.press(press),
		.switch(switch),
		.col_idx(col_idx)
    );
	
  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

initial begin
	// initialize	
	rows = 4'b0000;
	cols = 4'b1111;
	#20

	// check state case
	rows = 4'b0001;
	cols = 4'b1110;
	#20

	rows = 4'b0010;
	cols = 4'b1101;
	#20
	
	rows = 4'b0100;
	cols = 4'b1011;
	#20
	
	rows = 4'b1000;
	cols = 4'b0111;
	#20
	
	

	// one singular press
	rows = 4'b0001;
	cols = 4'b1110;
	#20

	rows = 4'b0010;
	cols = 4'b1111;
	#20
	
	rows = 4'b0100;
	cols = 4'b1111;
	#20
	
	rows = 4'b1000;
	cols = 4'b1111;
	#20
	
	
	
	
	rows = 4'b0001;
	cols = 4'b1001;
	#20

	// check state case
	rows = 4'b0001;
	cols = 4'b0010;
	#20

	rows = 4'b0010;
	cols = 4'b0101;
	#20
	
	rows = 4'b0100;
	cols = 4'b1011;
	#20
	
	rows = 4'b1000;
	cols = 4'b0101;
	#20
	
	
    #100 $stop;
  end
endmodule
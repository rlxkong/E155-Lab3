//	lab3_keypress_state_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify the keypresses exerted match the keypad

`timescale 1 ns/1 ns

module lab3_keypress_state_rk_tb();
  logic    	   clk;    
  logic    [3:0] d;   
  logic    [3:0] q;    


    lab3_keypress_state_rk dut (
		.clk(clk),
		.d(d),
		.q(q)
    );
	
  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

  initial begin
	// input async input on off tick
		#2;				//no on a clk tick
		d = 4'b0010;
		#30;
		#5;
		d = 4'b1111;
			
    #100 $stop;
  end
endmodule
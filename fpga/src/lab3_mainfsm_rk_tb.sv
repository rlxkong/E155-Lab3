//	lab3_mainfsm_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify the keypresses exerted match the keypad

`timescale 1 ns/1 ns

module lab3_mainfsm_rk_tb();
  logic    	   	  clk;    
  logic          reset;
  logic          enable;
  logic          debounced;
  logic          press;
  logic    [3:0] switch;
  logic    [1:0] col_idx;
  logic    [3:0] cols;
  logic    [3:0] rows;   
  logic    [3:0] d0;
  logic    [3:0] d1;

    lab3_mainfsm_rk dut (
		.clk(clk),
		.reset(reset),
		.enable(enable),
		.debounced(debounced),
		.press(press),
		.switch(switch),
		.col_idx(col_idx),
		.cols(cols),
		.rows(rows),
		.d0(d0),
		.d1(d1)
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
	reset = 1;
	#5
	reset = 0;
	#5
	reset = 1;
	#5
	enable = 1;
	#5
	debounced = 0;
	#5
	press = 0;
	#5
	cols = 4'b1111;
	#5

	#27
	// check state case
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#5		
	debounced = 1;
	#22
	// check and case
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);	
	#5		
	press = 1;
	#5
	cols = 4'b1011;
	#22
	// check and case
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);	
			
	#24
	
	
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#16
	cols = 4'b1000;
	#5
	debounced = 0;
	#5
	press = 0;
	#8
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
	#5	
	cols = 4'b1011;
	#5
	press = 1;
	#22
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
			
	cols = 4'b1110;
	#5
	debounced = 1;
	#21
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is PRESS at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	// enable verification
	#5
	enable = 0;
	#65
	assert (dut.state == 2'b01)  
            $display("PASSED! The enable works as desired and state is PRESS at time: %0t.", $time);
        else 
            $error("FAILED! The enable and state behave incorrectly at time: %0t.", $time);
			
	// reset verification
	#10
	reset = 0;
	#30
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#5
	enable = 1;
	#5
	reset = 1;
	#50
	reset = 0;
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
    #100 $stop;
  end
endmodule
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
	switch = ~4'b0010;
	#22
	// check and case
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is PRESS at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);	
			
	#24
	
	
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
			
	#24
	
	
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
			
	#16		
	debounced = 0;
	press = 0;	
	#5
	cols = 4'b1110;
	switch = ~4'b1010;
	press = 1;
	debounced = 1;
	#29
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);		
			
	#16
	cols = 4'b1000;
	switch = ~4'b0010;
	debounced = 0;
	press = 0;
	#26
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
	#5	
	cols = 4'b0111;
	switch = ~4'b0001;
	press = 1;
	#32
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
			
	#5
	debounced = 1;
	#45
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is PRESS at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	// enable verification
	enable = 0;
	#65
	assert (dut.state == 2'b10)  
            $display("PASSED! The enable works as desired at time: %0t.", $time);
        else 
            $error("FAILED! The enable behaves incorrectly at time: %0t.", $time);
			
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
	#20
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is SCAN at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
		
	reset = 1;
	#5
	debounced = 1;
	press = 1;
	cols = 4'b1101;
	switch = ~4'b0011;
	#50
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is HOLD at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
    #100 $stop;
  end
endmodule
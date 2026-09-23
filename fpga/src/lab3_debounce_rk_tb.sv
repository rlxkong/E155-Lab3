//	lab3_debounce_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify that debounce works properly

`timescale 1 ps/1 ps

module lab3_debounce_rk_tb();
  logic    		clk;
  logic    		reset;
  logic  [15:0] map;   
  logic    		deb_en;    


    lab3_debounce_rk dut (
		.clk(clk),
        .reset(reset),
		.keymap(map),
		.deb_enabled(deb_en)
    );
	
	
  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

  initial begin
	// initialize
	reset = 1;
	#10
	map = 16'b1111111111111111;
	#10
	
	// check state case
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#15
	map = 16'b1111111111111110;
	#58
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is WAIT at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#16
	map = 16'b1111111111111111;
	#45
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	map = 16'b0111111111111111;
	#19
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is WAIT at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#18
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is WAIT at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#17
	assert (deb_en == 0)  
            $display("PASSED! The deb_enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The deb_enable behaves as desired at time: %0t.", $time);
	#10486000
	assert (dut.state == 2'b10)  
            $display("PASSED! The state is PRESSED at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#10
	assert (deb_en == 1)  
            $display("PASSED! The deb_enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The deb_enable behaves as desired at time: %0t.", $time);			
	#20
	map = 16'b1111111111111111;
	#50
	assert (deb_en == 0)  
            $display("PASSED! The deb_enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The deb_enable behaves as desired at time: %0t.", $time);	
	
	// reset verification
	map = 16'b1111111111111101;
	#50
	reset = 0;
	#30
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
    #100 $stop;
  end
endmodule
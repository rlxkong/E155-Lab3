//	lab3_debounce_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify that debounce works properly

`timescale 1 ps/1 ps

module lab3_debounce_rk_tb();
  logic    		  clk;
  logic    		reset;
  logic 		[3:0] col;   
  logic    	   deb_en;    


    lab3_debounce_rk dut (
		.clk(clk),
        .reset(reset),
		.columns(col),
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
	col = 4'b1111;
	#10
	
	// check state case
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#15
	col = 4'b1100;
	#17
	assert (dut.state == 2'b01)  
            $display("PASSED! The state is WAIT at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	#16
	col = 4'b1111;
	#45
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	col = 4'b0000;
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
	#10500000
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
	col = 4'b1111;
	#50
	assert (deb_en == 0)  
            $display("PASSED! The deb_enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The deb_enable behaves as desired at time: %0t.", $time);	
	
	// reset verification
	col = 4'b0101;
	#10
	reset = 0;
	#30
	assert (dut.state == 2'b00)  
            $display("PASSED! The state is IDLE at time: %0t.", $time);
        else 
            $error("FAILED! The state behaves incorrectly at time: %0t.", $time);
	
    #100 $stop;
  end
endmodule
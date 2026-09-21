//	lab3_flipflop_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/21/2026
//
//	A testbench used to verify that this is a proper 4 bit syncronous, enableable, resetable register

`timescale 1 ns/1 ns

module lab3_flipflop_rk_tb();
  logic    	   clk;
  logic     enable;
  logic      reset;
  logic    [3:0] d;   
  logic    [3:0] q;    


    lab3_flipflop_rk dut (
		.clk(clk),
        .enable(enable),
        .reset(reset),
		.d(d),
		.q(q)
    );
	
  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

  initial begin
	// initialize
	reset = 1;
	#20
	enable = 1;
	#20
	
	// check value storing
	d = 4'b0000;
	#25
	assert (q == d)  
            $display("PASSED! The flipflop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flipflop behaves incorrectly at time: %0t.", $time);
	#10
	d = 4'b0001;
	#20
	assert (q == d)  
            $display("PASSED! The flipflop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flipflop behaves incorrectly at time: %0t.", $time);
	
	
	// enable verification
	enable = 0;
	#20
	d = 4'b0010;
	#30
	assert (q == 4'b0001)  
            $display("PASSED! The flipflop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flipflop behaves incorrectly at time: %0t.", $time);
	
	// reset verification
	reset = 0;
	#30
	assert (q == 4'b0000)  
            $display("PASSED! The flipflop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flipflop behaves incorrectly at time: %0t.", $time);
	
	enable = 1;
	#30
	d = 4'b0011;
	#20
	assert (q == 4'b0000)  
            $display("PASSED! The flipflop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flipflop behaves incorrectly at time: %0t.", $time);
	
    #50 $stop;
  end
endmodule
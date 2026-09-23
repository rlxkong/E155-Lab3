//	lab3_top_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/23/2026
//
//	A testbench used to verify that inputs are synced to clock ticks

`timescale 1 ns/1 ns

module lab3_top_rk_tb();
  logic    	      reset;    
  logic    	   	  enable;
  logic    	[3:0] cols;   
  logic    	[3:0] rows;
  logic 	[6:0] seg;
  logic 	[1:0] power;


    lab3rk dut (
		.reset(reset),
		.enable(enable),
		.cols(cols),
		.rows(rows),
		.seg(seg),
		.power(power)
    );

  initial begin
	// initialize
	reset = 0;
	#22
	reset = 1;
	#22
	enable = 1;
	#22

	// Implement bouncing (10ms)
		cols = 4'b1011;
		#100000
		cols = 4'b1111;
		#100000
		cols = 4'b1011;
		#100000
		cols = 4'b1111;
		#100000
		cols = 4'b1011;
		#100000
		cols = 4'b1111;
		#100000
		cols = 4'b1011;
		#100000
		cols = 4'b1111;
		#100000
		cols = 4'b1011;
		#100000
		cols = 4'b1111;
		#100000
		cols = 4'b1011;
		#100000000
		assert (dut.d0 == 4'b1101)      
				$display("PASSED! d0 is at 1101");
			else 
				$error("FAILED! d0 = %0b",dut.d0); 
		
		assert (dut.map == 16'b0000_0000_0000_0010)       
				$display("PASSED! key is at 100");
			else 
				$error("FAILED! key = %0b",dut.map); 
				
		assert (dut.debounced == 1)     
				$display("PASSED! d_en is at 1");
			else 
				$error("FAILED! d_en = %0b",dut.debounced);		
		reset = 0;
		#5
		reset = 1;
		#5
		cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667cols = 4'b1111;
		#6666657
		cols = 4'b1111;
		#6666667
		cols = 4'b0111;
		#6666657
		cols = 4'b1111;
		#6666667
		assert(seg == 7'b1100000)
            $display("PASS segment correct at %t", $time);
		else
			$display("FAIL segment incorrect at %t", $time);
		
				
    #100 $stop;
  end
endmodule
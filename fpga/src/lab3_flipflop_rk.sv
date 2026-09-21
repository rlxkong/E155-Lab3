//	lab3_flipflop_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This module is a flipflop

module lab3_flipflop_rk(
  input  logic     	clk,
  input  logic     	enable,
  input  logic  	reset,
  input  logic  	[3:0] d,
  output logic  	[3:0] q
);

    always_ff @(posedge clk) begin
        if (~reset)         q <= 4'b0;
        else if (enable)    q <= d;
    end
endmodule

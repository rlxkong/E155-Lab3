//	lab3_sync_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This is the module that syncronizes inputs to clock ticks to prevent metastability

module lab3_sync_rk(
  input  logic 		clk,     // the clock speed you want to sync it to
  input  logic 		[3:0] d,
  output logic 		[3:0] q
);
    logic [3:0] n1;
    lab3_flipflop_rk ff1(clk, 1'b1, 1'b1, d, n1);
    lab3_flipflop_rk ff2(clk, 1'b1, 1'b1, n1, q);
endmodule
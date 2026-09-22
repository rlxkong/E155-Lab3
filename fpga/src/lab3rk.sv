//	lab3rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This is the code for the top level module for the lab3 keypress to segment display lab

module lab3rk(
	input   logic       reset,
	input   logic       enable,
	input   logic [3:0] cols,
	output  logic [3:0] rows,
	output  logic [6:0] seg,
	output  logic [1:0] power,
	output  logic [3:0] led
);
   logic 	    int_osc;
   logic 	    seg_clk;
   logic [3:0] 	sync_row;
   logic [3:0]	sync_col;
   logic       	debounced;
   logic [1:0] 	col_idx;
   logic [3:0] 	sw;
   logic [3:0] 	d0;
   logic [3:0] 	d1;
   logic [3:0] 	choosen_switch;
   logic [20:0]	count;

    // Internal high-speed oscillator
    HSOSC #(.CLKHF_DIV(2'b00))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    // Syncronize rows and columns
    lab3_sync_rk syncro_row(int_osc, rows, sync_row);
    lab3_sync_rk syncro_col(int_osc, cols, sync_col);

    // Debounce logic
    lab3_debounce_rk debounce_mod(int_osc, reset, sync_col, debounced);

    // Check keypress state
    lab3_keypress_state_rk keystate(int_osc, reset, sync_row, sync_col, press, sw, col_idx);

    // MainFSM
    lab3_mainfsm_rk mainfsm(int_osc, reset, enable, 1'b1, press, sw, col_idx, sync_col, rows, d0, d1, led);
		 
    // Segments Logic

    // Instantiate counter and seven segments
    lab1_counter_rk #(.maxcount(400000), .N(21)) counter (int_osc, enable, reset, seg_clk, count);		// Set counter to output at 120Hz (one period) 
    
    // Multiplexer segment choosing
    assign choosen_switch = seg_clk ? d0 : d1;							//chooses switch based on which segment should be on
    
    lab1_sevenseg_rk sevenseg(choosen_switch, seg);								// Display based on switches
    assign power[0] = seg_clk;													// Left display turns
    assign power[1] = ~seg_clk; 													// Right display turns on
    

endmodule
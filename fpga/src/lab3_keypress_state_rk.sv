//	lab3_keypress_state_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This is the module that updates when only one key is pressed
//  It also outputs the corresponding singular key input whe the press is true

module lab3_keypress_state_rk(
    input  logic        clk,
	input  logic   	     reset,
	input  logic 		 enable,
    input  logic [3:0]  rows,
    input  logic [3:0]  columns,
    output logic        one_key,		// when only one key is pressed
    output logic [3:0]  switch,
	output logic [15:0] keymap,
    output logic [1:0]  col_idx
);

	logic 	[3:0] r0;
	logic 	[3:0] r1;	
	logic 	[3:0] r2;	
	logic 	[3:0] r3;
	
	logic 	[16:0] off_edge_count;
	logic 		   off_edge_samp;

    // get column readings from each row and compile into a keymap
    lab3_flipflop_rk row0(clk, rows[0], reset, columns, r0);
    lab3_flipflop_rk row1(clk, rows[1], reset, columns, r1);
    lab3_flipflop_rk row2(clk, rows[2], reset, columns, r2);
    lab3_flipflop_rk row3(clk, rows[3], reset, columns, r3);
	
	// get timming for middle of clock cycles to ensure clean reading
	lab1_counter_rk #(.maxcount(80000), .N(17)) counter (clk, enable, reset, off_edge_samp, off_edge_count);

    // keymap order is DE0F C987 B654 A321
	// combine all the row-col outputs into one map
	always_ff @(posedge clk) begin
		if (reset == 0)
			keymap <= 15'b0;
		else if (enable)
			keymap <= {r3, r2, r1, r0};           // THIS MAY NEED EDITING
	end

    // switch output logic: DE0F_C987_B654_A321
    always_comb
        case(~keymap)
            16'b0000_0000_0000_0001: begin
                switch = ~4'b0001;       //1
                one_key = 1;
            end
            16'b0000_0000_0000_0010: begin
                switch = ~4'b0010;        //2
                one_key = 1;
            end
            16'b0000_0000_0000_0100: begin
                switch = ~4'b0011;        //3
                one_key = 1;
            end
            16'b0000_0000_0000_1000: begin
                switch = ~4'b1010;        //A
                one_key = 1;
            end
            16'b0000_0000_0001_0000: begin
                switch = ~4'b0100;        //4  
                one_key = 1;
            end
            16'b0000_0000_0010_0000: begin
                switch = ~4'b0101;        //5
                one_key = 1;
            end
            16'b0000_0000_0100_0000: begin
                switch = ~4'b0110;        //6
                one_key = 1;
            end
            16'b0000_0000_1000_0000: begin
                switch = ~4'b1011;        //B
                one_key = 1;
            end
            16'b0000_0001_0000_0000: begin
                switch = ~4'b0111;        //7
                one_key = 1;
            end
            16'b0000_0010_0000_0000: begin
                switch = ~4'b1000;        //8
                one_key = 1;
            end
            16'b0000_0100_0000_0000: begin
                switch = ~4'b1001;        //9
                one_key = 1;
            end
            16'b0000_1000_0000_0000: begin
                switch = ~4'b1100;        //C
                one_key = 1;
            end
            16'b0001_0000_0000_0000: begin
                switch = ~4'b1111;        //F
                one_key = 1;
            end
            16'b0010_0000_0000_0000: begin
                switch = ~4'b0000;        //0
                one_key = 1;
            end
            16'b0100_0000_0000_0000: begin
                switch = ~4'b1110;        //E
                one_key = 1;
            end
            16'b1000_0000_0000_0000: begin
                switch = ~4'b1101;        //D
                one_key = 1;
            end
            default: begin
                switch = ~4'b0000;	    //default 0
                one_key = 0;
            end
        endcase
		
endmodule
//	lab3_mainfsm_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This module is the mainfsm logic

module lab3_mainfsm_rk(
    input  logic        clk,
    input  logic        reset,
	input  logic 		 enable,
    input  logic        debounced,
    input  logic        press,
    input  logic  [3:0] switch,
    input  logic  [1:0] col_idx,
    input  logic  [3:0] cols,
    output logic  [3:0] rows,
    output logic  [3:0] d0,
    output logic  [3:0] d1,
	output logic  [2:0] led
);

    typedef enum logic [1:0] {SCAN, PRESS, HOLD} statetype;
    
    statetype state, nextstate;
    logic        rep_clk;
    logic        scan_en;

    always_ff @(posedge clk, posedge reset)
        if(reset)   state <= SCAN;
        else        state <= nextstate;

    // scanner running
    lab2_scanning_rk #(.limit(524288+1), .n(20)) scan_rows(reset, scan_en, clk, rows);

    always_comb
        case (state)
            SCAN:    nextstate = (debounced & press) ? PRESS : SCAN;
            PRESS:   nextstate = HOLD;
            HOLD:    nextstate = (cols[col_idx]) ? SCAN : HOLD;
            default: nextstate = SCAN;
        endcase
    
    assign scan_en = (state == SCAN);
	assign led[0] = (state == SCAN);
	assign led[1] = (state == PRESS);
	assign led[2] = (state == HOLD);
    
    always_ff @(posedge clk) begin
		if (reset == 0) begin
			d1 <= ~(4'b0000);
			d0 <= ~(4'b0000);
		end
		else if (enable & (state == PRESS)) begin
			d1 <= d0;
			d0 <= switch;
		end
    end
    
endmodule
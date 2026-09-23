//	lab3_debounce_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This is module ensures that an input becomes stable

module lab3_debounce_rk(
    input  logic        clk,
    input  logic        reset,
    input  logic [15:0] keymap,
    output logic        deb_enabled
);

    typedef enum logic [1:0] {IDLE, WAIT, PRESSED} statetype;
    
    statetype state, nextstate;
    logic [19:0] count;
    logic        rep_clk;

    always_ff @(posedge clk)
        if(reset == 0)   state <= IDLE;
        else        	  state <= nextstate;

    // debounce counter
    lab1_counter_rk #(.maxcount(524288+1), .N(20)) counter(clk, (state == WAIT), ~(state == IDLE), rep_clk, count);

    always_comb begin
        case (state)
            IDLE:    nextstate = ~(keymap == 16'b1111_1111_1111_1111) ? WAIT : IDLE;
            WAIT:    if (keymap == 16'b1111_1111_1111_1111)       						nextstate = IDLE;       //bounce
                     else if (count[19] & (~(keymap == 16'b1111_1111_1111_1111)))      nextstate = PRESSED;
                     else                        										nextstate = WAIT;
            PRESSED: nextstate = (keymap == 16'b1111_1111_1111_1111) ? IDLE : PRESSED;
            default: nextstate = IDLE;
        endcase
    end
	
    assign deb_enabled = (state == PRESSED);
    
endmodule
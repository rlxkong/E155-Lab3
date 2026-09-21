//	lab3_keypress_state_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/20/2026
//
//	This is the module that updates when only one key is pressed
//  It also outputs the corresponding singular key input whe the press is true

module lab3_keypress_state_rk(
    input  logic        clk,
    input  logic        rows,
    input  logic [3:0]  columns,
    output logic        press,
    output logic [3:0]  switch
);

    logic   [15:0] keymap;
    logic          one_on;

    // get column readings from each row and compile into a keymap
    lab3_flipflop_rk row0(clk, rows, 1'b1, columns, r0);
    lab3_flipflop_rk row1(clk, rows, 1'b1, columns, r1);
    lab3_flipflop_rk row2(clk, rows, 1'b1, columns, r2);
    lab3_flipflop_rk row3(clk, rows, 1'b1, columns, r3);

    // keymap order is 123A 456B 789C F0ED
    assign keymap = {r0, r1, r2, r3};                       // combine all the row-col outputs into one map

    // press output logic
    assign one_on = (~keymap & (~keymap - 1) == 0);         // check that only one bit is switched on
    assign press = ((keymap != 0) & one_on);

    // switch output logic: 123A_456B_789C_F0ED
    always_comb
        case(~keymap)
            16'b1000_0000_0000_0000: switch = 0001;     //1
            16'b0100_0000_0000_0000: switch = 0010;     //2
            16'b0010_0000_0000_0000: switch = 0011;     //3
            16'b0001_0000_0000_0000: switch = 1010;     //A
            16'b0000_1000_0000_0000: switch = 0100;     //4
            16'b0000_0100_0000_0000: switch = 0101;     //5
            16'b0000_0010_0000_0000: switch = 0110;     //6
            16'b0000_0001_0000_0000: switch = 1011;     //B
            16'b0000_0000_1000_0000: switch = 0111;     //7
            16'b0000_0000_0100_0000: switch = 1000;     //8
            16'b0000_0000_0010_0000: switch = 1001;     //9
            16'b0000_0000_0001_0000: switch = 1100;     //C
            16'b0000_0000_0000_1000: switch = 1111;     //F
            16'b0000_0000_0000_0100: switch = 0000;     //0
            16'b0000_0000_0000_0010: switch = 1110;     //E
            16'b0000_0000_0000_0001: switch = 1101;     //D
            default: switch = 0000;	                    //default 0
        endcase
endmodule
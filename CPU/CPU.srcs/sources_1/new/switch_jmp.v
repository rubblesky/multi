`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:27:09
// Design Name: 
// Module Name: switch_jmp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "config.vh"
module switch_jmp(
    input switch,
    input jmpPc,notJmpPc,
    output newPc
    );

    assign newPc = (switch == `jmp)? jmpPc : notJmpPc;

endmodule

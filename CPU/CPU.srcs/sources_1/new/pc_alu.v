`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:21:45
// Design Name: 
// Module Name: pc_alu
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
module pc_alu(
    input clk,
    input[`SIZE] pc,
    output reg[`SIZE] newPc
    );

    always @(negedge clk) fork
        newPc <= pc + 4; 
    join

endmodule

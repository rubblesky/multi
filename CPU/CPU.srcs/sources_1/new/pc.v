`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:09:10
// Design Name: 
// Module Name: pc
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
module pc(
    input clk,
    input newPc,
    output pcOut
    );
    reg[`SIZE] pc;
    always @(posedge clk) fork
        pc <= newPc;
    join
    assign pcOut = pc; 
endmodule

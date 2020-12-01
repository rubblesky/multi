`ifndef PC_V
`define PC_V
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
    input[`SIZE] newPc,
    output[`SIZE] pcOut
    );
    reg[`SIZE] pc;
    //initial pc <= 32'b0;
    always @(negedge clk) fork
        pc <= newPc;
    join
    assign pcOut = pc; 
endmodule
`endif
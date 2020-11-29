`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 21:15:13
// Design Name: 
// Module Name: mem_tmp_reg
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
module mem_tmp_reg(
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] calculationIn,

    input  regFileIsInIn,

    output reg[`SIZE] inst,
    output reg[`SIZE] calculation,

    output reg regFileIsIn
    );
    always @(posedge clk ) begin
        calculation <= calculationIn;
        inst <= instIn;
        regFileIsIn <= regFileIsInIn;
    end

endmodule

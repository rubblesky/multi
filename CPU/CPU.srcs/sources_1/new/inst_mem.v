//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/11/26 20:05:41
// Design Name:
// Module Name: inst_mem
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

module inst_mem(input wire clk,
                input wire[`SIZE] address,
                input wire isOut,
                output reg[`SIZE] instruction);
    reg[`SIZE] memory[`instMemSize];
    always	@(posedge clk) fork
        if (isOut == `true) begin
            instruction <= memory[address[`instMemSizeLog2 - 1:0]];
        end
    join
endmodule

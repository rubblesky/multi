`ifndef SIGN_EXTEND_V
`define SIGN_EXTEND_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 16:50:11
// Design Name: 
// Module Name: sign_extend
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
module sign_extend(
    input clk,
    input[15:0] immediate,
    output reg[`SIZE] extendedImmediate
    );

    always @(posedge clk ) begin
        if(immediate[15] == 1'b0)begin
            extendedImmediate <= {16'hffff,immediate};             
        end
        else begin
            extendedImmediate <= {16'h0000,immediate};  
        end

    end

endmodule

`endif
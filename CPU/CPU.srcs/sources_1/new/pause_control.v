`ifndef PAUSE_CONTROL_V
`define PAUSE_CONTROL_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 20:41:08
// Design Name: 
// Module Name: pause_control
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
module pause_control(
    input clk,
    input isPauseIn,
    output reg isPause
    );
    always @(posedge clk ) begin
        isPause <= isPauseIn;
    end
endmodule

`endif
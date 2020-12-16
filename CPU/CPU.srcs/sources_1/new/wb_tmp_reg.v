`ifndef WB_TMP_REG_V
`define WB_TMP_REG_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 15:10:32
// Design Name: 
// Module Name: wb_tmp_reg
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
module wb_tmp_reg(
    input clk,
    input [`SIZE] wbDataIn,
    input [`regAddrSize] wbRegAddrIn,

    input regFileIsInIn,

    output reg[`SIZE] wbData,
    output reg[`regAddrSize] wbRegAddr,

    output reg regFileIsIn
    );

    always @(negedge clk ) begin
        wbData <= wbDataIn;
        wbRegAddr <= wbRegAddrIn;
        regFileIsIn <= regFileIsInIn;
    end

endmodule

`endif
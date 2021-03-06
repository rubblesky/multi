`ifndef REG_MEM_WB_V
`define REG_MEM_WB_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 20:06:06
// Design Name: 
// Module Name: reg_mem_wb
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
module reg_mem_wb(
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] calculationIn,
    input[`SIZE] loadedDataIn,

    input  muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,

    output reg[`SIZE] inst,
    output reg[`SIZE] calculation,
    output reg[`SIZE] loadedData,

    output reg muxWbDataControl,muxWbRegAddrControl,regFileIsIn
    );
    always @(negedge clk ) begin
        inst <= instIn;
        calculation <= calculationIn;
        loadedData <= loadedDataIn;
        {muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <= 
        {muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};
    end
endmodule
`endif
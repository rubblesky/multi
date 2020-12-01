`ifndef ID_TMP_REG_V
`define ID_TMP_REG_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 20:55:13
// Design Name: 
// Module Name: id_tmp_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:ID阶段的临时寄存器，用于保存数据和调整时序
// 
//////////////////////////////////////////////////////////////////////////////////

`include "config.vh"
module id_tmp_reg(
    input clk,
    input[`SIZE] instIn,
    //input[`SIZE] pc;
    output reg[`SIZE] inst
    );

    always @(posedge clk ) begin
        inst = instIn; 
    end
endmodule
`endif
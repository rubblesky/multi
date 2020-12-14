`ifndef STATUS_REGS_V
`define STATUS_REGS_V

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/14 20:59:39
// Design Name: 
// Module Name: status_regs
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
module status_regs(
    input clk,rst,
    input [`SIZE] inst,
    output pcIsIn
    );
    reg [`regStatusSize]status[`SIZE];
    always @(posedge clk ) begin
        if(rst == `true)fork
            status[0] <= 5'b00000;
            status[1] <= 5'b00000;
            status[2] <= 5'b00000;
            status[3] <= 5'b00000;
            status[4] <= 5'b00000;
            status[5] <= 5'b00000;
            status[6] <= 5'b00000;
            status[7] <= 5'b00000;
            status[8] <= 5'b00000;
            status[9] <= 5'b00000;
            status[10] <= 5'b00000;
            status[11] <= 5'b00000;
            status[12] <= 5'b00000;
            status[13] <= 5'b00000;
            status[14] <= 5'b00000;
            status[15] <= 5'b00000;
            status[16] <= 5'b00000;
            status[17] <= 5'b00000;
            status[18] <= 5'b00000;
            status[19] <= 5'b00000;
            status[20] <= 5'b00000;
            status[21] <= 5'b00000;
            status[22] <= 5'b00000;
            status[23] <= 5'b00000;
            status[24] <= 5'b00000;
            status[25] <= 5'b00000;
            status[26] <= 5'b00000;
            status[27] <= 5'b00000;
            status[28] <= 5'b00000;
            status[29] <= 5'b00000;
            status[30] <= 5'b00000;
            status[31] <= 5'b00000;

        join
    end

    always @(posedge clk ) fork
            status[0] = status[0] >> 1;
            status[1] = status[1] >> 1;
            status[2] = status[2] >> 1;
            status[3] = status[3] >> 1;
            status[4] = status[4] >> 1;
            status[5] = status[5] >> 1;
            status[6] = status[6] >> 1;
            status[7] = status[7] >> 1;
            status[8] = status[8] >> 1;
            status[9] = status[9] >> 1;
            status[10] = status[10] >> 1;
            status[11] = status[11] >> 1;
            status[12] = status[12] >> 1;
            status[13] = status[13] >> 1;
            status[14] = status[14] >> 1;
            status[15] = status[15] >> 1;
            status[16] = status[16] >> 1;
            status[17] = status[17] >> 1;
            status[18] = status[18] >> 1;
            status[19] = status[19] >> 1;
            status[20] = status[20] >> 1;
            status[21] = status[21] >> 1;
            status[22] = status[22] >> 1;
            status[23] = status[23] >> 1;
            status[24] = status[24] >> 1;
            status[25] = status[25] >> 1;
            status[26] = status[26] >> 1;
            status[27] = status[27] >> 1;
            status[28] = status[28] >> 1;
            status[29] = status[29] >> 1;
            status[30] = status[30] >> 1;
            status[31] = status[31] >> 1;
    join
    assign pcIsIn = (inst[`opPos] == 6'b000000 && 
    status[inst[`rsPos]] == 0 && status[inst[`rtPos]] == 0)?`true:`false;

    always @(negedge clk ) begin
        if(pcIsIn == `true && inst[`opPos] == 6'b000000)
            status[inst[`rdPos]] <= 5'b10000 ;
    end

endmodule

`endif
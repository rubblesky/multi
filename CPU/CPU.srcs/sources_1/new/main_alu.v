`ifndef MAIN_ALU_V
`define MAIN_ALU_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 22:06:26
// Design Name: 
// Module Name: main_alu
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

module main_alu(
    input clk,
    input[`SIZE] dataIn1,dataIn2,
    input[`aluControlSize] aluControl,
    output reg[`SIZE] dataOut
    );

    always @(posedge clk ) fork
        case(aluControl)
            4'b0000: dataOut <= dataIn1 & dataIn2;//与
            4'b0001: dataOut <= dataIn1 | dataIn2;
            4'b0010: dataOut <= dataIn1 + dataIn2;
            4'b0110: dataOut <= dataIn1 - dataIn2;
            //4'b0111: dataOut <= 小于则置1
            4'b1100: dataOut <= ~(dataIn1 | dataIn2);
        endcase
    join
    //always @(posedge clk) $display("MAIN ALU posative: dataIn1 : %d, dataIn2 : %d, aluControl : %b,dataOut : %d",dataIn1,dataIn2,aluControl,dataOut);
    //always @(negedge clk) $display("MAIN ALU negative: dataIn1 : %d, dataIn2 : %d, aluControl : %b,dataOut : %d",dataIn1,dataIn2,aluControl,dataOut);


endmodule
`endif
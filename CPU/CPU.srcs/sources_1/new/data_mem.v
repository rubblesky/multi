`ifndef DATA_MEM_V
`define DATA_MEM_V

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:34:31
// Design Name: 
// Module Name: data_mem
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
module data_mem(
    input clk,
    input isIn,isOut,
    input[`SIZE] addrIn,
    input[`SIZE] dataIn,
    input[`SIZE] addrOut,
    output reg[`SIZE] dataOut
    );

    reg[`SIZE] memory[`dataMemSize];

    always @(negedge clk) begin
        if(isOut == `true)begin
            dataOut <= memory[addrOut[`dataMemSizeLog2 - 1 : 0]];
        end
    end
    
    always @(posedge clk ) begin
        if(isIn == `true)begin
            memory[addrIn[`dataMemSizeLog2 : 0]] <= dataIn;
        end
    end

endmodule
`endif
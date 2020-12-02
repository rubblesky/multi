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
    input[`SIZE] addr,
    input[`SIZE] dataIn,
    //input[`SIZE] addrOut,
    output reg[`SIZE] dataOut
    );

    reg[`SIZE] memory[`dataMemSize];
    
    always @(posedge clk ) begin
        if(isIn == `false && isOut == `false)begin
            dataOut <= 32'hzzzz;
        end
        else if(isIn == `true)begin
            memory[addr[`dataMemSizeLog2 : 0]] <= dataIn;
        end
        else if(isOut == `true)begin
            dataOut <= memory[addr[`dataMemSizeLog2 - 1 : 0]];
        end
        else begin
            dataOut <= 32'hzzzz;
        end
    end

endmodule
`endif
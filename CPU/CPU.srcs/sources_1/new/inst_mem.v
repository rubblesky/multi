`ifndef INST_MEM_V
`define INST_MEM_V
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

module inst_mem(
                input wire rst,
                input wire clk,
                input wire[`SIZE] address,
                input wire isOut,
                output reg[`SIZE] instruction);
    reg[`SIZE] memory[`instMemSize];	
    initial
    begin
        //memory[0] <= 32'b00100000000001000000000000000010;
        $readmemb ("E:/myfile/homework/ComputerArchitecture/CPU/CPU/CPU.srcs/sources_1/new/inst.data",memory,0,1023);

    end
    always	@(posedge clk) fork
        if (isOut == `true) begin
            instruction <= memory[address[`instMemSizeLog2 - 1:0]];
        end
    join
    //always @(posedge clk) $display(" positive: isOut : %b, address : %h, fetch : %b\n",isOut,address[`instMemSizeLog2 - 1:0],instruction);
    //always @(posedge clk) $display(" negative: isOut : %b, address : %h, fetch : %b\n",isOut,address[`instMemSizeLog2 - 1:0],instruction);

endmodule
`endif
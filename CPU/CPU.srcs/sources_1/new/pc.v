`ifndef PC_V
`define PC_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:09:10
// Design Name: 
// Module Name: pc
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
 module pc(
    input clk,rst,
    input isIn,
    input[`SIZE] newPc,
    output[`SIZE] pcOut
    );

    reg[`SIZE] pc;
    reg isPause;
    always @(posedge clk ) begin
        if(rst == `true)begin
            pc <= 32'h00000000;
            isPause <= `false;
        end
$display("---------------------------\n pc : %b\n",pc);
    end

    always @(negedge clk) fork
        if(rst != `true && isIn == `true)begin
            pc <= newPc;            
        end
        else if(isIn == `false)begin
            isPause <= `true;
        end
    join
    assign pcOut = pc; 
endmodule
`endif
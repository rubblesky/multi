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
    input isNotBranch,isNotDataHazard,
    input[`SIZE] newPc,
    output[`SIZE] pcOut,
    output wire isPause
    );

    reg[`SIZE] pc;
    reg pause1,pause2;

    initial begin
        pause1 <= `false;
        pause2 <= `false;
        pc <= 32'h00000000;
    end
    always @(posedge clk ) begin
        pause1 <= `false ^ pause1;
    end

    always @(negedge clk) begin
        
        if(rst != `true && isNotBranch == `true && isNotDataHazard == `true)begin
            pc <= newPc;            
        end
        else if(isNotBranch == `false )begin
            pause2 <= `true ^ pause2;
        end
    end
    assign isPause = (rst)?`false:pause1^pause2;
    assign pcOut = (rst)?32'bz:pc; 
endmodule
`endif
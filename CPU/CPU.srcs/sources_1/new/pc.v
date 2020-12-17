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
    output reg isPause
    );

    reg[`SIZE] pc;

always @(posedge clk ) begin
    if(rst == `true)
        pc <= 32'h00000000;
        isPause <= `false;
end

    always @(posedge clk ) begin
        if(rst == `true)begin
            pc <= 32'h00000000;
            isPause <= `false;
        end
$display("---------------------------\n pc : %b  isNotDataHazard : %b\n",pc,isNotDataHazard);
    end

    always @(negedge clk) fork
        if(rst != `true && isNotBranch == `true && isNotDataHazard == `true)begin
            pc <= newPc;            
        end
        /*
        else if(isNotBranch && !isNotDataHazard)begin
            
        end
        */
        else if(isNotBranch == `false )begin
            isPause <= `true;
        end
    join
    assign pcOut = (rst)?32'bz:pc; 
endmodule
`endif
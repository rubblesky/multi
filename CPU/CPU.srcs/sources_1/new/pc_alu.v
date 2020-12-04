`ifndef PC_ALU_V
`define PC_ALU_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:21:45
// Design Name: 
// Module Name: pc_alu
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
module pc_alu(
    input clk,rst,
    input[`SIZE] pc,
    output reg[`SIZE] nextPc
    );



always @(posedge clk ) begin
    if(rst == `true)
        nextPc <= 32'h00000000;

end

    always @(posedge clk) fork
        nextPc <= pc + 1; 
        //由于inst_mem的定义 这里加一
    join

endmodule
`endif
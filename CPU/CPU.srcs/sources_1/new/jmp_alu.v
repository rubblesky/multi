`ifndef JMP_ALU_V
`define JMP_ALU_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 19:20:03
// Design Name: 
// Module Name: jmp_alu
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
module jmp_alu(
    input clk,
    input[`SIZE] pc,
    input[`SIZE] addr,
    output reg[`SIZE] jmpPc 
    );
    always @(posedge clk ) begin
        jmpPc <= pc + addr;
        $display("jmp ALU pc : %d addr : %d  jmpPc : %d ",pc,addr,jmpPc);
    end

endmodule

`endif
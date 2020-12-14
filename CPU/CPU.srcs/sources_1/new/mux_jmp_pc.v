`ifndef MUX_JMP_PC_V
`define MUX_JMP_PC_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/14 14:01:04
// Design Name: 
// Module Name: mux_jmp_pc
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
module mux_jmp_pc(
    input control,
    input [`SIZE] pc0,pc1,
    output[`SIZE] jmpPc
    );
    assign jmpPc = (control)?pc1:pc0;


endmodule


`endif
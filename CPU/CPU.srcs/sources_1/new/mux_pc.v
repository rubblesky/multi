`ifndef MUX_PC_V
`define MUX_PC_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 19:36:09
// Design Name: 
// Module Name: mux_pc
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
module mux_pc(
    input control,
    input [`SIZE] jmpPc,
    input [`SIZE] nextPc,
    output [`SIZE] newPc
    );

    assign newPc = (control)?jmpPc:nextPc;
endmodule

`endif
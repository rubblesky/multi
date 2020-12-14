`ifndef PC_SELECT_CONTROL_V
`define PC_SELECT_CONTROL_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 20:50:18
// Design Name: 
// Module Name: pc_select_control
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
module pc_select_control(

    input[`jmpOpSize] jmpOp,
    input[`SIZE] calculation,
    output muxPcControl,muxJmpPcControl
    );

    assign muxPcControl = (jmpOp == 2'b11 || 
    (jmpOp == 2'b10 && calculation == 0)  ||
    (jmpOp == 2'b01 && calculation != 0) ) ? 1'b1:1'b0; 
    
    assign muxJmpPcControl = (jmpOp == 2'b11)?1'b1:1'b0;

endmodule

`endif
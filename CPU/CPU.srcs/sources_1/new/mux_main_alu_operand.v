`ifndef MUX_MAIN_ALU_OPERAND_V
`define MUX_MAIN_ALU_OPERAND_V

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 16:38:27
// Design Name: 
// Module Name: mux_main_alu_operand
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
module mux_main_alu_operand(
    input control,
    input[`SIZE] dataIn0,
    input[`SIZE] dataIn1,
    output[`SIZE] dataOut
    );
    
    assign dataOut = (control)?dataIn1:dataIn0;

endmodule

`endif
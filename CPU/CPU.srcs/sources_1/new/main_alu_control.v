`ifndef MAIN_ALU_CONTROL_V
`define MAIN_ALU_CONTROL_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/11/29 20:26:51
// Design Name:
// Module Name: main_alu_control
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
module main_alu_control(input clk,
                        input[`aluOpSize] aluOp,
                        input[`instFunctSize] funct,
                        output reg[`aluControlSize] aluControl);
    
    always @(negedge clk) begin
        case (aluOp)
            2'b10:
            begin
                case (funct)
                    6'b100000: aluControl <= 4'b0010;
                    6'b100010: aluControl <= 4'b0110;
                    6'b100100: aluControl <= 4'b0000;
                    6'b100101: aluControl <= 4'b0001;
                    6'b101010: aluControl <= 4'b0111;
                    //或非
                endcase
            end
            2'b00:
            begin
                aluControl <= 4'b0010;
            end
        endcase
    end
    
    
endmodule
`endif
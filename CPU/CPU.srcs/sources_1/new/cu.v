`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 21:58:49
// Design Name: 
// Module Name: cu
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
module cu(
    input clk,
    input [0:5] op,
    output isJmp,
    output reg[0:1] aluOp,
    output jmpAluWork,
    output reg instMemOut,
    output dataMemOut,dataMemIn,
    output regFileOut1,regFileOut2,regFileIn
    );
    reg status[0:4];        //各阶段状态 工作为1
    reg[`instOp] inst[0:4];
    always @(posedge clk) begin
        inst[0] <= op;
        status[0] = 1'b1;
        case (op)
            6'b000000: 
                instMemOut <= 1'b1;
        endcase
/*
        case (inst[1])
            6'b000000: //数据选择器;
        endcase
*/        
        case (inst[2])
            6'b000000: /*数据选择器*/
        endcase
        
        case (inst[3])
            6'b000000: /*数据选择器*/
        endcase
        case (inst[4])
            6'b000000: /*数据选择器*/
        endcase

    end

    always @(negedge clk ) begin
        case (op)
            5'b000000: aluOp <= 2'b10;
            5'b100011: aluOp <= 2'b00;
            5'b101011: aluOp <= 2'b00;
            5'b000100: aluOp <= 2'b01;
            default: 
        endcase        
    end
    
    



endmodule

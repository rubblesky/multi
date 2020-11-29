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
module cu(input clk,
          input [`instOpSize] op,
          //output isJmp,
          output reg[`aluOpSize] aluOp,
          output reg regFileIsIn);
    
    always @(posedge clk) begin
        aluOp <= 2'b10;
        case(op)
            6'b000000: //R型指令
            begin
                regFileIsIn <= 1'b1;
                aluOp       <= 2'b10;
            end
            /*
             6'b100011: //lw
             6'b101011: //sw
             6'b000100: //beq
             6'b000010: //jmp
             */
        endcase
    end
    
    /*
     reg status[0:4];        //各阶段状态 工作
     reg[`instOp] inst[0:4];
     always @(posedge clk) begin
     inst[0] <= op;
     status[0] = 1'b1;
     case (op)
     6'b000000:
     instMemOut <= 1'b1;
     endcase
     
     case (inst[1])
     6'b000000: //数据选择�?;
     endcase
     case (inst[2])
     6'b000000:
     endcase
     
     case (inst[3])
     6'b000000:
     endcase
     case (inst[4])
     6'b000000:
     endcase
     
     end
     
     always @(negedge clk) begin
     case (op)
     5'b000000: aluOp <= 2'b10;
     5'b100011: aluOp <= 2'b00;
     5'b101011: aluOp <= 2'b00;
     5'b000100: aluOp <= 2'b01;
     default:
     endcase
     end
     
     
     */
    
    
endmodule

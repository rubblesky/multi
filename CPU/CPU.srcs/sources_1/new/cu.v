`ifndef CU_V
`define CU_V
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
          output reg muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,
          output reg regFileIsIn);
    
    always @(posedge clk) begin
        //aluOp <= 2'b10;
        case(op)
            6'b000000: //R型指令 mux控制 一律为1
            begin
                regFileIsIn <= `true;
                aluOp       <= 2'b10;
                muxOperandControl <= 1'b1;
                dataMemIsIn <= `false;
                dataMemIsOut <= `false;
                muxWbDataControl <= 1'b1;
                muxWbRegAddrControl <= 1'b1;
            end
            
            6'b100011: //lw 
            begin
                regFileIsIn <= `true;
                aluOp <= 2'b00;
                muxOperandControl <= 1'b0;
                dataMemIsIn <= `false;
                dataMemIsOut <= `true;
                muxWbDataControl <= 1'b0;
                muxWbRegAddrControl <= 1'b0;
            end
            6'b101011: //sw
            begin
                regFileIsIn <= `false;
                aluOp <= 2'b00;
                muxOperandControl <= 1'b0;
                dataMemIsIn <= `true;
                dataMemIsOut <= `false;
                muxWbDataControl <= 1'bx;
                muxWbRegAddrControl <= 1'bx;               
            end
            /*
             6'b000100: //beq
             6'b000010: //jmp
             */
        endcase
    end
    

    
    
endmodule

`endif
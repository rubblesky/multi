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
module cu(input clk,rst,
          input [`instOpSize] op,
          input isPause,

          output reg[`aluOpSize] aluOp,
          output reg muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,
          output reg regFileIsIn,pcIsIn,
          output reg[`jmpOpSize] jmpOp
          );
/*
    initial begin
        pcIsIn <= `true;
        jmpOp <= 2'b00;
    end
*/


    always @(posedge clk) begin
        //aluOp <= 2'b10;
        if(isPause) begin
            regFileIsIn <= `false;
            dataMemIsIn <= `false;
        end
        else if(rst == `true)begin
            
            pcIsIn <= `true;
            jmpOp <= 2'b00;      
        end
        else    fork
            case(op)
                6'b000000: //R型指令 mux控制 一律为1
                begin
                    pcIsIn <= `true;
                    regFileIsIn <= `true;
                    aluOp       <= 2'b10;
                    muxOperandControl <= 1'b1;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'b1;
                    muxWbRegAddrControl <= 1'b1;
                    jmpOp <= 2'b00;
                end
                
                6'b100011: //lw 
                begin
                    pcIsIn <= `true;
                    regFileIsIn <= `true;
                    aluOp <= 2'b00;
                    muxOperandControl <= 1'b0;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `true;
                    muxWbDataControl <= 1'b0;
                    muxWbRegAddrControl <= 1'b0;
                    jmpOp <= 2'b00;
                end
                6'b101011: //sw
                begin
                    pcIsIn <= `true;
                    regFileIsIn <= `false;
                    aluOp <= 2'b00;
                    muxOperandControl <= 1'b0;
                    dataMemIsIn <= `true;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'bx;
                    muxWbRegAddrControl <= 1'bx;     
                    jmpOp <= 2'b00;          
                end
                6'b001000: //addi
                begin
                    pcIsIn <= `true;
                    regFileIsIn <= `true;
                    aluOp <= 2'b00;     //姑且这样 没有查资料
                    muxOperandControl <= 1'b0;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'b1;
                    muxWbRegAddrControl <= 1'b0;    
                    jmpOp <= 2'b00;           
                end
                
                6'b000100: //beq
                begin

                    pcIsIn <= `false;
                    regFileIsIn <= `false;
                    aluOp <= 2'b01;
                    muxOperandControl <= 1'b1;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'bx;
                    muxWbRegAddrControl <= 1'bx;   
                    jmpOp <= 2'b10;             
                end
                6'b000101: //bne
                begin

                    pcIsIn <= `false;
                    regFileIsIn <= `false;
                    aluOp <= 2'b01;
                    muxOperandControl <= 1'b1;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'bx;
                    muxWbRegAddrControl <= 1'bx;   
                    jmpOp <= 2'b01;             
                end


                6'b000010: //jmp
                begin
                    pcIsIn <= `false;
                    regFileIsIn <= `false;
                    aluOp <= 2'bxx;
                    muxOperandControl <= 1'bx;
                    dataMemIsIn <= `false;
                    dataMemIsOut <= `false;
                    muxWbDataControl <= 1'bx;
                    muxWbRegAddrControl <= 1'bx;   
                    jmpOp <= 2'b11;             
                end                    
            endcase

        join
    end
    

    
    
endmodule

`endif
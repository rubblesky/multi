`ifndef REG_FILE
`define REG_FILE

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 19:32:05
// Design Name: 
// Module Name: reg_file
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

module reg_file(
    input clk,rst,
    input isIn,
    input[`regAddrSize] addrIn,
    input[`SIZE] dataIn,
    input[`regAddrSize] addrOut1,
    input[`regAddrSize] addrOut2,
    output reg[`SIZE] dataOut1,dataOut2
    
    );
    reg[`SIZE] file[`SIZE];
/*    reg[0:4] count;
    always @(posedge clk ) begin
        if(rst == `true)begin 
            count = 0;
            while(count < 32)begin
                file[count] = 0;
            end
        end
    end
*/
    always @(posedge clk) fork  
        dataOut1 <= file[addrOut1];
        dataOut2 <= file[addrOut2];
        if(isIn == `true)begin
            file[addrIn] <= dataIn;
        end   
    join

endmodule

`endif
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
    reg[`SIZE] file [`SIZE];

integer i;
initial
begin
    file[0] = 0;
    for(i = 1;i <32 ;i=i+1)
        file[i] = 0;  

end


    always @(posedge clk) fork  
        dataOut1 <= file[addrOut1];
        dataOut2 <= file[addrOut2];

            
        $display( "file[0] : %d   file[5] : %d \n",file[0],file[5]);
    join

    always @(negedge clk ) begin
        if(isIn == `true)begin
            file[addrIn] <= dataIn;
        end  
        //$display("regFile rsAddr : %d rs : %d rtAddr : %d rt : %d\n",addrOut1,dataOut1,addrOut2,dataOut2); 
        $display("WriteBack : addrIn:%d  dataIn : %d\n",addrIn,dataIn);
    end

endmodule

`endif
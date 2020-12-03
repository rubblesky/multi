`ifndef MUX_WB_REG_ADDR_V
`define MUX_WB_REG_ADDR_V

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 16:44:53
// Design Name: 
// Module Name: mux_wb_reg_addr
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
module mux_wb_reg_addr(
    input control,
    input[`regAddrSize] dataIn0,dataIn1,
    output[`regAddrSize] dataOut
    );
always @( dataIn0,dataIn1,control) begin
    //$display("mux wb addr dataIn0 : %d dataIn1 : %d \n control : %d dataOut : %d \n",dataIn0,dataIn1,control,dataOut);
end
    assign dataOut = (control)?dataIn1:dataIn0;


endmodule

`endif
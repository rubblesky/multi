`ifndef MUX_FORWARD_MAIN_ALU1_V
`define MUX_FORWARD_MAIN_ALU1_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 15:45:43
// Design Name: 
// Module Name: mux_forward_main_alu1
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
module mux_forward_main_alu1(
    input[`forwardMuxControlSize] control,
    input[`SIZE] noForwardData,memForwardData,wbForwardData,

    output [`SIZE] dataOut
    
    );
    assign dataOut = 
    (control == `noForward)?
        noForwardData:((control == `memForward)?
        memForwardData:(control == `wbForward)?
            wbForwardData:32'bx);    
endmodule
`endif

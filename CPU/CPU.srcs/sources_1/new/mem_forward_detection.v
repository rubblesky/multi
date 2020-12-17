`ifndef MEM_FORWARD_DETECTION_V
`define MEM_FOREARD_DETECTION_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 11:35:47
// Design Name: 
// Module Name: mem_forward_detection
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
module mem_forward_detection(
    input clk,rst,
    input [`SIZE] inst,
    input [`SIZE] wbInst,
    input wbIsWb,wbWbAddr,
    output reg[`forwardMuxControlSize] rtMuxControl
    );

    always @(posedge clk) begin
        if(rst == `true)begin
            rtMuxControl <= `noForward;
        end
    end


    always @(negedge clk ) begin
        if(wbIsWb &&
        (wbWbAddr == `wbRtAddr && wbInst[`rtPos] == inst[`rtPos] 
        || wbWbAddr == `wbRdAddr && wbInst[`rdPos] == inst[`rtPos]))begin      
            rtMuxControl <= `wbForward;
        end
        else begin
            rtMuxControl <= `noForward;
        end
    end

endmodule
`endif
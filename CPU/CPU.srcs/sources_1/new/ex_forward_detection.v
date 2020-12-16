`ifndef EX_FORWARD_DETECTION_V
`define EX_FORWARD_DETECTION_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 11:35:47
// Design Name: 
// Module Name: forward_detection
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
module ex_forward_detection(
    input clk,rst,
    input [`SIZE] inst,
    input [`SIZE] memInst,wbInst,
    input memIsWb,memWbAddr,wbIsWb,wbWbAddr,
    output reg[`forwardMuxControlSize] rsMuxControl,rtMuxControl
    );

    always @(posedge clk) begin
        if(rst == `true)begin
            rsMuxControl <= `noForward;
            rtMuxControl <= `noForward;
        end
    end
    
    always @(negedge clk ) begin
        if(memIsWb &&
        (memWbAddr == `wbRtAddr && memInst[`rtPos] == inst[`rsPos] 
        || memWbAddr == `wbRdAddr && memInst[`rdPos] == inst[`rsPos]))begin
            rsMuxControl <= `memForward;
        end
        else if(wbIsWb &&
        (wbWbAddr == `wbRtAddr && wbInst[`rtPos] == inst[`rsPos] 
        || wbWbAddr == `wbRdAddr && wbInst[`rdPos] == inst[`rsPos]))begin      
            rsMuxControl <= `wbForward;
        end
        else begin
            rsMuxControl <= `noForward;
        end

        if(memIsWb &&
        (memWbAddr == `wbRtAddr && memInst[`rtPos] == inst[`rtPos] 
        || memWbAddr == `wbRdAddr && memInst[`rdPos] == inst[`rtPos]))begin
            rtMuxControl <= `memForward;
        end
        else if(wbIsWb &&
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
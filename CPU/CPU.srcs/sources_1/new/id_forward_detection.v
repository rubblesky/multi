`ifndef ID_FORWARD_DETECTION_V
`define ID_FORWARD_DETECTION_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 11:35:47
// Design Name: 
// Module Name: id_forward_detection
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
module id_forward_detection(
    input clk,rst,
    input [`SIZE] idInst,
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
    
    always @(posedge clk ) begin
        if(memIsWb &&
        (memWbAddr == `wbRtAddr && memInst[`rtPos] == idInst[`rsPos] 
        || memWbAddr == `wbRdAddr && memInst[`rdPos] == idInst[`rsPos]))begin
            rsMuxControl <= `memForward;
        end
        else if(wbIsWb &&
        (wbWbAddr == `wbRtAddr && wbInst[`rtPos] == idInst[`rsPos] 
        || wbWbAddr == `wbRdAddr && wbInst[`rdPos] == idInst[`rsPos]))begin      
            rsMuxControl <= `wbForward;
        end
        else begin
            rsMuxControl <= `noForward;
        end

        if(memIsWb &&
        (memWbAddr == `wbRtAddr && memInst[`rtPos] == idInst[`rtPos] 
        || memWbAddr == `wbRdAddr && memInst[`rdPos] == idInst[`rtPos]))begin
            rtMuxControl <= `memForward;
        end
        else if(wbIsWb &&
        (wbWbAddr == `wbRtAddr && wbInst[`rtPos] == idInst[`rtPos] 
        || wbWbAddr == `wbRdAddr && wbInst[`rdPos] == idInst[`rtPos]))begin      
            rtMuxControl <= `wbForward;
        end
        else begin
            rtMuxControl <= `noForward;
        end

    end
    

endmodule

`endif
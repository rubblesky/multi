`ifndef MUX_WB_DATA_V
`define MUX_WB_DATA_V
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 16:44:53
// Design Name: 
// Module Name: mux_wb_data
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
module mux_wb_data(
    input control,
    input[`SIZE] calculation,load,
    output[`SIZE] dataOut   
    );
    assign dataOut = (control)?calculation:load;

endmodule
`endif

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 22:33:05
// Design Name: 
// Module Name: tb_inst_mem
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

//`include "..\..\sources_1\new\config.vh"
//~ `New testbench
`timescale  1ns / 1ps

module tb_inst_mem;

// inst_mem Parameters
parameter PERIOD  = 10;


// inst_mem Inputs
reg   clk                                  = 0 ;
reg   wire[`SIZE] address                  = 0 ;
reg   isOut                                = 0 ;

// inst_mem Outputs
wire  reg[`SIZE] instruction               ;    


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

inst_mem  u_inst_mem (
    .clk                     ( clk                      ),
    .wire[`SIZE] address     ( wire[`SIZE] address      ),
    .isOut                   ( isOut                    ),

initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

inst_mem  u_inst_mem (
    .clk                     ( clk                      ),
    .wire[`SIZE] address     ( wire[`SIZE] address      ),
    .isOut                   ( isOut                    ),

    .reg[`SIZE] instruction  ( reg[`SIZE] instruction   )
);

initial
begin

    $finish;
end

endmodule

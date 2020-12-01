`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 13:38:33
// Design Name: 
// Module Name: tb_cpu
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


//~ `New testbench
`timescale  1ns / 1ps

module tb_CPU;

// CPU Parameters
parameter PERIOD  = 10;


// CPU Inputs
reg   clk                                  = 0 ;

// CPU Outputs



initial
begin
    forever #(PERIOD/2)  clk=~clk;
end
/*
initial
begin
    #(PERIOD*2) rst_n  =  1;
end
*/
CPU  u_CPU (
    .clk                     ( clk   )
);

initial
begin

    $finish;
end

endmodule
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
reg   rst                                  = 1 ;
// CPU Outputs



initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst  =  0;
end

 wire[`SIZE] tb_newPc,tb_pcOut,tb_instruction;
 wire[`regAddrSize] tb_reg_file_addrOut1,tb_reg_file_addrOut2;

CPU  u_CPU (
    .clk                     ( clk   ),
    .rst                     (rst),

    .tb_newPc                                   (tb_newPc                      ),
    .tb_pcOut                                 ( tb_pcOut                                  ),
    .tb_instruction                           ( tb_instruction                            ),
    .tb_reg_file_addrOut1                            (tb_reg_file_addrOut1   ),
    .tb_reg_file_addrOut2                     ( tb_reg_file_addrOut2                      )
);

initial
begin
    #100
    $finish;
end

endmodule
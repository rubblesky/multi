`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 20:07:47
// Design Name: 
// Module Name: tb_reg_file
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

module tb_reg_file;

// reg_file Parameters
parameter PERIOD  = 10;


// reg_file Inputs
reg   clk                                  = 0 ;
reg   isOut1                               = 0 ;
reg   isOut2                               = 0 ;
reg   isIn                                 = 0 ;
reg   [`regAddrSize] addrIn                = 0 ;
reg   [`SIZE] dataIn                       = 0 ;
reg   [`regAddrSize] addrOut1              = 0 ;
reg   [`regAddrSize] addrOut2              = 0 ;

// reg_file Outputs
wire  reg[`SIZE] dataOut1                  ;
wire  dataOut2                             ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

reg_file  u_reg_file (
    .clk                      ( clk                       ),
    .isOut1                   ( isOut1                    ),
    .isOut2                   ( isOut2                    ),
    .isIn                     ( isIn                      ),
    .[`regAddrSize] addrIn    ( [`regAddrSize] addrIn     ),
    .[`SIZE] dataIn           ( [`SIZE] dataIn            ),
    .[`regAddrSize] addrOut1  ( [`regAddrSize] addrOut1   ),
    .[`regAddrSize] addrOut2  ( [`regAddrSize] addrOut2   ),

    .reg[`SIZE] dataOut1      ( reg[`SIZE] dataOut1       ),
    .dataOut2                 ( dataOut2                  )
);

initial
begin

    $finish;
end

endmodule

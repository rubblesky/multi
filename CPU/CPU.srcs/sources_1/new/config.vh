//所有器件都在下降沿输出 上升沿输入

`ifndef CONFIG_V
`define CONFIG_V

`timescale 1ns / 1ps

`define true 1'b1
`define false 1'b0 

/*用于PC旁数据选择器控制信号*/
`define jmp 1'b1
`define notJmp 1'b0 


`define SIZE 31:0
`define instMemSize 0:1023
`define dataMemSize 0:1023
`define instMemSizeLog2 10
`define dataMemSizeLog2 10
`define regAddrSize 4:0

`define instOp 5:0
`define aluControlSize 3:0

`endif
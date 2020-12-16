//所有器件都在下降沿输出 上升沿输入

`ifndef CONFIG_V
`define CONFIG_V

`timescale 1ns / 1ps

`define true 1'b1
`define false 1'b0 

/*用于PC旁数据选择器控制信号*/
`define jmp 1'b1
`define notJmp 1'b0 

/**/
`define regStatusSize 4:0

`define SIZE 31:0
`define instMemSize 0:1023
`define dataMemSize 0:1023
`define instMemSizeLog2 10
`define dataMemSizeLog2 10
`define regAddrSize 4:0

`define instOpSize 5:0
`define instFunctSize 5:0

`define jmpOpSize 1:0

`define aluOpSize 1:0
`define aluControlSize 3:0

`define wbRtAddr 1'b0
`define wbRdAddr 1'b1


`define forwardMuxControlSize 1:0
`define noForward 2'b00
`define memForward 2'b01
`define wbForward 2'b10

`define opPos 31:26
`define rsPos 25:21
`define rtPos 20:16
`define rdPos 15:11
`define shamtPos 10:6
`define functPos 5:0
`define immediatePos 15:0

`endif
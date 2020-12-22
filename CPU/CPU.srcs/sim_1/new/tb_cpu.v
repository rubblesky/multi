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
`define wbCalculationData 1'b1
`define wbLoadData 1'b0

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
    #(PERIOD*2 + PERIOD/4) rst  =  0;
end

 //wire[`SIZE] tb_newPc;
  wire[`SIZE]tb_pcOut;
wire[`SIZE]tb_instruction;
 wire[`regAddrSize] tb_reg_file_addrOut1,tb_reg_file_addrOut2;
 //wire [`SIZE] tb_reg_file_dataOut1,tb_reg_file_dataOut2;
 //wire [`aluOpSize] tb_cu_aluOp;
 wire[`SIZE] tb_mux_main_alu_operand_dataOut;
 //wire [`aluControlSize]tb_main_alu_control_aluControl;
//wire [`SIZE] tb_main_alu_dataOut;
wire [`SIZE] tb_jmp_alu_branchjmpPc;

 wire[`SIZE] tb_reg_ex_mem_calculation;
wire[`SIZE] tb_reg_ex_mem_rt;
//wire [`SIZE] tb_data_mem_dataOut;
wire tb_reg_mem_wb_regFileIsIn;
wire [`SIZE] tb_reg_mem_wb_calculation;
//wire [4:0] tb_rtAddr;
wire [`regAddrSize]tb_mux_wb_reg_addr_dataOut;
 wire [`SIZE] tb_mux_wb_data_dataOut;
wire tb_pc_isIn;

wire [`SIZE] tb_mux_forward_main_alu1_dataOut;
wire [`SIZE] tb_mux_forward_main_alu2_dataOut;
wire [`forwardMuxControlSize] tb_id_forward_detection_rsMuxControl;
wire [`forwardMuxControlSize] tb_id_forward_detection_rtMuxControl;  
wire [`forwardMuxControlSize] tb_ex_forward_detection_rsMuxControl;
wire [`forwardMuxControlSize] tb_ex_forward_detection_rtMuxControl;
wire [`forwardMuxControlSize] tb_mem_forward_detection_rtMuxControl;
wire [`SIZE] tb_negativeMemForwardData;
wire [`SIZE] tb_negativeWbForwardData;

CPU  u_CPU (
    .clk                     ( clk   ),
    .rst                     (rst),

    //.tb_newPc                                   (tb_newPc                      ),
    .tb_pc_isIn(tb_pc_isIn),
    .tb_pcOut                                 ( tb_pcOut                                  ),
    .tb_instruction                           ( tb_instruction                            ),
    .tb_reg_file_addrOut1                            (tb_reg_file_addrOut1   ),
    .tb_reg_file_addrOut2                     ( tb_reg_file_addrOut2                      ),
    //.tb_reg_file_dataOut1                  (tb_reg_file_dataOut1       ),
    //.tb_reg_file_dataOut2                 ( tb_reg_file_dataOut2               ),
    //.tb_cu_aluOp(tb_cu_aluOp),
    .tb_mux_main_alu_operand_dataOut(tb_mux_main_alu_operand_dataOut),
    //.tb_main_alu_control_aluControl(tb_main_alu_control_aluControl),
    //.tb_main_alu_dataOut(tb_main_alu_dataOut),
    .tb_jmp_alu_branchJmpPc(tb_jmp_alu_branchjmpPc),

    .tb_reg_ex_mem_calculation(tb_reg_ex_mem_calculation),
    .tb_reg_ex_mem_rt(tb_reg_ex_mem_rt),
    //.tb_data_mem_dataOut(tb_data_mem_dataOut),
    
    .tb_reg_mem_wb_regFileIsIn(tb_reg_mem_wb_regFileIsIn),
    .tb_reg_mem_wb_calculation(tb_reg_mem_wb_calculation),
    //.tb_rtAddr(tb_rtAddr),

    .tb_mux_wb_reg_addr_dataOut(tb_mux_wb_reg_addr_dataOut),
    .tb_mux_wb_data_dataOut(tb_mux_wb_data_dataOut),

    .tb_mux_forward_main_alu1_dataOut( tb_mux_forward_main_alu1_dataOut),
    .tb_mux_forward_main_alu2_dataOut(tb_mux_forward_main_alu2_dataOut),
    .tb_id_forward_detection_rsMuxControl(tb_id_forward_detection_rsMuxControl),
    .tb_id_forward_detection_rtMuxControl(tb_id_forward_detection_rtMuxControl),
    .tb_ex_forward_detection_rsMuxControl(tb_ex_forward_detection_rsMuxControl),
    .tb_ex_forward_detection_rtMuxControl(tb_ex_forward_detection_rtMuxControl),
    .tb_mem_forward_detection_rtMuxControl(tb_mem_forward_detection_rtMuxControl),
    .tb_negativeMemForwardData(tb_negativeMemForwardData),
    .tb_negativeWbForwardData(tb_negativeWbForwardData)
);

initial
begin
    #300
    $finish;
end

endmodule
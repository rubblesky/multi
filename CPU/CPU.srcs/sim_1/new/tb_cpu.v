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
 wire [`SIZE] tb_reg_file_dataOut1,tb_reg_file_dataOut2;
 wire [`aluOpSize] tb_cu_aluOp;
 wire[`SIZE] tb_mux_main_alu_operand_dataOut;
 wire [`aluControlSize]tb_main_alu_control_aluControl;
wire [`SIZE] tb_main_alu_dataOut;
wire tb_reg_mem_wb_regFileIsIn;
wire [`SIZE] tb_reg_mem_wb_calculation;
wire [4:0] tb_rtAddr;
wire [`regAddrSize]tb_mux_wb_reg_addr_dataOut;
 wire [`SIZE] tb_mux_wb_data_dataOut;
 wire[`SIZE] tb_reg_ex_mem_calculation;
wire[`SIZE] tb_reg_ex_mem_rt;
wire [`SIZE] tb_data_mem_dataOut;
CPU  u_CPU (
    .clk                     ( clk   ),
    .rst                     (rst),

    .tb_newPc                                   (tb_newPc                      ),
    .tb_pcOut                                 ( tb_pcOut                                  ),
    .tb_instruction                           ( tb_instruction                            ),
    .tb_reg_file_addrOut1                            (tb_reg_file_addrOut1   ),
    .tb_reg_file_addrOut2                     ( tb_reg_file_addrOut2                      ),
    .tb_reg_file_dataOut1                  (tb_reg_file_dataOut1       ),
    .tb_reg_file_dataOut2                 ( tb_reg_file_dataOut2               ),
    .tb_cu_aluOp(tb_cu_aluOp),
    .tb_mux_main_alu_operand_dataOut(tb_mux_main_alu_operand_dataOut),
    .tb_main_alu_control_aluControl(tb_main_alu_control_aluControl),
    .tb_main_alu_dataOut(tb_main_alu_dataOut),

    .tb_reg_ex_mem_calculation(tb_reg_ex_mem_calculation),
    .tb_reg_ex_mem_rt(tb_reg_ex_mem_rt),
    .tb_data_mem_dataOut(tb_data_mem_dataOut),
    
    .tb_reg_mem_wb_regFileIsIn(tb_reg_mem_wb_regFileIsIn),
    .tb_reg_mem_wb_calculation(tb_reg_mem_wb_calculation),
    .tb_rtAddr(tb_rtAddr),
    .tb_mux_wb_reg_addr_dataOut(tb_mux_wb_reg_addr_dataOut),
    .tb_mux_wb_data_dataOut(tb_mux_wb_data_dataOut)
);

initial
begin
    #300
    $finish;
end

endmodule
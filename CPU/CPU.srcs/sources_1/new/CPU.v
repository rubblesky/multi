
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 21:32:28
// Design Name: 
// Module Name: CPU
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

`include "CPU.vh"
module CPU(
    input clk,
    input rst,

    output wire[`SIZE] tb_newPc,tb_pcOut,tb_instruction,
    output wire[`regAddrSize] tb_reg_file_addrOut1,tb_reg_file_addrOut2,
    output wire [`SIZE] tb_reg_file_dataOut1,tb_reg_file_dataOut2,
    output wire [`SIZE] tb_main_alu_dataOut,
    output wire [`SIZE] tb_reg_mem_wb_inst, 
    output wire tb_reg_mem_wb_regFileIsIn,
    wire [`SIZE] tb_reg_mem_wb_calculation
    );


//pc
wire[`SIZE] newPc,pcOut;

pc cpu_pc(
    .clk (clk),
    .rst(rst),
    .newPc (newPc),

    .pcOut (pcOut)
);

//pc_alu
pc_alu cpu_pc_alu(
    .clk(clk),
    .pc(pcOut),

    .newPc(newPc)
);

//inst_mem

wire[`SIZE] instruction;
inst_mem cpu_inst_mem(
    .clk(clk),
    .address(pcOut),
    .isOut(`true),  //需要控制指令流出时再修改

    .instruction(instruction)
);

//reg_if_id
wire[`SIZE] reg_if_id_inst;
reg_if_id cpu_reg_if_id(
    .clk(clk),
    .instIn(instruction),

    .inst(reg_if_id_inst)
);

//reg_file
wire  reg_file_isIn;
wire[`regAddrSize] reg_file_addrIn,reg_file_addrOut1,reg_file_addrOut2;
wire[`SIZE] reg_file_dataIn,reg_file_dataOut1,reg_file_dataOut2;
reg_file cpu_reg_file(
    .clk(clk),
    .rst(rst),
    .isIn(reg_file_isIn),

    .addrIn(reg_file_addrIn),
    .dataIn(reg_file_dataIn),
    .addrOut1(reg_file_addrOut1),
    .addrOut2(reg_file_addrOut2),

    .dataOut1(reg_file_dataOut1),
    .dataOut2(reg_file_dataOut2)
);

//cu
wire[5:0] cu_op;
wire[`aluOpSize] cu_aluOp;
wire cu_regFileIsIN;
cu cpu_cu(
    .clk(clk),
    .op(cu_op),

    .aluOp(cu_aluOp),
    .regFileIsIn(cu_regFileIsIn)
);

//id_tmp_reg
wire [`SIZE] id_tmp_reg_inst;
id_tmp_reg cpu_id_tmp_reg(
    .clk(clk),
    .instIn(reg_if_id_inst),

    .inst(id_tmp_reg_inst)
);

//main_alu_control
wire [5:0] main_alu_control_funct;
wire [`aluControlSize] main_alu_control_aluControl; 
main_alu_control cpu_main_alu_control(
    .clk(clk),
    .aluOp(cu_aluOp),
    .funct(main_alu_control_funct),

    .aluControl(main_alu_control_aluControl)
);

//reg_id_ex
wire[`SIZE] reg_id_ex_rs,reg_id_ex_rt;
wire[`SIZE] reg_id_ex_inst;
wire reg_id_ex_regFileIsIn;
reg_id_ex cpu_reg_id_ex(
    .clk(clk),
    .rsIn(reg_file_dataOut1),
    .rtIn(reg_file_dataOut2),
    .instIn(id_tmp_reg_inst),
    .regFileIsInIn(cu_regFileIsIn),

    .rs(reg_id_ex_rs),
    .rt(reg_id_ex_rt),
    .inst(reg_id_ex_inst),
    .regFileIsIn(reg_id_ex_regFileIsIn)
);

//main_alu
wire[`SIZE] main_alu_dataOut;
main_alu cpu_main_alu(
    .clk(clk),
    .dataIn1(reg_id_ex_rs),
    .dataIn2(reg_id_ex_rt),
    .aluControl(main_alu_control_aluControl),

    .dataOut(main_alu_dataOut)
);

//ex_tmp_reg
wire [`SIZE] ex_tmp_reg_inst;
wire ex_tmp_reg_regFileIn;
ex_tmp_reg cpu_ex_tmp_reg(
    .clk(clk),
    .instIn(reg_id_ex_inst),
    .regFileIsInIn(reg_id_ex_regFileIsIn),

    .inst(ex_tmp_reg_inst),
    .regFileIsIn(ex_tmp_reg_regFileIsIn)
);

//reg_ex_mem
wire [`SIZE] reg_ex_mem_inst,reg_ex_mem_calculation;
wire reg_ex_mem_regFileIsIn;
reg_ex_mem cpu_reg_ex_mem(
    .clk(clk),
    .instIn(id_tmp_reg_inst),
    .calculationIn(main_alu_dataOut),
    .regFileIsInIn(ex_tmp_reg_regFileIsIn),

    .inst(reg_ex_mem_inst),
    .calculation(reg_ex_mem_calculation),
    .regFileIsIn(reg_ex_mem_regFileIsIn)
);

//mem_tmp_reg
wire [`SIZE]  mem_tmp_reg_inst, mem_tmp_reg_calculation;
wire mem_tmp_reg_regFileIsIn;
mem_tmp_reg cpu_mem_tmp_reg(
    .clk(clk),
    .instIn(reg_ex_mem_inst),
    .calculationIn(reg_ex_mem_calculation),
    .regFileIsInIn(reg_ex_mem_regFileIsIn),

    .inst(mem_tmp_reg_inst),
    .calculation(mem_tmp_reg_calculation),
    .regFileIsIn(mem_tmp_reg_regFileIsIn)
);

//reg_mem_wb
wire [`SIZE] reg_mem_wb_inst, reg_mem_wb_calculation;
wire reg_mem_wb_regFileIsIn;
reg_mem_wb cpu_reg_mem_wb(
    .clk(clk),
    .instIn(mem_tmp_reg_inst),
    .calculationIn(mem_tmp_reg_calculation),
    .regFileIsInIn(mem_tmp_reg_regFileIsIn),
    
    .inst(reg_mem_wb_inst),
    .calculation(reg_mem_wb_calculation),
    .regFileIsIn(reg_mem_wb_regFileIsIn)
);


//连接cu和if_id_reg
assign cu_op = reg_if_id_inst[31:26];

//连接reg_file和reg_if_id
assign reg_file_addrOut1 = reg_if_id_inst[25:21];
assign reg_file_addrOut2 = reg_if_id_inst[20:16];
//连接reg_file和reg_mem_wb
assign reg_file_isIn = reg_mem_wb_regFileIsIn;
assign reg_file_addrIn = reg_mem_wb_inst[15:11];
assign reg_file_dataIn = reg_mem_wb_calculation;

//连接main_alu_control和id_tmp_reg
assign main_alu_control_funct = id_tmp_reg_inst[5:0];


//测试用
    assign tb_newPc = newPc;
    assign tb_pcOut = pcOut;
    assign tb_instruction = instruction;
    assign tb_reg_file_addrOut1 = reg_file_addrOut1;
    assign tb_reg_file_addrOut2 = reg_file_addrOut2;
    assign tb_reg_file_dataOut1 = reg_file_dataOut1;
    assign tb_reg_file_dataOut2 = reg_file_dataOut2;
    assign tb_main_alu_dataOut = main_alu_dataOut;
    assign tb_reg_mem_wb_regFileIsIn = reg_mem_wb_regFileIsIn;
    assign tb_reg_mem_wb_calculation = reg_ex_mem_calculation;
endmodule


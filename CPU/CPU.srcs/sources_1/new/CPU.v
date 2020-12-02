
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
wire cu_regFileIsIn,cu_muxOperandControl,cu_dataMemIsIn,cu_dataMemIsOut,cu_muxWbDataControl,cu_muxWbRegAddrControl;
cu cpu_cu(
    .clk(clk),
    .op(cu_op),

    .aluOp(cu_aluOp),
    .muxOperandControl(cu_muxOperandControl),
    .dataMemIsIn(cu_dataMemIsIn),
    .dataMemIsOut(cu_dataMemIsOut),
    .muxWbDataControl(cu_muxWbDataControl),
    .muxWbRegAddrControl(cu_muxWbRegAddrControl),
    .regFileIsIn(cu_regFileIsIn)
);

//sign_extend
wire [15:0] immediate;
wire [`SIZE] sign_extend_extendedImmediate;
sign_extend cpu_sign_extend(
    .clk(clk),
    .immediate(immediate),
    .extendedImmediate(extendedImmediate)
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
wire reg_id_ex_muxOperandControl,reg_id_ex_dataMemIsIn,reg_id_ex_dataMemIsOut,reg_id_ex_muxWbDataControl,reg_id_ex_muxWbRegAddrControl,reg_id_ex_regFileIsIn;
reg_id_ex cpu_reg_id_ex(
    .clk(clk),
    .rsIn(reg_file_dataOut1),
    .rtIn(reg_file_dataOut2),
    .instIn(id_tmp_reg_inst),
    .muxOperandControlIn(cu_muxOperandControl),
    .dataMemIsInIn(cu_dataMemIsOut),
    .dataMemIsOutIn(cu_dataMemIsOut),
    .muxWbDataControlIn(cu_muxWbDataControl),
    .muxWbRegAddrControlIn(cu_muxWbRegAddrControl),
    .regFileIsInIn(cu_regFileIsIn),

    .rs(reg_id_ex_rs),
    .rt(reg_id_ex_rt),
    .inst(reg_id_ex_inst),
    .muxOperandControl(reg_id_ex_muxOperandControl),
    .dataMemIsIn(reg_id_ex_dataMemIsOut),
    .dataMemIsOut(reg_id_ex_dataMemIsOut),
    .muxWbDataControl(reg_id_ex_muxWbDataControl),
    .muxWbRegAddrControl(reg_id_ex_muxWbRegAddrControl),
    .regFileIsIn(reg_id_ex_regFileIsIn)
);

//mux_main_alu_operand
wire [`SIZE] mux_main_alu_operand_dataOut;
mux_main_alu_operand cpu_mux_main_alu_operand(
    .control(reg_id_ex_muxOperandControl),
    .dataIn0(sign_extend_extendedImmediate),
    .dataIn1(reg_id_ex_rt),
    .dataOut(mux_main_alu_operand_dataOut)
    
);


//main_alu
wire[`SIZE] main_alu_dataOut;
main_alu cpu_main_alu(
    .clk(clk),
    .dataIn1(reg_id_ex_rs),
    .dataIn2(mux_main_alu_operand_dataOut),
    .aluControl(main_alu_control_aluControl),

    .dataOut(main_alu_dataOut)
);

//ex_tmp_reg
wire [`SIZE] ex_tmp_reg_inst,ex_tmp_reg_rt;
wire ex_tmp_reg_dataMemIsIn,ex_tmp_reg_dataMemIsOut,ex_tmp_reg_muxWbDataControl,ex_tmp_reg_muxWbRegAddrControl,ex_tmp_reg_regFileIsIn;
ex_tmp_reg cpu_ex_tmp_reg(
    .clk(clk),
    .instIn(reg_id_ex_inst),
    .rtIn(reg_id_ex_rt),
    .dataMemIsInIn(reg_id_ex_dataMemIsIn),
    .dataMemIsOutIn(reg_id_ex_dataMemIsOut),
    .muxWbDataControlIn(reg_id_ex_muxWbDataControl),
    .muxWbRegAddrControlIn(reg_id_ex_muxWbRegAddrControl),    
    .regFileIsInIn(reg_id_ex_regFileIsIn),

    .inst(ex_tmp_reg_inst),
    .rt(ex_tmp_reg_rt),
    .dataMemIsIn(ex_tmp_reg_dataMemIsIn),
    .dataMemIsOut(ex_tmp_reg_muxWbDataControl),
    .muxWbDataControl(ex_tmp_reg_muxWbDataControl),
    .muxWbRegAddrControl(ex_tmp_reg_muxWbRegAddrControl),
    .regFileIsIn(ex_tmp_reg_regFileIsIn)

);

//reg_ex_mem
wire [`SIZE] reg_ex_mem_inst,reg_ex_mem_rt,reg_ex_mem_calculation;
wire reg_ex_mem_dataMemIsIn,reg_ex_mem_dataMemIsOut,reg_ex_mem_muxWbDataControl,reg_ex_mem_muxWbRegAddrControl,reg_ex_mem_regFileIsIn;
reg_ex_mem cpu_reg_ex_mem(
    .clk(clk),
    .instIn(id_tmp_reg_inst),
    .rtIn(ex_tmp_reg_rt),
    .calculationIn(main_alu_dataOut),
    .dataMemIsInIn(ex_tmp_reg_dataMemIsIn),
    .dataMemIsOutIn(ex_tmp_reg_dataMemIsOut),
    .muxWbDataControlIn(ex_tmp_reg_muxWbDataControl),
    .muxWbRegAddrControlIn(ex_tmp_reg_muxWbRegAddrControl),
    .regFileIsInIn(ex_tmp_reg_regFileIsIn),

    .inst(reg_ex_mem_inst),
    .rt(reg_ex_mem_rt),
    .calculation(reg_ex_mem_calculation),
    .dataMemIsIn(reg_ex_mem_dataMemIsIn),
    .dataMemIsOut(reg_ex_mem_dataMemIsOut),
    .muxWbDataControl(reg_ex_mem_muxWbDataControl),
    .muxWbRegAddrControl(reg_ex_mem_muxWbRegAddrControl),
    .regFileIsIn(reg_ex_mem_regFileIsIn)
);

//data_mem
wire[`SIZE] data_mem_dataOut ;
data_mem cpu_data_mem(
    .clk(clk),
    .isIn(reg_ex_mem_dataMemIsIn),
    .isOut(reg_ex_mem_dataMemIsOut),
    .addr(reg_ex_mem_calculation),
    .dataIn(reg_ex_mem_rt),
    .dataOut(data_mem_dataOut)
);


//mem_tmp_reg
wire [`SIZE]  mem_tmp_reg_inst, mem_tmp_reg_calculation;
wire mem_tmp_reg_muxWbDataControl,mem_tmp_reg_muxWbRegAddrControl,mem_tmp_reg_regFileIsIn;
mem_tmp_reg cpu_mem_tmp_reg(
    .clk(clk),
    .instIn(reg_ex_mem_inst),
    .calculationIn(reg_ex_mem_calculation),
    .muxWbDataControlIn(reg_ex_mem_muxWbDataControl),
    .muxWbRegAddrControlIn(reg_ex_mem_muxWbRegAddrControl),
    .regFileIsInIn(reg_ex_mem_regFileIsIn),

    .inst(mem_tmp_reg_inst),
    .calculation(mem_tmp_reg_calculation),
    .muxWbDataControl(mem_tmp_reg_muxWbDataControl),
    .muxWbRegAddrControl(mem_tmp_reg_muxWbRegAddrControl),
    .regFileIsIn(mem_tmp_reg_regFileIsIn)
);

//reg_mem_wb
wire [`SIZE] reg_mem_wb_inst;
wire [`SIZE] reg_mem_wb_calculation,reg_mem_wb_loadedData;
wire reg_mem_wb_muxWbDataControl,reg_mem_wb_muxWbRegAddrControl,reg_mem_wb_regFileIsIn;
reg_mem_wb cpu_reg_mem_wb(
    .clk(clk),
    .instIn(mem_tmp_reg_inst),
    .calculationIn(mem_tmp_reg_calculation),
    .loadedDataIn(data_mem_dataOut),
    .muxWbDataControlIn(mem_tmp_reg_muxWbDataControl),
    .muxWbRegAddrControlIn(mem_tmp_reg_muxWbRegAddrControl),
    .regFileIsInIn(mem_tmp_reg_regFileIsIn),
    
    .inst(reg_mem_wb_inst),
    .calculation(reg_mem_wb_calculation),
    .loadedData(reg_mem_wb_loadedData),
    .muxWbDataControl(reg_mem_wb_muxWbDataControl),
    .muxWbRegAddrControl(reg_mem_wb_muxWbRegAddrControl),
    .regFileIsIn(reg_mem_wb_regFileIsIn)
);

//mux_wb_data
wire [`SIZE] mux_wb_data_dataOut;
mux_wb_data cpu_mux_wb_data(
    .control(reg_mem_wb_muxWbDataControl),
    .dataIn0(reg_mem_wb_loadedData),
    .dataIn1(reg_mem_wb_calculation),
    .dataOut(mux_wb_data_dataOut)
);


//mux_wb_reg_addr
wire [`regAddrSize]rtAddr,rdAddr;
wire [`regAddrSize]mux_wb_reg_addr_dataOut;
mux_wb_reg_addr cpu_mux_wb_reg_addr(
    .control(reg_mem_wb_muxWbRegAddrControl),
    .dataIn0(rtAddr),
    .dataIn1(rdAddr),
    .dataOut(mux_wb_reg_addr_dataOut)
);






//连接cu和if_id_reg
assign cu_op = reg_if_id_inst[`opPos];

//连接reg_file和reg_if_id
assign reg_file_addrOut1 = reg_if_id_inst[`rsPos];
assign reg_file_addrOut2 = reg_if_id_inst[`rtPos];
//连接reg_file和reg_mem_wb
assign reg_file_isIn = reg_mem_wb_regFileIsIn;

//连接sign_extend和reg_if_id
assign immediate = reg_if_id_inst[`immediatePos];


//连接main_alu_control和id_tmp_reg
assign main_alu_control_funct = id_tmp_reg_inst[`functPos];

//连接mux_wb_reg_addr和reg_mem_wb
assign rdAddr = reg_mem_wb_inst[`rdPos];
assign rtAddr = reg_mem_wb_inst[`rtPos];

//连接mux_wb_data和reg_file
assign reg_file_dataIn = mux_wb_data_dataOut;

//连接mux_wb_reg_addr和reg_file
assign reg_file_addrIn = mux_wb_reg_addr_dataOut;

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


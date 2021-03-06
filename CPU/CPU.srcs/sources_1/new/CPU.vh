`ifndef CPU_VH
`define CPU_VH 
`include "config.vh"
`include "pc.v"
`include "pc_alu.v"
`include "pause_control.v"
`include "inst_mem.v"
`include "status_regs.v"
`include "reg_if_id.v"
`include "reg_file.v"
`include "cu.v"
`include "sign_extend.v"
`include "id_tmp_reg.v"
`include "main_alu_control.v"
`include "reg_id_ex.v"
`include "mux_main_alu_operand.v"
`include "main_alu.v"
`include "jmp_alu.v"
`include "ex_tmp_reg.v"
`include "pc_select_control.v"
`include "mux_jmp_pc.v"
`include "mux_pc.v"
`include "reg_ex_mem.v"
`include "data_mem.v"
`include "mem_tmp_reg.v"
`include "reg_mem_wb.v"
`include "mux_wb_data.v"
`include "mux_wb_reg_addr.v"
`include "wb_tmp_reg.v"

`include "id_forward_detection.v"
`include "ex_forward_detection.v"
`include "mem_forward_detection.v"
`include "mux_forward.v"
`endif

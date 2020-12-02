
`ifndef REG_EX_MEM_V
`define REG_EX_MEM_V
`include "config.vh"

module reg_ex_mem (
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] rtIn,
    input[`SIZE] calculationIn, //ALU计算结果

    input dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,

    output reg[`SIZE]inst,
    output reg[`SIZE]rt,
    output reg[`SIZE]calculation,

    output reg dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn
);

always @(negedge clk ) begin
    inst <= instIn;
    rt <= rtIn;
    calculation <= calculationIn;
        {dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <= 
        {dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};
end

    
endmodule
`endif
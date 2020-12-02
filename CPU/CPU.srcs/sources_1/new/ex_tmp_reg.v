`ifndef EX_TMP_REG
`define EX_TMP_REG

`include "config.vh"
module ex_tmp_reg (
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] rtIn,

    input dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,

    output reg[`SIZE] inst,
    output reg[`SIZE] rt,

    output reg dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn
);

    always @(posedge clk) begin
        inst <= instIn;
        rt <= rtIn;
        {dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <= 
        {dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};

    end
    
endmodule
`endif
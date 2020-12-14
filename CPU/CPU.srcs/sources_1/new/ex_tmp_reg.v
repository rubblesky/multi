`ifndef EX_TMP_REG
`define EX_TMP_REG

`include "config.vh"
module ex_tmp_reg (
    input clk,rst,
    input[`SIZE] instIn,
    input[`SIZE] rtIn,
    input[`SIZE] pcIn,

    input dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,
    input[`jmpOpSize] jmpOpIn,

    output reg[`SIZE] inst,
    output reg[`SIZE] rt,
    output reg[`SIZE] pc,

    output reg dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn,
    output reg[`jmpOpSize] jmpOp
);
always @(posedge clk ) begin
    if(rst == `true)
        jmpOp <= 2'b00;
end
    always @(posedge clk) begin
        inst <= instIn;
        rt <= rtIn;
        pc <= pcIn;
        {dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <= 
        {dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};
        jmpOp <= jmpOpIn;
    end
    
endmodule
`endif
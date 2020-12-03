`ifndef REG_ID_EX_V
`define REG_ID_EX_V
`include "config.vh"
module reg_id_ex(
    input clk,
    input[`SIZE] rsIn,
    input[`SIZE] rtIn,
    //input[`SIZE] pcIn,
    input[`SIZE] instIn,
    input[`SIZE] extendedImmediateIn,

    
    input  muxOperandControlIn,dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,
    
    output reg[`SIZE] rs,    
    output reg[`SIZE] rt,
    //output reg[`SIZE] pc,
    output reg[`SIZE] inst,
    output reg[`SIZE] extendedImmediate,

    output reg muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn
);

reg[`regAddrSize] rdAddr;


always @(negedge clk ) begin
    rs <= rsIn;
    rt <= rtIn;
    inst <= instIn;
    extendedImmediate <= extendedImmediateIn;
    {muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <=
    {muxOperandControlIn,dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};

    //pc <= pcIn;
end
    
endmodule
`endif
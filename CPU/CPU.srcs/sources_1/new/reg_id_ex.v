`ifndef REG_ID_EX_V
`define REG_ID_EX_V
`include "config.vh"
module reg_id_ex(
    input clk,rst,
    input[`SIZE] rsIn,
    input[`SIZE] rtIn,
    input[`SIZE] pcIn,
    input[`SIZE] instIn,
    input[`SIZE] extendedImmediateIn,

    
    input  muxOperandControlIn,dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn,
    input[`jmpOpSize] jmpOpIn,

    output reg[`SIZE] rs,    
    output reg[`SIZE] rt,
    output reg[`SIZE] pc,
    output reg[`SIZE] inst,
    output reg[`SIZE] extendedImmediate,

    output reg muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn,
    output reg[`jmpOpSize] jmpOp
);

reg[`regAddrSize] rdAddr;

initial begin
    jmpOp <= 2'b00;
end
/*
always @(posedge clk ) begin
    if(rst == `true)
        jmpOp <= 2'b00;
end
*/
always @(negedge clk ) begin
    
    rs <= rsIn;
    rt <= rtIn;
    pc <= pcIn;
    inst <= instIn;
    extendedImmediate <= extendedImmediateIn;
    {muxOperandControl,dataMemIsIn,dataMemIsOut,muxWbDataControl,muxWbRegAddrControl,regFileIsIn} <=
    {muxOperandControlIn,dataMemIsInIn,dataMemIsOutIn,muxWbDataControlIn,muxWbRegAddrControlIn,regFileIsInIn};
    jmpOp <= jmpOpIn;

end
    

endmodule
`endif
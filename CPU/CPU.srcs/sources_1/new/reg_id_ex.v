`include "config.vh"
module reg_id_ex(
    input clk,
    input[`SIZE] rsIn,
    input[`SIZE] rtIn,
    //input[`SIZE] pcIn,
    input[`SIZE] instIn,

    input  regFileIsInIn,
    
    output reg[`SIZE] rs,    
    output reg[`SIZE] rt,
    //output reg[`SIZE] pc,
    output reg[`SIZE] inst,

    output reg regFileIsIn
);

reg[`regAddrSize] rdAddr;

always @(posedge clk ) begin
    
end

always @(negedge clk ) begin
    rs <= rsIn;
    rt <= rtIn;
    inst <= instIn;

    regFileIsIn <= regFileIsInIn;
    //pc <= pcIn;
end
    
endmodule

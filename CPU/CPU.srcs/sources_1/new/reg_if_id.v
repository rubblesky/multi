`ifndef REG_IF_ID_V
`define REG_IF_ID_V
`include "config.vh"
module reg_if_id(
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] pcIn,

    input isPauseIn,

    output reg[`SIZE] inst,
    output reg[`SIZE] pc,

    output reg isPause
);
always @(negedge clk ) begin
    inst <= instIn;
    pc <= pcIn;
    isPause <= isPauseIn;
end
    
endmodule

`endif
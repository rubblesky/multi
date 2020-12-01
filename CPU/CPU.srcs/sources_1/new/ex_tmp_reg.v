`ifndef EX_TMP_REG
`define EX_TMP_REG

`include "config.vh"
module ex_tmp_reg (
    input clk,
    input[`SIZE] instIn,

    input  regFileIsInIn,

    output reg[`SIZE] inst,

    output reg regFileIsIn
);

    always @(posedge clk) begin
        inst <= instIn;
        regFileIsIn <= regFileIsInIn;
    end
    
endmodule
`endif
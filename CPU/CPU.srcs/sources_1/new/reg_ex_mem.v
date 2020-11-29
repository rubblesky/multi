
`include "config.vh"

module reg_ex_mem (
    input clk,
    input[`SIZE] instIn,
    input[`SIZE] calculationIn, //ALU计算结果

    input  regFileIsInIn,

    output reg[`SIZE]inst,
    output reg[`SIZE]calculation,

    output reg regFileIsIn
);

always @(negedge clk ) begin
    inst <= instIn;
    calculation <= calculationIn;
    regFileIsIn <= regFileIsInIn;
end

    
endmodule
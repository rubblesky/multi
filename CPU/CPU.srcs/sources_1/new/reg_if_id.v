`include "config.vh"
module reg_if_id(
    input clk,
    input[`SIZE] instIn,
    //input[`SIZE] pcIn,
    output reg[`SIZE] inst,
    output reg[`SIZE] pc
);
always @(negedge clk ) begin
    inst <= instIn;
    //pc <= pcIn;
end
    
endmodule

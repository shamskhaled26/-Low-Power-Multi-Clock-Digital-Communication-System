module SHIFT_unit#(parameter operand_A_len=16,parameter operand_B_len=16, parameter SHIFT_out_len=16)(A,B,ALU_FUN,clk,RST,SHIFT_out,SHIFT_flag,shift_enable);
    
    input wire [3:0]ALU_FUN;
    input wire  [operand_A_len-1:0]A;
    input wire  [operand_B_len-1:0]B;
    input wire clk;
    input wire RST;
    input wire shift_enable;

    output reg  [SHIFT_out_len-1:0] SHIFT_out;
    output reg SHIFT_flag;

always @(posedge clk or negedge RST) begin
    if(!RST)begin
        SHIFT_flag<=1'b0;
        SHIFT_out <= 0;
    end
    else if(shift_enable)begin
        SHIFT_flag=1'b1;
        case (ALU_FUN)
                4'b1100:SHIFT_out <= A>>1;
                4'b1101:SHIFT_out <= A<<1;
                4'b1110:SHIFT_out <= B>>1;
                4'b1111:SHIFT_out <= B<<1;
        endcase
    end
    else begin
        SHIFT_flag<=1'b0;
        SHIFT_out <= 0;
    end
end
endmodule
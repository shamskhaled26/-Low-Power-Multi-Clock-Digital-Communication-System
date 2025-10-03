module logic_unit#(parameter operand_A_len=16,parameter operand_B_len=16, parameter logic_out_len=16)(A,B,ALU_FUN,clk,RST,Logic_out,Logic_flag,logic_enable);
    input wire [3:0]ALU_FUN;
    input wire  [operand_A_len-1:0]A;
    input wire  [operand_B_len-1:0]B;
    input wire clk;
    input wire RST;
    input wire logic_enable;
    output reg  [logic_out_len-1:0] Logic_out;
    output reg Logic_flag;
always @(posedge clk or negedge RST) begin
    if(!RST)begin
        Logic_flag<=1'b0;
        Logic_out<=0;
    end
    else if(logic_enable)begin
        Logic_flag<=1'b1;
        case (ALU_FUN)
                4'b0100:Logic_out <= A & B;
                4'b0101:Logic_out <= A | B;
                4'b0110:Logic_out <= ~(A & B);
                4'b0111:Logic_out <= ~(A | B);
                4'b1000:Logic_out <= A ^ B;
                4'b1001:Logic_out <= ~(A ^ B);
        endcase
    end
    else begin 
        Logic_flag<=1'b0;
        Logic_out<=0;
    end
end
endmodule
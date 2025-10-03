module cmp_unit#(parameter operand_A_len=16,parameter operand_B_len=16, parameter CMP_out_len=16)(A,B,ALU_FUN,clk,RST,CMP_out,CMP_flag,CMP_enable);
    input wire [3:0]ALU_FUN;
    input wire  [operand_A_len-1:0]A;
    input wire  [operand_B_len-1:0]B;
    input wire clk;
    input wire RST;
    input wire CMP_enable;
    output reg   [CMP_out_len-1:0] CMP_out;
    output reg CMP_flag;
always @(posedge clk or negedge RST) begin
    if(!RST)begin
        CMP_flag <=1'b0;
        CMP_out <=0;
    end
    else if(CMP_enable)begin
        CMP_flag=1'b1;
        case (ALU_FUN)
                4'b1000:CMP_out<=0;//no operation
                4'b1001:begin
                    if (A==B)
                        CMP_out <=16'h1;
                    else CMP_out <= 16'h0;
                end
                4'b1010:begin
                    if (A>B)
                        CMP_out <=16'h2;
                    else CMP_out <= 16'h0;
                end
                4'b1011:begin
                    if (A<B)
                        CMP_out <=16'h3;
                    else CMP_out <= 16'h0;
                end
        endcase
    end
    else begin
        CMP_flag <=1'b0;
        CMP_out <=0;
    end
end

endmodule
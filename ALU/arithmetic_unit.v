module arithmetic_unit#(parameter operand_A_len=16,parameter operand_B_len=16, parameter Arith_out_len=16) (A,B,ALU_FUN,clk,RST,Arith_out,Arith_flag,arith_enable);
    input wire [3:0]ALU_FUN;
    input wire signed[operand_A_len-1:0]A;
    input wire signed[operand_B_len-1:0]B;
    input wire clk;
    input wire RST;
    input wire arith_enable;
    output reg signed[Arith_out_len-1:0] Arith_out;
    output reg Arith_flag;

always @(posedge clk or negedge RST) begin
    if(!RST)begin
        Arith_flag<=1'b0;
        Arith_out<=0; 
    end
    else if (arith_enable) begin
        Arith_flag<=1'b1;
        case (ALU_FUN)
                4'b0000:Arith_out <= A + B;
                4'b0001:Arith_out <= A - B;
                4'b0010:Arith_out <= A * B;
                4'b0011:begin
                    if (B != 16'h0)
                    Arith_out <= (A / B);
                    else Arith_out <= 16'h0;
                end
        endcase
    end 
    else begin
        Arith_flag<=1'b0;
        Arith_out<=0; 
    end
end

endmodule
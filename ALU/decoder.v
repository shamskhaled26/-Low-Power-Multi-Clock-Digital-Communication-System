module decoder(
    input enable,
    input wire [3:0]ALU_FUN,
    output reg arith_enable,
    output reg logic_enable,
    output reg CMP_enable,
    output reg shift_enable,
    output reg OUT_VALID
);

    always @(*) begin
        if (enable) begin
            case (ALU_FUN[3:2])
            2'h0 : begin
                arith_enable =1'b1;
                logic_enable =1'b0;
                CMP_enable   =1'b0;
                shift_enable =1'b0;
                OUT_VALID = 1'b1;
                end 
            2'h1 : begin
                arith_enable =1'b0;
                logic_enable =1'b1;
                CMP_enable   =1'b0;
                shift_enable =1'b0;
                OUT_VALID = 1'b1;
                end
            2'h2 : begin
                arith_enable =1'b0;
                logic_enable =1'b0;
                CMP_enable   =1'b1;
                shift_enable =1'b0;
                OUT_VALID = 1'b1;
                end
            2'h3 : begin
                arith_enable =1'b0;
                logic_enable =1'b0;
                CMP_enable   =1'b0;
                shift_enable =1'b1;
                OUT_VALID = 1'b1;
                end
        
            endcase       
        end else begin
                arith_enable =1'b0;
                logic_enable =1'b0;
                CMP_enable   =1'b0;
                shift_enable =1'b0;
                OUT_VALID = 1'b0;
        end
    end
endmodule
module ALU_TOP#(
    parameter operand_A_len = 8,
    parameter operand_B_len = 8,
    parameter func_len = 4,
    parameter ALU_OUT_LEN = 8

)(
    input signed [operand_A_len-1:0]A,
    input signed [operand_B_len-1:0]B,
    input [func_len-1:0] ALU_FUN,
    input CLK,
    input RST,
    input enable,
    output signed[ALU_OUT_LEN-1:0]ALU_OUT,
    output OUT_VALID
);
    parameter Arith_out_len = 16;
    parameter logic_out_len = 16;
    parameter CMP_out_len = 16;
    parameter SHIFT_out_len = 16;
    wire Arith_flag;
    //wire signed[Arith_out_len-1:0]Arith_out;
    wire Logic_flag;
    //wire signed[logic_out_len-1:0]Logic_out;
    wire CMP_flag;
    //wire signed[CMP_out_len-1:0] CMP_out;
    wire SHIFT_flag;
    //wire signed[SHIFT_out_len-1:0]SHIFT_out;
    wire arith_enable,logic_enable,CMP_enable,shift_enable;


decoder decoder_mod(enable,ALU_FUN,arith_enable,logic_enable,CMP_enable,shift_enable,OUT_VALID);
arithmetic_unit #(.operand_A_len(operand_A_len),.operand_B_len(operand_B_len),.Arith_out_len(ALU_OUT_LEN)) arith_unit_dut(A,B,ALU_FUN,CLK,RST,ALU_OUT,Arith_flag,arith_enable);
logic_unit      #(.operand_A_len(operand_A_len),.operand_B_len(operand_B_len),.logic_out_len(ALU_OUT_LEN)) logic_unit_dut(A,B,ALU_FUN,CLK,RST,ALU_OUT,Logic_flag,logic_enable);
cmp_unit        #(.operand_A_len(operand_A_len),.operand_B_len(operand_B_len),.CMP_out_len(ALU_OUT_LEN))     cmp_unit_dut(A,B,ALU_FUN,CLK,RST,ALU_OUT,CMP_flag,CMP_enable);
SHIFT_unit      #(.operand_A_len(operand_A_len),.operand_B_len(operand_B_len),.SHIFT_out_len(ALU_OUT_LEN)) shift_unit_dut(A,B,ALU_FUN,CLK,RST,ALU_OUT,SHIFT_flag,shift_enable);

endmodule

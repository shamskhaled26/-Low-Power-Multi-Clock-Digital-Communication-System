`timescale 1ns/1ps
module int_clk_div_tb();
    reg i_ref_clk;
    reg i_rst_n;
    reg i_clk_en;
    reg [7:0] i_div_ratio;
    wire o_div_clk;

int_clk_div DUT(
    .i_ref_clk (i_ref_clk),
    .i_rst_n   (i_rst_n),
    .i_clk_en  (i_clk_en),
    .i_div_ratio(i_div_ratio),
    .o_div_clk (o_div_clk)
);


always #5 i_ref_clk =~i_ref_clk;

initial begin
    $dumpfile("clk_div_DUMP.vcd") ;       
    $dumpvars; 
    initialize_ports();
    reset();
    randomize_inputs(0,2);

    randomize_inputs(1,2);
    randomize_inputs(1,4);
    randomize_inputs(1,6);
    
    randomize_inputs(0,4);
    randomize_inputs(1,3);
    randomize_inputs(1,5);
    randomize_inputs(1,7);
    randomize_inputs(1,1);

$stop;
end

task initialize_ports();
begin
    i_ref_clk =0;
    i_rst_n =0;
    i_clk_en =0;
    i_div_ratio =1;
    @(negedge i_ref_clk);
end
endtask

task reset();
begin
    i_rst_n =0;
    @(negedge i_ref_clk);
    i_rst_n =1;
    @(negedge i_ref_clk);
end
endtask

task randomize_inputs(input clk_en, input [7:0] div_ratio);
begin
    i_clk_en    = clk_en;
    i_div_ratio = div_ratio;
    repeat(20)@(negedge i_ref_clk);
end
endtask

endmodule
`timescale 1ns/1ps

module RST_SYNC_tb();

// Parameters
parameter num_stages = 2;   // change this to test different pipeline lengths
parameter CLK_PERIOD = 10;  // 100 MHz clock

// DUT inputs/outputs
reg clk;
reg rst;
wire sync_rst;

// DUT instantiation
RST_SYNC #(.num_stages(num_stages)) dut (
    .rst(rst),
    .clk(clk),
    .sync_rst(sync_rst)
);

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;


initial begin
    $dumpfile("rst_sync_tb.vcd");
    $dumpvars;
    initialize;
    reset;
    #(CLK_PERIOD*num_stages);
    #(CLK_PERIOD*num_stages);
    
    reset;
    #(CLK_PERIOD*num_stages);

    $stop;
end

//***********tasks***********//

    task initialize;
        begin
            clk='b0;
            rst='b1;
            #(CLK_PERIOD);
        end
    endtask  

    task reset;
        begin
            rst='b0;
            #(CLK_PERIOD);
            rst='b1;
        end
    endtask
endmodule

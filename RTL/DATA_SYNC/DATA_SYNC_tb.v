`timescale 1ns/1ps

module DATA_SYNC_tb();

// Parameters
parameter NUM_STAGES = 2;
parameter data_width = 8;
parameter CLK_PERIOD = 10; // 100 MHz clock

// DUT signals
reg clk;
reg rst;
reg bus_enable;
reg [data_width-1:0] unsync_bus;
wire enable_pulse;
wire [data_width-1:0] sync_bus;

// Instantiate DUT
DATA_SYNC #(.num_stages(NUM_STAGES), .data_width(data_width)) dut (
    .rst(rst),
    .clk(clk),
    .bus_enable(bus_enable),
    .unsync_bus(unsync_bus),
    .enable_pulse(enable_pulse),
    .sync_bus(sync_bus)
);

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;


initial begin
    $dumpfile("rst_sync_tb.vcd");
    $dumpvars;
    initialize;
    reset;
    #(CLK_PERIOD)
    send(1,8'hA5);
    bus_enable =0;
    send(1,8'h11);
    send(1,8'h56);
    send(0,8'h05);
    send(1,8'hff);


    #(10*CLK_PERIOD);

    $stop;
end
//***********tasks***********//
task send(input enable ,input [data_width-1:0]data);
    begin
        bus_enable = enable;
        unsync_bus =data;
        #(NUM_STAGES*CLK_PERIOD);
        //bus_enable =0;
        #(CLK_PERIOD);
    end
endtask 

task initialize;
    begin
        clk='b0;
        rst='b1;
        bus_enable = 0;
        unsync_bus = 8'h00;
        #(NUM_STAGES*CLK_PERIOD);
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

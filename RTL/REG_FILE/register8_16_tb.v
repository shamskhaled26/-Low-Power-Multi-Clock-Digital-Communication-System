`timescale 1us/1ns
module register8_16_tb();
    parameter WIDTH = 3;
    parameter MEM_DEPTH = 8;
    parameter MEM_WIDTH = 16;

    reg clk;    // Clock
	reg Wren_tb; // Clock Enable
	reg Rden_tb; // Clock Enable
	reg RST;  // Asynchronous reset active low
	reg [WIDTH-1:0] WrData_tb;
	reg [WIDTH-1:0] Address_tb;
    reg [WIDTH-1:0]RdData_tb;
    reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];        
wire [WIDTH-1:0]RdData;
register8_16 DUT(clk,Wren_tb,Rden_tb,RST,WrData_tb,Address_tb,RdData);

always #5 clk=~clk;

initial begin
    clk = 0;    RST=1;
    Wren_tb=0;  Rden_tb=0;
    WrData_tb=0;RdData_tb=0;
    Address_tb=0;
    @(negedge clk);
    RST=0;
    @(negedge clk);
    RST=1;

    Address_tb =$urandom_range(0,7);
    WrData_tb =$random;
    // check write data
    @(negedge clk);
    Wren_tb =1;
    Rden_tb=0;
    memory[Address_tb]= WrData_tb;
    // check read data
    @(negedge clk);    
    Rden_tb =1;
    Wren_tb =0;
    RdData_tb = memory[Address_tb];
    @(negedge clk);
    if(RdData!= RdData_tb)$display("error");

    // check write data
    WrData_tb =$random;
    @(negedge clk);
    Rden_tb =0;
    Wren_tb =1;
    memory[Address_tb]= WrData_tb;

    // check read data
    @(negedge clk);    
    Rden_tb =1;
    Wren_tb =0;
    RdData_tb = memory[Address_tb];
    @(negedge clk);
    if(RdData!= RdData_tb)$display("error");
    Address_tb ='h4;
    WrData_tb ='h7;
    // check write data
    @(negedge clk);
    Wren_tb =1;
    Rden_tb=0;
    memory[Address_tb]= WrData_tb;
    // check read data
    @(negedge clk);    
    Rden_tb =1;
    Wren_tb =0;
    RdData_tb = memory[Address_tb];
    @(negedge clk);
    if(RdData!= RdData_tb)$display("error");
    RST=0;

    @(negedge clk);
    $stop;
end

endmodule
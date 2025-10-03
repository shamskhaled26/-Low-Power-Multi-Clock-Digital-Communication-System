module system_top#(
    parameter operand_A_len = 8,
    parameter operand_B_len = 8,
    parameter func_len = 4,
    parameter ALU_OUT_LEN = 16,
    parameter data_width = 8,
    parameter addr_size =$clog2(data_width),
    parameter addr_width = 4
)(
    input REF_CLK,
    input RST,
    input UART_CLK,
    input RX_IN,
    output TX_OUT,
    output Parity_Error,Stop_Error
);

//////////////////// Internal Wires ////////////////////
wire TX_CLK,RX_CLK;
wire [operand_A_len-1:0]A;
wire [operand_B_len-1:0]B;
wire [func_len-1:0] ALU_FUN;
wire [ALU_OUT_LEN-1:0]ALU_OUT;

wire [7:0] div_ratio_rx;

//////////////////// ASYNC FIFO ////////////////////

wire /*wclk,wrst_n,winc,rclk,rrst_n,rinc,*/wfull,rempty;
wire [data_width-1:0] WrData,RdData,fifo_RdData;

//////////////////// register8_16 ////////////////////

wire WrEn,RdEn,RdData_Valid,OUT_VALID;
wire [data_width-1:0] UART_CONFIG;//,REG0,REG1,REG2,REG3;
wire [addr_width-1:0] Address;

////////////////////  DATA SYNC ////////////////////
wire [data_width-1:0] unsync_bus,sync_bus,RX_OUT;

////////////////////  pulse gen ////////////////////

//////////////////// rst sync ////////////////////

wire sync_rst;
//////////////////// clk gating ////////////////////
wire CLK_EN,GATED_CLK;

//////////////////// int_clk_div ////////////////////   
wire [7:0] i_div_ratio;

//////////////////// SYS_CTRL ////////////////////
wire [data_width-1:0] TX_P_DATA,RX_P_DATA;

//**************** instantiation of blocks ******************//


//////////////////// ASYNC FIFO ////////////////////

ASYNC_FIFO#(
    .data_width(data_width),
    .addr_size(addr_size)
)ASYNC_FIFO_inst(
   .wclk(REF_CLK),
   .wrst_n(sync_rst),
   .winc(TX_D_VLD),
   .WrData(TX_P_DATA),
   .rclk(TX_CLK),
   .rrst_n(SYNC_RST_UART),
   .rinc(rinc),  
   .wfull(wfull),
   .rempty(rempty),
   .RdData(fifo_RdData)
);
////////////////////  DATA SYNC ////////////////////

DATA_SYNC#(
    .num_stages(2),
    .data_width(data_width)
) DATA_SYNC_inst (
    .rst       (sync_rst),
    .clk       (REF_CLK),
    .bus_enable(DATA_VALID),
    .unsync_bus(RX_OUT),
    .enable_pulse(RX_D_VLD),
    .sync_bus(RX_P_DATA)
);

////////////////////  pulse gen ////////////////////

PULSE_GEN PULSE_GEN (
    .CLK(TX_CLK),  
    .RST(SYNC_RST_UART), // Active low reset
    .LVL_SIG  (BUSY), // Level signal
    .PULSE_SIG(rinc) // Pulse signal  
);
//////////////////// rst sync ////////////////////

RST_SYNC #(.num_stages(2))RST_SYNC_ref(
    .RST(RST),
    .CLK(REF_CLK),
    .sync_rst(sync_rst)
);

RST_SYNC #(.num_stages(2)) RST_SYNC_uart(
    .RST(RST),
    .CLK(UART_CLK),
    .sync_rst(SYNC_RST_UART)  
);
//////////////////// clk gating ////////////////////

CLK_GATE CLK_GATE(
    .CLK_EN(CLK_EN),
    .CLK(REF_CLK),/////////
    .GATED_CLK(GATED_CLK)
);
//////////////////// int_clk_div ////////////////////   

int_clk_div int_clk_div_tx (
    .i_ref_clk (UART_CLK),
    .i_rst_n   (SYNC_RST_UART),
    .i_clk_en  (i_clk_en),
    .i_div_ratio(i_div_ratio),
    .o_div_clk (TX_CLK)
);
int_clk_div int_clk_div_rx (
    .i_ref_clk (UART_CLK),
    .i_rst_n   (SYNC_RST_UART),
    .i_clk_en  (i_clk_en),
    .i_div_ratio(div_ratio_rx),
    .o_div_clk (RX_CLK)
);
//////////////////// CLK_MUX ////////////////////
CLK_MUX CLK_MUX (
   .Prescale(UART_CONFIG[7:2]),
   .div_ratio_rx(div_ratio_rx)
);
////////////////// alu_top ////////////////////
ALU #(.OPER_WIDTH (8), .OUT_WIDTH (8*2)
)ALU_INST(
  .A(A),
  .B(B),
  .EN(ALU_EN),
    .ALU_FUN(ALU_FUN),
    .CLK(GATED_CLK),
    .RST(sync_rst), 
    .ALU_OUT(ALU_OUT),
    .OUT_VALID(OUT_VALID)
);

// ALU_TOP #(
//     .operand_A_len(operand_A_len),
//     .operand_B_len(operand_B_len),
//     .func_len(func_len),
//     .ALU_OUT_LEN(ALU_OUT_LEN)
// )ALU_TOP_INST (
//     .A(A),
//     .B(B),
//     .ALU_FUN(ALU_FUN),
//     .CLK(GATED_CLK),
//     .RST(sync_rst),
//     .enable(ALU_EN),
//     .ALU_OUT(ALU_OUT),
//     .OUT_VALID(OUT_VALID)
// );

//////////////////// register8_16 ////////////////////


register8_16 #(   
	.addr_width(addr_width),
    .MEM_DEPTH (16),
    .data_width(data_width),
    .MEM_WIDTH (8)
)register8_16_inst(
	.CLK(REF_CLK),    // Clock
	.RST(sync_rst),  // Asynchronous reset active low
    .WrEn(WrEn),
    .RdEn(RdEn),
	.WrData(WrData),
	.Address(Address),
	.RdData(RdData),
	.RdData_Valid(RdData_Valid),
	.REG0(A),
	.REG1(B),
	.REG2(UART_CONFIG),
	.REG3(i_div_ratio)
);


//////////////////// SYS_CTRL ////////////////////

SYS_CTRL #(
    .width     (16),
    .addr_width(addr_width),
    .data_width(data_width)
)SYS_CTRL(
    .CLK(REF_CLK),
    .RST(sync_rst),
    .ALU_OUT(ALU_OUT),
    .OUT_VALID(OUT_VALID),
    .RdData(RdData),
	.RdData_Valid(RdData_Valid), 
    .RX_P_DATA(RX_P_DATA), // Parallel RX data
    .RX_D_VLD(RX_D_VLD),  // RX data valid
    .wfull(wfull),
// Outputs
    .ALU_FUN(ALU_FUN),        // ALU function select
    .ALU_EN(ALU_EN),         // ALU enable
    .CLK_EN(CLK_EN),     // ALU clock gate enable
    .Address(Address), // Address bus (clock gating / RegFile?)
    .WrEn(WrEn),     // Write enable
    .RdEn(RdEn),     // Read enable
    .WrData(WrData),   // Write data bus
    .TX_P_DATA(TX_P_DATA), // Parallel TX data
    .TX_D_VLD(TX_D_VLD),  // TX data valid
    .clk_div_en(i_clk_en)        // Clock divider enable
);

//////////////////// UART_TOP ////////////////////
UART_TOP #(.DATA_WIDTH(8)
)UART_TOP_inst(
    .UART_CONFIG (UART_CONFIG),
    .TX_CLK      (TX_CLK),
    .RX_CLK      (RX_CLK),
    .RST         (SYNC_RST_UART),
    .RX_IN       (RX_IN),
    .RX_OUT      (RX_OUT),
    .RX_D_VLD(DATA_VALID),
    .TX_D_VLD(!rempty),
    .TX_IN_P     (fifo_RdData),
    .TX_OUT      (TX_OUT),
    .BUSY        (BUSY),
    .Parity_Error(Parity_Error),
    .Stop_Error  (Stop_Error)
);


endmodule
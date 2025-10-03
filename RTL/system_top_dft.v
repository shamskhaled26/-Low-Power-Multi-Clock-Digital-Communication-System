module system_top_dft #(

    parameter operand_A_len = 8,

    parameter operand_B_len = 8,

    parameter func_len = 4,

    parameter ALU_OUT_LEN = 16,

    parameter data_width = 8,

    parameter addr_size =$clog2(data_width),

    parameter addr_width = 4,
parameter NUM_OF_CHAINS = 3

)(

    input REF_CLK,

    input RST,

    input UART_CLK,

    input RX_IN,

    output TX_OUT,

    output Parity_Error,Stop_Error,
input scan_clk,
input scan_rst,
input test_mode,
input SE,
input [NUM_OF_CHAINS-1:0]  SI,
output [NUM_OF_CHAINS-1:0]  SO

);


wire scan_fun_clk_ref;
wire scan_fun_clk_uart;
wire scan_fun_clk_TX;
wire scan_fun_clk_RX;
wire scan_fun_rst;

wire scan_ref_rst;
wire scan_uart_rst;
wire SYNC_RST_UART;

wire TX_D_VLD;
wire RX_D_VLD;
wire rinc;
wire BUSY;
wire ALU_EN;
wire i_clk_en;


mux2X1 mux_refclk (REF_CLK,scan_clk,test_mode,scan_fun_clk_ref);
mux2X1 mux_uartclk (UART_CLK,scan_clk,test_mode,scan_fun_clk_uart);
mux2X1 mux_clk_tx (TX_CLK,scan_clk,test_mode,scan_fun_clk_TX);
mux2X1 mux_clk_rx (RX_CLK,scan_clk,test_mode,scan_fun_clk_RX);

mux2X1 mux_syncrst (RST,scan_rst,test_mode,scan_fun_rst);
mux2X1 mux_syncrst_ref (sync_rst,scan_rst,test_mode,scan_ref_rst);
mux2X1 mux_syncrst_uart (SYNC_RST_UART,scan_rst,test_mode,scan_uart_rst);


//////////////////// Internal Wires ////////////////////

//wire TX_CLK,RX_CLK;

wire [operand_A_len-1:0]A;

wire [operand_B_len-1:0]B;

wire [func_len-1:0] ALU_FUN;

wire [ALU_OUT_LEN-1:0]ALU_OUT;



wire [7:0] div_ratio_rx;



//////////////////// ASYNC FIFO ////////////////////



wire /*wclk,wrst_n,winc,rclk,rrst_n,rinc,*/wfull,rempty;

wire [data_width-1:0] WrData,RdData,fifo_RdData;



//////////////////// register8_16 ////////////////////



wire WrEn,RdEn,RdData_Valid,OUT_VALID,DATA_VALID;

wire [data_width-1:0] UART_CONFIG;//,REG0,REG1,REG2,REG3;

wire [addr_width-1:0] Address;



////////////////////  DATA SYNC ////////////////////

wire [data_width-1:0] unsync_bus,sync_bus,RX_OUT;



////////////////////  pulse gen ////////////////////



//////////////////// rst sync ////////////////////



//wire sync_rst;

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

   .wclk(scan_fun_clk_ref),

   .wrst_n(scan_ref_rst),

   .winc(TX_D_VLD),

   .WrData(TX_P_DATA),

   .rclk(scan_fun_clk_TX),

   .rrst_n(scan_uart_rst),

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

    .rst       (scan_ref_rst),

    .clk       (scan_fun_clk_ref),

    .bus_enable(DATA_VALID),

    .unsync_bus(RX_OUT),

    .enable_pulse(RX_D_VLD),

    .sync_bus(RX_P_DATA)

);



////////////////////  pulse gen ////////////////////



PULSE_GEN PULSE_GEN (

    .CLK(scan_fun_clk_TX),  

    .RST(scan_uart_rst), // Active low reset

    .LVL_SIG  (BUSY), // Level signal

    .PULSE_SIG(rinc) // Pulse signal  

);

//////////////////// rst sync ////////////////////



RST_SYNC #(.num_stages(2))RST_SYNC_ref(

    .RST(scan_fun_rst),

    .CLK(scan_fun_clk_ref),

    .sync_rst(sync_rst)

);



RST_SYNC #(.num_stages(2)) RST_SYNC_uart(

    .RST(scan_fun_rst),

    .CLK(scan_fun_clk_uart),

    .sync_rst(SYNC_RST_UART)  

);

//////////////////// clk gating ////////////////////



CLK_GATE CLK_GATE(

    .CLK_EN(CLK_EN |  test_mode),

    .CLK(scan_fun_clk_ref),/////////

    .GATED_CLK(GATED_CLK)

);

//////////////////// int_clk_div ////////////////////   



int_clk_div int_clk_div_tx (

    .i_ref_clk (scan_fun_clk_uart),

    .i_rst_n   (scan_uart_rst),

    .i_clk_en  (i_clk_en),

    .i_div_ratio(i_div_ratio),

    .o_div_clk (TX_CLK)

);

int_clk_div int_clk_div_rx (

    .i_ref_clk (scan_fun_clk_uart),

    .i_rst_n   (scan_uart_rst),

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

    .RST(scan_ref_rst), 

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

	.CLK(scan_fun_clk_ref),    // Clock

	.RST(scan_ref_rst),  // Asynchronous reset active low

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

    .CLK(scan_fun_clk_ref),

    .RST(scan_ref_rst),

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

    .TX_CLK      (scan_fun_clk_TX),

    .RX_CLK      (scan_fun_clk_RX),

    .RST         (scan_uart_rst),

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
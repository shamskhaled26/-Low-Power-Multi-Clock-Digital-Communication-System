module UART_TOP#(parameter DATA_WIDTH=8)(
    input  [7:0] UART_CONFIG,
    input  TX_CLK, RX_CLK,
    input  RST,
    input  RX_IN,
    output  RX_D_VLD,
    input TX_D_VLD,
    input  [DATA_WIDTH-1:0] TX_IN_P,
    output  TX_OUT,
    output  BUSY,
    output  [DATA_WIDTH-1:0] RX_OUT,
    output  Parity_Error,Stop_Error
);  
UART_TX #(.DATA_WIDTH(DATA_WIDTH))UART_TX_inst(
    .CLK(TX_CLK),        // UART TX clock
    .RST(RST),        // Asynchronous active low reset
    .P_DATA(TX_IN_P),   // Input data byte
    .DATA_VALID(TX_D_VLD), // Input data valid signal
    .PAR_EN(UART_CONFIG[0]),       //Parity_Enable
    .PAR_TYP(UART_CONFIG[1]),      //Parity Type
    .TX_OUT(TX_OUT),     // Serial data output
    .BUSY(BUSY)       // High during transmission
);
UART_RX UART_RX_inst(
    .CLK(RX_CLK),          //UART RX Clock Signal
    .RST(RST),          //Asynchronized reset signal
    .RX_IN(RX_IN),        //Serial Data IN
    .Prescale(UART_CONFIG[7:2]),//Oversampling Prescale
    .PAR_EN(UART_CONFIG[0]),       //Parity_Enable
    .PAR_TYP(UART_CONFIG[1]),      //Parity Type
    .P_DATA(RX_OUT),
    .DATA_VALID(RX_D_VLD),  // Data Byte Valid signal
    .Parity_Error(Parity_Error), // 1 Frame Parity Error
    .Stop_Error(Stop_Error)   // Frame Stop Error
);


endmodule
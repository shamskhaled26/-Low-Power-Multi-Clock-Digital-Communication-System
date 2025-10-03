
module UART_TX  # (parameter DATA_WIDTH = 8)
(
 input   wire                         CLK,
 input   wire                         RST,
 input   wire    [DATA_WIDTH-1:0]     P_DATA,
 input   wire                         DATA_VALID,
 input   wire                         PAR_EN,
 input   wire                         PAR_TYP, 
 output  wire                         TX_OUT,
 output  wire                         BUSY

 );

wire          seriz_en    , 
              seriz_done  ,
		 	  ser_data    ,
		 	  parity      ;
			
wire  [1:0]   mux_sel ;
 
uart_tx_fsm  U0_fsm (
.CLK(CLK),
.RST(RST),
.DATA_VALID(DATA_VALID), 
.PAR_EN(PAR_EN),
.ser_done(seriz_done), 
.Ser_enable(seriz_en),
.mux_sel(mux_sel), 
.BUSY(BUSY)
);

Serializer # (.WIDTH(DATA_WIDTH)) U0_Serializer (
.CLK(CLK),
.RST(RST),
.DATA(P_DATA),
.BUSY(BUSY),
.Enable(seriz_en), 
.DATA_VALID(DATA_VALID), 
.ser_out(ser_data),
.ser_done(seriz_done)
);

mux U0_mux (
.CLK(CLK),
.RST(RST),
.IN_0(1'b0),
.IN_1(ser_data),
.IN_2(parity),
.IN_3(1'b1),
.SEL(mux_sel),
.OUT(TX_OUT) 
);

parity_calc # (.WIDTH(DATA_WIDTH)) U0_parity_calc (
.CLK(CLK),
.RST(RST),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP),
.DATA(P_DATA),
.BUSY(BUSY),
.DATA_VALID(DATA_VALID), 
.parity(parity)
); 



endmodule
 
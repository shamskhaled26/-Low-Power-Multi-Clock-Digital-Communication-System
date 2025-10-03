
module UART_RX # (parameter DATA_WIDTH = 8)

(
 input   wire                          CLK,
 input   wire                          RST,
 input   wire                          RX_IN,
 input   wire                          PAR_EN,
 input   wire                          PAR_TYP,
 input   wire   [5:0]                  Prescale, 
 output  wire   [DATA_WIDTH-1:0]       P_DATA, 
 output  wire                          DATA_VALID,
 output  wire                          Parity_Error,
 output  wire                          Stop_Error
);


wire   [3:0]           bit_count ;
wire   [5:0]           edge_count ;

wire                   edge_bit_en; 
wire                   deser_en; 
wire                   par_chk_en; 
wire                   stp_chk_en; 
wire                   strt_chk_en; 
wire                   strt_glitch;
wire                   sampled_bit;
wire                   dat_samp_en;

 
uart_rx_fsm # ( .DATA_WIDTH(8)) U0_uart_fsm (
.CLK(CLK),
.RST(RST),
.S_DATA(RX_IN),
.Prescale(Prescale),
.bit_count(bit_count),
.PAR_EN(PAR_EN),
.edge_count(edge_count), 
.strt_glitch(strt_glitch),
.Parity_Error(Parity_Error),
.Stop_Error(Stop_Error), 
.strt_chk_en(strt_chk_en),
.edge_bit_en(edge_bit_en), 
.deser_en(deser_en), 
.par_chk_en(par_chk_en), 
.stp_chk_en(stp_chk_en),
.dat_samp_en(dat_samp_en),
.DATA_VALID(DATA_VALID)
);
 
 
edge_bit_counter U0_edge_bit_counter (
.CLK(CLK),
.RST(RST),
.Prescale(Prescale),
.Enable(edge_bit_en),
.bit_count(bit_count),
.edge_count(edge_count) 
); 

data_sampling U0_data_sampling (
.CLK(CLK),
.RST(RST),
.S_DATA(RX_IN),
.Prescale(Prescale),
.Enable(dat_samp_en),
.edge_count(edge_count),
.sampled_bit(sampled_bit)
);

deserializer # ( .DATA_WIDTH(8)) U0_deserializer (
.CLK(CLK),
.RST(RST),
.Prescale(Prescale),
.sampled_bit(sampled_bit),
.Enable(deser_en),
.edge_count(edge_count), 
.P_DATA(P_DATA)
);

strt_chk U0_strt_chk (
.CLK(CLK),
.RST(RST),
.sampled_bit(sampled_bit),
.Enable(strt_chk_en), 
.strt_glitch(strt_glitch)
);

par_chk # ( .DATA_WIDTH(8)) U0_par_chk (
.CLK(CLK),
.RST(RST),
.PAR_TYP(PAR_TYP),
.sampled_bit(sampled_bit),
.Enable(par_chk_en), 
.P_DATA(P_DATA),
.Parity_Error(Parity_Error)
);

stp_chk U0_stp_chk (
.CLK(CLK),
.RST(RST),
.sampled_bit(sampled_bit),
.Enable(stp_chk_en), 
.Stop_Error(Stop_Error)
);


endmodule
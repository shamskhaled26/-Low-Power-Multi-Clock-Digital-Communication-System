module ASYNC_FIFO#(parameter data_width = 8,parameter addr_size =$clog2(data_width))(
   input wclk,
   input wrst_n,
   input winc,
   input rclk,
   input rrst_n,
   input rinc,
   input [data_width-1:0] WrData,
   output wfull,
   output rempty,
   output [data_width-1:0] RdData
);

wire [addr_size:0]w_gray_encoding,r_gray_encoding,wq2_rptr,rq2_wptr;
wire [addr_size-1:0]raddr,waddr;


fifo_rd  #(
	 .fifo_width(data_width),
	 .addr_size(addr_size)) sync_w2r(
    rclk,
    rrst_n,
    rinc,
    rq2_wptr,
    raddr,
    rempty,
    r_gray_encoding
);
fifo_wr #(
	 .fifo_width(data_width),
	 .addr_size(addr_size)) sync_r2w(
    wclk,
    wrst_n,
    winc,
    wq2_rptr,
    waddr,
    wfull,
    w_gray_encoding,
    wclken
);
fifo_mem_ctrl  #(
	 .fifo_width(data_width),
	 .addr_size(addr_size)) fifo_mem_ctrl(
    wclk,
    wrst_n,
    WrData,
    wclken,
    raddr,
    waddr,
    RdData
);
DF_SYNC  #(
	 .fifo_width(data_width),
	 .addr_size(addr_size)) DF_SYNC_r(
    rclk,
    rrst_n,
    w_gray_encoding,
    rq2_wptr
);
DF_SYNC #(
	 .fifo_width(data_width),
	 .addr_size(addr_size)) DF_SYNC_w(
    wclk,
    wrst_n,
    r_gray_encoding,
    wq2_rptr
);
endmodule
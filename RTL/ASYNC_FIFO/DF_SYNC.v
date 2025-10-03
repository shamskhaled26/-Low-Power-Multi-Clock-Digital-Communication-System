module DF_SYNC#(
	parameter fifo_width = 8,
	parameter addr_size = $clog2(fifo_width)
)(
    input clk,
    input rst,
    input [addr_size:0]in1,
    output reg [addr_size:0] out2
);
reg [addr_size:0] out1;// sync_r2w,sync_w2r;
always @(posedge clk or negedge rst)begin
    if(!rst)begin
        out1 <= 0;
        out2 <= 0;
    end
    else begin
        out1 <= in1;
        out2 <= out1;
    end
end

// //sync_w2r
// always @(posedge rclk or negedge rrst_n)begin
//     if(!rrst_n)begin
//         sync_w2r <= 0;
//         rq2_wptr <= 0;
//     end
//     else begin
//         sync_w2r <= wr_pointer;
//         rq2_wptr <= sync_w2r;
//     end
// end
// //sync_r2w
// always @(posedge wclk or negedge wrst_n)begin
//     if(!wrst_n)begin
//         sync_r2w <= 0;
//         wq2_rptr <= 0;
//     end
//     else begin
//         sync_r2w <= rd_pointer;
//         wq2_rptr <= sync_r2w;
//     end
// end
endmodule
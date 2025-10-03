module RST_SYNC#(parameter num_stages = 3)(
    input RST,
    input CLK,
    output reg sync_rst
);
 
reg [num_stages-1:0] out;
integer i;
always @(posedge CLK or negedge RST) begin
    if(!RST)begin
        out <= {num_stages{1'b0}};
        sync_rst<=0;

    end
    else begin
        out[0] <= 1;
        for(i = 1;i < num_stages; i = i + 1)begin
            out[i] <= out[i-1];
        end          
        sync_rst <=out[num_stages-1];
    end
end


endmodule
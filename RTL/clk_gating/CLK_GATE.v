module CLK_GATE(
    input CLK_EN,
    input CLK,
    output GATED_CLK
);
    
reg     Latch_Out ;

//latch (Level Sensitive Device)
always @(CLK or CLK_EN)begin
    if(!CLK) begin
        Latch_Out <= CLK_EN ;
    end
end

assign  GATED_CLK = CLK && Latch_Out ;


endmodule
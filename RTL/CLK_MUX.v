module CLK_MUX (
    input wire [5:0] Prescale,
    output reg [7:0] div_ratio_rx
);
always @(*) begin
    case(Prescale)
        6'd32 : div_ratio_rx= 1 ;
        6'd16 : div_ratio_rx=2 ;
        6'd8  : div_ratio_rx= 4 ;
        default : div_ratio_rx= 1 ;
    endcase  
end
endmodule
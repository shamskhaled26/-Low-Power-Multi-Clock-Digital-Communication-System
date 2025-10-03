module PULSE_GEN (
    input   CLK,        // Clock signal
    input   RST,        // Active low reset
    input   LVL_SIG,    // Level signal
    output  PULSE_SIG   // Pulse signal
);
reg [1:0] out;


always @(posedge CLK or negedge RST) begin
    if(!RST)begin
        out<='b0;
    end 
    else begin
        out[0]<=LVL_SIG;
        out[1]<=out[0];
    end 
end

assign PULSE_SIG = (~out[1] && out[0]); 
endmodule 


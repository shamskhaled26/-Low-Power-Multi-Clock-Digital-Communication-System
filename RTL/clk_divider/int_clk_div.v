module int_clk_div(
    input i_ref_clk,
    input i_rst_n,
    input i_clk_en,
    input [7:0] i_div_ratio,
    output o_div_clk
);
wire clk_div_en;
wire odd;
wire [7:0] half_togg;
wire [7:0] half_togg_pl;
reg [7:0] counter;
reg flag;
reg div_clk_reg;
assign o_div_clk = (!i_rst_n)? 1'b0 :(i_clk_en && (i_div_ratio > 1)) ? div_clk_reg : i_ref_clk;
assign clk_div_en = i_clk_en && ( i_div_ratio != 0) && ( i_div_ratio != 1);
assign odd = i_div_ratio[0];
assign half_togg = i_div_ratio >> 1;
assign half_togg_pl = i_div_ratio - half_togg;

always @(posedge i_ref_clk or negedge i_rst_n) begin
    if (!i_rst_n)begin
        div_clk_reg <= 1'h0;
        counter <= 8'h0 ;
        flag <= 1'h0 ;
    end
    else if(clk_div_en)begin
        if (!odd && counter == half_togg-1)begin
            div_clk_reg <=! o_div_clk ;
            counter <= 'h0 ;
        end
        else if (odd && ((counter == half_togg-1 && flag) || (counter == half_togg_pl-1 && !flag)))begin
            div_clk_reg <= ! o_div_clk ;
            counter <= 'h0 ;
            flag <= !flag ;
        end
        else
            counter <= counter + 'h1 ;
    end
    else begin
        counter   <= 8'd0;
        flag      <= 1'b0;
    end
end
endmodule


module DATA_SYNC # ( 
     parameter num_stages = 2 ,
	 parameter data_width = 8 
)(
input    wire                      clk,
input    wire                      rst,
input    wire     [data_width-1:0]  unsync_bus,
input    wire                      bus_enable,
output   reg      [data_width-1:0]  sync_bus,
output   reg                       enable_pulse
);



//internal connections
reg   [num_stages-1:0]    sync_reg;
reg                       enable_flop ;
					 
wire                      pulse ;

wire  [data_width-1:0]     sync_bus_c ;
					 
//----------------- Multi flop synchronizer --------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    sync_reg <= 'b0 ;
   end
  else
   begin
    sync_reg <= {sync_reg[num_stages-2:0],bus_enable};
   end  
 end
 

//----------------- pulse generator --------------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    enable_flop <= 1'b0 ;	
   end
  else
   begin
    enable_flop <= sync_reg[num_stages-1] ;
   end  
 end

 
assign pulse = sync_reg[num_stages-1] && !enable_flop ;


//----------------- multiplexing --------------------

assign sync_bus_c =  pulse ? unsync_bus : sync_bus ;  


//----------- destination domain flop ---------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    sync_bus <= 'b0 ;	
   end
  else
   begin
    sync_bus <= sync_bus_c ;
   end  
 end
 
//--------------- delay generated pulse ------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    enable_pulse <= 1'b0 ;	
   end
  else
   begin
    enable_pulse <= pulse ;
   end  
 end
 

endmodule






// module DATA_SYNC#(parameter num_stages = 8,parameter data_width = 8)(
//     input rst,
//     input clk,
//     input bus_enable,
//     input [data_width-1:0] unsync_bus,
//     output reg enable_pulse,
//     output reg [data_width-1:0] sync_bus
// );

// integer i;
// reg [data_width-1:0] mux_out;
// reg [num_stages-1:0]out;
// wire mux_sel;
// reg  out_gen_f;

// assign mux_sel = (!out_gen_f) & out[num_stages-1] ;

// always @(posedge clk or negedge rst) begin
//     if(!rst)begin
//         for(i = 0;i < num_stages; i = i + 1)begin
//             out[i] <=0;
//         end
//         mux_out <=0;
//         out_gen_f <= 0;          //pulse gen
//         sync_bus <= 0;        //sync_bus
//         enable_pulse <= 0; 
//     end 

//     else begin
//         out[0] <= bus_enable;
//         for(i = 1;i <= num_stages; i = i + 1)begin
//             out[i] <= out[i-1];
//         end  
//         out_gen_f <= out[num_stages-1];          //pulse gen
//         sync_bus <= mux_out;        //sync_bus
//         enable_pulse <= mux_sel;    //enable pulse
//     end
// end

// always @(*)begin
//     case (mux_sel)
//         0 : mux_out = sync_bus;
//         1 : mux_out = unsync_bus;
//     endcase
// end

// endmodule
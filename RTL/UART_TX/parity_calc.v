module parity_calc # ( parameter WIDTH = 8 )

(
 input   wire                  CLK,
 input   wire                  RST,
 input   wire                  PAR_EN,
 input   wire                  PAR_TYP,
 input   wire                  BUSY, 
 input   wire   [WIDTH-1:0]    DATA,
 input   wire                  DATA_VALID,
 output  reg                   parity 
);

reg  [WIDTH-1:0]    DATA_V ;

//isolate input 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    DATA_V <= 'b0 ;
   end
  else if(DATA_VALID && !BUSY)
   begin
    DATA_V <= DATA ;
   end 
 end
 

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    parity <= 'b0 ;
   end
  else
   begin
    if (PAR_EN)
	 begin
	  case(PAR_TYP)
	  1'b0 : begin                 
	          parity <= ^DATA_V  ;     // Even Parity
	         end
	  1'b1 : begin
	          parity <= ~^DATA_V ;     // Odd Parity
	         end		
	  endcase       	 
	 end
   end
 end 


endmodule
 
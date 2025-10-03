
module par_chk # ( parameter DATA_WIDTH = 8 )

(
 input   wire                   CLK,
 input   wire                   RST,
 input   wire                   PAR_TYP, 
 input   wire                   sampled_bit,
 input   wire                   Enable,  
 input   wire  [DATA_WIDTH-1:0] P_DATA,
 output  reg                    Parity_Error
);


reg        parity ;

// parity calc
always @ (*)
  begin
    case(PAR_TYP)
    1'b0 : begin                 
	        parity <= ^P_DATA  ;     // Even Parity
	       end
    1'b1 : begin
	        parity <= ~^P_DATA ;     // Odd Parity
	       end		
    endcase       	 
 end 
 
           
// error check
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    Parity_Error <= 1'b0 ;
   end
  else if(Enable)
   begin
    Parity_Error <= parity ^	sampled_bit ;
   end	
 end
 

endmodule
 
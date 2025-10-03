
module stp_chk (
 input   wire                  CLK,
 input   wire                  RST,
 input   wire                  sampled_bit,
 input   wire                  Enable, 
 output  reg                   Stop_Error
);

 
              
// error check
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    Stop_Error <= 'b0 ;
   end
  else if(Enable)
   begin
    Stop_Error <= 1'b1 ^ sampled_bit ;
   end
 end
 

 
endmodule
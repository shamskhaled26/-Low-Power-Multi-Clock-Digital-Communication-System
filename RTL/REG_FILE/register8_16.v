module register8_16#(   
	parameter addr_width = 4,
    parameter MEM_DEPTH = 16,    
	parameter data_width = 8,
    parameter MEM_WIDTH = 8
) (
	input CLK,    // Clock
	input WrEn, // Clock Enable
	input RdEn, // Clock Enable
	input RST,  // Asynchronous reset active low
	input [data_width-1:0] WrData,
	input [addr_width-1:0] Address,
	output reg [data_width-1:0]RdData,
	output reg RdData_Valid,
	output  [data_width-1:0]REG0,
	output  [data_width-1:0]REG1,
	output  [data_width-1:0]REG2,
	output  [data_width-1:0]REG3
);
    reg [MEM_WIDTH-1:0] REG_FILE [MEM_DEPTH-1:0];        
integer i;
always @(posedge CLK or negedge RST) begin
	if(~RST) begin
		RdData <= 'h0;
		RdData_Valid <=0;
		for(i = 0;i < MEM_DEPTH; i = i + 1)begin
			if (i == 2) begin
            	REG_FILE[i] <='b1000_0001;
			end
			else if (i == 3) begin
            	REG_FILE[i] <='b0010_0000;
			end
			else
            	REG_FILE[i] <='b0;
        end
		// REG_FILE[0]<=0;
		// REG_FILE[1]<=0;
		// REG_FILE[2]<=0;
		// REG_FILE[3]<=0;
		// REG_FILE[4]<=0;
		// REG_FILE[5]<=0;
		// REG_FILE[6]<=0;
		// REG_FILE[7]<=0;
	end
	else if(WrEn && !RdEn)begin
		REG_FILE[Address] <= WrData;
		end
	else if(!WrEn && RdEn)begin
		RdData <= REG_FILE[Address];
		RdData_Valid <=1;
	end
	else 	
		RdData_Valid <=0;


		
end
assign 	REG0 = REG_FILE[0];
assign	REG1 = REG_FILE[1];
assign	REG2 = REG_FILE[2];
assign	REG3 = REG_FILE[3];

endmodule
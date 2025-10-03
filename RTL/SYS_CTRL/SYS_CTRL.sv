module SYS_CTRL #(
    parameter width = 16,
    parameter addr_width = 4,
    parameter data_width = 8
)(
    input CLK,
    input RST,
    input [width-1:0] ALU_OUT,
    input             OUT_VALID,
    input   [data_width-1:0] RdData,   // Read data bus
    input                    RdData_Valid, // Read data valid
    input   [data_width-1:0] RX_P_DATA, // Parallel RX data
    input                    RX_D_VLD,  // RX data valid
    input wfull,
// Outputs
    output  [addr_width-1:0] ALU_FUN,        // ALU function select
    output reg                  ALU_EN,         // ALU enable
    output reg                  CLK_EN,     // ALU clock gate enable
    output reg [addr_width-1:0] Address, // Address bus (clock gating / RegFile?)
    output reg                  WrEn,     // Write enable
    output reg                  RdEn,     // Read enable
    output reg [data_width-1:0] WrData,   // Write data bus
    output reg [data_width-1:0] TX_P_DATA, // Parallel TX data
    output reg                  TX_D_VLD,  // TX data valid
    output reg                  clk_div_en        // Clock divider enable
);
reg [width-1:0] alu_dn;
reg [addr_width-1:0] address_reg,ALU_FUN_reg;
reg address_flag,alu_flag,ALU_FUN_flag;

typedef enum bit [3:0] {
    IDLE,     
    WR_ADDR,
    WR_DATA,
    RD_ADDR,
    FIFO_WR,
    OPER_A,
    OPER_B,
    ALU_FUN_STATE,
    alu_out_state,
    fifo_1st,
    fifo_2nd} state_fsm;
            
state_fsm current_state,next_state;

// // State encoding
// localparam  [3:0] IDLE          = 4'h0,
//     WR_ADDR       = 4'h1,
//     WR_DATA       = 4'h2,
//     RD_ADDR       = 4'h3,
//     FIFO_WR       = 4'h4,
//     OPER_A        = 4'h5,
//     OPER_B        = 4'h6,
//     ALU_FUN_STATE = 4'h7,
//     alu_out_state = 4'h8,
//     fifo_1st      = 4'h9,
//     fifo_2nd      = 4'hA;


            

// reg [3:0] current_state,next_state;
 // Sequential: state update
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
     // Combinational:  next state
     always @(*) begin
        // Default values
       // next_state  = current_state;
            case (current_state)
                IDLE: 
                    if(RX_D_VLD)begin
                        if (RX_P_DATA==8'hAA)begin
                            next_state = WR_ADDR;
                        end
                        else if (RX_P_DATA==8'hBB) begin
                            next_state = RD_ADDR;                          
                        end
                        else if (RX_P_DATA==8'hCC) begin
                            next_state = OPER_A;  
                        end
                        else if (RX_P_DATA==8'hDD) begin
                            next_state = ALU_FUN_STATE;    
                        end
                    end
                    else next_state = IDLE;

                WR_ADDR: begin
                    if(RX_D_VLD)
                        next_state = WR_DATA;
                    else next_state  =WR_ADDR;
                end

                WR_DATA: begin
                    if(RX_D_VLD)
                        next_state = IDLE;
                    else next_state  =WR_DATA;

                end

                RD_ADDR: begin
                    if(RX_D_VLD)
                        next_state = FIFO_WR;
                    else next_state  =RD_ADDR;

                end

                FIFO_WR: begin
                    if(RX_D_VLD)
                        next_state = IDLE;                                       
                    else next_state  =FIFO_WR;

                end
                OPER_A: begin
                    if(RX_D_VLD)
                        next_state = OPER_B;
                    else next_state  =OPER_A;

                end

                OPER_B: begin
                    if(RX_D_VLD)
                        next_state = ALU_FUN_STATE;
                    else next_state  =OPER_B;
                end

                ALU_FUN_STATE: begin
                    if(RX_D_VLD)
                        next_state = alu_out_state;
                    else next_state  =ALU_FUN_STATE;
                end
                alu_out_state :begin
                    if(OUT_VALID)
                        next_state = fifo_1st;
                    else next_state  =alu_out_state;                       
                end
                
                fifo_1st : begin
                    next_state=fifo_2nd;  
                end           
                fifo_2nd : begin
                    next_state=IDLE;  
                end      
              
                default : next_state = IDLE;
            endcase
        end
    // Combinational: outputs 
    always @(*) begin
        // Default values
        ALU_EN      = 1'b0;
        CLK_EN      = 1'b0;
        //ALU_FUN     = ALU_FUN_reg;//4'b0;
        WrEn        = 1'b0;
        RdEn        = 1'b0;
        WrData      = 'b0;
        TX_P_DATA   = 'b0;
        TX_D_VLD    = 1'b0;
        clk_div_en  = 1'b0;
       Address     = 'b0;
        alu_flag = 'b0;
        address_flag = 'b0;
        ALU_FUN_flag = 0;
        case (current_state)
            IDLE: begin
                clk_div_en  = 1'b1;
                ALU_EN      = 1'b0;
                CLK_EN      = 1'b0;
                //ALU_FUN     = 'b0;
                WrEn        = 1'b0;
                RdEn        = 1'b0;
                WrData      = 'b0;
                TX_P_DATA   = 'b0;
                TX_D_VLD    = 1'b0;
               // Address     = 'b0;
                alu_flag = 'b0;
                address_flag = 'b0;
        ALU_FUN_flag = 0;


            end

            WR_ADDR:begin
                if(RX_D_VLD) begin
                    address_flag=1'b1;
                end 
                else address_flag=1'b0;
            end

            WR_DATA:begin
                if(RX_D_VLD) begin
                    WrEn    = 1'b1; 
                    Address = address_reg;  
                    WrData  = RX_P_DATA;
                end 
                else begin
                    //Address=1'b0; 
                    WrData=1'b0;
                    WrEn=1'b0;
                  end
            end

            RD_ADDR:begin
                if(RX_D_VLD) begin
                    RdEn = 1'b1;
                    Address = RX_P_DATA[addr_width-1:0];                     
                end else begin
                    Address=0;
                    RdEn=0;
                end   
            end

            FIFO_WR: begin
                if(!wfull && RdData_Valid)begin                    
                    TX_P_DATA   = RdData;
                    TX_D_VLD    = 1'b1;
                end 
                 else begin
                    TX_D_VLD=0;
                    TX_P_DATA = 'b0;
                    
                end  
            end

            OPER_A:begin
                if(RX_D_VLD) begin
                    Address = 'h0; 
                    WrData = RX_P_DATA;
                    WrEn =1; 
                end 
                 else begin
                    Address='h0; 
                    WrData=0;
                    WrEn=0;
                 end
            end
            OPER_B:begin
                if(RX_D_VLD) begin
                    Address = 'b1; 
                    WrData = RX_P_DATA;
                    WrEn =1;
                end 
                 else begin
                    Address='h0; 
                    WrData=0;
                    WrEn=0;
                 end 
            end
            ALU_FUN_STATE:begin
                CLK_EN = 1'b1;
                if(RX_D_VLD) begin
                    ALU_FUN_flag = 1; 
                    //ALU_FUN = RX_P_DATA; 
                    ALU_EN = 1'b1;
                end 
                else begin
                 ALU_EN=0;
                 //ALU_FUN=0;
                 ALU_FUN_flag = 0; 
                end   
            end

            alu_out_state:begin
                CLK_EN = 1'b1;
                    ALU_EN = 1'b1;

                //ALU_FUN = ALU_FUN_reg;
                if(OUT_VALID) begin
                    //ALU_FUN = ALU_FUN_reg;
                    alu_flag=1;
                end 
                else begin
                    alu_flag=0;
                end       
            end 

            fifo_1st : begin
                if(!wfull)begin
                    TX_P_DATA=alu_dn[data_width-1:0];
                    TX_D_VLD=1;
                end 
                 else begin
                     TX_P_DATA=0;
                     TX_D_VLD=0;
                 end          
            end           
            fifo_2nd : begin
                if(!wfull)begin
                    TX_P_DATA=alu_dn[width-1:data_width];
                    TX_D_VLD=1;
                end 
                 else begin
                     TX_P_DATA='b0;
                     TX_D_VLD=0;
                 end         
            end      
            default :begin
                clk_div_en  = 1'b1;
                ALU_EN      = 1'b0;
                CLK_EN      = 1'b0;
                //ALU_FUN     = 'b0;
                WrEn        = 1'b0;
                RdEn        = 1'b0;
                WrData      = 'b0;
                TX_P_DATA   = 'b0;
                TX_D_VLD    = 1'b0;
               // Address     = 'b0;
                alu_flag = 'b0;
                address_flag = 'b0;
            end
        endcase
    end


always @(posedge CLK or negedge RST)begin
    if(!RST) begin
        alu_dn<='b0;
    end
    else if(alu_flag)begin
        alu_dn<=ALU_OUT;
    end 
end

always @(posedge CLK or negedge RST)begin
    if(!RST) begin
        address_reg<='b0;
    end
    else if(address_flag)begin
        address_reg<=RX_P_DATA[addr_width-1:0];
    end 
  
end  
always @(posedge CLK or negedge RST)begin
    if(!RST) begin
        ALU_FUN_reg<='b0;
    end
    else if(ALU_FUN_flag)begin
        ALU_FUN_reg<=RX_P_DATA[addr_width-1:0];
    end 
end  
assign ALU_FUN = ALU_FUN_reg;
endmodule
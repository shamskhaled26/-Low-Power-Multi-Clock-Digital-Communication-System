`timescale 1us/1ns
module alu_tb();
    parameter operand_A_len = 16;
    parameter operand_B_len = 16;
    parameter Arith_out_len = 16;
    parameter logic_out_len = 16;
    parameter CMP_out_len = 16;
    parameter SHIFT_out_len = 16;

    reg signed[operand_A_len-1:0]A_tb;
    reg signed[operand_B_len-1:0]B_tb;
    reg clk;
    reg RST;
    reg [3:0] ALU_FUN_tb;
    reg signed[Arith_out_len-1:0]Arith_out_tb;
    reg [logic_out_len-1:0]Logic_out_tb;
    reg [CMP_out_len-1:0]CMP_out_tb;
    reg [SHIFT_out_len-1:0]SHIFT_out_tb;

    reg Arith_flag_tb;
    reg Logic_flag_tb;
    reg CMP_flag_tb;
    reg SHIFT_flag_tb;

    wire signed[Arith_out_len-1:0]Arith_out;
    wire [logic_out_len-1:0]Logic_out;
    wire [CMP_out_len-1:0]CMP_out;
    wire [SHIFT_out_len-1:0]SHIFT_out;


     ALU_TOP #(operand_A_len,operand_B_len,Arith_out_len,logic_out_len,CMP_out_len,SHIFT_out_len) 
     alu_dut(A_tb,B_tb,ALU_FUN_tb,clk,RST,Arith_flag,Arith_out,Logic_flag,Logic_out,CMP_flag,CMP_out,SHIFT_flag,SHIFT_out);

    
    initial begin
    clk = 0;
        forever begin
            #4 clk = 1; // 60% high
            #6 clk = 0; // 40% low
        end
    end

    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars;
        clk=0;RST=1;
        A_tb=16'h0;B_tb=16'h0;Arith_out_tb=16'h0;
        Logic_out_tb=16'h0;
        CMP_out_tb=16'h0;
        SHIFT_out_tb=16'h0;
        ALU_FUN_tb=4'h0;    

        Arith_flag_tb=0;
        Logic_flag_tb=0;
        CMP_flag_tb=0;
        SHIFT_flag_tb=0;
        @(negedge clk);

        //  test arithmetic operations
        ///////////// addition /////////////
        $display("///////////// addition /////////////");
        ALU_FUN_tb = 4'h0;
        Arith_flag_tb = 1'b1;
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb + B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d + B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1001;   //neq
        Arith_out_tb = A_tb + B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d + B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb + B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d + B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1001;   //neg
        Arith_out_tb = A_tb + B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d + B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        ///////////// subtraction /////////////
        $display(" ///////////// subtraction /////////////");
        ALU_FUN_tb = 4'h1;
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh0001;      //pos
        Arith_out_tb = A_tb - B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase: A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
            $stop;
        end
        else $display("successfull testcase : A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1001;   //neq
        Arith_out_tb = A_tb - B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase: A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
            $stop;
        end
        else $display("successfull testcase : A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh0001;      //pos
        Arith_out_tb = A_tb - B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase: A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
            $stop;
        end
        else $display("successfull testcase : A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1001;   //neg
        Arith_out_tb = A_tb - B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase: A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
            $stop;
        end
        else $display("successfull testcase : A = %0d - B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        ///////////// multiplication /////////////
        $display(" ///////////// multiplication ///////////// ");
        ALU_FUN_tb = 4'h2;
       A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb * B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d * B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1001;   //neq
        Arith_out_tb = A_tb * B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d * B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb * B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d * B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1001;   //neg
        Arith_out_tb = A_tb * B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d * B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        
        ///////////// division /////////////
        $display("///////////// division ///////////// ");
        ALU_FUN_tb = 4'h3;
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb / B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d / B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'sh0fff;   //pos
        B_tb = 16'sh1001;   //neq
        Arith_out_tb = A_tb / B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d / B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1;      //pos
        Arith_out_tb = A_tb / B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d / B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        A_tb=  16'shffff;   //neg
        B_tb = 16'sh1001;   //neg
        Arith_out_tb = A_tb / B_tb;
        @(negedge clk);
        if(Arith_out!= Arith_out_tb|| Arith_flag != Arith_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase : A = %0d / B = %0d = expected %0d result %0d",A_tb,B_tb,Arith_out_tb,Arith_out);
        
        /////////////  Logical Operations /////////////
         $display(" /////////////  Logical Operations /////////////");
       A_tb = 16'h4;
       B_tb = 16'h8;
       Arith_flag_tb = 1'b0;
       Logic_flag_tb = 1'b1;
       
        ALU_FUN_tb = 4'h4;
        Logic_out_tb = A_tb & B_tb;
        @(negedge clk);
        if(Logic_out!= Logic_out_tb || Logic_flag != Logic_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase A = %0d & B = %0d = expected %0d result %0d",A_tb,B_tb,Logic_out_tb,Logic_out);
       
        ALU_FUN_tb = 4'h5;
        Logic_out_tb = A_tb | B_tb;
        @(negedge clk);
        if(Logic_out!= Logic_out_tb || Logic_flag != Logic_flag_tb )begin
            $display("error in testcase");
            $stop;
        end
        else $display("successfull testcase A = %0d | B = %0d = expected %0d result %0d",A_tb,B_tb,Logic_out_tb,Logic_out);
       
        ALU_FUN_tb = 4'h6;
        Logic_out_tb = ~( A_tb & B_tb);
        @(negedge clk);
        if(Logic_out!= Logic_out_tb || Logic_flag != Logic_flag_tb )begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase ~(A = %0d & B = %0d) = expected %0d result %0d",A_tb,B_tb,Logic_out_tb,Logic_out);
       
/////////////check reset function/////////////
        $display("/////////////check reset function/////////////");
        RST = 0;
        #10
        RST=1;
        #3
        ALU_FUN_tb = 4'h7;
        Logic_out_tb =~( A_tb | B_tb);
        @(negedge clk);
        if(Logic_out!= Logic_out_tb|| Logic_flag != Logic_flag_tb )begin
            $display("error in testcase  ");
            $stop;
        end
        else $display("successfull testcase ~(A = %0d | B = %0d) = expected %0d result %0d",A_tb,B_tb,Logic_out_tb,Logic_out);

        ///////////// compare functions /////////////
        $display("///////////// compare functions /////////////");
        Logic_flag_tb =1'b0;
        CMP_flag_tb =1'b1;

        ALU_FUN_tb = 4'h8;// no operation
        CMP_out_tb = 0;
        @(negedge clk);
        if(CMP_out != CMP_out_tb || CMP_flag != CMP_flag_tb )begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase:  no operation ");

        ALU_FUN_tb = 4'h9;
        A_tb = 16'h5; 
        B_tb = 16'h5;
        CMP_out_tb =(A_tb==B_tb);
        @(negedge clk);
        if(CMP_out != CMP_out_tb || CMP_flag != CMP_flag_tb )begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase A = %0d is equal to B = %0d = expected %0d result %0d",A_tb,B_tb,CMP_out_tb,CMP_out);
       
        ALU_FUN_tb = 4'hA;
        A_tb = 16'h9; 
        B_tb = 16'h5;
        CMP_out_tb =16'h2;
        @(negedge clk);
        if(CMP_out!= CMP_out_tb ||  CMP_flag != CMP_flag_tb)begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase A = %0d is greater than B = %0d = expected %0d result %0d",A_tb,B_tb,CMP_out_tb,CMP_out);
        
       
        ALU_FUN_tb = 4'hB;
        A_tb = 16'h3; 
        B_tb = 16'h5;
        CMP_out_tb =16'h3;
        @(negedge clk);
        if(CMP_out!= CMP_out_tb || CMP_flag != CMP_flag_tb)begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase A = %0d is less than B = %0d = expected %0d result %0d",A_tb,B_tb,CMP_out_tb,CMP_out);

        ///////////// shift functions /////////////
        $display("///////////// shift functions /////////////");
        CMP_flag_tb = 1'b0;
        SHIFT_flag_tb =1'b1;

        ALU_FUN_tb = 4'hC;
        A_tb = 16'h9; 
        SHIFT_out_tb =16'h4;
        @(negedge clk);
        if(SHIFT_out_tb!= SHIFT_out_tb || SHIFT_flag != SHIFT_flag_tb)begin
             $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase A = %0d >>1 = expected %0d result %0d",A_tb,SHIFT_out_tb,SHIFT_out);

        ALU_FUN_tb = 4'hD;
        A_tb = 16'h9; 
        SHIFT_out_tb =16'h12;
        @(negedge clk);
        if(SHIFT_out!= SHIFT_out_tb || SHIFT_flag != SHIFT_flag_tb)begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase A = %0d <<1 = expected %0d result %0d",A_tb,SHIFT_out_tb,SHIFT_out);
            
         ALU_FUN_tb = 4'hE;
        B_tb = 16'h9; 
        SHIFT_out_tb =16'h4;
        @(negedge clk);
        if(SHIFT_out!= SHIFT_out_tb || SHIFT_flag != SHIFT_flag_tb)begin
             $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase B = %0d >>1 = expected %0d result %0d",B_tb,SHIFT_out_tb,SHIFT_out);

        ALU_FUN_tb = 4'hF;
        B_tb = 16'h9; 
        SHIFT_out_tb =16'h12;
        @(negedge clk);
        if(SHIFT_out!= SHIFT_out_tb || SHIFT_flag != SHIFT_flag_tb)begin
            $display("error in testcase ");
            $stop;
        end
        else $display("successfull testcase B = %0d <<1 = expected %0d result %0d",B_tb,SHIFT_out_tb,SHIFT_out);
        $stop;
    end

    // initial begin
    //     $monitor("arith_out=%0h , arith_out_tb=%0h , arith_flag=%0h , arith_flag_tb=%0hlogic_out=%0h , logic_out_tb=%0h , logic_flag=%0h , logic_flag_tb=%0h,=%0h , shift_out_tb=%0h , shift_flag=%0h , shift_flag_tb=%0h,cmp_out=%0h , cmp_out_tb=%0h , cmp_flag=%0h ,cmp_flag_tb=%0h",
    //             Arith_out,Arith_out_tb,Arith_flag_tb,Arith_flag_tb,Logic_out,Logic_out_tb,Logic_flag,Logic_flag_tb,SHIFT_out,SHIFT_out_tb,SHIFT_flag,SHIFT_flag_tb,CMP_out,CMP_out_tb,CMP_flag,CMP_flag_tb);
    // end
endmodule
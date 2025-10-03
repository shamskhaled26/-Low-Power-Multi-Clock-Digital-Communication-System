/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sat Sep 27 03:50:09 2025
/////////////////////////////////////////////////////////////


module fifo_rd_fifo_width8_addr_size3 ( rclk, rrst_n, rinc, rq2_wptr, raddr, 
        rempty, r_gray_encoding );
  input [3:0] rq2_wptr;
  output [2:0] raddr;
  output [3:0] r_gray_encoding;
  input rclk, rrst_n, rinc;
  output rempty;
  wire   \rd_pointer[3] , N7, N8, N9, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n1, n2, n17;

  DFFRQX2M \rd_pointer_reg[3]  ( .D(n12), .CK(rclk), .RN(n1), .Q(
        \rd_pointer[3] ) );
  DFFRQX2M \r_gray_encoding_reg[0]  ( .D(N9), .CK(rclk), .RN(n1), .Q(
        r_gray_encoding[0]) );
  DFFRQX2M \r_gray_encoding_reg[3]  ( .D(\rd_pointer[3] ), .CK(rclk), .RN(n1), 
        .Q(r_gray_encoding[3]) );
  DFFRQX2M \r_gray_encoding_reg[2]  ( .D(N7), .CK(rclk), .RN(n1), .Q(
        r_gray_encoding[2]) );
  DFFRQX2M \r_gray_encoding_reg[1]  ( .D(N8), .CK(rclk), .RN(n1), .Q(
        r_gray_encoding[1]) );
  DFFRQX2M \rd_pointer_reg[0]  ( .D(n15), .CK(rclk), .RN(n1), .Q(raddr[0]) );
  DFFRQX2M \rd_pointer_reg[1]  ( .D(n14), .CK(rclk), .RN(n1), .Q(raddr[1]) );
  DFFRQX4M \rd_pointer_reg[2]  ( .D(n13), .CK(rclk), .RN(n1), .Q(raddr[2]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
  INVX2M U5 ( .A(n3), .Y(rempty) );
  NOR2X2M U6 ( .A(n17), .B(n7), .Y(n6) );
  XNOR2X2M U7 ( .A(rq2_wptr[2]), .B(r_gray_encoding[2]), .Y(n11) );
  NAND4X2M U8 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n3) );
  XNOR2X2M U9 ( .A(rq2_wptr[1]), .B(r_gray_encoding[1]), .Y(n8) );
  XNOR2X2M U10 ( .A(rq2_wptr[3]), .B(r_gray_encoding[3]), .Y(n10) );
  XNOR2X2M U11 ( .A(rq2_wptr[0]), .B(r_gray_encoding[0]), .Y(n9) );
  CLKXOR2X2M U12 ( .A(\rd_pointer[3] ), .B(raddr[2]), .Y(N7) );
  CLKXOR2X2M U13 ( .A(raddr[2]), .B(raddr[1]), .Y(N8) );
  CLKXOR2X2M U14 ( .A(raddr[1]), .B(n6), .Y(n14) );
  XNOR2X2M U15 ( .A(raddr[2]), .B(n5), .Y(n13) );
  XNOR2X2M U16 ( .A(raddr[0]), .B(n7), .Y(n15) );
  XNOR2X2M U17 ( .A(raddr[1]), .B(n17), .Y(N9) );
  NAND2X2M U18 ( .A(raddr[1]), .B(n6), .Y(n5) );
  NAND2X2M U19 ( .A(rinc), .B(n3), .Y(n7) );
  INVX2M U20 ( .A(raddr[0]), .Y(n17) );
  XNOR2X2M U21 ( .A(\rd_pointer[3] ), .B(n4), .Y(n12) );
  NAND2BX2M U22 ( .AN(n5), .B(raddr[2]), .Y(n4) );
endmodule


module fifo_wr_fifo_width8_addr_size3 ( wclk, wrst_n, winc, wq2_rptr, waddr, 
        wfull, w_gray_encoding, wclken );
  input [3:0] wq2_rptr;
  output [2:0] waddr;
  output [3:0] w_gray_encoding;
  input wclk, wrst_n, winc;
  output wfull, wclken;
  wire   \wr_pointer[3] , N4, N10, N11, n1, n2, n3, n4, n5, n7, n8, n9, n10,
         n11, n12, n13, n14, n6, n15, n18;

  DFFRQX2M \wr_pointer_reg[3]  ( .D(n11), .CK(wclk), .RN(n6), .Q(
        \wr_pointer[3] ) );
  DFFRQX4M \wr_pointer_reg[0]  ( .D(n14), .CK(wclk), .RN(n6), .Q(waddr[0]) );
  DFFRQX2M \w_gray_encoding_reg[0]  ( .D(N4), .CK(wclk), .RN(n6), .Q(
        w_gray_encoding[0]) );
  DFFRQX2M \w_gray_encoding_reg[1]  ( .D(N11), .CK(wclk), .RN(n6), .Q(
        w_gray_encoding[1]) );
  DFFRQX2M \w_gray_encoding_reg[3]  ( .D(\wr_pointer[3] ), .CK(wclk), .RN(n6), 
        .Q(w_gray_encoding[3]) );
  DFFRQX2M \w_gray_encoding_reg[2]  ( .D(N10), .CK(wclk), .RN(n6), .Q(
        w_gray_encoding[2]) );
  DFFRQX2M \wr_pointer_reg[2]  ( .D(n12), .CK(wclk), .RN(n6), .Q(waddr[2]) );
  DFFRQX4M \wr_pointer_reg[1]  ( .D(n13), .CK(wclk), .RN(n6), .Q(waddr[1]) );
  INVX2M U3 ( .A(n2), .Y(wclken) );
  INVX4M U4 ( .A(n15), .Y(n6) );
  INVX2M U5 ( .A(wrst_n), .Y(n15) );
  NAND2X2M U6 ( .A(winc), .B(n1), .Y(n2) );
  NOR2X2M U7 ( .A(n18), .B(n2), .Y(n5) );
  INVX2M U8 ( .A(n1), .Y(wfull) );
  CLKXOR2X2M U9 ( .A(wq2_rptr[3]), .B(w_gray_encoding[3]), .Y(n10) );
  NAND2X2M U10 ( .A(waddr[1]), .B(n5), .Y(n4) );
  CLKXOR2X2M U11 ( .A(waddr[1]), .B(n5), .Y(n13) );
  XNOR2X2M U12 ( .A(waddr[0]), .B(n2), .Y(n14) );
  XNOR2X2M U13 ( .A(waddr[2]), .B(n4), .Y(n12) );
  XNOR2X2M U14 ( .A(\wr_pointer[3] ), .B(n3), .Y(n11) );
  NAND2BX2M U15 ( .AN(n4), .B(waddr[2]), .Y(n3) );
  NAND4X2M U16 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n1) );
  XNOR2X2M U17 ( .A(wq2_rptr[0]), .B(w_gray_encoding[0]), .Y(n7) );
  XNOR2X2M U18 ( .A(wq2_rptr[1]), .B(w_gray_encoding[1]), .Y(n8) );
  CLKXOR2X2M U19 ( .A(wq2_rptr[2]), .B(w_gray_encoding[2]), .Y(n9) );
  INVX2M U20 ( .A(waddr[0]), .Y(n18) );
  CLKXOR2X2M U21 ( .A(waddr[2]), .B(waddr[1]), .Y(N11) );
  CLKXOR2X2M U22 ( .A(\wr_pointer[3] ), .B(waddr[2]), .Y(N10) );
  XNOR2X2M U23 ( .A(waddr[1]), .B(n18), .Y(N4) );
endmodule


module fifo_mem_ctrl_fifo_width8_addr_size3 ( wclk, wrst_n, wr_data, wclken, 
        raddr, waddr, rd_data );
  input [7:0] wr_data;
  input [2:0] raddr;
  input [2:0] waddr;
  output [7:0] rd_data;
  input wclk, wrst_n, wclken;
  wire   N10, N11, N12, \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \mem_reg[5][7]  ( .D(n68), .CK(wclk), .RN(n106), .Q(\mem[5][7] ) );
  DFFRQX2M \mem_reg[5][6]  ( .D(n67), .CK(wclk), .RN(n107), .Q(\mem[5][6] ) );
  DFFRQX2M \mem_reg[5][5]  ( .D(n66), .CK(wclk), .RN(n104), .Q(\mem[5][5] ) );
  DFFRQX2M \mem_reg[5][4]  ( .D(n65), .CK(wclk), .RN(n106), .Q(\mem[5][4] ) );
  DFFRQX2M \mem_reg[5][3]  ( .D(n64), .CK(wclk), .RN(n107), .Q(\mem[5][3] ) );
  DFFRQX2M \mem_reg[5][2]  ( .D(n63), .CK(wclk), .RN(n104), .Q(\mem[5][2] ) );
  DFFRQX2M \mem_reg[5][1]  ( .D(n62), .CK(wclk), .RN(n106), .Q(\mem[5][1] ) );
  DFFRQX2M \mem_reg[5][0]  ( .D(n61), .CK(wclk), .RN(wrst_n), .Q(\mem[5][0] )
         );
  DFFRQX2M \mem_reg[1][7]  ( .D(n36), .CK(wclk), .RN(n107), .Q(\mem[1][7] ) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n35), .CK(wclk), .RN(n107), .Q(\mem[1][6] ) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n34), .CK(wclk), .RN(n107), .Q(\mem[1][5] ) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n33), .CK(wclk), .RN(n107), .Q(\mem[1][4] ) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n32), .CK(wclk), .RN(n107), .Q(\mem[1][3] ) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n31), .CK(wclk), .RN(n107), .Q(\mem[1][2] ) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n30), .CK(wclk), .RN(n107), .Q(\mem[1][1] ) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n29), .CK(wclk), .RN(n107), .Q(\mem[1][0] ) );
  DFFRQX2M \mem_reg[7][7]  ( .D(n84), .CK(wclk), .RN(n104), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n83), .CK(wclk), .RN(n104), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n82), .CK(wclk), .RN(n104), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n81), .CK(wclk), .RN(n104), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n80), .CK(wclk), .RN(n104), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n79), .CK(wclk), .RN(n104), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n78), .CK(wclk), .RN(n104), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n77), .CK(wclk), .RN(n104), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n52), .CK(wclk), .RN(n105), .Q(\mem[3][7] ) );
  DFFRQX2M \mem_reg[3][6]  ( .D(n51), .CK(wclk), .RN(n105), .Q(\mem[3][6] ) );
  DFFRQX2M \mem_reg[3][5]  ( .D(n50), .CK(wclk), .RN(n105), .Q(\mem[3][5] ) );
  DFFRQX2M \mem_reg[3][4]  ( .D(n49), .CK(wclk), .RN(n105), .Q(\mem[3][4] ) );
  DFFRQX2M \mem_reg[3][3]  ( .D(n48), .CK(wclk), .RN(n106), .Q(\mem[3][3] ) );
  DFFRQX2M \mem_reg[3][2]  ( .D(n47), .CK(wclk), .RN(n106), .Q(\mem[3][2] ) );
  DFFRQX2M \mem_reg[3][1]  ( .D(n46), .CK(wclk), .RN(n106), .Q(\mem[3][1] ) );
  DFFRQX2M \mem_reg[3][0]  ( .D(n45), .CK(wclk), .RN(n106), .Q(\mem[3][0] ) );
  DFFRQX2M \mem_reg[6][7]  ( .D(n76), .CK(wclk), .RN(n104), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n75), .CK(wclk), .RN(n104), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n74), .CK(wclk), .RN(n104), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n73), .CK(wclk), .RN(n104), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n72), .CK(wclk), .RN(wrst_n), .Q(\mem[6][3] )
         );
  DFFRQX2M \mem_reg[6][2]  ( .D(n71), .CK(wclk), .RN(n108), .Q(\mem[6][2] ) );
  DFFRQX2M \mem_reg[6][1]  ( .D(n70), .CK(wclk), .RN(n105), .Q(\mem[6][1] ) );
  DFFRQX2M \mem_reg[6][0]  ( .D(n69), .CK(wclk), .RN(n108), .Q(\mem[6][0] ) );
  DFFRQX2M \mem_reg[2][7]  ( .D(n44), .CK(wclk), .RN(n106), .Q(\mem[2][7] ) );
  DFFRQX2M \mem_reg[2][6]  ( .D(n43), .CK(wclk), .RN(n106), .Q(\mem[2][6] ) );
  DFFRQX2M \mem_reg[2][5]  ( .D(n42), .CK(wclk), .RN(n106), .Q(\mem[2][5] ) );
  DFFRQX2M \mem_reg[2][4]  ( .D(n41), .CK(wclk), .RN(n106), .Q(\mem[2][4] ) );
  DFFRQX2M \mem_reg[2][3]  ( .D(n40), .CK(wclk), .RN(n106), .Q(\mem[2][3] ) );
  DFFRQX2M \mem_reg[2][2]  ( .D(n39), .CK(wclk), .RN(n106), .Q(\mem[2][2] ) );
  DFFRQX2M \mem_reg[2][1]  ( .D(n38), .CK(wclk), .RN(n106), .Q(\mem[2][1] ) );
  DFFRQX2M \mem_reg[2][0]  ( .D(n37), .CK(wclk), .RN(n106), .Q(\mem[2][0] ) );
  DFFRQX2M \mem_reg[4][7]  ( .D(n60), .CK(wclk), .RN(n105), .Q(\mem[4][7] ) );
  DFFRQX2M \mem_reg[4][6]  ( .D(n59), .CK(wclk), .RN(n105), .Q(\mem[4][6] ) );
  DFFRQX2M \mem_reg[4][5]  ( .D(n58), .CK(wclk), .RN(n105), .Q(\mem[4][5] ) );
  DFFRQX2M \mem_reg[4][4]  ( .D(n57), .CK(wclk), .RN(n105), .Q(\mem[4][4] ) );
  DFFRQX2M \mem_reg[4][3]  ( .D(n56), .CK(wclk), .RN(n105), .Q(\mem[4][3] ) );
  DFFRQX2M \mem_reg[4][2]  ( .D(n55), .CK(wclk), .RN(n105), .Q(\mem[4][2] ) );
  DFFRQX2M \mem_reg[4][1]  ( .D(n54), .CK(wclk), .RN(n105), .Q(\mem[4][1] ) );
  DFFRQX2M \mem_reg[4][0]  ( .D(n53), .CK(wclk), .RN(n105), .Q(\mem[4][0] ) );
  DFFRQX2M \mem_reg[0][7]  ( .D(n28), .CK(wclk), .RN(n107), .Q(\mem[0][7] ) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n27), .CK(wclk), .RN(n107), .Q(\mem[0][6] ) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n26), .CK(wclk), .RN(n107), .Q(\mem[0][5] ) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n25), .CK(wclk), .RN(n107), .Q(\mem[0][4] ) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n24), .CK(wclk), .RN(n105), .Q(\mem[0][3] ) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n23), .CK(wclk), .RN(n108), .Q(\mem[0][2] ) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n22), .CK(wclk), .RN(n105), .Q(\mem[0][1] ) );
  DFFRQX2M \mem_reg[0][0]  ( .D(n21), .CK(wclk), .RN(n105), .Q(\mem[0][0] ) );
  AND2X2M U2 ( .A(waddr[2]), .B(wclken), .Y(n17) );
  CLKBUFX6M U3 ( .A(n108), .Y(n107) );
  CLKBUFX6M U4 ( .A(n108), .Y(n106) );
  CLKBUFX6M U5 ( .A(wrst_n), .Y(n105) );
  CLKBUFX6M U6 ( .A(n108), .Y(n104) );
  BUFX4M U7 ( .A(n11), .Y(n103) );
  BUFX4M U8 ( .A(n16), .Y(n99) );
  INVX2M U9 ( .A(n109), .Y(n108) );
  INVX2M U10 ( .A(wrst_n), .Y(n109) );
  NAND3X2M U11 ( .A(n118), .B(n119), .C(n12), .Y(n11) );
  BUFX4M U12 ( .A(n13), .Y(n102) );
  BUFX4M U13 ( .A(n14), .Y(n101) );
  BUFX4M U14 ( .A(n15), .Y(n100) );
  NAND3X2M U15 ( .A(n118), .B(n119), .C(n17), .Y(n16) );
  INVX4M U16 ( .A(n93), .Y(n91) );
  INVX4M U17 ( .A(n93), .Y(n92) );
  NOR2BX4M U18 ( .AN(wclken), .B(waddr[2]), .Y(n12) );
  CLKBUFX6M U19 ( .A(n18), .Y(n98) );
  NAND3X2M U20 ( .A(waddr[0]), .B(n119), .C(n17), .Y(n18) );
  CLKBUFX6M U21 ( .A(n19), .Y(n97) );
  NAND3X2M U22 ( .A(waddr[1]), .B(n118), .C(n17), .Y(n19) );
  CLKBUFX6M U23 ( .A(n20), .Y(n96) );
  NAND3X2M U24 ( .A(waddr[1]), .B(waddr[0]), .C(n17), .Y(n20) );
  OAI2BB2X1M U25 ( .B0(n110), .B1(n102), .A0N(\mem[1][0] ), .A1N(n102), .Y(n29) );
  OAI2BB2X1M U26 ( .B0(n111), .B1(n102), .A0N(\mem[1][1] ), .A1N(n102), .Y(n30) );
  OAI2BB2X1M U27 ( .B0(n112), .B1(n102), .A0N(\mem[1][2] ), .A1N(n102), .Y(n31) );
  OAI2BB2X1M U28 ( .B0(n113), .B1(n102), .A0N(\mem[1][3] ), .A1N(n102), .Y(n32) );
  OAI2BB2X1M U29 ( .B0(n114), .B1(n102), .A0N(\mem[1][4] ), .A1N(n102), .Y(n33) );
  OAI2BB2X1M U30 ( .B0(n115), .B1(n13), .A0N(\mem[1][5] ), .A1N(n102), .Y(n34)
         );
  OAI2BB2X1M U31 ( .B0(n116), .B1(n13), .A0N(\mem[1][6] ), .A1N(n102), .Y(n35)
         );
  OAI2BB2X1M U32 ( .B0(n117), .B1(n13), .A0N(\mem[1][7] ), .A1N(n102), .Y(n36)
         );
  OAI2BB2X1M U33 ( .B0(n110), .B1(n101), .A0N(\mem[2][0] ), .A1N(n101), .Y(n37) );
  OAI2BB2X1M U34 ( .B0(n111), .B1(n101), .A0N(\mem[2][1] ), .A1N(n101), .Y(n38) );
  OAI2BB2X1M U35 ( .B0(n112), .B1(n101), .A0N(\mem[2][2] ), .A1N(n101), .Y(n39) );
  OAI2BB2X1M U36 ( .B0(n113), .B1(n101), .A0N(\mem[2][3] ), .A1N(n101), .Y(n40) );
  OAI2BB2X1M U37 ( .B0(n114), .B1(n101), .A0N(\mem[2][4] ), .A1N(n101), .Y(n41) );
  OAI2BB2X1M U38 ( .B0(n115), .B1(n14), .A0N(\mem[2][5] ), .A1N(n101), .Y(n42)
         );
  OAI2BB2X1M U39 ( .B0(n116), .B1(n14), .A0N(\mem[2][6] ), .A1N(n101), .Y(n43)
         );
  OAI2BB2X1M U40 ( .B0(n117), .B1(n14), .A0N(\mem[2][7] ), .A1N(n101), .Y(n44)
         );
  OAI2BB2X1M U41 ( .B0(n110), .B1(n100), .A0N(\mem[3][0] ), .A1N(n100), .Y(n45) );
  OAI2BB2X1M U42 ( .B0(n111), .B1(n100), .A0N(\mem[3][1] ), .A1N(n100), .Y(n46) );
  OAI2BB2X1M U43 ( .B0(n112), .B1(n100), .A0N(\mem[3][2] ), .A1N(n100), .Y(n47) );
  OAI2BB2X1M U44 ( .B0(n113), .B1(n100), .A0N(\mem[3][3] ), .A1N(n100), .Y(n48) );
  OAI2BB2X1M U45 ( .B0(n114), .B1(n100), .A0N(\mem[3][4] ), .A1N(n100), .Y(n49) );
  OAI2BB2X1M U46 ( .B0(n115), .B1(n15), .A0N(\mem[3][5] ), .A1N(n100), .Y(n50)
         );
  OAI2BB2X1M U47 ( .B0(n116), .B1(n15), .A0N(\mem[3][6] ), .A1N(n100), .Y(n51)
         );
  OAI2BB2X1M U48 ( .B0(n117), .B1(n15), .A0N(\mem[3][7] ), .A1N(n100), .Y(n52)
         );
  OAI2BB2X1M U49 ( .B0(n110), .B1(n98), .A0N(\mem[5][0] ), .A1N(n98), .Y(n61)
         );
  OAI2BB2X1M U50 ( .B0(n111), .B1(n98), .A0N(\mem[5][1] ), .A1N(n98), .Y(n62)
         );
  OAI2BB2X1M U51 ( .B0(n112), .B1(n98), .A0N(\mem[5][2] ), .A1N(n98), .Y(n63)
         );
  OAI2BB2X1M U52 ( .B0(n113), .B1(n98), .A0N(\mem[5][3] ), .A1N(n98), .Y(n64)
         );
  OAI2BB2X1M U53 ( .B0(n114), .B1(n98), .A0N(\mem[5][4] ), .A1N(n98), .Y(n65)
         );
  OAI2BB2X1M U54 ( .B0(n115), .B1(n98), .A0N(\mem[5][5] ), .A1N(n98), .Y(n66)
         );
  OAI2BB2X1M U55 ( .B0(n116), .B1(n98), .A0N(\mem[5][6] ), .A1N(n98), .Y(n67)
         );
  OAI2BB2X1M U56 ( .B0(n117), .B1(n98), .A0N(\mem[5][7] ), .A1N(n98), .Y(n68)
         );
  OAI2BB2X1M U57 ( .B0(n110), .B1(n97), .A0N(\mem[6][0] ), .A1N(n97), .Y(n69)
         );
  OAI2BB2X1M U58 ( .B0(n111), .B1(n97), .A0N(\mem[6][1] ), .A1N(n97), .Y(n70)
         );
  OAI2BB2X1M U59 ( .B0(n112), .B1(n97), .A0N(\mem[6][2] ), .A1N(n97), .Y(n71)
         );
  OAI2BB2X1M U60 ( .B0(n113), .B1(n97), .A0N(\mem[6][3] ), .A1N(n97), .Y(n72)
         );
  OAI2BB2X1M U61 ( .B0(n114), .B1(n97), .A0N(\mem[6][4] ), .A1N(n97), .Y(n73)
         );
  OAI2BB2X1M U62 ( .B0(n115), .B1(n97), .A0N(\mem[6][5] ), .A1N(n97), .Y(n74)
         );
  OAI2BB2X1M U63 ( .B0(n116), .B1(n97), .A0N(\mem[6][6] ), .A1N(n97), .Y(n75)
         );
  OAI2BB2X1M U64 ( .B0(n117), .B1(n97), .A0N(\mem[6][7] ), .A1N(n97), .Y(n76)
         );
  OAI2BB2X1M U65 ( .B0(n110), .B1(n96), .A0N(\mem[7][0] ), .A1N(n96), .Y(n77)
         );
  OAI2BB2X1M U66 ( .B0(n111), .B1(n96), .A0N(\mem[7][1] ), .A1N(n96), .Y(n78)
         );
  OAI2BB2X1M U67 ( .B0(n112), .B1(n96), .A0N(\mem[7][2] ), .A1N(n96), .Y(n79)
         );
  OAI2BB2X1M U68 ( .B0(n113), .B1(n96), .A0N(\mem[7][3] ), .A1N(n96), .Y(n80)
         );
  OAI2BB2X1M U69 ( .B0(n114), .B1(n96), .A0N(\mem[7][4] ), .A1N(n96), .Y(n81)
         );
  OAI2BB2X1M U70 ( .B0(n115), .B1(n96), .A0N(\mem[7][5] ), .A1N(n96), .Y(n82)
         );
  OAI2BB2X1M U71 ( .B0(n116), .B1(n96), .A0N(\mem[7][6] ), .A1N(n96), .Y(n83)
         );
  OAI2BB2X1M U72 ( .B0(n117), .B1(n96), .A0N(\mem[7][7] ), .A1N(n96), .Y(n84)
         );
  OAI2BB2X1M U73 ( .B0(n103), .B1(n110), .A0N(\mem[0][0] ), .A1N(n103), .Y(n21) );
  OAI2BB2X1M U74 ( .B0(n103), .B1(n111), .A0N(\mem[0][1] ), .A1N(n103), .Y(n22) );
  OAI2BB2X1M U75 ( .B0(n103), .B1(n112), .A0N(\mem[0][2] ), .A1N(n103), .Y(n23) );
  OAI2BB2X1M U76 ( .B0(n103), .B1(n113), .A0N(\mem[0][3] ), .A1N(n103), .Y(n24) );
  OAI2BB2X1M U77 ( .B0(n103), .B1(n114), .A0N(\mem[0][4] ), .A1N(n103), .Y(n25) );
  OAI2BB2X1M U78 ( .B0(n11), .B1(n115), .A0N(\mem[0][5] ), .A1N(n103), .Y(n26)
         );
  OAI2BB2X1M U79 ( .B0(n11), .B1(n116), .A0N(\mem[0][6] ), .A1N(n103), .Y(n27)
         );
  OAI2BB2X1M U80 ( .B0(n11), .B1(n117), .A0N(\mem[0][7] ), .A1N(n103), .Y(n28)
         );
  NAND3X2M U81 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n15) );
  NAND3X2M U82 ( .A(n12), .B(n119), .C(waddr[0]), .Y(n13) );
  NAND3X2M U83 ( .A(n12), .B(n118), .C(waddr[1]), .Y(n14) );
  INVX4M U84 ( .A(wr_data[0]), .Y(n110) );
  INVX4M U85 ( .A(wr_data[1]), .Y(n111) );
  INVX4M U86 ( .A(wr_data[2]), .Y(n112) );
  INVX4M U87 ( .A(wr_data[3]), .Y(n113) );
  INVX4M U88 ( .A(wr_data[4]), .Y(n114) );
  INVX4M U89 ( .A(wr_data[5]), .Y(n115) );
  INVX4M U90 ( .A(wr_data[6]), .Y(n116) );
  INVX4M U91 ( .A(wr_data[7]), .Y(n117) );
  OAI2BB2X1M U92 ( .B0(n110), .B1(n99), .A0N(\mem[4][0] ), .A1N(n99), .Y(n53)
         );
  OAI2BB2X1M U93 ( .B0(n111), .B1(n99), .A0N(\mem[4][1] ), .A1N(n99), .Y(n54)
         );
  OAI2BB2X1M U94 ( .B0(n112), .B1(n99), .A0N(\mem[4][2] ), .A1N(n99), .Y(n55)
         );
  OAI2BB2X1M U95 ( .B0(n113), .B1(n99), .A0N(\mem[4][3] ), .A1N(n99), .Y(n56)
         );
  OAI2BB2X1M U96 ( .B0(n114), .B1(n99), .A0N(\mem[4][4] ), .A1N(n99), .Y(n57)
         );
  OAI2BB2X1M U97 ( .B0(n115), .B1(n16), .A0N(\mem[4][5] ), .A1N(n99), .Y(n58)
         );
  OAI2BB2X1M U98 ( .B0(n116), .B1(n16), .A0N(\mem[4][6] ), .A1N(n99), .Y(n59)
         );
  OAI2BB2X1M U99 ( .B0(n117), .B1(n16), .A0N(\mem[4][7] ), .A1N(n99), .Y(n60)
         );
  INVX2M U100 ( .A(waddr[1]), .Y(n119) );
  INVX2M U101 ( .A(waddr[0]), .Y(n118) );
  MX2X2M U102 ( .A(n2), .B(n1), .S0(N12), .Y(rd_data[0]) );
  MX4X1M U103 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n92), .S1(n95), .Y(n2) );
  MX4X1M U104 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n91), .S1(n94), .Y(n1) );
  MX2X2M U105 ( .A(n4), .B(n3), .S0(N12), .Y(rd_data[1]) );
  MX4X1M U106 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n92), .S1(n95), .Y(n4) );
  MX4X1M U107 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n91), .S1(n94), .Y(n3) );
  MX2X2M U108 ( .A(n6), .B(n5), .S0(N12), .Y(rd_data[2]) );
  MX4X1M U109 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n92), .S1(n95), .Y(n6) );
  MX4X1M U110 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n91), .S1(n94), .Y(n5) );
  MX2X2M U111 ( .A(n8), .B(n7), .S0(N12), .Y(rd_data[3]) );
  MX4X1M U112 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n92), .S1(n95), .Y(n8) );
  MX4X1M U113 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n91), .S1(n94), .Y(n7) );
  MX2X2M U114 ( .A(n10), .B(n9), .S0(N12), .Y(rd_data[4]) );
  MX4X1M U115 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n92), .S1(n95), .Y(n10) );
  MX4X1M U116 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n91), .S1(n94), .Y(n9) );
  MX2X2M U117 ( .A(n86), .B(n85), .S0(N12), .Y(rd_data[5]) );
  MX4X1M U118 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n92), .S1(n95), .Y(n86) );
  MX4X1M U119 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n91), .S1(n94), .Y(n85) );
  MX2X2M U120 ( .A(n88), .B(n87), .S0(N12), .Y(rd_data[6]) );
  MX4X1M U121 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n92), .S1(n95), .Y(n88) );
  MX4X1M U122 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n91), .S1(n94), .Y(n87) );
  BUFX4M U123 ( .A(N11), .Y(n94) );
  BUFX4M U124 ( .A(N11), .Y(n95) );
  INVX2M U125 ( .A(N10), .Y(n93) );
  MX2X2M U126 ( .A(n90), .B(n89), .S0(N12), .Y(rd_data[7]) );
  MX4X1M U127 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n92), .S1(n95), .Y(n90) );
  MX4X1M U128 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n91), .S1(n94), .Y(n89) );
endmodule


module DF_SYNC_fifo_width8_addr_size3_0 ( clk, rst, in1, out2 );
  input [3:0] in1;
  output [3:0] out2;
  input clk, rst;
  wire   n1, n2;
  wire   [3:0] out1;

  DFFRQX2M \out2_reg[3]  ( .D(out1[3]), .CK(clk), .RN(n1), .Q(out2[3]) );
  DFFRQX2M \out2_reg[2]  ( .D(out1[2]), .CK(clk), .RN(n1), .Q(out2[2]) );
  DFFRQX2M \out2_reg[1]  ( .D(out1[1]), .CK(clk), .RN(n1), .Q(out2[1]) );
  DFFRQX2M \out2_reg[0]  ( .D(out1[0]), .CK(clk), .RN(n1), .Q(out2[0]) );
  DFFRQX2M \out1_reg[3]  ( .D(in1[3]), .CK(clk), .RN(n1), .Q(out1[3]) );
  DFFRQX2M \out1_reg[2]  ( .D(in1[2]), .CK(clk), .RN(n1), .Q(out1[2]) );
  DFFRQX2M \out1_reg[1]  ( .D(in1[1]), .CK(clk), .RN(n1), .Q(out1[1]) );
  DFFRQX2M \out1_reg[0]  ( .D(in1[0]), .CK(clk), .RN(n1), .Q(out1[0]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
endmodule


module DF_SYNC_fifo_width8_addr_size3_1 ( clk, rst, in1, out2 );
  input [3:0] in1;
  output [3:0] out2;
  input clk, rst;
  wire   n1, n2;
  wire   [3:0] out1;

  DFFRQX2M \out2_reg[1]  ( .D(out1[1]), .CK(clk), .RN(n1), .Q(out2[1]) );
  DFFRQX2M \out2_reg[0]  ( .D(out1[0]), .CK(clk), .RN(n1), .Q(out2[0]) );
  DFFRQX2M \out2_reg[3]  ( .D(out1[3]), .CK(clk), .RN(n1), .Q(out2[3]) );
  DFFRQX2M \out2_reg[2]  ( .D(out1[2]), .CK(clk), .RN(n1), .Q(out2[2]) );
  DFFRQX2M \out1_reg[3]  ( .D(in1[3]), .CK(clk), .RN(n1), .Q(out1[3]) );
  DFFRQX2M \out1_reg[2]  ( .D(in1[2]), .CK(clk), .RN(n1), .Q(out1[2]) );
  DFFRQX2M \out1_reg[1]  ( .D(in1[1]), .CK(clk), .RN(n1), .Q(out1[1]) );
  DFFRQX2M \out1_reg[0]  ( .D(in1[0]), .CK(clk), .RN(n1), .Q(out1[0]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst), .Y(n2) );
endmodule


module ASYNC_FIFO_data_width8_addr_size3 ( wclk, wrst_n, winc, rclk, rrst_n, 
        rinc, WrData, wfull, rempty, RdData );
  input [7:0] WrData;
  output [7:0] RdData;
  input wclk, wrst_n, winc, rclk, rrst_n, rinc;
  output wfull, rempty;
  wire   wclken, n1, n2, n3, n4;
  wire   [3:0] rq2_wptr;
  wire   [2:0] raddr;
  wire   [3:0] r_gray_encoding;
  wire   [3:0] wq2_rptr;
  wire   [2:0] waddr;
  wire   [3:0] w_gray_encoding;

  fifo_rd_fifo_width8_addr_size3 sync_w2r ( .rclk(rclk), .rrst_n(n1), .rinc(
        rinc), .rq2_wptr(rq2_wptr), .raddr(raddr), .rempty(rempty), 
        .r_gray_encoding(r_gray_encoding) );
  fifo_wr_fifo_width8_addr_size3 sync_r2w ( .wclk(wclk), .wrst_n(n3), .winc(
        winc), .wq2_rptr(wq2_rptr), .waddr(waddr), .wfull(wfull), 
        .w_gray_encoding(w_gray_encoding), .wclken(wclken) );
  fifo_mem_ctrl_fifo_width8_addr_size3 fifo_mem_ctrl ( .wclk(wclk), .wrst_n(n3), .wr_data(WrData), .wclken(wclken), .raddr(raddr), .waddr(waddr), .rd_data(
        RdData) );
  DF_SYNC_fifo_width8_addr_size3_0 DF_SYNC_r ( .clk(rclk), .rst(n1), .in1(
        w_gray_encoding), .out2(rq2_wptr) );
  DF_SYNC_fifo_width8_addr_size3_1 DF_SYNC_w ( .clk(wclk), .rst(n3), .in1(
        r_gray_encoding), .out2(wq2_rptr) );
  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(wrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rrst_n), .Y(n2) );
endmodule


module DATA_SYNC_num_stages2_data_width8 ( clk, rst, unsync_bus, bus_enable, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input clk, rst, bus_enable;
  output enable_pulse;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(clk), .RN(n11), .Q(
        enable_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(clk), .RN(n11), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(clk), .RN(n11), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(clk), .RN(n11), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(clk), .RN(n11), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(clk), .RN(n11), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(clk), .RN(n11), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(clk), .RN(n11), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(clk), .RN(n11), .Q(sync_bus[2]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(clk), .RN(n11), .Q(
        sync_reg[0]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(clk), .RN(n11), .Q(sync_bus[6]) );
  DFFRQX2M enable_pulse_reg ( .D(n13), .CK(clk), .RN(n11), .Q(enable_pulse) );
  INVX4M U3 ( .A(n10), .Y(n13) );
  INVX4M U4 ( .A(n12), .Y(n11) );
  INVX2M U5 ( .A(rst), .Y(n12) );
  BUFX4M U6 ( .A(n1), .Y(n10) );
  NAND2BX2M U7 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U8 ( .A0(unsync_bus[6]), .A1(n13), .B0(sync_bus[6]), .B1(n10), .Y(n8) );
  AO22X1M U9 ( .A0(unsync_bus[2]), .A1(n13), .B0(sync_bus[2]), .B1(n10), .Y(n4) );
  AO22X1M U10 ( .A0(unsync_bus[0]), .A1(n13), .B0(sync_bus[0]), .B1(n10), .Y(
        n2) );
  AO22X1M U11 ( .A0(unsync_bus[4]), .A1(n13), .B0(sync_bus[4]), .B1(n10), .Y(
        n6) );
  AO22X1M U12 ( .A0(unsync_bus[1]), .A1(n13), .B0(sync_bus[1]), .B1(n10), .Y(
        n3) );
  AO22X1M U13 ( .A0(unsync_bus[5]), .A1(n13), .B0(sync_bus[5]), .B1(n10), .Y(
        n7) );
  AO22X1M U14 ( .A0(unsync_bus[7]), .A1(n13), .B0(sync_bus[7]), .B1(n10), .Y(
        n9) );
  AO22X1M U15 ( .A0(unsync_bus[3]), .A1(n13), .B0(sync_bus[3]), .B1(n10), .Y(
        n5) );
endmodule


module PULSE_GEN ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;

  wire   [1:0] out;

  DFFRQX2M \out_reg[1]  ( .D(out[0]), .CK(CLK), .RN(RST), .Q(out[1]) );
  DFFRQX2M \out_reg[0]  ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(out[0]) );
  NOR2BX2M U3 ( .AN(out[0]), .B(out[1]), .Y(PULSE_SIG) );
endmodule


module RST_SYNC_num_stages2_0 ( RST, CLK, sync_rst );
  input RST, CLK;
  output sync_rst;

  wire   [1:0] out;

  DFFRQX2M sync_rst_reg ( .D(out[1]), .CK(CLK), .RN(RST), .Q(sync_rst) );
  DFFRQX2M \out_reg[1]  ( .D(out[0]), .CK(CLK), .RN(RST), .Q(out[1]) );
  DFFRQX2M \out_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(out[0]) );
endmodule


module RST_SYNC_num_stages2_1 ( RST, CLK, sync_rst );
  input RST, CLK;
  output sync_rst;

  wire   [1:0] out;

  DFFRQX2M sync_rst_reg ( .D(out[1]), .CK(CLK), .RN(RST), .Q(sync_rst) );
  DFFRQX2M \out_reg[1]  ( .D(out[0]), .CK(CLK), .RN(RST), .Q(out[1]) );
  DFFRQX2M \out_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(out[0]) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   Latch_Out;

  TLATNX2M Latch_Out_reg ( .D(CLK_EN), .GN(CLK), .Q(Latch_Out) );
  CLKAND2X4M U2 ( .A(Latch_Out), .B(CLK), .Y(GATED_CLK) );
endmodule


module int_clk_div_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module int_clk_div_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N8, flag, N17, N19, N20, N21, N22, N23, N24, N25, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N41, N42, N43, N44, N45, N46, N47, N48,
         N62, N63, N64, N65, N66, N67, N68, N69, n14, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, \sub_19/carry[7] ,
         \sub_19/carry[6] , \sub_19/carry[5] , \sub_19/carry[4] ,
         \sub_19/carry[3] , \sub_19/carry[2] , \sub_19/carry[1] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [7:0] half_togg_pl;
  wire   [7:0] counter;

  NOR2BX12M U4 ( .AN(n17), .B(n3), .Y(o_div_clk) );
  int_clk_div_0_DW01_inc_0 add_38 ( .A(counter), .SUM({N48, N47, N46, N45, N44, 
        N43, N42, N41}) );
  DFFRX1M div_clk_reg_reg ( .D(n27), .CK(i_ref_clk), .RN(n2), .QN(n14) );
  OAI2BB2X1M U11 ( .B0(n18), .B1(n14), .A0N(i_ref_clk), .A1N(n18), .Y(n17) );
  DFFRX1M flag_reg ( .D(n28), .CK(i_ref_clk), .RN(n2), .Q(flag) );
  DFFRX1M \counter_reg[7]  ( .D(N69), .CK(i_ref_clk), .RN(n2), .Q(counter[7])
         );
  DFFRX1M \counter_reg[6]  ( .D(N68), .CK(i_ref_clk), .RN(n2), .Q(counter[6])
         );
  DFFRX1M \counter_reg[5]  ( .D(N67), .CK(i_ref_clk), .RN(n2), .Q(counter[5])
         );
  DFFRX1M \counter_reg[4]  ( .D(N66), .CK(i_ref_clk), .RN(n2), .Q(counter[4])
         );
  DFFRX1M \counter_reg[3]  ( .D(N65), .CK(i_ref_clk), .RN(n2), .Q(counter[3])
         );
  DFFRX1M \counter_reg[2]  ( .D(N64), .CK(i_ref_clk), .RN(n2), .Q(counter[2])
         );
  DFFRX1M \counter_reg[0]  ( .D(N62), .CK(i_ref_clk), .RN(n2), .Q(counter[0]), 
        .QN(n46) );
  DFFRX2M \counter_reg[1]  ( .D(N63), .CK(i_ref_clk), .RN(n2), .Q(counter[1])
         );
  NOR3X2M U3 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n7), .Y(N24) );
  XNOR2X2M U5 ( .A(i_div_ratio[0]), .B(N17), .Y(half_togg_pl[0]) );
  XNOR2X2M U6 ( .A(i_div_ratio[7]), .B(\sub_19/carry[7] ), .Y(half_togg_pl[7])
         );
  AOI2B1X2M U7 ( .A1N(i_div_ratio[0]), .A0(N25), .B0(n22), .Y(n20) );
  INVX4M U8 ( .A(n3), .Y(n2) );
  NAND2BX4M U9 ( .AN(n19), .B(n20), .Y(n23) );
  NOR2BX2M U10 ( .AN(N42), .B(n23), .Y(N63) );
  NOR2BX2M U12 ( .AN(N43), .B(n23), .Y(N64) );
  NOR2BX2M U13 ( .AN(N44), .B(n23), .Y(N65) );
  NOR2BX2M U14 ( .AN(N45), .B(n23), .Y(N66) );
  NOR2BX2M U15 ( .AN(N46), .B(n23), .Y(N67) );
  NOR2BX2M U16 ( .AN(N47), .B(n23), .Y(N68) );
  INVX2M U17 ( .A(i_rst_n), .Y(n3) );
  CLKINVX1M U18 ( .A(half_togg_pl[0]), .Y(N28) );
  OAI2B2X1M U19 ( .A1N(n16), .A0(o_div_clk), .B0(n16), .B1(n14), .Y(n27) );
  NOR2X2M U20 ( .A(n19), .B(n20), .Y(n16) );
  NAND2X2M U21 ( .A(i_clk_en), .B(N8), .Y(n18) );
  NOR2BX2M U22 ( .AN(N48), .B(n23), .Y(N69) );
  NOR2BX2M U23 ( .AN(N41), .B(n23), .Y(N62) );
  AND2X2M U24 ( .A(i_div_ratio[0]), .B(n24), .Y(n22) );
  AO2B2X2M U25 ( .B0(N25), .B1(flag), .A0(N37), .A1N(flag), .Y(n24) );
  NOR2X2M U26 ( .A(n21), .B(n19), .Y(n28) );
  XNOR2X2M U27 ( .A(n22), .B(flag), .Y(n21) );
  OAI2BB1X2M U28 ( .A0N(n25), .A1N(n26), .B0(i_clk_en), .Y(n19) );
  NOR3X2M U29 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n25) );
  NOR4X1M U30 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n26) );
  INVX2M U31 ( .A(i_div_ratio[1]), .Y(N17) );
  AOI21BX2M U32 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n4), .Y(n1)
         );
  ADDFX2M U33 ( .A(i_div_ratio[1]), .B(n9), .CI(\sub_19/carry[1] ), .CO(
        \sub_19/carry[2] ), .S(half_togg_pl[1]) );
  INVX2M U34 ( .A(i_div_ratio[2]), .Y(n9) );
  ADDFX2M U35 ( .A(i_div_ratio[2]), .B(n10), .CI(\sub_19/carry[2] ), .CO(
        \sub_19/carry[3] ), .S(half_togg_pl[2]) );
  INVX2M U36 ( .A(i_div_ratio[3]), .Y(n10) );
  ADDFX2M U37 ( .A(i_div_ratio[3]), .B(n11), .CI(\sub_19/carry[3] ), .CO(
        \sub_19/carry[4] ), .S(half_togg_pl[3]) );
  INVX2M U38 ( .A(i_div_ratio[4]), .Y(n11) );
  ADDFX2M U39 ( .A(i_div_ratio[4]), .B(n12), .CI(\sub_19/carry[4] ), .CO(
        \sub_19/carry[5] ), .S(half_togg_pl[4]) );
  INVX2M U40 ( .A(i_div_ratio[5]), .Y(n12) );
  ADDFX2M U41 ( .A(i_div_ratio[5]), .B(n13), .CI(\sub_19/carry[5] ), .CO(
        \sub_19/carry[6] ), .S(half_togg_pl[5]) );
  INVX2M U42 ( .A(i_div_ratio[6]), .Y(n13) );
  ADDFX2M U43 ( .A(i_div_ratio[6]), .B(n15), .CI(\sub_19/carry[6] ), .CO(
        \sub_19/carry[7] ), .S(half_togg_pl[6]) );
  INVX2M U44 ( .A(i_div_ratio[7]), .Y(n15) );
  OR2X1M U45 ( .A(N17), .B(i_div_ratio[0]), .Y(\sub_19/carry[1] ) );
  NAND2BX1M U46 ( .AN(i_div_ratio[2]), .B(N17), .Y(n4) );
  OR2X1M U47 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1X1M U48 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(N19) );
  OR2X1M U49 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  OAI2BB1X1M U50 ( .A0N(n5), .A1N(i_div_ratio[4]), .B0(n6), .Y(N20) );
  OR2X1M U51 ( .A(n6), .B(i_div_ratio[5]), .Y(n7) );
  OAI2BB1X1M U52 ( .A0N(n6), .A1N(i_div_ratio[5]), .B0(n7), .Y(N21) );
  XNOR2X1M U53 ( .A(i_div_ratio[6]), .B(n7), .Y(N22) );
  OAI21X1M U54 ( .A0(i_div_ratio[6]), .A1(n7), .B0(i_div_ratio[7]), .Y(n8) );
  NAND2BX1M U55 ( .AN(N24), .B(n8), .Y(N23) );
  NAND2BX1M U56 ( .AN(half_togg_pl[1]), .B(N28), .Y(n29) );
  OAI2BB1X1M U57 ( .A0N(half_togg_pl[0]), .A1N(half_togg_pl[1]), .B0(n29), .Y(
        N29) );
  OR2X1M U58 ( .A(n29), .B(half_togg_pl[2]), .Y(n30) );
  OAI2BB1X1M U59 ( .A0N(n29), .A1N(half_togg_pl[2]), .B0(n30), .Y(N30) );
  OR2X1M U60 ( .A(n30), .B(half_togg_pl[3]), .Y(n31) );
  OAI2BB1X1M U61 ( .A0N(n30), .A1N(half_togg_pl[3]), .B0(n31), .Y(N31) );
  OR2X1M U62 ( .A(n31), .B(half_togg_pl[4]), .Y(n32) );
  OAI2BB1X1M U63 ( .A0N(n31), .A1N(half_togg_pl[4]), .B0(n32), .Y(N32) );
  OR2X1M U64 ( .A(n32), .B(half_togg_pl[5]), .Y(n33) );
  OAI2BB1X1M U65 ( .A0N(n32), .A1N(half_togg_pl[5]), .B0(n33), .Y(N33) );
  OR2X1M U66 ( .A(n33), .B(half_togg_pl[6]), .Y(n34) );
  OAI2BB1X1M U67 ( .A0N(n33), .A1N(half_togg_pl[6]), .B0(n34), .Y(N34) );
  NOR2X1M U68 ( .A(n34), .B(half_togg_pl[7]), .Y(N36) );
  AO21XLM U69 ( .A0(n34), .A1(half_togg_pl[7]), .B0(N36), .Y(N35) );
  XNOR2X1M U70 ( .A(N19), .B(counter[2]), .Y(n45) );
  NOR2X1M U71 ( .A(n46), .B(N17), .Y(n35) );
  OAI22X1M U72 ( .A0(counter[1]), .A1(n35), .B0(n35), .B1(n1), .Y(n44) );
  CLKNAND2X2M U73 ( .A(N17), .B(n46), .Y(n36) );
  AOI22X1M U74 ( .A0(n36), .A1(n1), .B0(n36), .B1(counter[1]), .Y(n37) );
  NOR3X1M U75 ( .A(n37), .B(N24), .C(counter[7]), .Y(n43) );
  CLKXOR2X2M U76 ( .A(N20), .B(counter[3]), .Y(n41) );
  CLKXOR2X2M U77 ( .A(N21), .B(counter[4]), .Y(n40) );
  CLKXOR2X2M U78 ( .A(N22), .B(counter[5]), .Y(n39) );
  CLKXOR2X2M U79 ( .A(N23), .B(counter[6]), .Y(n38) );
  NOR4X1M U80 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(n42) );
  AND4X1M U81 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N25) );
  OR4X1M U82 ( .A(i_div_ratio[5]), .B(i_div_ratio[4]), .C(i_div_ratio[7]), .D(
        i_div_ratio[6]), .Y(n47) );
  OR4X1M U83 ( .A(i_div_ratio[3]), .B(i_div_ratio[2]), .C(i_div_ratio[1]), .D(
        n47), .Y(N8) );
  XNOR2X1M U84 ( .A(N34), .B(counter[6]), .Y(n51) );
  XNOR2X1M U85 ( .A(N33), .B(counter[5]), .Y(n50) );
  XNOR2X1M U86 ( .A(N32), .B(counter[4]), .Y(n49) );
  XNOR2X1M U87 ( .A(N31), .B(counter[3]), .Y(n48) );
  NAND4X1M U88 ( .A(n51), .B(n50), .C(n49), .D(n48), .Y(n59) );
  NOR2BX1M U89 ( .AN(N28), .B(counter[0]), .Y(n52) );
  OAI2B2X1M U90 ( .A1N(counter[1]), .A0(n52), .B0(N29), .B1(n52), .Y(n55) );
  NOR2BX1M U91 ( .AN(counter[0]), .B(N28), .Y(n53) );
  OAI2B2X1M U92 ( .A1N(N29), .A0(n53), .B0(counter[1]), .B1(n53), .Y(n54) );
  NAND3BX1M U93 ( .AN(N36), .B(n55), .C(n54), .Y(n58) );
  CLKXOR2X2M U94 ( .A(N35), .B(counter[7]), .Y(n57) );
  CLKXOR2X2M U95 ( .A(N30), .B(counter[2]), .Y(n56) );
  NOR4X1M U96 ( .A(n59), .B(n58), .C(n57), .D(n56), .Y(N37) );
endmodule


module int_clk_div_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module int_clk_div_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N8, flag, N17, N19, N20, N21, N22, N23, N24, N25, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N41, N42, N43, N44, N45, N46, N47, N48,
         N62, N63, N64, N65, N66, N67, N68, N69, \sub_19/carry[7] ,
         \sub_19/carry[6] , \sub_19/carry[5] , \sub_19/carry[4] ,
         \sub_19/carry[3] , \sub_19/carry[2] , \sub_19/carry[1] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73;
  wire   [7:0] half_togg_pl;
  wire   [7:0] counter;

  int_clk_div_1_DW01_inc_0 add_38 ( .A(counter), .SUM({N48, N47, N46, N45, N44, 
        N43, N42, N41}) );
  DFFRQX2M flag_reg ( .D(n60), .CK(i_ref_clk), .RN(n2), .Q(flag) );
  DFFRX1M div_clk_reg_reg ( .D(n61), .CK(i_ref_clk), .RN(n2), .QN(n73) );
  DFFRQX2M \counter_reg[7]  ( .D(N69), .CK(i_ref_clk), .RN(n2), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N68), .CK(i_ref_clk), .RN(n2), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N67), .CK(i_ref_clk), .RN(n2), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N66), .CK(i_ref_clk), .RN(n2), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N65), .CK(i_ref_clk), .RN(n2), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N64), .CK(i_ref_clk), .RN(n2), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N63), .CK(i_ref_clk), .RN(n2), .Q(counter[1])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N62), .CK(i_ref_clk), .RN(n2), .Q(counter[0])
         );
  OAI2BB2X1M U11 ( .B0(n70), .B1(n73), .A0N(i_ref_clk), .A1N(n70), .Y(n71) );
  NOR3X2M U3 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n7), .Y(N24) );
  XNOR2X2M U4 ( .A(i_div_ratio[0]), .B(N17), .Y(half_togg_pl[0]) );
  XNOR2X2M U5 ( .A(i_div_ratio[7]), .B(\sub_19/carry[7] ), .Y(half_togg_pl[7])
         );
  CLKINVX1M U6 ( .A(half_togg_pl[0]), .Y(N28) );
  AOI21BX2M U7 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n4), .Y(n1) );
  INVX2M U8 ( .A(i_div_ratio[1]), .Y(N17) );
  INVX4M U9 ( .A(n3), .Y(n2) );
  ADDFX2M U10 ( .A(i_div_ratio[1]), .B(n15), .CI(\sub_19/carry[1] ), .CO(
        \sub_19/carry[2] ), .S(half_togg_pl[1]) );
  INVX2M U12 ( .A(i_div_ratio[2]), .Y(n15) );
  NAND2BX4M U13 ( .AN(n69), .B(n68), .Y(n65) );
  AOI2B1X2M U14 ( .A1N(i_div_ratio[0]), .A0(N25), .B0(n66), .Y(n68) );
  NOR2BX2M U15 ( .AN(N42), .B(n65), .Y(N63) );
  NOR2BX2M U16 ( .AN(N43), .B(n65), .Y(N64) );
  NOR2BX2M U17 ( .AN(N44), .B(n65), .Y(N65) );
  NOR2BX2M U18 ( .AN(N45), .B(n65), .Y(N66) );
  NOR2BX2M U19 ( .AN(N46), .B(n65), .Y(N67) );
  NOR2BX2M U20 ( .AN(N47), .B(n65), .Y(N68) );
  INVX2M U21 ( .A(i_rst_n), .Y(n3) );
  OAI2B2X1M U22 ( .A1N(n72), .A0(o_div_clk), .B0(n72), .B1(n73), .Y(n61) );
  NOR2X2M U23 ( .A(n69), .B(n68), .Y(n72) );
  NAND2X2M U24 ( .A(i_clk_en), .B(N8), .Y(n70) );
  NOR2BX2M U25 ( .AN(N48), .B(n65), .Y(N69) );
  NOR2BX2M U26 ( .AN(N41), .B(n65), .Y(N62) );
  AND2X2M U27 ( .A(i_div_ratio[0]), .B(n64), .Y(n66) );
  AO2B2X2M U28 ( .B0(N25), .B1(flag), .A0(N37), .A1N(flag), .Y(n64) );
  INVX2M U29 ( .A(counter[0]), .Y(n46) );
  NOR2X2M U30 ( .A(n67), .B(n69), .Y(n60) );
  XNOR2X2M U31 ( .A(n66), .B(flag), .Y(n67) );
  OAI2BB1X2M U32 ( .A0N(n63), .A1N(n62), .B0(i_clk_en), .Y(n69) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n62) );
  NOR3X2M U34 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n63) );
  ADDFX2M U35 ( .A(i_div_ratio[2]), .B(n13), .CI(\sub_19/carry[2] ), .CO(
        \sub_19/carry[3] ), .S(half_togg_pl[2]) );
  INVX2M U36 ( .A(i_div_ratio[3]), .Y(n13) );
  ADDFX2M U37 ( .A(i_div_ratio[3]), .B(n12), .CI(\sub_19/carry[3] ), .CO(
        \sub_19/carry[4] ), .S(half_togg_pl[3]) );
  INVX2M U38 ( .A(i_div_ratio[4]), .Y(n12) );
  ADDFX2M U39 ( .A(i_div_ratio[4]), .B(n11), .CI(\sub_19/carry[4] ), .CO(
        \sub_19/carry[5] ), .S(half_togg_pl[4]) );
  INVX2M U40 ( .A(i_div_ratio[5]), .Y(n11) );
  ADDFX2M U41 ( .A(i_div_ratio[5]), .B(n10), .CI(\sub_19/carry[5] ), .CO(
        \sub_19/carry[6] ), .S(half_togg_pl[5]) );
  INVX2M U42 ( .A(i_div_ratio[6]), .Y(n10) );
  ADDFX2M U43 ( .A(i_div_ratio[6]), .B(n9), .CI(\sub_19/carry[6] ), .CO(
        \sub_19/carry[7] ), .S(half_togg_pl[6]) );
  INVX2M U44 ( .A(i_div_ratio[7]), .Y(n9) );
  NOR2BX8M U45 ( .AN(n71), .B(n3), .Y(o_div_clk) );
  OR2X1M U46 ( .A(N17), .B(i_div_ratio[0]), .Y(\sub_19/carry[1] ) );
  NAND2BX1M U47 ( .AN(i_div_ratio[2]), .B(N17), .Y(n4) );
  OR2X1M U48 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1X1M U49 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(N19) );
  OR2X1M U50 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  OAI2BB1X1M U51 ( .A0N(n5), .A1N(i_div_ratio[4]), .B0(n6), .Y(N20) );
  OR2X1M U52 ( .A(n6), .B(i_div_ratio[5]), .Y(n7) );
  OAI2BB1X1M U53 ( .A0N(n6), .A1N(i_div_ratio[5]), .B0(n7), .Y(N21) );
  XNOR2X1M U54 ( .A(i_div_ratio[6]), .B(n7), .Y(N22) );
  OAI21X1M U55 ( .A0(i_div_ratio[6]), .A1(n7), .B0(i_div_ratio[7]), .Y(n8) );
  NAND2BX1M U56 ( .AN(N24), .B(n8), .Y(N23) );
  NAND2BX1M U57 ( .AN(half_togg_pl[1]), .B(N28), .Y(n29) );
  OAI2BB1X1M U58 ( .A0N(half_togg_pl[0]), .A1N(half_togg_pl[1]), .B0(n29), .Y(
        N29) );
  OR2X1M U59 ( .A(n29), .B(half_togg_pl[2]), .Y(n30) );
  OAI2BB1X1M U60 ( .A0N(n29), .A1N(half_togg_pl[2]), .B0(n30), .Y(N30) );
  OR2X1M U61 ( .A(n30), .B(half_togg_pl[3]), .Y(n31) );
  OAI2BB1X1M U62 ( .A0N(n30), .A1N(half_togg_pl[3]), .B0(n31), .Y(N31) );
  OR2X1M U63 ( .A(n31), .B(half_togg_pl[4]), .Y(n32) );
  OAI2BB1X1M U64 ( .A0N(n31), .A1N(half_togg_pl[4]), .B0(n32), .Y(N32) );
  OR2X1M U65 ( .A(n32), .B(half_togg_pl[5]), .Y(n33) );
  OAI2BB1X1M U66 ( .A0N(n32), .A1N(half_togg_pl[5]), .B0(n33), .Y(N33) );
  OR2X1M U67 ( .A(n33), .B(half_togg_pl[6]), .Y(n34) );
  OAI2BB1X1M U68 ( .A0N(n33), .A1N(half_togg_pl[6]), .B0(n34), .Y(N34) );
  NOR2X1M U69 ( .A(n34), .B(half_togg_pl[7]), .Y(N36) );
  AO21XLM U70 ( .A0(n34), .A1(half_togg_pl[7]), .B0(N36), .Y(N35) );
  XNOR2X1M U71 ( .A(N19), .B(counter[2]), .Y(n45) );
  NOR2X1M U72 ( .A(n46), .B(N17), .Y(n35) );
  OAI22X1M U73 ( .A0(counter[1]), .A1(n35), .B0(n35), .B1(n1), .Y(n44) );
  CLKNAND2X2M U74 ( .A(N17), .B(n46), .Y(n36) );
  AOI22X1M U75 ( .A0(n36), .A1(n1), .B0(n36), .B1(counter[1]), .Y(n37) );
  NOR3X1M U76 ( .A(n37), .B(N24), .C(counter[7]), .Y(n43) );
  CLKXOR2X2M U77 ( .A(N20), .B(counter[3]), .Y(n41) );
  CLKXOR2X2M U78 ( .A(N21), .B(counter[4]), .Y(n40) );
  CLKXOR2X2M U79 ( .A(N22), .B(counter[5]), .Y(n39) );
  CLKXOR2X2M U80 ( .A(N23), .B(counter[6]), .Y(n38) );
  NOR4X1M U81 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(n42) );
  AND4X1M U82 ( .A(n45), .B(n44), .C(n43), .D(n42), .Y(N25) );
  OR4X1M U83 ( .A(i_div_ratio[5]), .B(i_div_ratio[4]), .C(i_div_ratio[7]), .D(
        i_div_ratio[6]), .Y(n47) );
  OR4X1M U84 ( .A(i_div_ratio[3]), .B(i_div_ratio[2]), .C(i_div_ratio[1]), .D(
        n47), .Y(N8) );
  XNOR2X1M U85 ( .A(N34), .B(counter[6]), .Y(n51) );
  XNOR2X1M U86 ( .A(N33), .B(counter[5]), .Y(n50) );
  XNOR2X1M U87 ( .A(N32), .B(counter[4]), .Y(n49) );
  XNOR2X1M U88 ( .A(N31), .B(counter[3]), .Y(n48) );
  NAND4X1M U89 ( .A(n51), .B(n50), .C(n49), .D(n48), .Y(n59) );
  NOR2BX1M U90 ( .AN(N28), .B(counter[0]), .Y(n52) );
  OAI2B2X1M U91 ( .A1N(counter[1]), .A0(n52), .B0(N29), .B1(n52), .Y(n55) );
  NOR2BX1M U92 ( .AN(counter[0]), .B(N28), .Y(n53) );
  OAI2B2X1M U93 ( .A1N(N29), .A0(n53), .B0(counter[1]), .B1(n53), .Y(n54) );
  NAND3BX1M U94 ( .AN(N36), .B(n55), .C(n54), .Y(n58) );
  CLKXOR2X2M U95 ( .A(N35), .B(counter[7]), .Y(n57) );
  CLKXOR2X2M U96 ( .A(N30), .B(counter[2]), .Y(n56) );
  NOR4X1M U97 ( .A(n59), .B(n58), .C(n57), .D(n56), .Y(N37) );
endmodule


module CLK_MUX ( Prescale, div_ratio_rx );
  input [5:0] Prescale;
  output [7:0] div_ratio_rx;
  wire   n1, n2, n3;
  assign div_ratio_rx[3] = 1'b0;
  assign div_ratio_rx[4] = 1'b0;
  assign div_ratio_rx[5] = 1'b0;
  assign div_ratio_rx[6] = 1'b0;
  assign div_ratio_rx[7] = 1'b0;

  NOR3BX4M U7 ( .AN(Prescale[4]), .B(Prescale[3]), .C(Prescale[5]), .Y(n3) );
  NOR3BX4M U8 ( .AN(Prescale[3]), .B(Prescale[4]), .C(Prescale[5]), .Y(n1) );
  AND2X2M U3 ( .A(n2), .B(n3), .Y(div_ratio_rx[1]) );
  NOR3X4M U4 ( .A(Prescale[2]), .B(Prescale[1]), .C(Prescale[0]), .Y(n2) );
  OAI21X4M U5 ( .A0(n1), .A1(n3), .B0(n2), .Y(div_ratio_rx[0]) );
  AND2X2M U6 ( .A(n1), .B(n2), .Y(div_ratio_rx[2]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n22, n23, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[4][1] , \u_div/PartRem[4][2] ,
         \u_div/PartRem[4][3] , \u_div/PartRem[4][4] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[5][2] , \u_div/PartRem[5][3] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[7][1] , n1, n4, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  MX2X1M U1 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(n23), 
        .Y(\u_div/PartRem[2][2] ) );
  INVX10M U2 ( .A(n8), .Y(n1) );
  INVX16M U3 ( .A(n1), .Y(quotient[4]) );
  CLKAND2X4M U4 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(n8) );
  AND2X12M U5 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
  INVX12M U6 ( .A(b[5]), .Y(n13) );
  MX2X3M U7 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  MX2X4M U8 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  AND2X6M U9 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(n23) );
  INVX2M U10 ( .A(n4), .Y(quotient[2]) );
  INVX2M U11 ( .A(n23), .Y(n4) );
  AND2X8M U12 ( .A(\u_div/CryTmp[3][5] ), .B(n9), .Y(quotient[3]) );
  BUFX8M U13 ( .A(n22), .Y(quotient[5]) );
  AND2X8M U14 ( .A(\u_div/CryTmp[6][2] ), .B(n7), .Y(quotient[6]) );
  AND4X4M U15 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  MX2X2M U16 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(n23), 
        .Y(\u_div/PartRem[2][3] ) );
  MX2X2M U17 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  MX2X2M U18 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  MX2X2M U19 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  INVX6M U20 ( .A(b[0]), .Y(n18) );
  MX2X2M U21 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2X3M U22 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  MX2X1M U23 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2XLM U24 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  MX2X6M U25 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  MX2X1M U26 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  MX2XLM U27 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  MX2X4M U28 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(n23), .Y(
        \u_div/PartRem[2][1] ) );
  MX2X4M U29 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  AND3X12M U30 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  NOR2X6M U31 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U32 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(n22) );
  XNOR2X1M U33 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  MX2XLM U34 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  INVX8M U35 ( .A(b[4]), .Y(n14) );
  INVX16M U36 ( .A(b[3]), .Y(n15) );
  AND2X4M U37 ( .A(n20), .B(n15), .Y(n19) );
  INVX16M U38 ( .A(b[2]), .Y(n16) );
  AND2X1M U39 ( .A(n19), .B(n16), .Y(n7) );
  MX2XLM U40 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  OR2X2M U41 ( .A(a[7]), .B(n18), .Y(\u_div/CryTmp[7][1] ) );
  INVX16M U42 ( .A(b[1]), .Y(n17) );
  MX2XLM U43 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U44 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U45 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U46 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2XLM U47 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  XNOR2XLM U48 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2XLM U49 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2XLM U50 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2XLM U51 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  OR2X1M U52 ( .A(a[5]), .B(n18), .Y(\u_div/CryTmp[5][1] ) );
  OR2X1M U53 ( .A(a[4]), .B(n18), .Y(\u_div/CryTmp[4][1] ) );
  OR2X1M U54 ( .A(a[3]), .B(n18), .Y(\u_div/CryTmp[3][1] ) );
  OR2X1M U55 ( .A(a[2]), .B(n18), .Y(\u_div/CryTmp[2][1] ) );
  OR2X1M U56 ( .A(a[1]), .B(n18), .Y(\u_div/CryTmp[1][1] ) );
  OR2X1M U57 ( .A(a[6]), .B(n18), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2XLM U58 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2XLM U59 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  AND2X1M U60 ( .A(n21), .B(n13), .Y(n9) );
  NAND2X2M U61 ( .A(b[0]), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U62 ( .A(a[0]), .Y(n10) );
  INVX2M U63 ( .A(b[6]), .Y(n12) );
  INVX2M U64 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U65 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U66 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U67 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U68 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U69 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVXLM U1 ( .A(B[0]), .Y(n9) );
  INVXLM U2 ( .A(B[1]), .Y(n8) );
  INVXLM U3 ( .A(B[4]), .Y(n5) );
  INVXLM U4 ( .A(B[2]), .Y(n7) );
  INVXLM U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U7 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  OR2X2M U9 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  INVX2M U10 ( .A(B[5]), .Y(n4) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XLM U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  OAI21BX2M U2 ( .A0(n12), .A1(n13), .B0N(n14), .Y(n10) );
  OAI21XLM U3 ( .A0(A[12]), .A1(n10), .B0(B[12]), .Y(n11) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n6) );
  CLKXOR2X2M U5 ( .A(B[13]), .B(n9), .Y(SUM[13]) );
  CLKXOR2X2M U6 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  XNOR2X1M U7 ( .A(n1), .B(n2), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n3), .B(n4), .Y(n2) );
  CLKXOR2X2M U9 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n7), .B(n8), .Y(n5) );
  OAI2BB1X1M U11 ( .A0N(n10), .A1N(A[12]), .B0(n11), .Y(n9) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n10), .Y(SUM[12]) );
  XNOR2X1M U13 ( .A(n13), .B(n15), .Y(SUM[11]) );
  NOR2X1M U14 ( .A(n14), .B(n12), .Y(n15) );
  NOR2X1M U15 ( .A(B[11]), .B(A[11]), .Y(n12) );
  AND2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n14) );
  OA21X1M U17 ( .A0(n16), .A1(n17), .B0(n18), .Y(n13) );
  CLKXOR2X2M U18 ( .A(n19), .B(n17), .Y(SUM[10]) );
  AOI2BB1X1M U19 ( .A0N(n1), .A1N(n4), .B0(n3), .Y(n17) );
  AND2X1M U20 ( .A(B[9]), .B(A[9]), .Y(n3) );
  NOR2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n4) );
  OA21X1M U22 ( .A0(n6), .A1(n7), .B0(n8), .Y(n1) );
  CLKNAND2X2M U23 ( .A(B[8]), .B(A[8]), .Y(n8) );
  NOR2X1M U24 ( .A(B[8]), .B(A[8]), .Y(n7) );
  NAND2BX1M U25 ( .AN(n16), .B(n18), .Y(n19) );
  CLKNAND2X2M U26 ( .A(B[10]), .B(A[10]), .Y(n18) );
  NOR2X1M U27 ( .A(B[10]), .B(A[10]), .Y(n16) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, 
        n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n5), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKINVX3M U10 ( .A(B[0]), .Y(n24) );
  CLKINVX3M U11 ( .A(B[1]), .Y(n23) );
  CLKINVX3M U12 ( .A(B[4]), .Y(n20) );
  CLKINVX3M U13 ( .A(B[3]), .Y(n21) );
  CLKINVX3M U14 ( .A(B[2]), .Y(n22) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  AND2X2M U16 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U19 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  AND2X2M U20 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U26 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XOR2XLM U27 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  INVX4M U28 ( .A(B[6]), .Y(n18) );
  INVX4M U29 ( .A(A[0]), .Y(n32) );
  INVX4M U30 ( .A(A[1]), .Y(n31) );
  INVX4M U31 ( .A(A[2]), .Y(n30) );
  XOR2XLM U32 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2XLM U33 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2XLM U34 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2XLM U35 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2XLM U36 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2XLM U37 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  INVX4M U38 ( .A(A[3]), .Y(n29) );
  INVX4M U39 ( .A(A[4]), .Y(n28) );
  INVX4M U40 ( .A(A[5]), .Y(n27) );
  INVX4M U41 ( .A(A[7]), .Y(n25) );
  INVX4M U42 ( .A(A[6]), .Y(n26) );
  CLKXOR2X2M U43 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  INVX4M U44 ( .A(B[7]), .Y(n17) );
  INVX4M U45 ( .A(B[5]), .Y(n19) );
  NOR2X1M U47 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  NOR2X1M U48 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U49 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U50 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U51 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U52 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U53 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U54 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U55 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U56 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U57 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U58 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U59 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U60 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U61 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U62 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U63 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U64 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U65 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U66 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U67 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U68 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U69 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U70 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U71 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U72 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U73 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U74 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U75 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U76 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U77 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U78 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U79 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U80 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U81 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U82 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U83 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U84 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U85 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U86 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U87 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U88 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U89 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U90 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U91 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U92 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U93 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U94 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U95 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
  NOR2X1M U96 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X1M U97 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X1M U98 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X1M U99 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X1M U100 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  NOR2X1M U101 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X1M U102 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X1M U103 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X1M U104 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X1M U105 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X1M U106 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X1M U107 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X1M U108 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X1M U109 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n42, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U77 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({A[7:6], n14, n13, n12, 
        n11, n10, n9}), .b(B), .quotient({N132, N131, N130, N129, N128, N127, 
        N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, A[7:6], n14, n13, 
        n12, n11, n10, n9}), .B({1'b0, B}), .CI(1'b0), .DIFF({N108, N107, N106, 
        N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, A[7:6], n14, n13, 
        n12, n11, n10, n9}), .B({1'b0, B}), .CI(1'b0), .SUM({N99, N98, N97, 
        N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({A[7:6], n14, n13, n12, 
        n11, n10, n9}), .B(B), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, 
        N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(n22), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(n23), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(n23), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(n23), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(n23), .Q(OUT_VALID) );
  DFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(n23), .Q(
        ALU_OUT[1]) );
  NOR2X4M U3 ( .A(n141), .B(n8), .Y(n105) );
  NAND2X4M U4 ( .A(N125), .B(n3), .Y(n6) );
  CLKBUFX4M U7 ( .A(n46), .Y(n20) );
  INVX2M U8 ( .A(B[2]), .Y(n131) );
  INVX2M U9 ( .A(B[3]), .Y(n133) );
  AOI222X1M U10 ( .A0(N115), .A1(n16), .B0(n17), .B1(A[6]), .C0(N131), .C1(n3), 
        .Y(n52) );
  BUFX4M U11 ( .A(n49), .Y(n3) );
  NOR3BX2M U12 ( .AN(n105), .B(n140), .C(ALU_FUN[2]), .Y(n49) );
  BUFX5M U13 ( .A(A[5]), .Y(n14) );
  CLKBUFX6M U14 ( .A(A[4]), .Y(n13) );
  NAND2X2M U15 ( .A(N109), .B(n16), .Y(n4) );
  NAND2X2M U16 ( .A(n9), .B(n18), .Y(n5) );
  AND3X4M U17 ( .A(n4), .B(n5), .C(n6), .Y(n94) );
  AOI31X4M U18 ( .A0(n93), .A1(n94), .A2(n95), .B0(n136), .Y(ALU_OUT_Comb[0])
         );
  XNOR2X2M U19 ( .A(A[6]), .B(B[6]), .Y(n120) );
  CLKBUFX6M U20 ( .A(n41), .Y(n19) );
  INVX2M U21 ( .A(n91), .Y(n138) );
  BUFX4M U22 ( .A(A[1]), .Y(n10) );
  BUFX4M U23 ( .A(A[0]), .Y(n9) );
  AOI21XLM U24 ( .A0(n25), .A1(n127), .B0(B[1]), .Y(n26) );
  OAI21XLM U25 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  OAI21XLM U26 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  INVXLM U27 ( .A(B[0]), .Y(n129) );
  NAND2BXLM U28 ( .AN(n13), .B(B[4]), .Y(n29) );
  INVXLM U29 ( .A(B[4]), .Y(n144) );
  NAND2BXLM U30 ( .AN(B[5]), .B(n14), .Y(n117) );
  INVX2M U31 ( .A(ALU_FUN[0]), .Y(n141) );
  OAI2BB1X2M U32 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U33 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U34 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U35 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U36 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U37 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U38 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  NAND2X4M U39 ( .A(EN), .B(n135), .Y(n32) );
  INVX4M U40 ( .A(EN), .Y(n136) );
  INVX4M U41 ( .A(n7), .Y(n17) );
  INVX4M U42 ( .A(n7), .Y(n18) );
  INVX4M U43 ( .A(n24), .Y(n22) );
  INVX2M U44 ( .A(n24), .Y(n23) );
  AOI22X1M U45 ( .A0(N100), .A1(n50), .B0(N91), .B1(n15), .Y(n93) );
  AOI211X2M U46 ( .A0(n19), .A1(n151), .B0(n96), .C0(n97), .Y(n95) );
  AOI31X2M U47 ( .A0(n81), .A1(n82), .A2(n83), .B0(n136), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U48 ( .A0(N92), .A1(n15), .B0(N110), .B1(n16), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U49 ( .A0(n11), .A1(n138), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U50 ( .A0(N126), .A1(n3), .B0(n19), .B1(n150), .C0(n10), .C1(n17), 
        .Y(n82) );
  AOI31X2M U51 ( .A0(n75), .A1(n76), .A2(n77), .B0(n136), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U52 ( .A0(N102), .A1(n50), .B0(N93), .B1(n15), .Y(n75) );
  AOI221X1M U53 ( .A0(n12), .A1(n138), .B0(n19), .B1(n149), .C0(n78), .Y(n77)
         );
  AOI222X1M U54 ( .A0(N111), .A1(n16), .B0(n11), .B1(n17), .C0(N127), .C1(n3), 
        .Y(n76) );
  AOI31X2M U55 ( .A0(n69), .A1(n70), .A2(n71), .B0(n136), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U56 ( .A0(N103), .A1(n50), .B0(N94), .B1(n15), .Y(n69) );
  AOI221X1M U57 ( .A0(n13), .A1(n138), .B0(n19), .B1(n148), .C0(n72), .Y(n71)
         );
  AOI222X1M U58 ( .A0(N112), .A1(n16), .B0(n12), .B1(n18), .C0(N128), .C1(n3), 
        .Y(n70) );
  AOI31X2M U59 ( .A0(n63), .A1(n64), .A2(n65), .B0(n136), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U60 ( .A0(N104), .A1(n50), .B0(N95), .B1(n15), .Y(n63) );
  AOI221X1M U61 ( .A0(n138), .A1(n14), .B0(n19), .B1(n147), .C0(n66), .Y(n65)
         );
  AOI222X1M U62 ( .A0(N113), .A1(n16), .B0(n13), .B1(n17), .C0(N129), .C1(n3), 
        .Y(n64) );
  INVX2M U63 ( .A(n112), .Y(n132) );
  AOI31X2M U64 ( .A0(n57), .A1(n58), .A2(n59), .B0(n136), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U65 ( .A0(N105), .A1(n50), .B0(N96), .B1(n15), .Y(n57) );
  AOI221X1M U66 ( .A0(n138), .A1(A[6]), .B0(n19), .B1(n146), .C0(n60), .Y(n59)
         );
  AOI222X1M U67 ( .A0(N114), .A1(n16), .B0(n14), .B1(n18), .C0(N130), .C1(n3), 
        .Y(n58) );
  INVX2M U68 ( .A(n126), .Y(N158) );
  INVX2M U69 ( .A(B[6]), .Y(n134) );
  AND4X2M U70 ( .A(N159), .B(n99), .C(n8), .D(n141), .Y(n90) );
  AOI31X2M U71 ( .A0(n38), .A1(n39), .A2(n40), .B0(n136), .Y(ALU_OUT_Comb[7])
         );
  AOI221X1M U72 ( .A0(n19), .A1(n128), .B0(n18), .B1(A[7]), .C0(n43), .Y(n40)
         );
  AOI22X1M U73 ( .A0(N107), .A1(n50), .B0(N98), .B1(n15), .Y(n38) );
  AOI22XLM U74 ( .A0(N132), .A1(n3), .B0(N116), .B1(n16), .Y(n39) );
  AOI21X2M U75 ( .A0(n33), .A1(n34), .B0(n136), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U76 ( .A0(N99), .A1(n15), .B0(n135), .Y(n33) );
  AOI2BB2XLM U78 ( .B0(N117), .B1(n16), .A0N(n128), .A1N(n36), .Y(n34) );
  INVX2M U79 ( .A(n10), .Y(n127) );
  AOI31X2M U80 ( .A0(n51), .A1(n52), .A2(n53), .B0(n136), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U81 ( .A0(N106), .A1(n50), .B0(N97), .B1(n15), .Y(n51) );
  AOI221X1M U82 ( .A0(n138), .A1(A[7]), .B0(n19), .B1(n145), .C0(n54), .Y(n53)
         );
  INVX2M U83 ( .A(n92), .Y(n135) );
  AOI211X2M U84 ( .A0(N108), .A1(n50), .B0(n19), .C0(n21), .Y(n92) );
  INVX2M U85 ( .A(A[7]), .Y(n128) );
  NAND3X4M U86 ( .A(n139), .B(n141), .C(n8), .Y(n36) );
  OAI222X1M U87 ( .A0(n55), .A1(n134), .B0(B[6]), .B1(n56), .C0(n36), .C1(n146), .Y(n54) );
  AOI221X1M U88 ( .A0(A[6]), .A1(n46), .B0(n21), .B1(n145), .C0(n19), .Y(n56)
         );
  AOI221X1M U89 ( .A0(n20), .A1(n145), .B0(A[6]), .B1(n48), .C0(n18), .Y(n55)
         );
  NOR2BX8M U90 ( .AN(n16), .B(n136), .Y(n31) );
  CLKAND2X4M U91 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U92 ( .A(n100), .Y(n137) );
  NOR2X2M U93 ( .A(n107), .B(n137), .Y(n41) );
  INVX2M U94 ( .A(n107), .Y(n139) );
  BUFX4M U95 ( .A(n47), .Y(n21) );
  OAI2BB1X2M U96 ( .A0N(n139), .A1N(n105), .B0(n101), .Y(n47) );
  AND3X2M U97 ( .A(n106), .B(n141), .C(n8), .Y(n46) );
  NAND2X2M U98 ( .A(n99), .B(n105), .Y(n7) );
  INVX2M U99 ( .A(n10), .Y(n150) );
  INVX2M U100 ( .A(n9), .Y(n151) );
  INVX2M U101 ( .A(A[6]), .Y(n145) );
  INVX2M U102 ( .A(n12), .Y(n148) );
  INVX2M U103 ( .A(n11), .Y(n149) );
  INVX2M U104 ( .A(n14), .Y(n146) );
  INVX2M U105 ( .A(n13), .Y(n147) );
  BUFX4M U106 ( .A(n37), .Y(n15) );
  NOR2BX2M U107 ( .AN(n106), .B(n137), .Y(n37) );
  INVX2M U108 ( .A(RST), .Y(n24) );
  CLKBUFX6M U109 ( .A(A[3]), .Y(n12) );
  CLKBUFX6M U110 ( .A(A[2]), .Y(n11) );
  INVX2M U111 ( .A(n25), .Y(n130) );
  AOI221X1M U112 ( .A0(n9), .A1(n20), .B0(n21), .B1(n151), .C0(n19), .Y(n102)
         );
  AOI31X2M U113 ( .A0(N157), .A1(n8), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U114 ( .A(n140), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  AOI221X1M U115 ( .A0(n10), .A1(n46), .B0(n21), .B1(n150), .C0(n19), .Y(n87)
         );
  AOI31X2M U116 ( .A0(N158), .A1(n8), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U117 ( .A(n141), .B(ALU_FUN[2]), .C(n140), .Y(n89) );
  INVX2M U118 ( .A(ALU_FUN[1]), .Y(n140) );
  BUFX4M U119 ( .A(ALU_FUN[3]), .Y(n8) );
  OAI222X1M U120 ( .A0(n44), .A1(n142), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n145), .Y(n43) );
  INVX2M U121 ( .A(B[7]), .Y(n142) );
  AOI221X1M U122 ( .A0(n20), .A1(A[7]), .B0(n21), .B1(n128), .C0(n19), .Y(n45)
         );
  AOI221X1M U123 ( .A0(n20), .A1(n128), .B0(A[7]), .B1(n48), .C0(n17), .Y(n44)
         );
  OAI222X1M U124 ( .A0(n79), .A1(n131), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n150), .Y(n78) );
  AOI221X1M U125 ( .A0(n11), .A1(n46), .B0(n21), .B1(n149), .C0(n19), .Y(n80)
         );
  AOI221X1M U126 ( .A0(n20), .A1(n149), .B0(n11), .B1(n48), .C0(n18), .Y(n79)
         );
  OAI222X1M U127 ( .A0(n73), .A1(n133), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n149), .Y(n72) );
  AOI221X1M U128 ( .A0(n12), .A1(n46), .B0(n21), .B1(n148), .C0(n19), .Y(n74)
         );
  AOI221X1M U129 ( .A0(n20), .A1(n148), .B0(n12), .B1(n48), .C0(n17), .Y(n73)
         );
  OAI222X1M U130 ( .A0(n67), .A1(n144), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n148), .Y(n66) );
  AOI221X1M U131 ( .A0(n13), .A1(n46), .B0(n21), .B1(n147), .C0(n19), .Y(n68)
         );
  AOI221X1M U132 ( .A0(n20), .A1(n147), .B0(n13), .B1(n48), .C0(n18), .Y(n67)
         );
  OAI222X1M U133 ( .A0(n61), .A1(n143), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n147), .Y(n60) );
  INVX2M U134 ( .A(B[5]), .Y(n143) );
  AOI221X1M U135 ( .A0(n14), .A1(n46), .B0(n21), .B1(n146), .C0(n19), .Y(n62)
         );
  AOI221X1M U136 ( .A0(n20), .A1(n146), .B0(n14), .B1(n48), .C0(n17), .Y(n61)
         );
  NOR2X4M U137 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  OAI2B2X1M U138 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n151), .Y(n85) );
  AOI221X1M U139 ( .A0(n20), .A1(n150), .B0(n10), .B1(n48), .C0(n17), .Y(n86)
         );
  OAI2B2X1M U140 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n150), .Y(n97) );
  AOI221X1M U141 ( .A0(n20), .A1(n151), .B0(n9), .B1(n48), .C0(n18), .Y(n98)
         );
  NAND2X2M U142 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND3X2M U143 ( .A(n106), .B(ALU_FUN[0]), .C(n8), .Y(n101) );
  NOR2X2M U144 ( .A(n8), .B(ALU_FUN[0]), .Y(n100) );
  AND2X2M U145 ( .A(ALU_FUN[2]), .B(n140), .Y(n99) );
  NAND3X2M U146 ( .A(n8), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  BUFX4M U147 ( .A(n35), .Y(n16) );
  NOR3X2M U148 ( .A(n137), .B(ALU_FUN[2]), .C(n140), .Y(n35) );
  NOR2X1M U149 ( .A(n128), .B(B[7]), .Y(n123) );
  NAND2BX1M U150 ( .AN(B[4]), .B(n13), .Y(n116) );
  CLKNAND2X2M U151 ( .A(n116), .B(n29), .Y(n118) );
  NOR2X1M U152 ( .A(n133), .B(n12), .Y(n113) );
  NOR2X1M U153 ( .A(n131), .B(n11), .Y(n28) );
  NOR2X1M U154 ( .A(n129), .B(n9), .Y(n25) );
  CLKNAND2X2M U155 ( .A(n11), .B(n131), .Y(n115) );
  NAND2BX1M U156 ( .AN(n28), .B(n115), .Y(n110) );
  AOI211X1M U157 ( .A0(n10), .A1(n130), .B0(n110), .C0(n26), .Y(n27) );
  CLKNAND2X2M U158 ( .A(n12), .B(n133), .Y(n114) );
  OAI31X1M U159 ( .A0(n113), .A1(n28), .A2(n27), .B0(n114), .Y(n30) );
  NAND2BX1M U160 ( .AN(n14), .B(B[5]), .Y(n121) );
  OAI211X1M U161 ( .A0(n118), .A1(n30), .B0(n29), .C0(n121), .Y(n42) );
  AOI32X1M U162 ( .A0(n42), .A1(n117), .A2(n120), .B0(B[6]), .B1(n145), .Y(
        n108) );
  CLKNAND2X2M U163 ( .A(B[7]), .B(n128), .Y(n124) );
  OAI21X1M U164 ( .A0(n123), .A1(n108), .B0(n124), .Y(N159) );
  CLKNAND2X2M U165 ( .A(n9), .B(n129), .Y(n111) );
  OA21X1M U166 ( .A0(n111), .A1(n127), .B0(B[1]), .Y(n109) );
  AOI211X1M U167 ( .A0(n111), .A1(n127), .B0(n110), .C0(n109), .Y(n112) );
  AOI31X1M U168 ( .A0(n132), .A1(n115), .A2(n114), .B0(n113), .Y(n119) );
  OAI2B11X1M U169 ( .A1N(n119), .A0(n118), .B0(n117), .C0(n116), .Y(n122) );
  AOI32X1M U170 ( .A0(n122), .A1(n121), .A2(n120), .B0(A[6]), .B1(n134), .Y(
        n125) );
  AOI2B1X1M U171 ( .A1N(n125), .A0(n124), .B0(n123), .Y(n126) );
  NOR2X1M U172 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module register8_16_addr_width4_MEM_DEPTH16_data_width8_MEM_WIDTH8 ( CLK, WrEn, 
        RdEn, RST, WrData, Address, RdData, RdData_Valid, REG0, REG1, REG2, 
        REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, WrEn, RdEn, RST;
  output RdData_Valid;
  wire   N11, N12, N13, N14, n249, n250, \REG_FILE[15][7] , \REG_FILE[15][6] ,
         \REG_FILE[15][5] , \REG_FILE[15][4] , \REG_FILE[15][3] ,
         \REG_FILE[15][2] , \REG_FILE[15][1] , \REG_FILE[15][0] ,
         \REG_FILE[14][7] , \REG_FILE[14][6] , \REG_FILE[14][5] ,
         \REG_FILE[14][4] , \REG_FILE[14][3] , \REG_FILE[14][2] ,
         \REG_FILE[14][1] , \REG_FILE[14][0] , \REG_FILE[13][7] ,
         \REG_FILE[13][6] , \REG_FILE[13][5] , \REG_FILE[13][4] ,
         \REG_FILE[13][3] , \REG_FILE[13][2] , \REG_FILE[13][1] ,
         \REG_FILE[13][0] , \REG_FILE[12][7] , \REG_FILE[12][6] ,
         \REG_FILE[12][5] , \REG_FILE[12][4] , \REG_FILE[12][3] ,
         \REG_FILE[12][2] , \REG_FILE[12][1] , \REG_FILE[12][0] ,
         \REG_FILE[11][7] , \REG_FILE[11][6] , \REG_FILE[11][5] ,
         \REG_FILE[11][4] , \REG_FILE[11][3] , \REG_FILE[11][2] ,
         \REG_FILE[11][1] , \REG_FILE[11][0] , \REG_FILE[10][7] ,
         \REG_FILE[10][6] , \REG_FILE[10][5] , \REG_FILE[10][4] ,
         \REG_FILE[10][3] , \REG_FILE[10][2] , \REG_FILE[10][1] ,
         \REG_FILE[10][0] , \REG_FILE[9][7] , \REG_FILE[9][6] ,
         \REG_FILE[9][5] , \REG_FILE[9][4] , \REG_FILE[9][3] ,
         \REG_FILE[9][2] , \REG_FILE[9][1] , \REG_FILE[9][0] ,
         \REG_FILE[8][7] , \REG_FILE[8][6] , \REG_FILE[8][5] ,
         \REG_FILE[8][4] , \REG_FILE[8][3] , \REG_FILE[8][2] ,
         \REG_FILE[8][1] , \REG_FILE[8][0] , \REG_FILE[7][7] ,
         \REG_FILE[7][6] , \REG_FILE[7][5] , \REG_FILE[7][4] ,
         \REG_FILE[7][3] , \REG_FILE[7][2] , \REG_FILE[7][1] ,
         \REG_FILE[7][0] , \REG_FILE[6][7] , \REG_FILE[6][6] ,
         \REG_FILE[6][5] , \REG_FILE[6][4] , \REG_FILE[6][3] ,
         \REG_FILE[6][2] , \REG_FILE[6][1] , \REG_FILE[6][0] ,
         \REG_FILE[5][7] , \REG_FILE[5][6] , \REG_FILE[5][5] ,
         \REG_FILE[5][4] , \REG_FILE[5][3] , \REG_FILE[5][2] ,
         \REG_FILE[5][1] , \REG_FILE[5][0] , \REG_FILE[4][7] ,
         \REG_FILE[4][6] , \REG_FILE[4][5] , \REG_FILE[4][4] ,
         \REG_FILE[4][3] , \REG_FILE[4][2] , \REG_FILE[4][1] ,
         \REG_FILE[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRHQX8M \REG_FILE_reg[2][6]  ( .D(n72), .CK(CLK), .RN(n228), .Q(REG2[6])
         );
  DFFRHQX8M \REG_FILE_reg[2][3]  ( .D(n69), .CK(CLK), .RN(n228), .Q(REG2[3])
         );
  DFFRHQX8M \REG_FILE_reg[1][7]  ( .D(n65), .CK(CLK), .RN(n227), .Q(REG1[7])
         );
  DFFRQX2M \RdData_reg[7]  ( .D(n49), .CK(CLK), .RN(n226), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n48), .CK(CLK), .RN(n227), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n47), .CK(CLK), .RN(n226), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n46), .CK(CLK), .RN(n226), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n45), .CK(CLK), .RN(n226), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n44), .CK(CLK), .RN(n226), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n43), .CK(CLK), .RN(n226), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n42), .CK(CLK), .RN(n226), .Q(RdData[0]) );
  DFFRQX2M \REG_FILE_reg[13][7]  ( .D(n161), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[13][7] ) );
  DFFRQX2M \REG_FILE_reg[13][6]  ( .D(n160), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[13][6] ) );
  DFFRQX2M \REG_FILE_reg[13][5]  ( .D(n159), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[13][5] ) );
  DFFRQX2M \REG_FILE_reg[13][4]  ( .D(n158), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[13][4] ) );
  DFFRQX2M \REG_FILE_reg[13][3]  ( .D(n157), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[13][3] ) );
  DFFRQX2M \REG_FILE_reg[13][2]  ( .D(n156), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[13][2] ) );
  DFFRQX2M \REG_FILE_reg[13][1]  ( .D(n155), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[13][1] ) );
  DFFRQX2M \REG_FILE_reg[13][0]  ( .D(n154), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[13][0] ) );
  DFFRQX2M \REG_FILE_reg[9][7]  ( .D(n129), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][7] ) );
  DFFRQX2M \REG_FILE_reg[9][6]  ( .D(n128), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][6] ) );
  DFFRQX2M \REG_FILE_reg[9][5]  ( .D(n127), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][5] ) );
  DFFRQX2M \REG_FILE_reg[9][4]  ( .D(n126), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][4] ) );
  DFFRQX2M \REG_FILE_reg[9][3]  ( .D(n125), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][3] ) );
  DFFRQX2M \REG_FILE_reg[9][2]  ( .D(n124), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][2] ) );
  DFFRQX2M \REG_FILE_reg[9][1]  ( .D(n123), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][1] ) );
  DFFRQX2M \REG_FILE_reg[9][0]  ( .D(n122), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[9][0] ) );
  DFFRQX2M \REG_FILE_reg[5][7]  ( .D(n97), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[5][7] ) );
  DFFRQX2M \REG_FILE_reg[5][6]  ( .D(n96), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[5][6] ) );
  DFFRQX2M \REG_FILE_reg[5][5]  ( .D(n95), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[5][5] ) );
  DFFRQX2M \REG_FILE_reg[5][4]  ( .D(n94), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[5][4] ) );
  DFFRQX2M \REG_FILE_reg[5][3]  ( .D(n93), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[5][3] ) );
  DFFRQX2M \REG_FILE_reg[5][2]  ( .D(n92), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[5][2] ) );
  DFFRQX2M \REG_FILE_reg[5][1]  ( .D(n91), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[5][1] ) );
  DFFRQX2M \REG_FILE_reg[5][0]  ( .D(n90), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[5][0] ) );
  DFFRQX2M \REG_FILE_reg[15][7]  ( .D(n177), .CK(CLK), .RN(n226), .Q(
        \REG_FILE[15][7] ) );
  DFFRQX2M \REG_FILE_reg[15][6]  ( .D(n176), .CK(CLK), .RN(n226), .Q(
        \REG_FILE[15][6] ) );
  DFFRQX2M \REG_FILE_reg[15][5]  ( .D(n175), .CK(CLK), .RN(n236), .Q(
        \REG_FILE[15][5] ) );
  DFFRQX2M \REG_FILE_reg[15][4]  ( .D(n174), .CK(CLK), .RN(n237), .Q(
        \REG_FILE[15][4] ) );
  DFFRQX2M \REG_FILE_reg[15][3]  ( .D(n173), .CK(CLK), .RN(n236), .Q(
        \REG_FILE[15][3] ) );
  DFFRQX2M \REG_FILE_reg[15][2]  ( .D(n172), .CK(CLK), .RN(n237), .Q(
        \REG_FILE[15][2] ) );
  DFFRQX2M \REG_FILE_reg[15][1]  ( .D(n171), .CK(CLK), .RN(n236), .Q(
        \REG_FILE[15][1] ) );
  DFFRQX2M \REG_FILE_reg[15][0]  ( .D(n170), .CK(CLK), .RN(n238), .Q(
        \REG_FILE[15][0] ) );
  DFFRQX2M \REG_FILE_reg[11][7]  ( .D(n145), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[11][7] ) );
  DFFRQX2M \REG_FILE_reg[11][6]  ( .D(n144), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[11][6] ) );
  DFFRQX2M \REG_FILE_reg[11][5]  ( .D(n143), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][5] ) );
  DFFRQX2M \REG_FILE_reg[11][4]  ( .D(n142), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][4] ) );
  DFFRQX2M \REG_FILE_reg[11][3]  ( .D(n141), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][3] ) );
  DFFRQX2M \REG_FILE_reg[11][2]  ( .D(n140), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][2] ) );
  DFFRQX2M \REG_FILE_reg[11][1]  ( .D(n139), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][1] ) );
  DFFRQX2M \REG_FILE_reg[11][0]  ( .D(n138), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[11][0] ) );
  DFFRQX2M \REG_FILE_reg[7][7]  ( .D(n113), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][7] ) );
  DFFRQX2M \REG_FILE_reg[7][6]  ( .D(n112), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][6] ) );
  DFFRQX2M \REG_FILE_reg[7][5]  ( .D(n111), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][5] ) );
  DFFRQX2M \REG_FILE_reg[7][4]  ( .D(n110), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][4] ) );
  DFFRQX2M \REG_FILE_reg[7][3]  ( .D(n109), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][3] ) );
  DFFRQX2M \REG_FILE_reg[7][2]  ( .D(n108), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][2] ) );
  DFFRQX2M \REG_FILE_reg[7][1]  ( .D(n107), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][1] ) );
  DFFRQX2M \REG_FILE_reg[7][0]  ( .D(n106), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[7][0] ) );
  DFFRQX2M \REG_FILE_reg[14][7]  ( .D(n169), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][7] ) );
  DFFRQX2M \REG_FILE_reg[14][6]  ( .D(n168), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][6] ) );
  DFFRQX2M \REG_FILE_reg[14][5]  ( .D(n167), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][5] ) );
  DFFRQX2M \REG_FILE_reg[14][4]  ( .D(n166), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][4] ) );
  DFFRQX2M \REG_FILE_reg[14][3]  ( .D(n165), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][3] ) );
  DFFRQX2M \REG_FILE_reg[14][2]  ( .D(n164), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][2] ) );
  DFFRQX2M \REG_FILE_reg[14][1]  ( .D(n163), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][1] ) );
  DFFRQX2M \REG_FILE_reg[14][0]  ( .D(n162), .CK(CLK), .RN(n235), .Q(
        \REG_FILE[14][0] ) );
  DFFRQX2M \REG_FILE_reg[10][7]  ( .D(n137), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][7] ) );
  DFFRQX2M \REG_FILE_reg[10][6]  ( .D(n136), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][6] ) );
  DFFRQX2M \REG_FILE_reg[10][5]  ( .D(n135), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][5] ) );
  DFFRQX2M \REG_FILE_reg[10][4]  ( .D(n134), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][4] ) );
  DFFRQX2M \REG_FILE_reg[10][3]  ( .D(n133), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][3] ) );
  DFFRQX2M \REG_FILE_reg[10][2]  ( .D(n132), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][2] ) );
  DFFRQX2M \REG_FILE_reg[10][1]  ( .D(n131), .CK(CLK), .RN(n233), .Q(
        \REG_FILE[10][1] ) );
  DFFRQX2M \REG_FILE_reg[10][0]  ( .D(n130), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[10][0] ) );
  DFFRQX2M \REG_FILE_reg[6][7]  ( .D(n105), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][7] ) );
  DFFRQX2M \REG_FILE_reg[6][6]  ( .D(n104), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][6] ) );
  DFFRQX2M \REG_FILE_reg[6][5]  ( .D(n103), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][5] ) );
  DFFRQX2M \REG_FILE_reg[6][4]  ( .D(n102), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][4] ) );
  DFFRQX2M \REG_FILE_reg[6][3]  ( .D(n101), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][3] ) );
  DFFRQX2M \REG_FILE_reg[6][2]  ( .D(n100), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][2] ) );
  DFFRQX2M \REG_FILE_reg[6][1]  ( .D(n99), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][1] ) );
  DFFRQX2M \REG_FILE_reg[6][0]  ( .D(n98), .CK(CLK), .RN(n230), .Q(
        \REG_FILE[6][0] ) );
  DFFRQX2M \REG_FILE_reg[12][7]  ( .D(n153), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][7] ) );
  DFFRQX2M \REG_FILE_reg[12][6]  ( .D(n152), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][6] ) );
  DFFRQX2M \REG_FILE_reg[12][5]  ( .D(n151), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][5] ) );
  DFFRQX2M \REG_FILE_reg[12][4]  ( .D(n150), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][4] ) );
  DFFRQX2M \REG_FILE_reg[12][3]  ( .D(n149), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][3] ) );
  DFFRQX2M \REG_FILE_reg[12][2]  ( .D(n148), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][2] ) );
  DFFRQX2M \REG_FILE_reg[12][1]  ( .D(n147), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][1] ) );
  DFFRQX2M \REG_FILE_reg[12][0]  ( .D(n146), .CK(CLK), .RN(n234), .Q(
        \REG_FILE[12][0] ) );
  DFFRQX2M \REG_FILE_reg[8][7]  ( .D(n121), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[8][7] ) );
  DFFRQX2M \REG_FILE_reg[8][6]  ( .D(n120), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[8][6] ) );
  DFFRQX2M \REG_FILE_reg[8][5]  ( .D(n119), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[8][5] ) );
  DFFRQX2M \REG_FILE_reg[8][4]  ( .D(n118), .CK(CLK), .RN(n232), .Q(
        \REG_FILE[8][4] ) );
  DFFRQX2M \REG_FILE_reg[8][3]  ( .D(n117), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[8][3] ) );
  DFFRQX2M \REG_FILE_reg[8][2]  ( .D(n116), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[8][2] ) );
  DFFRQX2M \REG_FILE_reg[8][1]  ( .D(n115), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[8][1] ) );
  DFFRQX2M \REG_FILE_reg[8][0]  ( .D(n114), .CK(CLK), .RN(n231), .Q(
        \REG_FILE[8][0] ) );
  DFFRQX2M \REG_FILE_reg[4][7]  ( .D(n89), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][7] ) );
  DFFRQX2M \REG_FILE_reg[4][6]  ( .D(n88), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][6] ) );
  DFFRQX2M \REG_FILE_reg[4][5]  ( .D(n87), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][5] ) );
  DFFRQX2M \REG_FILE_reg[4][4]  ( .D(n86), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][4] ) );
  DFFRQX2M \REG_FILE_reg[4][3]  ( .D(n85), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][3] ) );
  DFFRQX2M \REG_FILE_reg[4][2]  ( .D(n84), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][2] ) );
  DFFRQX2M \REG_FILE_reg[4][1]  ( .D(n83), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][1] ) );
  DFFRQX2M \REG_FILE_reg[4][0]  ( .D(n82), .CK(CLK), .RN(n229), .Q(
        \REG_FILE[4][0] ) );
  DFFRQX2M \REG_FILE_reg[2][1]  ( .D(n67), .CK(CLK), .RN(n228), .Q(REG2[1]) );
  DFFRQX2M \REG_FILE_reg[3][0]  ( .D(n74), .CK(CLK), .RN(n228), .Q(REG3[0]) );
  DFFSQX4M \REG_FILE_reg[2][7]  ( .D(n73), .CK(CLK), .SN(n226), .Q(REG2[7]) );
  DFFSQX4M \REG_FILE_reg[3][5]  ( .D(n79), .CK(CLK), .SN(n226), .Q(REG3[5]) );
  DFFRQX2M RdData_Valid_reg ( .D(n41), .CK(CLK), .RN(n231), .Q(RdData_Valid)
         );
  DFFRQX4M \REG_FILE_reg[3][3]  ( .D(n77), .CK(CLK), .RN(n228), .Q(REG3[3]) );
  DFFRQX4M \REG_FILE_reg[3][2]  ( .D(n76), .CK(CLK), .RN(n228), .Q(REG3[2]) );
  DFFRQX4M \REG_FILE_reg[3][4]  ( .D(n78), .CK(CLK), .RN(n228), .Q(REG3[4]) );
  DFFRQX4M \REG_FILE_reg[3][1]  ( .D(n75), .CK(CLK), .RN(n228), .Q(REG3[1]) );
  DFFRQX4M \REG_FILE_reg[3][6]  ( .D(n80), .CK(CLK), .RN(n229), .Q(REG3[6]) );
  DFFRQX4M \REG_FILE_reg[2][5]  ( .D(n71), .CK(CLK), .RN(n228), .Q(REG2[5]) );
  DFFRQX4M \REG_FILE_reg[2][2]  ( .D(n68), .CK(CLK), .RN(n228), .Q(REG2[2]) );
  DFFRQX2M \REG_FILE_reg[0][2]  ( .D(n52), .CK(CLK), .RN(n227), .Q(REG0[2]) );
  DFFRQX2M \REG_FILE_reg[0][1]  ( .D(n51), .CK(CLK), .RN(n226), .Q(REG0[1]) );
  DFFRQX2M \REG_FILE_reg[0][0]  ( .D(n50), .CK(CLK), .RN(n226), .Q(REG0[0]) );
  DFFRQX2M \REG_FILE_reg[0][3]  ( .D(n53), .CK(CLK), .RN(n227), .Q(REG0[3]) );
  DFFRQX4M \REG_FILE_reg[1][2]  ( .D(n60), .CK(CLK), .RN(n227), .Q(REG1[2]) );
  DFFRQX4M \REG_FILE_reg[1][1]  ( .D(n59), .CK(CLK), .RN(n227), .Q(REG1[1]) );
  DFFSQX2M \REG_FILE_reg[2][0]  ( .D(n66), .CK(CLK), .SN(n226), .Q(REG2[0]) );
  DFFRHQX8M \REG_FILE_reg[0][6]  ( .D(n56), .CK(CLK), .RN(n227), .Q(REG0[6])
         );
  DFFRHQX8M \REG_FILE_reg[1][6]  ( .D(n64), .CK(CLK), .RN(n228), .Q(REG1[6])
         );
  DFFRQX2M \REG_FILE_reg[0][4]  ( .D(n54), .CK(CLK), .RN(n227), .Q(REG0[4]) );
  DFFRQX2M \REG_FILE_reg[0][5]  ( .D(n55), .CK(CLK), .RN(n227), .Q(REG0[5]) );
  DFFRQX4M \REG_FILE_reg[1][3]  ( .D(n61), .CK(CLK), .RN(n227), .Q(REG1[3]) );
  DFFRHQX8M \REG_FILE_reg[1][0]  ( .D(n58), .CK(CLK), .RN(n227), .Q(REG1[0])
         );
  DFFRQX4M \REG_FILE_reg[3][7]  ( .D(n81), .CK(CLK), .RN(n229), .Q(REG3[7]) );
  DFFRQX4M \REG_FILE_reg[2][4]  ( .D(n70), .CK(CLK), .RN(n228), .Q(REG2[4]) );
  DFFRQX4M \REG_FILE_reg[0][7]  ( .D(n57), .CK(CLK), .RN(n227), .Q(REG0[7]) );
  DFFRQX2M \REG_FILE_reg[1][5]  ( .D(n63), .CK(CLK), .RN(n228), .Q(n249) );
  DFFRQX4M \REG_FILE_reg[1][4]  ( .D(n62), .CK(CLK), .RN(n227), .Q(n250) );
  CLKINVX8M U3 ( .A(n250), .Y(n2) );
  BUFX16M U4 ( .A(n249), .Y(REG1[5]) );
  CLKNAND2X2M U5 ( .A(n21), .B(n19), .Y(n22) );
  CLKNAND2X2M U6 ( .A(n16), .B(n17), .Y(n15) );
  CLKBUFX4M U7 ( .A(n18), .Y(n220) );
  CLKNAND2X2M U8 ( .A(n24), .B(n17), .Y(n23) );
  CLKNAND2X2M U9 ( .A(n24), .B(n19), .Y(n25) );
  CLKNAND2X2M U10 ( .A(n27), .B(n17), .Y(n26) );
  CLKNAND2X2M U11 ( .A(n27), .B(n19), .Y(n29) );
  CLKNAND2X2M U12 ( .A(n31), .B(n16), .Y(n30) );
  CLKNAND2X2M U13 ( .A(n33), .B(n16), .Y(n32) );
  CLKNAND2X2M U14 ( .A(n31), .B(n21), .Y(n34) );
  CLKNAND2X2M U15 ( .A(n33), .B(n21), .Y(n35) );
  CLKNAND2X2M U16 ( .A(n31), .B(n24), .Y(n36) );
  CLKNAND2X2M U17 ( .A(n33), .B(n24), .Y(n37) );
  CLKNAND2X2M U18 ( .A(n31), .B(n27), .Y(n38) );
  CLKNAND2X2M U19 ( .A(n33), .B(n27), .Y(n40) );
  INVX24M U20 ( .A(n2), .Y(REG1[4]) );
  AND2X2M U21 ( .A(N13), .B(n224), .Y(n27) );
  AND2X2M U22 ( .A(N13), .B(n225), .Y(n24) );
  NOR2BX1M U23 ( .AN(n13), .B(N14), .Y(n28) );
  CLKBUFX6M U24 ( .A(n222), .Y(n204) );
  CLKBUFX6M U25 ( .A(n222), .Y(n205) );
  AND2X2M U26 ( .A(n39), .B(n223), .Y(n31) );
  AND2X2M U27 ( .A(n28), .B(n223), .Y(n17) );
  NOR2X3M U28 ( .A(n225), .B(N13), .Y(n21) );
  NOR2X3M U29 ( .A(n224), .B(N13), .Y(n16) );
  MX4XLM U30 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n204), 
        .S1(n201), .Y(n180) );
  MX4XLM U31 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n204), 
        .S1(n201), .Y(n184) );
  MX4XLM U32 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n205), 
        .S1(n201), .Y(n188) );
  MX4XLM U33 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n205), 
        .S1(n202), .Y(n192) );
  MX4XLM U34 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n205), 
        .S1(n202), .Y(n196) );
  MX4XLM U35 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n205), 
        .S1(n202), .Y(n200) );
  OAI2BB2XLM U36 ( .B0(n15), .B1(n243), .A0N(REG0[4]), .A1N(n221), .Y(n54) );
  OAI2BB2XLM U37 ( .B0(n15), .B1(n242), .A0N(REG0[5]), .A1N(n221), .Y(n55) );
  OAI2BB2XLM U38 ( .B0(n15), .B1(n241), .A0N(REG0[7]), .A1N(n221), .Y(n57) );
  OAI2BB2XLM U39 ( .B0(n247), .B1(n220), .A0N(REG1[0]), .A1N(n220), .Y(n58) );
  OAI2BB2XLM U40 ( .B0(n246), .B1(n18), .A0N(REG1[1]), .A1N(n220), .Y(n59) );
  OAI2BB2XLM U41 ( .B0(n245), .B1(n18), .A0N(REG1[2]), .A1N(n220), .Y(n60) );
  OAI2BB2XLM U42 ( .B0(n244), .B1(n18), .A0N(REG1[3]), .A1N(n220), .Y(n61) );
  OAI2BB2XLM U43 ( .B0(n243), .B1(n18), .A0N(REG1[4]), .A1N(n220), .Y(n62) );
  OAI2BB2XLM U44 ( .B0(n221), .B1(n248), .A0N(REG0[6]), .A1N(n221), .Y(n56) );
  OAI2BB2XLM U45 ( .B0(n248), .B1(n18), .A0N(REG1[6]), .A1N(n220), .Y(n64) );
  MX4XLM U46 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n203), 
        .S1(n202), .Y(n7) );
  MX4XLM U47 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n204), 
        .S1(n201), .Y(n11) );
  INVX6M U48 ( .A(WrData[6]), .Y(n248) );
  CLKBUFX6M U49 ( .A(n224), .Y(n201) );
  CLKBUFX6M U50 ( .A(n224), .Y(n202) );
  BUFX4M U51 ( .A(n30), .Y(n213) );
  BUFX4M U52 ( .A(n32), .Y(n212) );
  BUFX4M U53 ( .A(n34), .Y(n211) );
  BUFX4M U54 ( .A(n35), .Y(n210) );
  BUFX4M U55 ( .A(n20), .Y(n219) );
  BUFX4M U56 ( .A(n22), .Y(n218) );
  BUFX4M U57 ( .A(n15), .Y(n221) );
  BUFX4M U58 ( .A(n23), .Y(n217) );
  BUFX4M U59 ( .A(n25), .Y(n216) );
  BUFX4M U60 ( .A(n26), .Y(n215) );
  BUFX4M U61 ( .A(n29), .Y(n214) );
  BUFX4M U62 ( .A(n36), .Y(n209) );
  BUFX4M U63 ( .A(n37), .Y(n208) );
  BUFX4M U64 ( .A(n38), .Y(n207) );
  BUFX4M U65 ( .A(n40), .Y(n206) );
  BUFX4M U66 ( .A(n222), .Y(n203) );
  INVX4M U67 ( .A(n14), .Y(n239) );
  CLKBUFX6M U68 ( .A(n238), .Y(n226) );
  CLKBUFX6M U69 ( .A(n237), .Y(n228) );
  CLKBUFX6M U70 ( .A(n237), .Y(n229) );
  CLKBUFX6M U71 ( .A(n237), .Y(n230) );
  CLKBUFX6M U72 ( .A(n238), .Y(n231) );
  CLKBUFX6M U73 ( .A(n236), .Y(n232) );
  CLKBUFX6M U74 ( .A(n238), .Y(n233) );
  CLKBUFX6M U75 ( .A(n236), .Y(n234) );
  CLKBUFX6M U76 ( .A(n236), .Y(n235) );
  CLKBUFX6M U77 ( .A(n237), .Y(n227) );
  NOR2X2M U78 ( .A(n240), .B(RdEn), .Y(n13) );
  INVX2M U79 ( .A(WrEn), .Y(n240) );
  AND2X2M U80 ( .A(n28), .B(n222), .Y(n19) );
  AND2X2M U81 ( .A(n39), .B(n222), .Y(n33) );
  NAND2X2M U82 ( .A(n19), .B(n16), .Y(n18) );
  NAND2X2M U83 ( .A(n21), .B(n17), .Y(n20) );
  NAND2X4M U84 ( .A(RdEn), .B(n240), .Y(n14) );
  BUFX2M U85 ( .A(n238), .Y(n237) );
  BUFX2M U86 ( .A(n238), .Y(n236) );
  INVX6M U87 ( .A(WrData[0]), .Y(n247) );
  INVX6M U88 ( .A(WrData[5]), .Y(n242) );
  INVX6M U89 ( .A(WrData[7]), .Y(n241) );
  AND2X1M U90 ( .A(N14), .B(n13), .Y(n39) );
  INVX2M U91 ( .A(n225), .Y(n224) );
  INVX2M U92 ( .A(n223), .Y(n222) );
  INVX6M U93 ( .A(WrData[1]), .Y(n246) );
  INVX6M U94 ( .A(WrData[2]), .Y(n245) );
  INVX6M U95 ( .A(WrData[3]), .Y(n244) );
  INVX6M U96 ( .A(WrData[4]), .Y(n243) );
  BUFX2M U97 ( .A(RST), .Y(n238) );
  OAI2BB2X1M U98 ( .B0(n248), .B1(n20), .A0N(REG2[6]), .A1N(n219), .Y(n72) );
  OAI2BB2X1M U99 ( .B0(n248), .B1(n22), .A0N(REG3[6]), .A1N(n218), .Y(n80) );
  OAI2BB2X1M U100 ( .B0(n248), .B1(n23), .A0N(\REG_FILE[4][6] ), .A1N(n217), 
        .Y(n88) );
  OAI2BB2X1M U101 ( .B0(n248), .B1(n25), .A0N(\REG_FILE[5][6] ), .A1N(n216), 
        .Y(n96) );
  OAI2BB2X1M U102 ( .B0(n248), .B1(n26), .A0N(\REG_FILE[6][6] ), .A1N(n215), 
        .Y(n104) );
  OAI2BB2X1M U103 ( .B0(n248), .B1(n29), .A0N(\REG_FILE[7][6] ), .A1N(n214), 
        .Y(n112) );
  OAI2BB2X1M U104 ( .B0(n248), .B1(n30), .A0N(\REG_FILE[8][6] ), .A1N(n213), 
        .Y(n120) );
  OAI2BB2X1M U105 ( .B0(n248), .B1(n32), .A0N(\REG_FILE[9][6] ), .A1N(n212), 
        .Y(n128) );
  OAI2BB2X1M U106 ( .B0(n248), .B1(n34), .A0N(\REG_FILE[10][6] ), .A1N(n211), 
        .Y(n136) );
  OAI2BB2X1M U107 ( .B0(n248), .B1(n35), .A0N(\REG_FILE[11][6] ), .A1N(n210), 
        .Y(n144) );
  OAI2BB2X1M U108 ( .B0(n248), .B1(n36), .A0N(\REG_FILE[12][6] ), .A1N(n209), 
        .Y(n152) );
  OAI2BB2X1M U109 ( .B0(n248), .B1(n37), .A0N(\REG_FILE[13][6] ), .A1N(n208), 
        .Y(n160) );
  OAI2BB2X1M U110 ( .B0(n248), .B1(n38), .A0N(\REG_FILE[14][6] ), .A1N(n207), 
        .Y(n168) );
  OAI2BB2X1M U111 ( .B0(n248), .B1(n40), .A0N(\REG_FILE[15][6] ), .A1N(n206), 
        .Y(n176) );
  OAI2BB2X1M U112 ( .B0(n221), .B1(n247), .A0N(REG0[0]), .A1N(n221), .Y(n50)
         );
  OAI2BB2X1M U113 ( .B0(n221), .B1(n246), .A0N(REG0[1]), .A1N(n221), .Y(n51)
         );
  OAI2BB2X1M U114 ( .B0(n221), .B1(n245), .A0N(REG0[2]), .A1N(n221), .Y(n52)
         );
  OAI2BB2X1M U115 ( .B0(n221), .B1(n244), .A0N(REG0[3]), .A1N(n221), .Y(n53)
         );
  OAI2BB2X1M U116 ( .B0(n242), .B1(n220), .A0N(REG1[5]), .A1N(n220), .Y(n63)
         );
  OAI2BB2X1M U117 ( .B0(n241), .B1(n18), .A0N(REG1[7]), .A1N(n220), .Y(n65) );
  OAI2BB2X1M U118 ( .B0(n246), .B1(n20), .A0N(REG2[1]), .A1N(n219), .Y(n67) );
  OAI2BB2X1M U119 ( .B0(n245), .B1(n219), .A0N(REG2[2]), .A1N(n219), .Y(n68)
         );
  OAI2BB2X1M U120 ( .B0(n244), .B1(n20), .A0N(REG2[3]), .A1N(n219), .Y(n69) );
  OAI2BB2X1M U121 ( .B0(n243), .B1(n20), .A0N(REG2[4]), .A1N(n219), .Y(n70) );
  OAI2BB2X1M U122 ( .B0(n242), .B1(n219), .A0N(REG2[5]), .A1N(n219), .Y(n71)
         );
  OAI2BB2X1M U123 ( .B0(n247), .B1(n218), .A0N(REG3[0]), .A1N(n218), .Y(n74)
         );
  OAI2BB2X1M U124 ( .B0(n246), .B1(n218), .A0N(REG3[1]), .A1N(n218), .Y(n75)
         );
  OAI2BB2X1M U125 ( .B0(n245), .B1(n218), .A0N(REG3[2]), .A1N(n218), .Y(n76)
         );
  OAI2BB2X1M U126 ( .B0(n244), .B1(n218), .A0N(REG3[3]), .A1N(n218), .Y(n77)
         );
  OAI2BB2X1M U127 ( .B0(n243), .B1(n218), .A0N(REG3[4]), .A1N(n218), .Y(n78)
         );
  OAI2BB2X1M U128 ( .B0(n241), .B1(n22), .A0N(REG3[7]), .A1N(n218), .Y(n81) );
  OAI2BB2X1M U129 ( .B0(n247), .B1(n217), .A0N(\REG_FILE[4][0] ), .A1N(n217), 
        .Y(n82) );
  OAI2BB2X1M U130 ( .B0(n246), .B1(n217), .A0N(\REG_FILE[4][1] ), .A1N(n217), 
        .Y(n83) );
  OAI2BB2X1M U131 ( .B0(n245), .B1(n217), .A0N(\REG_FILE[4][2] ), .A1N(n217), 
        .Y(n84) );
  OAI2BB2X1M U132 ( .B0(n244), .B1(n217), .A0N(\REG_FILE[4][3] ), .A1N(n217), 
        .Y(n85) );
  OAI2BB2X1M U133 ( .B0(n243), .B1(n217), .A0N(\REG_FILE[4][4] ), .A1N(n217), 
        .Y(n86) );
  OAI2BB2X1M U134 ( .B0(n242), .B1(n23), .A0N(\REG_FILE[4][5] ), .A1N(n217), 
        .Y(n87) );
  OAI2BB2X1M U135 ( .B0(n241), .B1(n23), .A0N(\REG_FILE[4][7] ), .A1N(n217), 
        .Y(n89) );
  OAI2BB2X1M U136 ( .B0(n247), .B1(n216), .A0N(\REG_FILE[5][0] ), .A1N(n216), 
        .Y(n90) );
  OAI2BB2X1M U137 ( .B0(n246), .B1(n216), .A0N(\REG_FILE[5][1] ), .A1N(n216), 
        .Y(n91) );
  OAI2BB2X1M U138 ( .B0(n245), .B1(n216), .A0N(\REG_FILE[5][2] ), .A1N(n216), 
        .Y(n92) );
  OAI2BB2X1M U139 ( .B0(n244), .B1(n216), .A0N(\REG_FILE[5][3] ), .A1N(n216), 
        .Y(n93) );
  OAI2BB2X1M U140 ( .B0(n243), .B1(n216), .A0N(\REG_FILE[5][4] ), .A1N(n216), 
        .Y(n94) );
  OAI2BB2X1M U141 ( .B0(n242), .B1(n25), .A0N(\REG_FILE[5][5] ), .A1N(n216), 
        .Y(n95) );
  OAI2BB2X1M U142 ( .B0(n241), .B1(n25), .A0N(\REG_FILE[5][7] ), .A1N(n216), 
        .Y(n97) );
  OAI2BB2X1M U143 ( .B0(n247), .B1(n215), .A0N(\REG_FILE[6][0] ), .A1N(n215), 
        .Y(n98) );
  OAI2BB2X1M U144 ( .B0(n246), .B1(n215), .A0N(\REG_FILE[6][1] ), .A1N(n215), 
        .Y(n99) );
  OAI2BB2X1M U145 ( .B0(n245), .B1(n215), .A0N(\REG_FILE[6][2] ), .A1N(n215), 
        .Y(n100) );
  OAI2BB2X1M U146 ( .B0(n244), .B1(n215), .A0N(\REG_FILE[6][3] ), .A1N(n215), 
        .Y(n101) );
  OAI2BB2X1M U147 ( .B0(n243), .B1(n215), .A0N(\REG_FILE[6][4] ), .A1N(n215), 
        .Y(n102) );
  OAI2BB2X1M U148 ( .B0(n242), .B1(n26), .A0N(\REG_FILE[6][5] ), .A1N(n215), 
        .Y(n103) );
  OAI2BB2X1M U149 ( .B0(n241), .B1(n26), .A0N(\REG_FILE[6][7] ), .A1N(n215), 
        .Y(n105) );
  OAI2BB2X1M U150 ( .B0(n247), .B1(n214), .A0N(\REG_FILE[7][0] ), .A1N(n214), 
        .Y(n106) );
  OAI2BB2X1M U151 ( .B0(n246), .B1(n214), .A0N(\REG_FILE[7][1] ), .A1N(n214), 
        .Y(n107) );
  OAI2BB2X1M U152 ( .B0(n245), .B1(n214), .A0N(\REG_FILE[7][2] ), .A1N(n214), 
        .Y(n108) );
  OAI2BB2X1M U153 ( .B0(n244), .B1(n214), .A0N(\REG_FILE[7][3] ), .A1N(n214), 
        .Y(n109) );
  OAI2BB2X1M U154 ( .B0(n243), .B1(n214), .A0N(\REG_FILE[7][4] ), .A1N(n214), 
        .Y(n110) );
  OAI2BB2X1M U155 ( .B0(n242), .B1(n29), .A0N(\REG_FILE[7][5] ), .A1N(n214), 
        .Y(n111) );
  OAI2BB2X1M U156 ( .B0(n241), .B1(n29), .A0N(\REG_FILE[7][7] ), .A1N(n214), 
        .Y(n113) );
  OAI2BB2X1M U157 ( .B0(n247), .B1(n213), .A0N(\REG_FILE[8][0] ), .A1N(n213), 
        .Y(n114) );
  OAI2BB2X1M U158 ( .B0(n246), .B1(n213), .A0N(\REG_FILE[8][1] ), .A1N(n213), 
        .Y(n115) );
  OAI2BB2X1M U159 ( .B0(n245), .B1(n213), .A0N(\REG_FILE[8][2] ), .A1N(n213), 
        .Y(n116) );
  OAI2BB2X1M U160 ( .B0(n244), .B1(n213), .A0N(\REG_FILE[8][3] ), .A1N(n213), 
        .Y(n117) );
  OAI2BB2X1M U161 ( .B0(n243), .B1(n213), .A0N(\REG_FILE[8][4] ), .A1N(n213), 
        .Y(n118) );
  OAI2BB2X1M U162 ( .B0(n242), .B1(n30), .A0N(\REG_FILE[8][5] ), .A1N(n213), 
        .Y(n119) );
  OAI2BB2X1M U163 ( .B0(n241), .B1(n30), .A0N(\REG_FILE[8][7] ), .A1N(n213), 
        .Y(n121) );
  OAI2BB2X1M U164 ( .B0(n247), .B1(n212), .A0N(\REG_FILE[9][0] ), .A1N(n212), 
        .Y(n122) );
  OAI2BB2X1M U165 ( .B0(n246), .B1(n212), .A0N(\REG_FILE[9][1] ), .A1N(n212), 
        .Y(n123) );
  OAI2BB2X1M U166 ( .B0(n245), .B1(n212), .A0N(\REG_FILE[9][2] ), .A1N(n212), 
        .Y(n124) );
  OAI2BB2X1M U167 ( .B0(n244), .B1(n212), .A0N(\REG_FILE[9][3] ), .A1N(n212), 
        .Y(n125) );
  OAI2BB2X1M U168 ( .B0(n243), .B1(n212), .A0N(\REG_FILE[9][4] ), .A1N(n212), 
        .Y(n126) );
  OAI2BB2X1M U169 ( .B0(n242), .B1(n32), .A0N(\REG_FILE[9][5] ), .A1N(n212), 
        .Y(n127) );
  OAI2BB2X1M U170 ( .B0(n241), .B1(n32), .A0N(\REG_FILE[9][7] ), .A1N(n212), 
        .Y(n129) );
  OAI2BB2X1M U171 ( .B0(n247), .B1(n211), .A0N(\REG_FILE[10][0] ), .A1N(n211), 
        .Y(n130) );
  OAI2BB2X1M U172 ( .B0(n246), .B1(n211), .A0N(\REG_FILE[10][1] ), .A1N(n211), 
        .Y(n131) );
  OAI2BB2X1M U173 ( .B0(n245), .B1(n211), .A0N(\REG_FILE[10][2] ), .A1N(n211), 
        .Y(n132) );
  OAI2BB2X1M U174 ( .B0(n244), .B1(n211), .A0N(\REG_FILE[10][3] ), .A1N(n211), 
        .Y(n133) );
  OAI2BB2X1M U175 ( .B0(n243), .B1(n211), .A0N(\REG_FILE[10][4] ), .A1N(n211), 
        .Y(n134) );
  OAI2BB2X1M U176 ( .B0(n242), .B1(n34), .A0N(\REG_FILE[10][5] ), .A1N(n211), 
        .Y(n135) );
  OAI2BB2X1M U177 ( .B0(n241), .B1(n34), .A0N(\REG_FILE[10][7] ), .A1N(n211), 
        .Y(n137) );
  OAI2BB2X1M U178 ( .B0(n247), .B1(n210), .A0N(\REG_FILE[11][0] ), .A1N(n210), 
        .Y(n138) );
  OAI2BB2X1M U179 ( .B0(n246), .B1(n210), .A0N(\REG_FILE[11][1] ), .A1N(n210), 
        .Y(n139) );
  OAI2BB2X1M U180 ( .B0(n245), .B1(n210), .A0N(\REG_FILE[11][2] ), .A1N(n210), 
        .Y(n140) );
  OAI2BB2X1M U181 ( .B0(n244), .B1(n210), .A0N(\REG_FILE[11][3] ), .A1N(n210), 
        .Y(n141) );
  OAI2BB2X1M U182 ( .B0(n243), .B1(n210), .A0N(\REG_FILE[11][4] ), .A1N(n210), 
        .Y(n142) );
  OAI2BB2X1M U183 ( .B0(n242), .B1(n35), .A0N(\REG_FILE[11][5] ), .A1N(n210), 
        .Y(n143) );
  OAI2BB2X1M U184 ( .B0(n241), .B1(n35), .A0N(\REG_FILE[11][7] ), .A1N(n210), 
        .Y(n145) );
  OAI2BB2X1M U185 ( .B0(n247), .B1(n209), .A0N(\REG_FILE[12][0] ), .A1N(n209), 
        .Y(n146) );
  OAI2BB2X1M U186 ( .B0(n246), .B1(n209), .A0N(\REG_FILE[12][1] ), .A1N(n209), 
        .Y(n147) );
  OAI2BB2X1M U187 ( .B0(n245), .B1(n209), .A0N(\REG_FILE[12][2] ), .A1N(n209), 
        .Y(n148) );
  OAI2BB2X1M U188 ( .B0(n244), .B1(n209), .A0N(\REG_FILE[12][3] ), .A1N(n209), 
        .Y(n149) );
  OAI2BB2X1M U189 ( .B0(n243), .B1(n209), .A0N(\REG_FILE[12][4] ), .A1N(n209), 
        .Y(n150) );
  OAI2BB2X1M U190 ( .B0(n242), .B1(n36), .A0N(\REG_FILE[12][5] ), .A1N(n209), 
        .Y(n151) );
  OAI2BB2X1M U191 ( .B0(n241), .B1(n36), .A0N(\REG_FILE[12][7] ), .A1N(n209), 
        .Y(n153) );
  OAI2BB2X1M U192 ( .B0(n247), .B1(n208), .A0N(\REG_FILE[13][0] ), .A1N(n208), 
        .Y(n154) );
  OAI2BB2X1M U193 ( .B0(n246), .B1(n208), .A0N(\REG_FILE[13][1] ), .A1N(n208), 
        .Y(n155) );
  OAI2BB2X1M U194 ( .B0(n245), .B1(n208), .A0N(\REG_FILE[13][2] ), .A1N(n208), 
        .Y(n156) );
  OAI2BB2X1M U195 ( .B0(n244), .B1(n208), .A0N(\REG_FILE[13][3] ), .A1N(n208), 
        .Y(n157) );
  OAI2BB2X1M U196 ( .B0(n243), .B1(n208), .A0N(\REG_FILE[13][4] ), .A1N(n208), 
        .Y(n158) );
  OAI2BB2X1M U197 ( .B0(n242), .B1(n37), .A0N(\REG_FILE[13][5] ), .A1N(n208), 
        .Y(n159) );
  OAI2BB2X1M U198 ( .B0(n241), .B1(n37), .A0N(\REG_FILE[13][7] ), .A1N(n208), 
        .Y(n161) );
  OAI2BB2X1M U199 ( .B0(n247), .B1(n207), .A0N(\REG_FILE[14][0] ), .A1N(n207), 
        .Y(n162) );
  OAI2BB2X1M U200 ( .B0(n246), .B1(n207), .A0N(\REG_FILE[14][1] ), .A1N(n207), 
        .Y(n163) );
  OAI2BB2X1M U201 ( .B0(n245), .B1(n207), .A0N(\REG_FILE[14][2] ), .A1N(n207), 
        .Y(n164) );
  OAI2BB2X1M U202 ( .B0(n244), .B1(n207), .A0N(\REG_FILE[14][3] ), .A1N(n207), 
        .Y(n165) );
  OAI2BB2X1M U203 ( .B0(n243), .B1(n207), .A0N(\REG_FILE[14][4] ), .A1N(n207), 
        .Y(n166) );
  OAI2BB2X1M U204 ( .B0(n242), .B1(n38), .A0N(\REG_FILE[14][5] ), .A1N(n207), 
        .Y(n167) );
  OAI2BB2X1M U205 ( .B0(n241), .B1(n38), .A0N(\REG_FILE[14][7] ), .A1N(n207), 
        .Y(n169) );
  OAI2BB2X1M U206 ( .B0(n247), .B1(n206), .A0N(\REG_FILE[15][0] ), .A1N(n206), 
        .Y(n170) );
  OAI2BB2X1M U207 ( .B0(n246), .B1(n206), .A0N(\REG_FILE[15][1] ), .A1N(n206), 
        .Y(n171) );
  OAI2BB2X1M U208 ( .B0(n245), .B1(n206), .A0N(\REG_FILE[15][2] ), .A1N(n206), 
        .Y(n172) );
  OAI2BB2X1M U209 ( .B0(n244), .B1(n206), .A0N(\REG_FILE[15][3] ), .A1N(n206), 
        .Y(n173) );
  OAI2BB2X1M U210 ( .B0(n243), .B1(n206), .A0N(\REG_FILE[15][4] ), .A1N(n206), 
        .Y(n174) );
  OAI2BB2X1M U211 ( .B0(n242), .B1(n40), .A0N(\REG_FILE[15][5] ), .A1N(n206), 
        .Y(n175) );
  OAI2BB2X1M U212 ( .B0(n241), .B1(n40), .A0N(\REG_FILE[15][7] ), .A1N(n206), 
        .Y(n177) );
  OAI2BB2X1M U213 ( .B0(n247), .B1(n219), .A0N(REG2[0]), .A1N(n219), .Y(n66)
         );
  OAI2BB2X1M U214 ( .B0(n241), .B1(n20), .A0N(REG2[7]), .A1N(n219), .Y(n73) );
  OAI2BB2X1M U215 ( .B0(n242), .B1(n22), .A0N(REG3[5]), .A1N(n218), .Y(n79) );
  MX4X1M U216 ( .A(\REG_FILE[4][0] ), .B(\REG_FILE[5][0] ), .C(
        \REG_FILE[6][0] ), .D(\REG_FILE[7][0] ), .S0(n203), .S1(n202), .Y(n6)
         );
  MX4X1M U217 ( .A(\REG_FILE[4][1] ), .B(\REG_FILE[5][1] ), .C(
        \REG_FILE[6][1] ), .D(\REG_FILE[7][1] ), .S0(n204), .S1(n201), .Y(n10)
         );
  MX4X1M U218 ( .A(\REG_FILE[4][2] ), .B(\REG_FILE[5][2] ), .C(
        \REG_FILE[6][2] ), .D(\REG_FILE[7][2] ), .S0(n204), .S1(n201), .Y(n179) );
  MX4X1M U219 ( .A(\REG_FILE[4][3] ), .B(\REG_FILE[5][3] ), .C(
        \REG_FILE[6][3] ), .D(\REG_FILE[7][3] ), .S0(n204), .S1(n201), .Y(n183) );
  MX4X1M U220 ( .A(\REG_FILE[4][4] ), .B(\REG_FILE[5][4] ), .C(
        \REG_FILE[6][4] ), .D(\REG_FILE[7][4] ), .S0(n204), .S1(n201), .Y(n187) );
  MX4X1M U221 ( .A(\REG_FILE[4][5] ), .B(\REG_FILE[5][5] ), .C(
        \REG_FILE[6][5] ), .D(\REG_FILE[7][5] ), .S0(n205), .S1(n202), .Y(n191) );
  MX4X1M U222 ( .A(\REG_FILE[4][6] ), .B(\REG_FILE[5][6] ), .C(
        \REG_FILE[6][6] ), .D(\REG_FILE[7][6] ), .S0(n205), .S1(n202), .Y(n195) );
  MX4X1M U223 ( .A(\REG_FILE[4][7] ), .B(\REG_FILE[5][7] ), .C(
        \REG_FILE[6][7] ), .D(\REG_FILE[7][7] ), .S0(n205), .S1(n202), .Y(n199) );
  MX4X1M U224 ( .A(\REG_FILE[12][0] ), .B(\REG_FILE[13][0] ), .C(
        \REG_FILE[14][0] ), .D(\REG_FILE[15][0] ), .S0(n203), .S1(n201), .Y(n4) );
  MX4X1M U225 ( .A(\REG_FILE[12][2] ), .B(\REG_FILE[13][2] ), .C(
        \REG_FILE[14][2] ), .D(\REG_FILE[15][2] ), .S0(n204), .S1(n201), .Y(
        n12) );
  MX4X1M U226 ( .A(\REG_FILE[12][3] ), .B(\REG_FILE[13][3] ), .C(
        \REG_FILE[14][3] ), .D(\REG_FILE[15][3] ), .S0(n204), .S1(n201), .Y(
        n181) );
  MX4X1M U227 ( .A(\REG_FILE[12][4] ), .B(\REG_FILE[13][4] ), .C(
        \REG_FILE[14][4] ), .D(\REG_FILE[15][4] ), .S0(n204), .S1(n201), .Y(
        n185) );
  MX4X1M U228 ( .A(\REG_FILE[12][5] ), .B(\REG_FILE[13][5] ), .C(
        \REG_FILE[14][5] ), .D(\REG_FILE[15][5] ), .S0(n205), .S1(n202), .Y(
        n189) );
  MX4X1M U229 ( .A(\REG_FILE[12][6] ), .B(\REG_FILE[13][6] ), .C(
        \REG_FILE[14][6] ), .D(\REG_FILE[15][6] ), .S0(n205), .S1(n202), .Y(
        n193) );
  MX4X1M U230 ( .A(\REG_FILE[12][7] ), .B(\REG_FILE[13][7] ), .C(
        \REG_FILE[14][7] ), .D(\REG_FILE[15][7] ), .S0(n205), .S1(n202), .Y(
        n197) );
  AO22X1M U231 ( .A0(N43), .A1(n239), .B0(RdData[0]), .B1(n14), .Y(n42) );
  MX4XLM U232 ( .A(n7), .B(n5), .C(n6), .D(n4), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U233 ( .A(\REG_FILE[8][0] ), .B(\REG_FILE[9][0] ), .C(
        \REG_FILE[10][0] ), .D(\REG_FILE[11][0] ), .S0(n203), .S1(n224), .Y(n5) );
  AO22X1M U234 ( .A0(N42), .A1(n239), .B0(RdData[1]), .B1(n14), .Y(n43) );
  MX4XLM U235 ( .A(n11), .B(n9), .C(n10), .D(n8), .S0(N14), .S1(N13), .Y(N42)
         );
  MX4X1M U236 ( .A(\REG_FILE[8][1] ), .B(\REG_FILE[9][1] ), .C(
        \REG_FILE[10][1] ), .D(\REG_FILE[11][1] ), .S0(n203), .S1(N12), .Y(n9)
         );
  MX4X1M U237 ( .A(\REG_FILE[12][1] ), .B(\REG_FILE[13][1] ), .C(
        \REG_FILE[14][1] ), .D(\REG_FILE[15][1] ), .S0(n203), .S1(n202), .Y(n8) );
  AO22X1M U238 ( .A0(N41), .A1(n239), .B0(RdData[2]), .B1(n14), .Y(n44) );
  MX4XLM U239 ( .A(n180), .B(n178), .C(n179), .D(n12), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4X1M U240 ( .A(\REG_FILE[8][2] ), .B(\REG_FILE[9][2] ), .C(
        \REG_FILE[10][2] ), .D(\REG_FILE[11][2] ), .S0(n204), .S1(n201), .Y(
        n178) );
  AO22X1M U241 ( .A0(N40), .A1(n239), .B0(RdData[3]), .B1(n14), .Y(n45) );
  MX4XLM U242 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U243 ( .A(\REG_FILE[8][3] ), .B(\REG_FILE[9][3] ), .C(
        \REG_FILE[10][3] ), .D(\REG_FILE[11][3] ), .S0(n204), .S1(n201), .Y(
        n182) );
  AO22X1M U244 ( .A0(N39), .A1(n239), .B0(RdData[4]), .B1(n14), .Y(n46) );
  MX4XLM U245 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U246 ( .A(\REG_FILE[8][4] ), .B(\REG_FILE[9][4] ), .C(
        \REG_FILE[10][4] ), .D(\REG_FILE[11][4] ), .S0(n204), .S1(n201), .Y(
        n186) );
  AO22X1M U247 ( .A0(N38), .A1(n239), .B0(RdData[5]), .B1(n14), .Y(n47) );
  MX4XLM U248 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U249 ( .A(\REG_FILE[8][5] ), .B(\REG_FILE[9][5] ), .C(
        \REG_FILE[10][5] ), .D(\REG_FILE[11][5] ), .S0(n205), .S1(n202), .Y(
        n190) );
  AO22X1M U250 ( .A0(N37), .A1(n239), .B0(RdData[6]), .B1(n14), .Y(n48) );
  MX4XLM U251 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U252 ( .A(\REG_FILE[8][6] ), .B(\REG_FILE[9][6] ), .C(
        \REG_FILE[10][6] ), .D(\REG_FILE[11][6] ), .S0(n205), .S1(n202), .Y(
        n194) );
  AO22X1M U253 ( .A0(N36), .A1(n239), .B0(RdData[7]), .B1(n14), .Y(n49) );
  MX4XLM U254 ( .A(n200), .B(n198), .C(n199), .D(n197), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U255 ( .A(\REG_FILE[8][7] ), .B(\REG_FILE[9][7] ), .C(
        \REG_FILE[10][7] ), .D(\REG_FILE[11][7] ), .S0(n205), .S1(n202), .Y(
        n198) );
  INVX2M U256 ( .A(N12), .Y(n225) );
  INVX2M U257 ( .A(N11), .Y(n223) );
  AO21XLM U258 ( .A0(RdData_Valid), .A1(n13), .B0(n239), .Y(n41) );
endmodule


module SYS_CTRL_width16_addr_width4_data_width8 ( CLK, RST, ALU_OUT, OUT_VALID, 
        RdData, RdData_Valid, RX_P_DATA, RX_D_VLD, wfull, ALU_FUN, ALU_EN, 
        CLK_EN, Address, WrEn, RdEn, WrData, TX_P_DATA, TX_D_VLD, clk_div_en
 );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_VALID, RdData_Valid, RX_D_VLD, wfull;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   n109, n110, N95, N96, N97, N98, N99, n12, n13, n14, n15, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n3, n4, n5, n6, n7, n8, n9, n10, n11, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  wire   [15:0] alu_dn;

  DFFRQX2M \alu_dn_reg[7]  ( .D(n90), .CK(CLK), .RN(n8), .Q(alu_dn[7]) );
  DFFRQX2M \alu_dn_reg[6]  ( .D(n89), .CK(CLK), .RN(n8), .Q(alu_dn[6]) );
  DFFRQX2M \alu_dn_reg[5]  ( .D(n88), .CK(CLK), .RN(n8), .Q(alu_dn[5]) );
  DFFRQX2M \alu_dn_reg[4]  ( .D(n87), .CK(CLK), .RN(n7), .Q(alu_dn[4]) );
  DFFRQX2M \alu_dn_reg[3]  ( .D(n86), .CK(CLK), .RN(n7), .Q(alu_dn[3]) );
  DFFRQX2M \alu_dn_reg[2]  ( .D(n85), .CK(CLK), .RN(n7), .Q(alu_dn[2]) );
  DFFRQX2M \alu_dn_reg[1]  ( .D(n84), .CK(CLK), .RN(n7), .Q(alu_dn[1]) );
  DFFRQX2M \alu_dn_reg[0]  ( .D(n83), .CK(CLK), .RN(n7), .Q(alu_dn[0]) );
  DFFRQX2M \alu_dn_reg[15]  ( .D(n98), .CK(CLK), .RN(n8), .Q(alu_dn[15]) );
  DFFRQX2M \alu_dn_reg[14]  ( .D(n97), .CK(CLK), .RN(n8), .Q(alu_dn[14]) );
  DFFRQX2M \alu_dn_reg[13]  ( .D(n96), .CK(CLK), .RN(n8), .Q(alu_dn[13]) );
  DFFRQX2M \alu_dn_reg[12]  ( .D(n95), .CK(CLK), .RN(n8), .Q(alu_dn[12]) );
  DFFRQX2M \alu_dn_reg[11]  ( .D(n94), .CK(CLK), .RN(n8), .Q(alu_dn[11]) );
  DFFRQX2M \alu_dn_reg[10]  ( .D(n93), .CK(CLK), .RN(n8), .Q(alu_dn[10]) );
  DFFRQX2M \alu_dn_reg[9]  ( .D(n92), .CK(CLK), .RN(n8), .Q(alu_dn[9]) );
  DFFRQX2M \alu_dn_reg[8]  ( .D(n91), .CK(CLK), .RN(n8), .Q(alu_dn[8]) );
  DFFRX1M \address_reg_reg[1]  ( .D(n80), .CK(CLK), .RN(n7), .QN(n14) );
  DFFRX1M \address_reg_reg[0]  ( .D(n79), .CK(CLK), .RN(n7), .QN(n15) );
  DFFRX1M \address_reg_reg[3]  ( .D(n82), .CK(CLK), .RN(n7), .QN(n12) );
  DFFRX1M \address_reg_reg[2]  ( .D(n81), .CK(CLK), .RN(n7), .QN(n13) );
  DFFRQX4M \ALU_FUN_reg_reg[2]  ( .D(n77), .CK(CLK), .RN(n7), .Q(ALU_FUN[2])
         );
  DFFRQX2M \ALU_FUN_reg_reg[3]  ( .D(n78), .CK(CLK), .RN(n7), .Q(ALU_FUN[3])
         );
  DFFRQX2M \ALU_FUN_reg_reg[1]  ( .D(n76), .CK(CLK), .RN(n7), .Q(ALU_FUN[1])
         );
  DFFRQX4M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n9), .Q(
        current_state[0]) );
  DFFRQX2M \ALU_FUN_reg_reg[0]  ( .D(n75), .CK(CLK), .RN(n7), .Q(ALU_FUN[0])
         );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n8), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(n9), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n8), .Q(
        current_state[2]) );
  TLATX1M \next_state_reg[0]  ( .G(N95), .D(N96), .Q(next_state[0]) );
  TLATX1M \next_state_reg[1]  ( .G(N95), .D(N97), .Q(next_state[1]) );
  TLATX1M \next_state_reg[3]  ( .G(N95), .D(N99), .Q(next_state[3]) );
  TLATX1M \next_state_reg[2]  ( .G(N95), .D(N98), .Q(next_state[2]) );
  NOR3X2M U3 ( .A(current_state[1]), .B(current_state[3]), .C(n100), .Y(n50)
         );
  NOR4X1M U4 ( .A(CLK_EN), .B(n55), .C(n24), .D(n49), .Y(n66) );
  BUFX4M U5 ( .A(n109), .Y(Address[3]) );
  OAI22X1M U6 ( .A0(n104), .A1(n22), .B0(n12), .B1(n31), .Y(n109) );
  BUFX4M U7 ( .A(n110), .Y(Address[2]) );
  OAI22X1M U8 ( .A0(n105), .A1(n22), .B0(n13), .B1(n31), .Y(n110) );
  NOR2X2M U9 ( .A(n60), .B(n108), .Y(RdEn) );
  NOR2BX2M U10 ( .AN(n50), .B(n20), .Y(n51) );
  NOR2X4M U11 ( .A(current_state[2]), .B(current_state[1]), .Y(n64) );
  INVX2M U12 ( .A(current_state[0]), .Y(n20) );
  INVX2M U13 ( .A(RX_P_DATA[1]), .Y(n106) );
  INVX2M U14 ( .A(RX_P_DATA[0]), .Y(n107) );
  CLKBUFX6M U15 ( .A(n27), .Y(n4) );
  INVX2M U16 ( .A(RX_P_DATA[3]), .Y(n104) );
  AOI2BB1X2M U17 ( .A0N(n70), .A1N(n29), .B0(n51), .Y(n52) );
  INVX4M U18 ( .A(WrEn), .Y(n16) );
  INVX2M U19 ( .A(RdEn), .Y(n22) );
  NOR2X2M U20 ( .A(n51), .B(n18), .Y(n30) );
  INVX2M U21 ( .A(n29), .Y(n17) );
  CLKBUFX6M U22 ( .A(n9), .Y(n7) );
  CLKBUFX6M U23 ( .A(n9), .Y(n8) );
  NAND2X2M U24 ( .A(n61), .B(n62), .Y(CLK_EN) );
  OAI21X4M U25 ( .A0(n30), .A1(n108), .B0(n31), .Y(WrEn) );
  NOR2X2M U26 ( .A(n16), .B(n107), .Y(WrData[0]) );
  NOR2X2M U27 ( .A(n16), .B(n102), .Y(WrData[5]) );
  NOR2X2M U28 ( .A(n16), .B(n101), .Y(WrData[7]) );
  OR3X2M U29 ( .A(n5), .B(n32), .C(n6), .Y(TX_D_VLD) );
  INVX2M U30 ( .A(n63), .Y(n18) );
  AND3X2M U31 ( .A(n74), .B(n20), .C(n100), .Y(n56) );
  AND2X2M U32 ( .A(n50), .B(n20), .Y(n44) );
  NOR2X2M U33 ( .A(n16), .B(n106), .Y(WrData[1]) );
  NOR2X2M U34 ( .A(n16), .B(n105), .Y(WrData[2]) );
  NOR2X2M U35 ( .A(n16), .B(n104), .Y(WrData[3]) );
  NOR2X2M U36 ( .A(n16), .B(n103), .Y(WrData[4]) );
  NAND2X2M U37 ( .A(n62), .B(n3), .Y(ALU_EN) );
  INVX2M U38 ( .A(n61), .Y(n21) );
  BUFX4M U39 ( .A(n35), .Y(n5) );
  NOR2X2M U40 ( .A(n45), .B(wfull), .Y(n35) );
  INVX2M U41 ( .A(n26), .Y(n23) );
  INVX6M U42 ( .A(n4), .Y(n19) );
  NAND3X2M U43 ( .A(n20), .B(n99), .C(n64), .Y(n29) );
  NOR4X1M U44 ( .A(n106), .B(n104), .C(n101), .D(n102), .Y(n68) );
  OAI211X2M U45 ( .A0(n52), .A1(n108), .B0(n53), .C0(n54), .Y(N97) );
  OAI21X2M U46 ( .A0(n56), .A1(n57), .B0(n108), .Y(n53) );
  NOR3X2M U47 ( .A(n24), .B(n23), .C(n18), .Y(n54) );
  OAI211X2M U48 ( .A0(n58), .A1(n108), .B0(n19), .C0(n59), .Y(N96) );
  NOR2X2M U49 ( .A(n17), .B(n18), .Y(n58) );
  OAI31X1M U50 ( .A0(n57), .A1(n55), .A2(n51), .B0(n108), .Y(n59) );
  AND3X2M U51 ( .A(n67), .B(n107), .C(n103), .Y(n49) );
  INVX2M U52 ( .A(n45), .Y(n24) );
  NAND2X2M U53 ( .A(n60), .B(n61), .Y(n57) );
  NAND2BX2M U54 ( .AN(ALU_EN), .B(n45), .Y(N99) );
  INVX2M U55 ( .A(n10), .Y(n9) );
  INVX2M U56 ( .A(RST), .Y(n10) );
  NAND3X2M U57 ( .A(n64), .B(n20), .C(current_state[3]), .Y(n62) );
  NOR2BX4M U58 ( .AN(current_state[1]), .B(current_state[3]), .Y(n74) );
  NAND3X2M U59 ( .A(current_state[0]), .B(n74), .C(current_state[2]), .Y(n61)
         );
  NAND2X2M U60 ( .A(n56), .B(RX_D_VLD), .Y(n31) );
  AND3X4M U61 ( .A(n11), .B(n44), .C(RdData_Valid), .Y(n32) );
  INVX2M U62 ( .A(wfull), .Y(n11) );
  NAND3X2M U63 ( .A(n74), .B(n100), .C(current_state[0]), .Y(n60) );
  INVX2M U64 ( .A(current_state[2]), .Y(n100) );
  NAND3X2M U65 ( .A(n74), .B(n20), .C(current_state[2]), .Y(n63) );
  INVX4M U66 ( .A(RX_D_VLD), .Y(n108) );
  OAI22X1M U67 ( .A0(n106), .A1(n22), .B0(n14), .B1(n31), .Y(Address[1]) );
  OAI222X1M U68 ( .A0(n108), .A1(n63), .B0(n15), .B1(n31), .C0(n107), .C1(n22), 
        .Y(Address[0]) );
  OAI2BB1X2M U69 ( .A0N(RdData[0]), .A1N(n32), .B0(n42), .Y(TX_P_DATA[0]) );
  AOI22X1M U70 ( .A0(n6), .A1(alu_dn[8]), .B0(n5), .B1(alu_dn[0]), .Y(n42) );
  OAI2BB1X2M U71 ( .A0N(RdData[1]), .A1N(n32), .B0(n41), .Y(TX_P_DATA[1]) );
  AOI22X1M U72 ( .A0(n6), .A1(alu_dn[9]), .B0(n5), .B1(alu_dn[1]), .Y(n41) );
  OAI2BB1X2M U73 ( .A0N(RdData[2]), .A1N(n32), .B0(n40), .Y(TX_P_DATA[2]) );
  AOI22X1M U74 ( .A0(n6), .A1(alu_dn[10]), .B0(n5), .B1(alu_dn[2]), .Y(n40) );
  OAI2BB1X2M U75 ( .A0N(RdData[3]), .A1N(n32), .B0(n39), .Y(TX_P_DATA[3]) );
  AOI22X1M U76 ( .A0(n6), .A1(alu_dn[11]), .B0(n5), .B1(alu_dn[3]), .Y(n39) );
  OAI2BB1X2M U77 ( .A0N(RdData[4]), .A1N(n32), .B0(n38), .Y(TX_P_DATA[4]) );
  AOI22X1M U78 ( .A0(n6), .A1(alu_dn[12]), .B0(n5), .B1(alu_dn[4]), .Y(n38) );
  OAI2BB1X2M U79 ( .A0N(RdData[5]), .A1N(n32), .B0(n37), .Y(TX_P_DATA[5]) );
  AOI22X1M U80 ( .A0(n6), .A1(alu_dn[13]), .B0(n5), .B1(alu_dn[5]), .Y(n37) );
  OAI2BB1X2M U81 ( .A0N(RdData[6]), .A1N(n32), .B0(n36), .Y(TX_P_DATA[6]) );
  AOI22X1M U82 ( .A0(n6), .A1(alu_dn[14]), .B0(n5), .B1(alu_dn[6]), .Y(n36) );
  OAI2BB1X2M U83 ( .A0N(RdData[7]), .A1N(n32), .B0(n33), .Y(TX_P_DATA[7]) );
  AOI22X1M U84 ( .A0(n6), .A1(alu_dn[15]), .B0(n5), .B1(alu_dn[7]), .Y(n33) );
  INVX2M U85 ( .A(RX_P_DATA[2]), .Y(n105) );
  NAND3X2M U86 ( .A(n64), .B(current_state[0]), .C(current_state[3]), .Y(n45)
         );
  AND2X2M U87 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  BUFX4M U88 ( .A(n25), .Y(n3) );
  NAND2X2M U89 ( .A(RX_D_VLD), .B(n21), .Y(n25) );
  BUFX4M U90 ( .A(n34), .Y(n6) );
  AND3X2M U91 ( .A(current_state[3]), .B(current_state[1]), .C(n43), .Y(n34)
         );
  NOR3X2M U92 ( .A(current_state[0]), .B(wfull), .C(current_state[2]), .Y(n43)
         );
  NAND2X2M U93 ( .A(n55), .B(RX_D_VLD), .Y(n26) );
  AND3X2M U94 ( .A(n64), .B(current_state[0]), .C(n99), .Y(n55) );
  OAI22X1M U95 ( .A0(n106), .A1(n26), .B0(n23), .B1(n14), .Y(n80) );
  OAI22X1M U96 ( .A0(n104), .A1(n26), .B0(n23), .B1(n12), .Y(n82) );
  OAI22X1M U97 ( .A0(n107), .A1(n26), .B0(n23), .B1(n15), .Y(n79) );
  OAI22X1M U98 ( .A0(n105), .A1(n26), .B0(n23), .B1(n13), .Y(n81) );
  NOR2BX2M U99 ( .AN(OUT_VALID), .B(n62), .Y(n27) );
  INVX2M U100 ( .A(current_state[3]), .Y(n99) );
  OAI2BB2X1M U101 ( .B0(n3), .B1(n106), .A0N(ALU_FUN[1]), .A1N(n3), .Y(n76) );
  OAI2BB2X1M U102 ( .B0(n3), .B1(n104), .A0N(ALU_FUN[3]), .A1N(n3), .Y(n78) );
  OAI2BB2X1M U103 ( .B0(n3), .B1(n107), .A0N(ALU_FUN[0]), .A1N(n3), .Y(n75) );
  OAI2BB2X1M U104 ( .B0(n3), .B1(n105), .A0N(ALU_FUN[2]), .A1N(n3), .Y(n77) );
  AO22X1M U105 ( .A0(n19), .A1(alu_dn[0]), .B0(ALU_OUT[0]), .B1(n4), .Y(n83)
         );
  AO22X1M U106 ( .A0(n19), .A1(alu_dn[1]), .B0(ALU_OUT[1]), .B1(n4), .Y(n84)
         );
  AO22X1M U107 ( .A0(n19), .A1(alu_dn[2]), .B0(ALU_OUT[2]), .B1(n4), .Y(n85)
         );
  AO22X1M U108 ( .A0(n19), .A1(alu_dn[3]), .B0(ALU_OUT[3]), .B1(n4), .Y(n86)
         );
  AO22X1M U109 ( .A0(n19), .A1(alu_dn[4]), .B0(ALU_OUT[4]), .B1(n4), .Y(n87)
         );
  AO22X1M U110 ( .A0(n19), .A1(alu_dn[5]), .B0(ALU_OUT[5]), .B1(n4), .Y(n88)
         );
  AO22X1M U111 ( .A0(n19), .A1(alu_dn[6]), .B0(ALU_OUT[6]), .B1(n4), .Y(n89)
         );
  AO22X1M U112 ( .A0(n19), .A1(alu_dn[7]), .B0(ALU_OUT[7]), .B1(n4), .Y(n90)
         );
  AO22X1M U113 ( .A0(n19), .A1(alu_dn[8]), .B0(ALU_OUT[8]), .B1(n4), .Y(n91)
         );
  AO22X1M U114 ( .A0(n19), .A1(alu_dn[9]), .B0(ALU_OUT[9]), .B1(n4), .Y(n92)
         );
  AO22X1M U115 ( .A0(n19), .A1(alu_dn[10]), .B0(ALU_OUT[10]), .B1(n4), .Y(n93)
         );
  AO22X1M U116 ( .A0(n19), .A1(alu_dn[11]), .B0(ALU_OUT[11]), .B1(n4), .Y(n94)
         );
  AO22X1M U117 ( .A0(n19), .A1(alu_dn[12]), .B0(ALU_OUT[12]), .B1(n4), .Y(n95)
         );
  AO22X1M U118 ( .A0(n19), .A1(alu_dn[13]), .B0(ALU_OUT[13]), .B1(n4), .Y(n96)
         );
  AO22X1M U119 ( .A0(n19), .A1(alu_dn[14]), .B0(ALU_OUT[14]), .B1(n4), .Y(n97)
         );
  AO22X1M U120 ( .A0(n19), .A1(alu_dn[15]), .B0(ALU_OUT[15]), .B1(n4), .Y(n98)
         );
  INVX2M U121 ( .A(RX_P_DATA[5]), .Y(n102) );
  INVX2M U122 ( .A(RX_P_DATA[7]), .Y(n101) );
  INVX2M U123 ( .A(RX_P_DATA[4]), .Y(n103) );
  OAI21X4M U124 ( .A0(n28), .A1(n99), .B0(n29), .Y(clk_div_en) );
  AOI21X2M U125 ( .A0(current_state[0]), .A1(current_state[1]), .B0(
        current_state[2]), .Y(n28) );
  AOI21X2M U126 ( .A0(n71), .A1(n72), .B0(n48), .Y(n70) );
  NOR4X1M U127 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .C(n107), .D(n106), .Y(
        n72) );
  NOR4X1M U128 ( .A(n104), .B(n101), .C(n102), .D(n103), .Y(n71) );
  NAND4X4M U129 ( .A(n52), .B(n64), .C(n65), .D(n66), .Y(N95) );
  AOI21X2M U130 ( .A0(n68), .A1(n69), .B0(n108), .Y(n65) );
  NOR4X1M U131 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[4]), .C(RX_P_DATA[2]), .D(
        RX_P_DATA[0]), .Y(n69) );
  AND3X2M U132 ( .A(n67), .B(RX_P_DATA[4]), .C(RX_P_DATA[0]), .Y(n48) );
  AND4X2M U133 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[3]), .C(RX_P_DATA[6]), .D(n73), 
        .Y(n67) );
  NOR3X2M U134 ( .A(n105), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n73) );
  NAND4X2M U135 ( .A(n30), .B(n46), .C(n47), .D(n22), .Y(N98) );
  OAI21X2M U136 ( .A0(n21), .A1(n44), .B0(n108), .Y(n46) );
  OAI211X2M U137 ( .A0(n48), .A1(n49), .B0(RX_D_VLD), .C0(n17), .Y(n47) );
endmodule


module uart_tx_fsm ( CLK, RST, DATA_VALID, ser_done, PAR_EN, Ser_enable, 
        mux_sel, BUSY );
  output [1:0] mux_sel;
  input CLK, RST, DATA_VALID, ser_done, PAR_EN;
  output Ser_enable, BUSY;
  wire   BUSY_c, n4, n5, n6, n7, n8, n9, n1, n2, n3, n10, n11;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M BUSY_reg ( .D(BUSY_c), .CK(CLK), .RN(n1), .Q(BUSY) );
  DFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n1), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n1), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n1), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  INVX2M U5 ( .A(n9), .Y(n3) );
  NOR3X4M U6 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X2M U7 ( .A0(current_state[1]), .A1(n10), .B0(n8), .Y(n9) );
  NAND2X2M U8 ( .A(current_state[1]), .B(n10), .Y(n8) );
  INVX2M U9 ( .A(current_state[0]), .Y(n10) );
  NAND2X2M U10 ( .A(n3), .B(current_state[0]), .Y(n5) );
  OAI2B2X4M U11 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  OAI21X2M U12 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  AOI21X2M U13 ( .A0(n3), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
  NOR3X2M U14 ( .A(n11), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U15 ( .A1N(PAR_EN), .A0(ser_done), .B0(n10), .Y(n4) );
  OAI21X2M U16 ( .A0(current_state[2]), .A1(n10), .B0(n8), .Y(BUSY_c) );
  AOI21X2M U17 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U18 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U19 ( .A0(DATA_VALID), .A1(current_state[0]), .B0(n11), .Y(n7) );
  INVX2M U20 ( .A(current_state[1]), .Y(n11) );
endmodule


module Serializer_WIDTH8 ( CLK, RST, DATA, Enable, BUSY, DATA_VALID, ser_out, 
        ser_done );
  input [7:0] DATA;
  input CLK, RST, Enable, BUSY, DATA_VALID;
  output ser_out, ser_done;
  wire   N23, N24, N25, N27, n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n2, n3, n4,
         n26, n27, n28;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;
  assign ser_done = N27;

  DFFRQX2M \DATA_V_reg[0]  ( .D(n18), .CK(CLK), .RN(n3), .Q(ser_out) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n20), .CK(CLK), .RN(n3), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n21), .CK(CLK), .RN(n3), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n22), .CK(CLK), .RN(n3), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n23), .CK(CLK), .RN(n3), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n24), .CK(CLK), .RN(n3), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n25), .CK(CLK), .RN(n3), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n19), .CK(CLK), .RN(n3), .Q(DATA_V[7]) );
  DFFRQX2M \ser_count_reg[1]  ( .D(N24), .CK(CLK), .RN(n3), .Q(ser_count[1])
         );
  DFFRQX2M \ser_count_reg[0]  ( .D(N23), .CK(CLK), .RN(n3), .Q(ser_count[0])
         );
  DFFRX1M \ser_count_reg[2]  ( .D(N25), .CK(CLK), .RN(n3), .QN(n1) );
  BUFX4M U3 ( .A(n8), .Y(n2) );
  INVX4M U4 ( .A(n4), .Y(n3) );
  INVX2M U5 ( .A(RST), .Y(n4) );
  NOR2X6M U6 ( .A(n26), .B(n2), .Y(n7) );
  NOR2X6M U7 ( .A(n2), .B(n7), .Y(n5) );
  INVX2M U8 ( .A(Enable), .Y(n26) );
  OAI32X1M U9 ( .A0(n15), .A1(n27), .A2(n28), .B0(n16), .B1(n1), .Y(N25) );
  NAND2X2M U10 ( .A(Enable), .B(n1), .Y(n15) );
  AOI21X2M U11 ( .A0(Enable), .A1(n28), .B0(N23), .Y(n16) );
  NOR2X2M U12 ( .A(n26), .B(ser_count[0]), .Y(N23) );
  OAI2BB1X2M U13 ( .A0N(ser_out), .A1N(n5), .B0(n6), .Y(n18) );
  AOI22X1M U14 ( .A0(DATA_V[1]), .A1(n7), .B0(DATA[0]), .B1(n2), .Y(n6) );
  OAI2BB1X2M U15 ( .A0N(DATA_V[1]), .A1N(n5), .B0(n14), .Y(n25) );
  AOI22X1M U16 ( .A0(DATA_V[2]), .A1(n7), .B0(DATA[1]), .B1(n2), .Y(n14) );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(DATA_V[2]), .B0(n13), .Y(n24) );
  AOI22X1M U18 ( .A0(DATA_V[3]), .A1(n7), .B0(DATA[2]), .B1(n2), .Y(n13) );
  OAI2BB1X2M U19 ( .A0N(n5), .A1N(DATA_V[3]), .B0(n12), .Y(n23) );
  AOI22X1M U20 ( .A0(DATA_V[4]), .A1(n7), .B0(DATA[3]), .B1(n2), .Y(n12) );
  OAI2BB1X2M U21 ( .A0N(n5), .A1N(DATA_V[4]), .B0(n11), .Y(n22) );
  AOI22X1M U22 ( .A0(DATA_V[5]), .A1(n7), .B0(DATA[4]), .B1(n2), .Y(n11) );
  OAI2BB1X2M U23 ( .A0N(n5), .A1N(DATA_V[5]), .B0(n10), .Y(n21) );
  AOI22X1M U24 ( .A0(DATA_V[6]), .A1(n7), .B0(DATA[5]), .B1(n2), .Y(n10) );
  OAI2BB1X2M U25 ( .A0N(n5), .A1N(DATA_V[6]), .B0(n9), .Y(n20) );
  AOI22X1M U26 ( .A0(DATA_V[7]), .A1(n7), .B0(DATA[6]), .B1(n2), .Y(n9) );
  AO22X1M U27 ( .A0(n5), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n2), .Y(n19) );
  NOR3X4M U28 ( .A(n1), .B(n27), .C(n28), .Y(N27) );
  INVX2M U29 ( .A(ser_count[1]), .Y(n28) );
  NOR2BX2M U30 ( .AN(DATA_VALID), .B(BUSY), .Y(n8) );
  INVX2M U31 ( .A(ser_count[0]), .Y(n27) );
  NOR2X2M U32 ( .A(n17), .B(n26), .Y(N24) );
  XNOR2X2M U33 ( .A(ser_count[0]), .B(ser_count[1]), .Y(n17) );
endmodule


module mux ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  output OUT;
  wire   mux_out, n2, n3, n1;

  DFFRQX2M OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(OUT) );
  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
endmodule


module parity_calc_WIDTH8 ( CLK, RST, PAR_EN, PAR_TYP, BUSY, DATA, DATA_VALID, 
        parity );
  input [7:0] DATA;
  input CLK, RST, PAR_EN, PAR_TYP, BUSY, DATA_VALID;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2,
         n17, n18, n19;
  wire   [7:0] DATA_V;

  DFFRQX2M parity_reg ( .D(n8), .CK(CLK), .RN(n17), .Q(parity) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(n17), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(n17), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(n17), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(n17), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(n17), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(n17), .Q(DATA_V[7]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(n17), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(n17), .Q(DATA_V[6]) );
  INVX4M U2 ( .A(n18), .Y(n17) );
  INVX2M U3 ( .A(RST), .Y(n18) );
  CLKBUFX6M U4 ( .A(n7), .Y(n2) );
  NOR2BX2M U5 ( .AN(DATA_VALID), .B(BUSY), .Y(n7) );
  AO2B2X2M U6 ( .B0(DATA[0]), .B1(n2), .A0(DATA_V[0]), .A1N(n2), .Y(n9) );
  AO2B2X2M U7 ( .B0(DATA[1]), .B1(n2), .A0(DATA_V[1]), .A1N(n2), .Y(n10) );
  AO2B2X2M U8 ( .B0(DATA[2]), .B1(n2), .A0(DATA_V[2]), .A1N(n2), .Y(n11) );
  AO2B2X2M U9 ( .B0(DATA[3]), .B1(n2), .A0(DATA_V[3]), .A1N(n2), .Y(n12) );
  AO2B2X2M U10 ( .B0(DATA[4]), .B1(n2), .A0(DATA_V[4]), .A1N(n2), .Y(n13) );
  AO2B2X2M U11 ( .B0(DATA[5]), .B1(n2), .A0(DATA_V[5]), .A1N(n2), .Y(n14) );
  AO2B2X2M U12 ( .B0(DATA[6]), .B1(n2), .A0(DATA_V[6]), .A1N(n2), .Y(n15) );
  AO2B2X2M U13 ( .B0(DATA[7]), .B1(n2), .A0(DATA_V[7]), .A1N(n2), .Y(n16) );
  XNOR2X2M U14 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  XOR3XLM U15 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U16 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
  OAI2BB2X1M U17 ( .B0(n1), .B1(n19), .A0N(parity), .A1N(n19), .Y(n8) );
  INVX2M U18 ( .A(PAR_EN), .Y(n19) );
  XOR3XLM U19 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U20 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, P_DATA, DATA_VALID, PAR_EN, PAR_TYP, 
        TX_OUT, BUSY );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP;
  output TX_OUT, BUSY;
  wire   seriz_done, seriz_en, ser_data, parity;
  wire   [1:0] mux_sel;

  uart_tx_fsm U0_fsm ( .CLK(CLK), .RST(RST), .DATA_VALID(DATA_VALID), 
        .ser_done(seriz_done), .PAR_EN(PAR_EN), .Ser_enable(seriz_en), 
        .mux_sel(mux_sel), .BUSY(BUSY) );
  Serializer_WIDTH8 U0_Serializer ( .CLK(CLK), .RST(RST), .DATA(P_DATA), 
        .Enable(seriz_en), .BUSY(BUSY), .DATA_VALID(DATA_VALID), .ser_out(
        ser_data), .ser_done(seriz_done) );
  mux U0_mux ( .CLK(CLK), .RST(RST), .IN_0(1'b0), .IN_1(ser_data), .IN_2(
        parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT) );
  parity_calc_WIDTH8 U0_parity_calc ( .CLK(CLK), .RST(RST), .PAR_EN(PAR_EN), 
        .PAR_TYP(PAR_TYP), .BUSY(BUSY), .DATA(P_DATA), .DATA_VALID(DATA_VALID), 
        .parity(parity) );
endmodule


module uart_rx_fsm_DATA_WIDTH8 ( CLK, RST, S_DATA, Prescale, PAR_EN, bit_count, 
        edge_count, Parity_Error, Stop_Error, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, DATA_VALID
 );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, PAR_EN, Parity_Error, Stop_Error, strt_glitch;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, DATA_VALID;
  wire   \sub_40/carry[5] , \sub_40/carry[4] , \sub_40/carry[3] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  NOR3BX4M U3 ( .AN(current_state[0]), .B(n35), .C(current_state[2]), .Y(
        deser_en) );
  INVX2M U4 ( .A(n13), .Y(n7) );
  NAND2X1M U5 ( .A(n6), .B(n7), .Y(edge_bit_en) );
  NOR2X2M U6 ( .A(n29), .B(n7), .Y(stp_chk_en) );
  NAND2X2M U7 ( .A(n35), .B(n6), .Y(dat_samp_en) );
  INVX2M U8 ( .A(current_state[1]), .Y(n35) );
  OAI21X2M U9 ( .A0(current_state[0]), .A1(n36), .B0(n29), .Y(n6) );
  NAND2XLM U10 ( .A(n35), .B(n29), .Y(n17) );
  NAND3BXLM U11 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n26)
         );
  NOR2XLM U12 ( .A(current_state[2]), .B(n7), .Y(par_chk_en) );
  NAND3BXLM U13 ( .AN(stp_chk_en), .B(n8), .C(n9), .Y(next_state[2]) );
  NOR2X2M U14 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  XNOR2X2M U15 ( .A(Prescale[1]), .B(edge_count[1]), .Y(n32) );
  INVX2M U16 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  INVX2M U17 ( .A(Prescale[3]), .Y(n5) );
  XNOR2X1M U18 ( .A(Prescale[5]), .B(\sub_40/carry[5] ), .Y(
        error_check_edge[5]) );
  OR2X1M U19 ( .A(Prescale[4]), .B(\sub_40/carry[4] ), .Y(\sub_40/carry[5] )
         );
  XNOR2X1M U20 ( .A(\sub_40/carry[4] ), .B(Prescale[4]), .Y(
        error_check_edge[4]) );
  OR2X1M U21 ( .A(Prescale[3]), .B(\sub_40/carry[3] ), .Y(\sub_40/carry[4] )
         );
  XNOR2X1M U22 ( .A(\sub_40/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U23 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_40/carry[3] ) );
  XNOR2X1M U24 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  NAND2BX1M U25 ( .AN(Prescale[1]), .B(check_edge[0]), .Y(n1) );
  OAI2BB1X1M U26 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n1), .Y(
        check_edge[1]) );
  AO21XLM U27 ( .A0(n1), .A1(Prescale[2]), .B0(n2), .Y(check_edge[2]) );
  CLKNAND2X2M U28 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U29 ( .A0(n2), .A1(n5), .B0(n3), .Y(check_edge[3]) );
  XNOR2X1M U30 ( .A(Prescale[4]), .B(n3), .Y(check_edge[4]) );
  NOR2X1M U31 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U32 ( .A(Prescale[5]), .B(n4), .Y(check_edge[5]) );
  NOR2X1M U33 ( .A(current_state[1]), .B(n6), .Y(strt_chk_en) );
  CLKINVX1M U34 ( .A(n10), .Y(n9) );
  NOR3BX1M U35 ( .AN(deser_en), .B(n11), .C(PAR_EN), .Y(n10) );
  NAND4X1M U36 ( .A(bit_count[3]), .B(bit_count[0]), .C(n12), .D(n13), .Y(n8)
         );
  OAI21X1M U37 ( .A0(current_state[2]), .A1(n14), .B0(n7), .Y(next_state[1])
         );
  AOI31X1M U38 ( .A0(current_state[0]), .A1(n12), .A2(n15), .B0(
        current_state[1]), .Y(n14) );
  NOR3X1M U39 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n15)
         );
  OAI211X1M U40 ( .A0(n16), .A1(n17), .B0(n18), .C0(n19), .Y(next_state[0]) );
  AOI2BB2XLM U41 ( .B0(deser_en), .B1(n11), .A0N(n20), .A1N(S_DATA), .Y(n19)
         );
  NAND3X1M U42 ( .A(n12), .B(n21), .C(bit_count[3]), .Y(n11) );
  NAND4X1M U43 ( .A(n22), .B(n23), .C(n24), .D(n25), .Y(n18) );
  NOR3X1M U44 ( .A(n26), .B(n27), .C(n28), .Y(n25) );
  CLKXOR2X2M U45 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n28) );
  CLKXOR2X2M U46 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n27) );
  NOR3X1M U47 ( .A(n30), .B(n31), .C(n32), .Y(n24) );
  CLKXOR2X2M U48 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n31) );
  CLKXOR2X2M U49 ( .A(error_check_edge[2]), .B(edge_count[2]), .Y(n30) );
  XNOR2X1M U50 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n23) );
  MXI2X1M U51 ( .A(n33), .B(n34), .S0(bit_count[0]), .Y(n22) );
  OR2X1M U52 ( .A(bit_count[1]), .B(PAR_EN), .Y(n34) );
  CLKNAND2X2M U53 ( .A(bit_count[1]), .B(PAR_EN), .Y(n33) );
  MXI2X1M U54 ( .A(n36), .B(n37), .S0(current_state[0]), .Y(n16) );
  NAND4BX1M U55 ( .AN(bit_count[3]), .B(strt_glitch), .C(n12), .D(n21), .Y(n37) );
  CLKINVX1M U56 ( .A(bit_count[0]), .Y(n21) );
  AND4X1M U57 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n12) );
  NOR4X1M U58 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U59 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n45) );
  CLKXOR2X2M U60 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n44) );
  CLKXOR2X2M U61 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n43) );
  CLKXOR2X2M U62 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n42) );
  NOR2X1M U63 ( .A(bit_count[2]), .B(bit_count[1]), .Y(n40) );
  XNOR2X1M U64 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n39) );
  XNOR2X1M U65 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n38) );
  NOR2X1M U66 ( .A(n35), .B(current_state[0]), .Y(n13) );
  CLKINVX1M U67 ( .A(current_state[2]), .Y(n29) );
  CLKINVX1M U68 ( .A(S_DATA), .Y(n36) );
  NOR3X1M U69 ( .A(n20), .B(Stop_Error), .C(Parity_Error), .Y(DATA_VALID) );
  NAND3X1M U70 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .Y(n20) );
endmodule


module edge_bit_counter ( CLK, RST, Enable, Prescale, bit_count, edge_count );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable;
  wire   N8, N9, N10, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, \add_26/carry[5] , \add_26/carry[4] , \add_26/carry[3] ,
         \add_26/carry[2] , n1, n2, n3, n5, n6, n7, n8, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  DFFRX2M \bit_count_reg[3]  ( .D(n17), .CK(CLK), .RN(n2), .Q(bit_count[3]), 
        .QN(n4) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n18), .CK(CLK), .RN(n2), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(n2), .Q(bit_count[1])
         );
  DFFRQX2M \edge_count_reg[4]  ( .D(N23), .CK(CLK), .RN(n2), .Q(edge_count[4])
         );
  DFFRQX4M \edge_count_reg[0]  ( .D(N19), .CK(CLK), .RN(n2), .Q(edge_count[0])
         );
  DFFRQX4M \edge_count_reg[1]  ( .D(N20), .CK(CLK), .RN(n2), .Q(edge_count[1])
         );
  DFFRQX4M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(n2), .Q(bit_count[0])
         );
  DFFRQX4M \edge_count_reg[2]  ( .D(N21), .CK(CLK), .RN(n2), .Q(edge_count[2])
         );
  DFFRQX4M \edge_count_reg[3]  ( .D(N22), .CK(CLK), .RN(n2), .Q(edge_count[3])
         );
  DFFRQX4M \edge_count_reg[5]  ( .D(N24), .CK(CLK), .RN(n2), .Q(edge_count[5])
         );
  XOR2XLM U3 ( .A(N29), .B(edge_count[4]), .Y(n29) );
  NOR4X2M U4 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(N31) );
  NOR2X2M U5 ( .A(n5), .B(Prescale[2]), .Y(n6) );
  INVX4M U6 ( .A(n3), .Y(n2) );
  INVX2M U7 ( .A(RST), .Y(n3) );
  INVX4M U8 ( .A(n13), .Y(n31) );
  INVX2M U9 ( .A(Enable), .Y(n35) );
  NOR2X3M U10 ( .A(n35), .B(N31), .Y(n13) );
  NOR2BX2M U11 ( .AN(N8), .B(n31), .Y(N20) );
  NOR2BX2M U12 ( .AN(N9), .B(n31), .Y(N21) );
  NOR2BX2M U13 ( .AN(N10), .B(n31), .Y(N22) );
  NOR2BX2M U14 ( .AN(N11), .B(n31), .Y(N23) );
  AOI21X2M U15 ( .A0(n32), .A1(Enable), .B0(n13), .Y(n16) );
  OAI32X1M U16 ( .A0(n35), .A1(bit_count[0]), .A2(n13), .B0(n32), .B1(n31), 
        .Y(n20) );
  OAI32X1M U17 ( .A0(n14), .A1(bit_count[2]), .A2(n33), .B0(n15), .B1(n34), 
        .Y(n18) );
  AOI21BX2M U18 ( .A0(Enable), .A1(n33), .B0N(n16), .Y(n15) );
  NAND3X1M U19 ( .A(bit_count[0]), .B(n31), .C(Enable), .Y(n14) );
  OAI22X1M U20 ( .A0(n16), .A1(n33), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  NOR2X2M U21 ( .A(n1), .B(n31), .Y(N24) );
  XNOR2X2M U22 ( .A(\add_26/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U23 ( .A(edge_count[0]), .B(n31), .Y(N19) );
  OAI32X1M U24 ( .A0(n9), .A1(n10), .A2(n35), .B0(n11), .B1(n4), .Y(n17) );
  NAND3XLM U25 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  NOR2X2M U26 ( .A(n12), .B(n13), .Y(n11) );
  AOI2BB1X2M U27 ( .A0N(n10), .A1N(n34), .B0(n35), .Y(n12) );
  INVX2M U28 ( .A(bit_count[1]), .Y(n33) );
  INVX2M U29 ( .A(bit_count[0]), .Y(n32) );
  NAND2X2M U30 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  INVX2M U31 ( .A(bit_count[2]), .Y(n34) );
  ADDHX1M U32 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_26/carry[2] ), 
        .S(N8) );
  ADDHX1M U33 ( .A(edge_count[2]), .B(\add_26/carry[2] ), .CO(
        \add_26/carry[3] ), .S(N9) );
  ADDHX1M U34 ( .A(edge_count[3]), .B(\add_26/carry[3] ), .CO(
        \add_26/carry[4] ), .S(N10) );
  ADDHX1M U35 ( .A(edge_count[4]), .B(\add_26/carry[4] ), .CO(
        \add_26/carry[5] ), .S(N11) );
  INVX2M U36 ( .A(Prescale[0]), .Y(N25) );
  INVX2M U37 ( .A(Prescale[3]), .Y(n21) );
  NAND2BX1M U38 ( .AN(Prescale[1]), .B(N25), .Y(n5) );
  OAI2BB1X1M U39 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n5), .Y(N26) );
  AO21XLM U40 ( .A0(n5), .A1(Prescale[2]), .B0(n6), .Y(N27) );
  CLKNAND2X2M U41 ( .A(n6), .B(n21), .Y(n7) );
  OAI21X1M U42 ( .A0(n6), .A1(n21), .B0(n7), .Y(N28) );
  XNOR2X1M U43 ( .A(Prescale[4]), .B(n7), .Y(N29) );
  NOR2X1M U44 ( .A(Prescale[4]), .B(n7), .Y(n8) );
  CLKXOR2X2M U45 ( .A(Prescale[5]), .B(n8), .Y(N30) );
  NOR2BX1M U46 ( .AN(edge_count[0]), .B(N25), .Y(n22) );
  OAI2B2X1M U47 ( .A1N(N26), .A0(n22), .B0(edge_count[1]), .B1(n22), .Y(n26)
         );
  NOR2BX1M U48 ( .AN(N25), .B(edge_count[0]), .Y(n23) );
  OAI2B2X1M U49 ( .A1N(edge_count[1]), .A0(n23), .B0(N26), .B1(n23), .Y(n25)
         );
  XNOR2X1M U50 ( .A(N30), .B(edge_count[5]), .Y(n24) );
  NAND3X1M U51 ( .A(n26), .B(n25), .C(n24), .Y(n30) );
  CLKXOR2X2M U52 ( .A(N27), .B(edge_count[2]), .Y(n28) );
  CLKXOR2X2M U53 ( .A(N28), .B(edge_count[3]), .Y(n27) );
endmodule


module data_sampling ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable;
  output sampled_bit;
  wire   N58, n19, n20, n21, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;
  wire   [4:0] half_edges;
  wire   [4:0] half_edges_p1;
  wire   [4:0] half_edges_n1;
  wire   [2:0] Samples;

  DFFRQX2M \Samples_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(Samples[2]) );
  DFFRQX2M \Samples_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(Samples[1]) );
  DFFRQX2M \Samples_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(Samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(N58), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  XOR2XLM U3 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n37) );
  XNOR2X4M U4 ( .A(Prescale[4]), .B(n2), .Y(half_edges[3]) );
  NOR2X2M U5 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n5) );
  AO21X1M U6 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n1), .Y(half_edges[1])
         );
  NAND2X1M U7 ( .A(n5), .B(n8), .Y(n6) );
  OAI21XLM U8 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edges_n1[2]) );
  OAI21X2M U9 ( .A0(n1), .A1(n4), .B0(n2), .Y(half_edges[2]) );
  XNOR2XLM U10 ( .A(half_edges[3]), .B(n6), .Y(half_edges_n1[3]) );
  NOR2XLM U11 ( .A(half_edges[3]), .B(n6), .Y(n7) );
  XOR2X1M U12 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n31) );
  NAND2X1M U13 ( .A(S_DATA), .B(Enable), .Y(n10) );
  NAND2XLM U14 ( .A(Samples[2]), .B(Enable), .Y(n9) );
  XNOR2XLM U15 ( .A(edge_count[2]), .B(half_edges[2]), .Y(n26) );
  XNOR2XLM U16 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n28) );
  NOR2X2M U17 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  INVX2M U18 ( .A(Prescale[1]), .Y(half_edges[0]) );
  INVXLM U19 ( .A(half_edges[2]), .Y(n8) );
  ADDHX1M U20 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(
        \add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U21 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(
        \add_21/carry[4] ), .S(half_edges_p1[3]) );
  ADDHX1M U22 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  XNOR2X2M U23 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n38) );
  INVX2M U24 ( .A(Prescale[3]), .Y(n4) );
  CLKNAND2X2M U25 ( .A(n1), .B(n4), .Y(n2) );
  NOR2X1M U26 ( .A(Prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U27 ( .A(Prescale[5]), .B(n3), .Y(half_edges[4]) );
  CLKXOR2X2M U28 ( .A(\add_21/carry[4] ), .B(half_edges[4]), .Y(
        half_edges_p1[4]) );
  AO21XLM U29 ( .A0(half_edges[0]), .A1(half_edges[1]), .B0(n5), .Y(
        half_edges_n1[1]) );
  CLKXOR2X2M U30 ( .A(half_edges[4]), .B(n7), .Y(half_edges_n1[4]) );
  MXI2X1M U31 ( .A(n9), .B(n10), .S0(n11), .Y(n21) );
  NOR4X1M U32 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n11) );
  CLKXOR2X2M U33 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n15) );
  OR2X1M U34 ( .A(edge_count[5]), .B(n16), .Y(n13) );
  NAND4X1M U35 ( .A(n17), .B(n18), .C(n22), .D(n23), .Y(n12) );
  XNOR2X1M U36 ( .A(edge_count[1]), .B(half_edges_p1[1]), .Y(n23) );
  XNOR2X1M U37 ( .A(edge_count[2]), .B(half_edges_p1[2]), .Y(n22) );
  XNOR2X1M U38 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n18) );
  CLKXOR2X2M U39 ( .A(n24), .B(half_edges_p1[4]), .Y(n17) );
  MXI2X1M U40 ( .A(n25), .B(n10), .S0(n14), .Y(n20) );
  AND4X1M U41 ( .A(n26), .B(n27), .C(n28), .D(n29), .Y(n14) );
  NOR4X1M U42 ( .A(edge_count[5]), .B(n16), .C(n30), .D(n31), .Y(n29) );
  CLKXOR2X2M U43 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n30) );
  CLKXOR2X2M U44 ( .A(n24), .B(half_edges[4]), .Y(n27) );
  CLKINVX1M U45 ( .A(edge_count[4]), .Y(n24) );
  CLKNAND2X2M U46 ( .A(Samples[1]), .B(Enable), .Y(n25) );
  MXI2X1M U47 ( .A(n32), .B(n10), .S0(n16), .Y(n19) );
  AND4X1M U48 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n16) );
  NOR3X1M U49 ( .A(n37), .B(edge_count[5]), .C(n38), .Y(n36) );
  XNOR2X1M U50 ( .A(edge_count[2]), .B(half_edges_n1[2]), .Y(n35) );
  XNOR2X1M U51 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n34) );
  XNOR2X1M U52 ( .A(edge_count[1]), .B(half_edges_n1[1]), .Y(n33) );
  CLKNAND2X2M U53 ( .A(Samples[0]), .B(Enable), .Y(n32) );
  AOI21BX1M U54 ( .A0(n39), .A1(n40), .B0N(Enable), .Y(N58) );
  OAI21X1M U55 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n40) );
  CLKNAND2X2M U56 ( .A(Samples[0]), .B(Samples[1]), .Y(n39) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, sampled_bit, Enable, edge_count, 
        Prescale, P_DATA );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(n3), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(n3), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(n3), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(n3), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(n3), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(n3), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(n3), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(n3), .Q(P_DATA[2]) );
  NOR2X2M U3 ( .A(n5), .B(Prescale[2]), .Y(n6) );
  BUFX4M U4 ( .A(n1), .Y(n2) );
  INVX4M U5 ( .A(n4), .Y(n3) );
  INVX2M U6 ( .A(RST), .Y(n4) );
  INVX4M U7 ( .A(n2), .Y(n34) );
  OAI22X1M U8 ( .A0(n34), .A1(n33), .B0(n2), .B1(n32), .Y(n11) );
  OAI22X1M U9 ( .A0(n34), .A1(n32), .B0(n2), .B1(n31), .Y(n12) );
  OAI22X1M U10 ( .A0(n34), .A1(n31), .B0(n2), .B1(n30), .Y(n13) );
  OAI22X1M U11 ( .A0(n34), .A1(n30), .B0(n2), .B1(n29), .Y(n14) );
  OAI22X1M U12 ( .A0(n34), .A1(n29), .B0(n2), .B1(n28), .Y(n15) );
  OAI22X1M U13 ( .A0(n34), .A1(n28), .B0(n2), .B1(n27), .Y(n16) );
  OAI2BB2X1M U14 ( .B0(n34), .B1(n27), .A0N(sampled_bit), .A1N(n34), .Y(n17)
         );
  OAI2BB2X1M U15 ( .B0(n2), .B1(n33), .A0N(P_DATA[0]), .A1N(n2), .Y(n10) );
  NAND2XLM U16 ( .A(N7), .B(Enable), .Y(n1) );
  INVX2M U17 ( .A(P_DATA[7]), .Y(n27) );
  INVX2M U18 ( .A(P_DATA[2]), .Y(n32) );
  INVX2M U19 ( .A(P_DATA[6]), .Y(n28) );
  INVX2M U20 ( .A(P_DATA[3]), .Y(n31) );
  INVX2M U21 ( .A(P_DATA[1]), .Y(n33) );
  INVX2M U22 ( .A(P_DATA[5]), .Y(n29) );
  INVX2M U23 ( .A(P_DATA[4]), .Y(n30) );
  INVX2M U24 ( .A(Prescale[0]), .Y(N1) );
  INVX2M U25 ( .A(Prescale[3]), .Y(n9) );
  NAND2BX1M U26 ( .AN(Prescale[1]), .B(N1), .Y(n5) );
  OAI2BB1X1M U27 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n5), .Y(N2) );
  AO21XLM U28 ( .A0(n5), .A1(Prescale[2]), .B0(n6), .Y(N3) );
  CLKNAND2X2M U29 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U30 ( .A0(n6), .A1(n9), .B0(n7), .Y(N4) );
  XNOR2X1M U31 ( .A(Prescale[4]), .B(n7), .Y(N5) );
  NOR2X1M U32 ( .A(Prescale[4]), .B(n7), .Y(n8) );
  CLKXOR2X2M U33 ( .A(Prescale[5]), .B(n8), .Y(N6) );
  NOR2BX1M U34 ( .AN(edge_count[0]), .B(N1), .Y(n18) );
  OAI2B2X1M U35 ( .A1N(N2), .A0(n18), .B0(edge_count[1]), .B1(n18), .Y(n22) );
  NOR2BX1M U36 ( .AN(N1), .B(edge_count[0]), .Y(n19) );
  OAI2B2X1M U37 ( .A1N(edge_count[1]), .A0(n19), .B0(N2), .B1(n19), .Y(n21) );
  XNOR2X1M U38 ( .A(N6), .B(edge_count[5]), .Y(n20) );
  NAND3X1M U39 ( .A(n22), .B(n21), .C(n20), .Y(n26) );
  CLKXOR2X2M U40 ( .A(N5), .B(edge_count[4]), .Y(n25) );
  CLKXOR2X2M U41 ( .A(N3), .B(edge_count[2]), .Y(n24) );
  CLKXOR2X2M U42 ( .A(N4), .B(edge_count[3]), .Y(n23) );
  NOR4X1M U43 ( .A(n26), .B(n25), .C(n24), .D(n23), .Y(N7) );
endmodule


module strt_chk ( CLK, RST, sampled_bit, Enable, strt_glitch );
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire   n1;

  DFFRQX2M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
endmodule


module par_chk_DATA_WIDTH8 ( CLK, RST, PAR_TYP, sampled_bit, Enable, P_DATA, 
        Parity_Error );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, sampled_bit, Enable;
  output Parity_Error;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX4M Parity_Error_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(Parity_Error) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(Parity_Error), .A1N(n2), .Y(n8) );
  XOR3XLM U3 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U4 ( .A(Enable), .Y(n2) );
  XNOR2X2M U5 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U6 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U7 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  XOR3XLM U8 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U9 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
endmodule


module stp_chk ( CLK, RST, sampled_bit, Enable, Stop_Error );
  input CLK, RST, sampled_bit, Enable;
  output Stop_Error;
  wire   n2, n1;

  DFFRQX4M Stop_Error_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(Stop_Error) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(Stop_Error), .A1N(n1), .Y(n2) );
  INVXLM U3 ( .A(Enable), .Y(n1) );
endmodule


module UART_RX ( CLK, RST, RX_IN, PAR_EN, PAR_TYP, Prescale, P_DATA, 
        DATA_VALID, Parity_Error, Stop_Error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP;
  output DATA_VALID, Parity_Error, Stop_Error;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .PAR_EN(PAR_EN), .bit_count(bit_count), 
        .edge_count(edge_count), .Parity_Error(Parity_Error), .Stop_Error(
        Stop_Error), .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), 
        .edge_bit_en(edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .DATA_VALID(DATA_VALID)
         );
  edge_bit_counter U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .Prescale(Prescale), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 U0_deserializer ( .CLK(CLK), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(Prescale), .P_DATA(P_DATA) );
  strt_chk U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch) );
  par_chk_DATA_WIDTH8 U0_par_chk ( .CLK(CLK), .RST(n1), .PAR_TYP(PAR_TYP), 
        .sampled_bit(sampled_bit), .Enable(par_chk_en), .P_DATA(P_DATA), 
        .Parity_Error(Parity_Error) );
  stp_chk U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(stp_chk_en), .Stop_Error(Stop_Error) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP_DATA_WIDTH8 ( UART_CONFIG, TX_CLK, RX_CLK, RST, RX_IN, 
        RX_D_VLD, TX_D_VLD, TX_IN_P, TX_OUT, BUSY, RX_OUT, Parity_Error, 
        Stop_Error );
  input [7:0] UART_CONFIG;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT;
  input TX_CLK, RX_CLK, RST, RX_IN, TX_D_VLD;
  output RX_D_VLD, TX_OUT, BUSY, Parity_Error, Stop_Error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 UART_TX_inst ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), 
        .DATA_VALID(TX_D_VLD), .PAR_EN(UART_CONFIG[0]), .PAR_TYP(
        UART_CONFIG[1]), .TX_OUT(TX_OUT), .BUSY(BUSY) );
  UART_RX UART_RX_inst ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(
        UART_CONFIG[0]), .PAR_TYP(UART_CONFIG[1]), .Prescale(UART_CONFIG[7:2]), 
        .P_DATA(RX_OUT), .DATA_VALID(RX_D_VLD), .Parity_Error(Parity_Error), 
        .Stop_Error(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module system_top ( REF_CLK, RST, UART_CLK, RX_IN, TX_OUT, Parity_Error, 
        Stop_Error );
  input REF_CLK, RST, UART_CLK, RX_IN;
  output TX_OUT, Parity_Error, Stop_Error;
  wire   sync_rst, TX_D_VLD, TX_CLK, SYNC_RST_UART, rinc, wfull, rempty,
         DATA_VALID, RX_D_VLD, BUSY, CLK_EN, GATED_CLK, i_clk_en, RX_CLK,
         ALU_EN, OUT_VALID, WrEn, RdEn, RdData_Valid, n2, n3, n4, n5;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] fifo_RdData;
  wire   [7:0] RX_OUT;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] i_div_ratio;
  wire   [7:0] div_ratio_rx;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] A;
  wire   [7:0] B;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] WrData;
  wire   [3:0] Address;
  wire   [7:0] RdData;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  ASYNC_FIFO_data_width8_addr_size3 ASYNC_FIFO_inst ( .wclk(REF_CLK), .wrst_n(
        n3), .winc(TX_D_VLD), .rclk(TX_CLK), .rrst_n(SYNC_RST_UART), .rinc(
        rinc), .WrData(TX_P_DATA), .wfull(wfull), .rempty(rempty), .RdData(
        fifo_RdData) );
  DATA_SYNC_num_stages2_data_width8 DATA_SYNC_inst ( .clk(REF_CLK), .rst(n3), 
        .unsync_bus(RX_OUT), .bus_enable(DATA_VALID), .sync_bus(RX_P_DATA), 
        .enable_pulse(RX_D_VLD) );
  PULSE_GEN PULSE_GEN ( .CLK(TX_CLK), .RST(SYNC_RST_UART), .LVL_SIG(BUSY), 
        .PULSE_SIG(rinc) );
  RST_SYNC_num_stages2_0 RST_SYNC_ref ( .RST(RST), .CLK(REF_CLK), .sync_rst(
        sync_rst) );
  RST_SYNC_num_stages2_1 RST_SYNC_uart ( .RST(RST), .CLK(UART_CLK), .sync_rst(
        SYNC_RST_UART) );
  CLK_GATE CLK_GATE ( .CLK_EN(CLK_EN), .CLK(REF_CLK), .GATED_CLK(GATED_CLK) );
  int_clk_div_0 int_clk_div_tx ( .i_ref_clk(UART_CLK), .i_rst_n(SYNC_RST_UART), 
        .i_clk_en(i_clk_en), .i_div_ratio(i_div_ratio), .o_div_clk(TX_CLK) );
  int_clk_div_1 int_clk_div_rx ( .i_ref_clk(UART_CLK), .i_rst_n(SYNC_RST_UART), 
        .i_clk_en(i_clk_en), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        div_ratio_rx[2:0]}), .o_div_clk(RX_CLK) );
  CLK_MUX CLK_MUX ( .Prescale(UART_CONFIG[7:2]), .div_ratio_rx({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, div_ratio_rx[2:0]}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16 ALU_INST ( .A(A), .B(B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(GATED_CLK), .RST(n3), .ALU_OUT(ALU_OUT), .OUT_VALID(
        OUT_VALID) );
  register8_16_addr_width4_MEM_DEPTH16_data_width8_MEM_WIDTH8 register8_16_inst ( 
        .CLK(REF_CLK), .WrEn(WrEn), .RdEn(RdEn), .RST(n3), .WrData(WrData), 
        .Address({Address[3:2], n2, Address[0]}), .RdData(RdData), 
        .RdData_Valid(RdData_Valid), .REG0(A), .REG1(B), .REG2(UART_CONFIG), 
        .REG3(i_div_ratio) );
  SYS_CTRL_width16_addr_width4_data_width8 SYS_CTRL ( .CLK(REF_CLK), .RST(n3), 
        .ALU_OUT(ALU_OUT), .OUT_VALID(OUT_VALID), .RdData(RdData), 
        .RdData_Valid(RdData_Valid), .RX_P_DATA(RX_P_DATA), .RX_D_VLD(RX_D_VLD), .wfull(wfull), .ALU_FUN(ALU_FUN), .ALU_EN(ALU_EN), .CLK_EN(CLK_EN), 
        .Address(Address), .WrEn(WrEn), .RdEn(RdEn), .WrData(WrData), 
        .TX_P_DATA(TX_P_DATA), .TX_D_VLD(TX_D_VLD), .clk_div_en(i_clk_en) );
  UART_TOP_DATA_WIDTH8 UART_TOP_inst ( .UART_CONFIG(UART_CONFIG), .TX_CLK(
        TX_CLK), .RX_CLK(RX_CLK), .RST(SYNC_RST_UART), .RX_IN(RX_IN), 
        .RX_D_VLD(DATA_VALID), .TX_D_VLD(n5), .TX_IN_P(fifo_RdData), .TX_OUT(
        TX_OUT), .BUSY(BUSY), .RX_OUT(RX_OUT), .Parity_Error(Parity_Error), 
        .Stop_Error(Stop_Error) );
  INVX2M U2 ( .A(n4), .Y(n3) );
  INVX2M U3 ( .A(rempty), .Y(n5) );
  BUFX2M U4 ( .A(Address[1]), .Y(n2) );
  INVX2M U5 ( .A(sync_rst), .Y(n4) );
endmodule


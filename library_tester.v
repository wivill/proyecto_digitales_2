module tester (oA, oB, oD, oClk, oEnb, oClr, oSel, oPre);

  output reg oA, oB, oD, oClk, oEnb, oClr, oSel, oPre;
  // Pruebas sincrónicas
  // Reloj
  initial begin
    oClk = 1'b0;
    oEnb = 1'b1;
    oClr = 1'b0;
    oSel = 1'b0;
    oPre = 1'b0;
    repeat(4) #35 oClk = ~oClk;
    oEnb = 1'b0;
    oClr = 1'b1;
    oPre = 1'b1;
    forever #35 oClk = ~oClk;
  end

  initial begin
    @(negedge oEnb);
    oSel = 1'b1;
    oD = 1'b1;
    oA = 1'b0;
    oB = 1'b0;
    repeat(3) @(posedge oClk);
    oSel = 1'b0;
    oD = 1'b0;
    oA = 1'b0;
    oB = 1'b1;
    repeat(3) @(posedge oClk);
    oSel = 1'b0;
    oD = 1'b1;
    oA = 1'b1;
    oB = 1'b0;
    repeat(3) @(posedge oClk);
    oSel = 1'b1;
    oD = 1'b0;
    oA = 1'b1;
    oB = 1'b1;
    repeat(3) @(posedge oClk);
    oSel = 1'b0;
    oD = 1'b1;
    oA = 1'b0;
    oB = 1'b0;
    repeat(3) @(posedge oClk);
    oSel = 1'b1;
    oD = 1'b0;
    oA = 1'b0;
    oB = 1'b1;
    repeat(3) @(posedge oClk);
    oSel = 1'b0;
    oD = 1'b0;
    oA = 1'b1;
    oB = 1'b0;
    repeat(3) @(posedge oClk);
    oSel = 1'b1;
    oD = 1'b1;
    oA = 1'b1;
    oB = 1'b1;
    repeat(3) @(posedge oClk);
    $finish;
  end

  initial begin
    $dumpfile ("library.vcd");
//    $dumpvars(1, library_tb);
    $dumpvars;
  end

endmodule // tester

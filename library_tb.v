`timescale 1ns/1ps
`include "library.v"
`include "library_tester.v"
module test_bench ();

  wire Nand, Nor, Not, Mux, Qn, Qp;

  tester tester00(
    oA, oB, oD, oClk, oEnb, oClr, oSel, oPre
  );

  nand_cell nand00
  (
    .oNand(Nand),
    .iA(oA),
    .iB(oB)
  );

  nor_cell nor00
  (
    .oNor(Nor),
    .iA(oA),
    .iB(oB)
  );

  not_cell not00
  (
    .oNot(Not),
    .iA(oA)
  );

  mux mux00
  (
    .oMux(Mux),
    .iA(oA),
    .iB(oB),
    .iSel(oSel),
    .iEnb(oEnb)
  );

  ffd ffd00
  (
    .iClr(oClr),
    .iPre(oPre),
    .iClk(oClk),
    .iD(oD),
    .oQp(Qp),
    .oQn(Qn)
  );

endmodule // test_bench

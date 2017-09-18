`timescale 1ns/1ps
//=============================================================================
//=============================================================================
module nand_cell (oNand, iA, iB);

  output                        oNand;
  input                         iA, iB;

  nand #(20:27:30) G1(oNand,iA,iB);

  specify
    specparam t_rise = 6;
    specparam t_fall = 6;

    (iA => oNand) = (t_rise, t_fall);
    (iB => oNand) = (t_rise, t_fall);
  endspecify


endmodule // nand
//=============================================================================
//=============================================================================
module nor_cell (oNor, iA, iB);

  output                        oNor;
  input                         iA, iB;

  nor #(20:27:30) G1(oNor,iA,iB);

  specify
    specparam t_rise = 6;
    specparam t_fall = 6;

    (iA => oNor) = (t_rise, t_fall);
    (iB => oNor) = (t_rise, t_fall);
  endspecify


endmodule // nor
//=============================================================================
//=============================================================================
module not_cell (oNot, iA);

  output                        oNot;
  input                         iA;

  not #(20:24:30) G1(oNot,iA);

  specify
    specparam t_rise = 6;
    specparam t_fall = 6;

    (iA => oNor) = (t_rise, t_fall);
  endspecify

endmodule // not
//=============================================================================
//=============================================================================
module mux (oMux, iA, iB, iSel, iEnb);

  output reg                    oMux;
  input wire                        iA, iB, iSel, iEnb;

  specify
    specparam t_rise = 6;
    specparam t_fall = 6;

    (iA => oMux) = (t_rise, t_fall);
    (iB => oMux) = (t_rise, t_fall);
    (iSel => oMux) = (t_rise, t_fall);
    (iEnb => oMux) = (t_rise, t_fall);
  endspecify

  always @ ( * ) begin
    if (~iEnb) begin
      case (iSel)
        1'b0:
        begin
          #(11:21:27) oMux <= iA;
        end
        1'b1:
        begin
          #(11:21:27) oMux <= iB;
        end
        default:
        begin
          #(11:21:27) oMux <= 1'b0;
        end
      endcase
    end else begin
      #(11:21:27) oMux <= 1'b0;
    end
  end

endmodule
//=============================================================================
//=============================================================================
module ffd (iClr, iPre, iClk, iD, oQp, oQn);

  output reg                oQp, oQn;
  input wire                iClr, iPre, iClk, iD;

  always @ ( posedge iClk ) begin
    if (iClr) begin
      case ({iPre})
        1'b0:
        begin
          #(10:15:30) oQp <= 1'b0;
          #(10:15:30) oQn <= 1'b1;
        end
        1'b1:
        begin
          #(10:15:30) oQp <= iD;
          #(10:15:30) oQn <= ~iD;
        end
        default:
        begin
          #(10:15:30) oQp <= oQp;
          #(10:15:30) oQn <= oQn;
        end
      endcase
    end else begin
      #(10:15:30) oQp <= 1'b0;
      #(10:15:30) oQn <= 1'b1;
    end
  end

  specify
    specparam t_rise = 6;
    specparam t_fall = 6;
    specparam t_setup_iD_iClk = 25;
    specparam t_hold_iD_iClk = 25;
    specparam t_width_l_iClk = 17;
    specparam t_width_h_iClk = 17;

    (posedge iClk *> (oQp +: iD)) = (t_rise, t_fall);
    (posedge iClk *> (oQn -: iD)) = (t_rise, t_fall);

    $setuphold(posedge iClk, posedge iD, t_setup_iD_iClk,t_hold_iD_iClk);
    $setuphold(posedge iClk, negedge iD, t_setup_iD_iClk,t_hold_iD_iClk);

    $width(posedge iClk, t_width_h_iClk, 0);
    $width(negedge iClk, t_width_l_iClk, 0);


  endspecify

endmodule // ffd

//=============================================================================
//=============================================================================

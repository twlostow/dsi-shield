import pkg_Axi4Agent::*;
import pkg_Axi4Driver::*;
import pkg_Axi4Types::*;

module Axi4MasterBFM #(
  parameter N = 1,
  parameter I = 1
)(
  AXI4 intf
);

  Axi4MasterAgent #(.N(N), .I(I)) Agent;
  Axi4MasterDriver #(.N(N), .I(I)) Driver;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;

  initial
  begin
    ARmbx = new();
    Rmbx = new();
    AWmbx = new();
    Wmbx = new();
    Bmbx = new();
    Agent = new(ARmbx, Rmbx, AWmbx, Wmbx, Bmbx);
    Driver = new(intf, ARmbx, Rmbx, AWmbx, Wmbx, Bmbx);
    Driver.Run;
  end
  
endmodule: Axi4MasterBFM

module Axi4SlaveBFM #(
  parameter N = 1,
  parameter I = 1
)(
  AXI4 intf
  );
  
  Axi4SlaveAgent #(.N(N), .I(I)) Agent;
  Axi4SlaveDriver #(.N(N), .I(I)) Driver;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;
  
  initial
  begin
    ARmbx = new();
    Rmbx = new();
    AWmbx = new();
    Wmbx = new();
    Bmbx = new();
    Agent = new(ARmbx, Rmbx, AWmbx, Wmbx, Bmbx);
    Driver = new(intf, ARmbx, Rmbx, AWmbx, Wmbx, Bmbx);
    Driver.Run;
  end
  
endmodule: Axi4SlaveBFM


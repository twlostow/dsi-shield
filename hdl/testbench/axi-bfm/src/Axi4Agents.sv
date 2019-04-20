package pkg_Axi4Agent;
import pkg_Axi4Types::*;

class Axi4MasterAgent #(
  parameter N = 1,
  parameter I = 1
);
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;

  ABeat #(N, I) AR_Q[$];
  RBeat #(N, I) R_Q[$];
  ABeat #(N, I) AW_Q[$];
  WBeat #(N) W_Q[$];
  BBeat #(I) B_Q[$];
  
  function new(
    mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx,
    mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx,
    mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx,
    mailbox #(.T(WBeat #(.N(N)))) Wmbx,
    mailbox #(.T(BBeat #(.I(I)))) Bmbx
  );
    this.ARmbx = ARmbx;
    this.Rmbx = Rmbx;
    this.AWmbx = AWmbx;
    this.Wmbx = Wmbx;
    this.Bmbx = Bmbx;
  endfunction

  task RBurst(
    input [I-1:0] id,
    input         len,
    inout byte    data[],
    inout bit [2:0] resp[]
  );
    bit [I-1:0] id_t;
    bit [255:0][N-1:0][7:0] data_t;
    bit [1:0] resp_t;
    bit last_t;
    int j=0;
    for (int i=0; i<256; i++)
    begin
//      RTransfer(0, id_t, data_t[j], resp_t, last_t);
      if (id_t == id)
      begin
        j++;
        if (last_t)
        
        break;
      end
    end
  endtask
  task WBurst(
    input int   len,
    input byte  data[],
    input bit   strb[]
  );
    bit [N-1:0][7:0] data_t;
    bit [N-1:0] strb_t;
    bit last_t;
    for(int i=0; i<len; i++)
    begin
      for(int j=0; j<N; j++)
      begin
        data_t[j] = data[N*i+j];
        strb_t[j] = strb[N*i+j];
      end
      last_t = (i == (len -1));
//      WTransfer(0, data_t, strb_t, last_t);
    end
  endtask
  
endclass: Axi4MasterAgent

class Axi4SlaveAgent #(
  parameter N = 1,
  parameter I = 1
);
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;

  function new(
    mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx,
    mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx,
    mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx,
    mailbox #(.T(WBeat #(.N(N)))) Wmbx,
    mailbox #(.T(BBeat #(.I(I)))) Bmbx
  );
    this.ARmbx = ARmbx;
    this.Rmbx = Rmbx;
    this.AWmbx = AWmbx;
    this.Wmbx = Wmbx;
    this.Bmbx = Bmbx;
  endfunction

endclass: Axi4SlaveAgent

endpackage : pkg_Axi4Agent
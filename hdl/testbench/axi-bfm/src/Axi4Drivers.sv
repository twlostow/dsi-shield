package pkg_Axi4Driver;
import pkg_Axi4Types::*;

class Axi4MasterDriver #(
  parameter N = 1,
  parameter I = 1
);

  virtual AXI4 #(.N(N), .I(I)) intf;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;

  function new(
    virtual AXI4 #(.N(N), .I(I)) intf, 
    mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx,
    mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx,
    mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx,
    mailbox #(.T(WBeat #(.N(N)))) Wmbx,
    mailbox #(.T(BBeat #(.I(I)))) Bmbx
  );
    this.intf = intf;
    this.ARmbx = ARmbx;
    this.Rmbx = Rmbx;
    this.AWmbx = AWmbx;
    this.Wmbx = Wmbx;
    this.Bmbx = Bmbx;
  endfunction

  task ARTransfer(
    ref ABeat #(.N(N), .I(I))  ab
  );
    intf.ARVALID <= 1'b1;
    intf.ARID <= ab.id;
    intf.ARADDR <= ab.addr;
    intf.ARREGION <= ab.region;
    intf.ARLEN <= ab.len;
    intf.ARSIZE <= ab.size;
    intf.ARBURST <= ab.burst;
    intf.ARLOCK <= ab.lock;
    intf.ARCACHE <= ab.cache;
    intf.ARPROT <= ab.prot;
    intf.ARQOS <= ab.qos;
    @(posedge intf.ACLK);
    while (!intf.ARREADY) @(posedge intf.ACLK);
    intf.ARVALID <= 1'b0;
  endtask
  
  task RTransfer(
    ref RBeat #(.N(N), .I(I))  rb
  );
    intf.RREADY <= 1'b1;
    while(!intf.RVALID) @(posedge intf.ACLK);
    rb.id = intf.RID;
    rb.data = intf.RDATA;
    rb.resp = intf.RRESP;
    rb.last = intf.RLAST;
    intf.RREADY <= 1'b0;
  endtask

  task AWTransfer(
    ref ABeat #(.N(N), .I(I)) ab
  );
    intf.AWVALID <= 1'b1;
    intf.AWID <= ab.id;
    intf.AWADDR <= ab.addr;
    intf.AWREGION <= ab.region;
    intf.AWLEN <= ab.len;
    intf.AWSIZE <= ab.size;
    intf.AWBURST <= ab.burst;
    intf.AWLOCK <= ab.lock;
    intf.AWCACHE <= ab.cache;
    intf.AWPROT <= ab.prot;
    intf.AWQOS <= ab.qos;
    @(posedge intf.ACLK);
    while (!intf.AWREADY) @(posedge intf.ACLK);
    intf.AWVALID <= 1'b0;
  endtask
  
  task WTransfer(
    ref WBeat #(.N(N)) wb
  );
    intf.WVALID <= 1'b1;
    intf.WDATA <= wb.data;
    intf.WSTRB <= wb.strb;
    intf.WLAST <= wb.last;
    @(posedge intf.ACLK);
    while (!intf.WREADY) @(posedge intf.ACLK);
    intf.WVALID <= 1'b0;
  endtask
  
  task BTransfer(
    ref BBeat #(.I(I)) bb
  );
    intf.BREADY <= 1'b1;
    while(!intf.BVALID) @(posedge intf.ACLK);
    bb.id = intf.BID;
    bb.resp = intf.BRESP;
    intf.BREADY <= 1'b0;
  endtask
  
  task ARLoop;
    ABeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        ARmbx.get(b);
        ARTransfer(b);
      end
      else 
        @(posedge intf.ARESETn);
  endtask
  
  task RLoop;
    RBeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        b = new();
        RTransfer(b);
        Rmbx.put(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task AWLoop;
    ABeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        AWmbx.get(b);
        AWTransfer(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task WLoop;
    WBeat #(.N(N)) b;
    forever
      if (intf.ARESETn)
      begin
        Wmbx.get(b);
        WTransfer(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task BLoop;
    BBeat #(.I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        b = new();
        BTransfer(b);
        Bmbx.put(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task ResetLoop;
    forever
    begin
    @(posedge intf.ACLK)
      if (!intf.ARESETn)
      begin
        intf.ARID     <= {I{1'b0}};
        intf.ARADDR   <= 32'b0;
        intf.ARREGION <= 4'b0;
        intf.ARLEN    <= 8'b0;
        intf.ARSIZE   <= (N==1)?3'b000:(N==2)?3'b001:(N==4)?3'b010:(N==8)?3'b011:(N==16)?3'b100:(N==32)?3'b101:(N==64)?3'b110:3'b111;
        intf.ARBURST  <= 2'b01;
        intf.ARLOCK   <= 1'b0;
        intf.ARCACHE  <= 4'b0;
        intf.ARPROT   <= 3'b0;
        intf.ARQOS    <= 4'b0;
        intf.ARVALID  <= 1'b0;
        intf.RREADY   <= 1'b0;
        intf.AWID     <= {I{1'b0}};
        intf.AWADDR   <= 32'b0;
        intf.AWREGION <= 4'b0;
        intf.AWLEN    <= 8'b0;
        intf.AWSIZE   <= (N==1)?3'b000:(N==2)?3'b001:(N==4)?3'b010:(N==8)?3'b011:(N==16)?3'b100:(N==32)?3'b101:(N==64)?3'b110:3'b111;
        intf.AWBURST  <= 2'b01;
        intf.AWLOCK   <= 1'b0;
        intf.AWCACHE  <= 4'b0;
        intf.AWPROT   <= 3'b0;
        intf.AWQOS    <= 4'b0;
        intf.AWVALID  <= 1'b0;
        intf.WDATA    <= {N{8'b0}};
        intf.WSTRB    <= {N{1'b1}};
        intf.WLAST    <= 1'b0;
        intf.WVALID   <= 1'b0;
        intf.BREADY   <= 1'b0;
      end
    end
  endtask

  task Run;
    fork
      ARLoop;
      RLoop;
      AWLoop;
      WLoop;
      BLoop;
      ResetLoop;
    join
  endtask

endclass

class Axi4SlaveDriver #(
  parameter N = 1,
  parameter I = 1
);
  virtual AXI4 #(.N(N), .I(I)) intf;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx;
  mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx;
  mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx;
  mailbox #(.T(WBeat #(.N(N)))) Wmbx;
  mailbox #(.T(BBeat #(.I(I)))) Bmbx;
  
  function new(
    virtual AXI4 #(.N(N), .I(I)) intf, 
    mailbox #(.T(ABeat #(.N(N), .I(I)))) ARmbx,
    mailbox #(.T(RBeat #(.N(N), .I(I)))) Rmbx,
    mailbox #(.T(ABeat #(.N(N), .I(I)))) AWmbx,
    mailbox #(.T(WBeat #(.N(N)))) Wmbx,
    mailbox #(.T(BBeat #(.I(I)))) Bmbx
  );
    this.intf = intf;
    this.ARmbx = ARmbx;
    this.Rmbx = Rmbx;
    this.AWmbx = AWmbx;
    this.Wmbx = Wmbx;
    this.Bmbx = Bmbx;
  endfunction
  
  task ARTransfer(
    ref ABeat #(.N(N), .I(I)) ab
  );
    intf.ARREADY <= 1'b1;
    while (!intf.ARVALID) @(posedge intf.ACLK);
    ab.id = intf.ARID;
    ab.addr = intf.ARADDR;
    ab.region = intf.ARREGION;
    ab.len = intf.ARLEN;
    ab.size = intf.ARSIZE;
    ab.burst = intf.ARBURST;
    ab.lock = intf.ARLOCK;
    ab.cache = intf.ARCACHE;
    ab.prot = intf.ARPROT;
    ab.qos = intf.ARQOS;
    intf.ARREADY <= 1'b0;
  endtask
  
  task RTransfer(
    ref RBeat #(.N(N), .I(I))  rb
  );
    intf.RVALID <= 1'b1;
    intf.RID <= rb.id;
    intf.RDATA <= rb.data;
    intf.RRESP <= rb.resp;
    intf.RLAST <= rb.last;
    @(posedge intf.ACLK);
    while(!intf.RREADY) @(posedge intf.ACLK);
    intf.RVALID <= 1'b0;
  endtask

  task AWTransfer(
    ref ABeat #(.N(N), .I(I)) ab
  );
    intf.AWREADY <= 1'b1;
    while (!intf.AWVALID) @(posedge intf.ACLK);
    ab.id = intf.AWID;
    ab.addr = intf.AWADDR;
    ab.region = intf.AWREGION;
    ab.len = intf.AWLEN;
    ab.size = intf.AWSIZE;
    ab.burst = intf.AWBURST;
    ab.lock = intf.AWLOCK;
    ab.cache = intf.AWCACHE;
    ab.prot = intf.AWPROT;
    ab.qos = intf.AWQOS;
    intf.AWREADY <= 1'b0;
  endtask
  
  task WTransfer(
    ref WBeat #(.N(N)) wb
  );
    intf.WREADY <= 1'b1;
    while (!intf.WVALID) @(posedge intf.ACLK);
    wb.data = intf.WDATA;
    wb.strb = intf.WSTRB;
    wb.last = intf.WLAST;
    intf.WREADY <= 1'b0;
  endtask
  
  task BTransfer(
    ref BBeat #(.I(I)) bb
  );
    intf.BVALID <= 1'b1;
    intf.BID <= bb.id;
    intf.BRESP <= bb.resp;
    @(posedge intf.ACLK);
    while(!intf.BREADY) @(posedge intf.ACLK);
    intf.BVALID <= 1'b0;
  endtask

  task ARLoop;
    ABeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        b = new();
        ARTransfer(b);
        ARmbx.put(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task RLoop;
    RBeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        Rmbx.get(b);
        RTransfer(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task AWLoop;
    ABeat #(.N(N), .I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        b = new();
        AWTransfer(b);
        AWmbx.put(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask
  
  task WLoop;
    WBeat #(.N(N)) b;
    forever
      if (intf.ARESETn)
      begin
        b = new();
        WTransfer(b);
        Wmbx.put(b);
      end
      else 
        @(posedge intf.ARESETn);
  endtask
  
  task BLoop;
    BBeat #(.I(I)) b;
    forever
      if (intf.ARESETn)
      begin
        Bmbx.get(b);
        BTransfer(b);
      end
      else
        @(posedge intf.ARESETn);
  endtask

  task ResetLoop;
    forever
    begin
      @(posedge intf.ACLK)
      if (!intf.ARESETn)
      begin
        intf.ARREADY  <= 1'b0;
        intf.RID      <= {I{1'b0}};
        intf.RDATA    <= {N{8'b0}};
        intf.RRESP    <= 2'b0;
        intf.RLAST    <= 1'b0;
        intf.RVALID   <= 1'b0;
        intf.AWREADY  <= 1'b0;
        intf.WREADY   <= 1'b0;
        intf.BID      <= {I{1'b0}};
        intf.BRESP    <= 2'b0;
        intf.BVALID   <= 1'b0;
      end
    end
  endtask

  task Run;
    fork
      ARLoop;
      RLoop;
      AWLoop;
      WLoop;
      BLoop;
      ResetLoop;
    join
  endtask
  
endclass

endpackage : pkg_Axi4Driver


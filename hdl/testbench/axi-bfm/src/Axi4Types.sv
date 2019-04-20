package pkg_Axi4Types;

class ABeat #(int N=1, int I=1);
  bit [I-1:0] id;
  bit [31:0] addr;
  bit [3:0] region;
  bit [7:0] len;
  bit [2:0] size;
  bit [1:0] burst;
  bit lock;
  bit [3:0] cache;
  bit [2:0] prot;
  bit [3:0] qos;
endclass: ABeat

class BBeat #(int I=1);
  bit [I-1:0]  id;
  bit [1:0]    resp;  
endclass: BBeat

class RBeat #(int N=1, int I=1);
  bit [I-1:0]    id;
  bit [8*N-1:0]  data;
  bit [1:0]      resp;
  bit            last;
endclass: RBeat

class WBeat #(int N=1);
  bit [8*N-1:0] data;
  bit [N-1:0]   strb;
  bit           last;
endclass: WBeat

endpackage: pkg_Axi4Types


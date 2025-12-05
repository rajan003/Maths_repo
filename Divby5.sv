//Question and explanation in divby3 and divby4
module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

/// MNOD value is nothing but remainder ..
/// Calculation is totally done on continious remainders
enum bit[2:0] {MODR, MOD0,MOD1, MOD2, MOD3,MOD4} state;

always@(posedge clk)
  if(!resetn)
     state <= MODR;
  else begin 
    case(state)
    MODR: state <= din? MOD1: MOD0;
    MOD0: state <= din? MOD1: MOD0; //remainder=0, din=1 >> divident= 01>> next_rem=01 ,in=0 >> divident= 00 >> next_rem=00.
    MOD1: state <= din? MOD3: MOD2; //remainder=1, din=1 >> divident= 11>> next_rem=11 ,in=0 >> divident= 10 >> next_rem=10.
    MOD2: state <= din? MOD0: MOD4; //remainder=10, din=1 >> divident= 101>> next_rem=0 ,in=0 >> divident= 100 >> next_rem=100.
    MOD3: state <= din? MOD2: MOD1; //remainder=11, din=1 >> divident= 111>> next_rem=10 ,in=0 >> divident= 110 >> next_rem=10.
    MOD4: state <= din? MOD4: MOD3; // remainder=100, din=1 >> divident= 1001>> next_rem=100 ,in=0 >> divident= 1000 >> next_rem=100.
    endcase
  end 
  assign dout = (state == MOD0);
endmodule

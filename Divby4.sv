//Explanation with Example : With Every Input you have to consider last remainder and current Input bit.
/// 2r+b , here 2.r is nothing but place value
/// if last remainder was 0 , input=1 >> Devident become = 10 i.e 2 >>> Next remainder is 2
///                           input=0 >> Divident=00 i.e 0 >>> Next remainder is 0
//////  Last remainder is 10  , input=1 >> Divident become = 101 , i.e 5 >>> Next remainder is 1
///                            input=0 >> Divident become = 100 , i.e 4 >> next remainder become 0
//////  Last remainder is  01 , input=1 >> Divident become = 011 , i.e 3 >>> Next remainder is 11
///                            input=0 >> Divident become = 010 , i.e 2 >> next remainder become 10
//////  Last remainder is  11 , input=1 >> Divident become = 111 , i.e 7 >>> Next remainder is 11
//                              input=0 >> Divident become = 110 , i.e 6 >> next remainder become 10
//                                    
//                                  --in=0(rem=0)
//                  --in=0(rem=0)--
//                                  --in=1(rem=01/100=01)
//input=0 (rem=0) --
//                                  --in=0(rem=10/100=10)
//                  --in=1(rem=1)--                          --in=0(rem=110/100=010)
//                                  --in=1(rem=11/100=11)
//                                                           --in=1(rem=111/100=011)

/////So in runtime we got 3 type of remainder : 0,1,2,3 
module divby4 (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  typedef enum bit [1:0] {MODR, MOD0, MOD1,MOD2,MOD3} st;
st state;


always@(posedge clk)
if(!resetn) begin
   state <= MODR; end
 else  begin 
  case(state)
  MODR: state<= (din ? MOD1 : MOD0);
  MOD0: state<= din? MOD1 : MOD0;
  MOD1: state <= din? MOD3 :MOD2 ;
  MOD2: state <= din? MOD0: MOD1;  /// when divident become 100 that is divisible by 4 so return to MOD0.
  MOD3: state <= din? MOD3 : MOD2;  
  endcase
 end 

 assign dout= (state==MOD0);
endmodule

//Design a circuit that determines whether an input value is evenly divisible by three.

//The input value is of unknown length and is left-shifted one bit at a time into the circuit via the input (din). The circuit should output a 1 on the output (dout) if the current cumulative value is evenly divisible by three, and a 0 otherwise.

//When resetn is asserted, all previous bits seen on the input are no longer considered. The 0 seen during reset should not be included when calculating the next value.

//This problem is tricky, so it may help to think in terms of modulus and remainder states.

//Input and Output Signals
//clk - Clock signal
//resetn - Synchronous reset-low signal
//din - Input bit
//dout - 1 if the current value is divisible by 3, 0 otherwise.

module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

typedef enum bit [1:0] {MODR, MOD0, MOD1,MOD2} st;
st state;


always@(posedge clk)
if(!resetn) begin
   state <= MODR; end
 else  begin 
  case(state)
  MODR: state<= (din ? MOD1 : MOD0);
  MOD0: state<= din? MOD1 : MOD0;
  MOD1: state <= din? MOD0 :MOD2 ;
  MOD2: state <= din? MOD2: MOD1; 
  endcase
 end 

 assign dout= (state==MOD0);
endmodule

//Explanation: 
//Let N be the value of the bits seen so far.

//When you get a new bit b (0 or 1), the new value becomes: N_new = (N << 1) + b = 2*N + b
//We don’t care about N exactly, only N mod 3.
//Let r = N mod 3. Then:
//N = 3k + r
//N_new = 2*(3k + r) + b = 6k + 2r + b
//So:
//N_new mod 3 = (2r + b) mod 3
//So the new remainder depends ONLY on:
//	•	old remainder r ∈ {0,1,2}
//	•	new bit b ∈ {0,1}
//That’s perfect FSM territory: 3 states for remainders {0,1,2}, plus an initial/reset state.


//Explanation with Example : With Every Input you have to consider last remainder and current Input bit.
/// 2r+b , here 2.r is nothing but place value
/// if last remainder was 0 , input=1 >> Devident become = 10 i.e 2 >>> Next remainder is 2
///                           input=0 >> Divident=00 i.e 0 >>> Next remainder is 0
//////  Last remainder is 10  , input=1 >> Divident become = 101 , i.e 5 >>> Next remainder is 2
///                            input=0 >> Divident become = 100 , i.e 4 >> next remainder become 1
//////  Last remainder is  01 , input=1 >> Divident become = 011 , i.e 3 >>> Next remainder is 0
///                            input=0 >> Divident become = 010 , i.e 2 >> next remainder become 2 
//                                    
//                                  --in=0(rem=0)
//                  --in=0(rem=0)--
//                                  --in=1(rem=01/11=01)
//input=0 (rem=0) --
//                                  --in=0(rem=10/11=10)
//                  --in=1(rem=1)--
//                                  --in=1(rem=11/11=0)

///Note-- Consider it like regular division where remainder drop down first as MSB and resp of divident comes after it in consecutive division//



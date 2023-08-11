////
module GetSetClr(
  input [NUM_INPUT-1:0] in,
  input [NUM_INPUT-1:0] pos,

  output {NUM_INPUT-1:0] set_out,
  output {NUM_INPUT-1:0] clr_out,
  output value);

  /////////////
  ///Finding the the value at the particular position is Set or not
  always_comb
    begin 
      value = in & (1 << pos);
    end 

  /////setting a partivular bit in a sequence////
  always_comb
    begin 
      set_out = in | (1<<pos);
    end

  ///// Clearing a Particular bit in a sequence//
          always_comb
            begin 
              mask = NUM_INPUT{1} << pos; 
              clr_out = in & ~mask;
            end 


endmodule 

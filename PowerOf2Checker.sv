module Pwr2chk(
              input logic [NUM_INPUT-1:0] in,
              output logic [NUM_INPUT-1:0] power2,
              output match);

  /// Power of 2 divisible number has only 1 bit set.
  // Example 2> 0010, 4>0100, 8>1000
always_comb
  begin 
    match = (in != '0 && (in & (in-1))=='0) ? 1:0;
    power2 = match ? $clog(in & ~(in-1)):0;
        
end 

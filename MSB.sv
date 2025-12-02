module RMB (
            input logic [NUM_BITS-1:0] S_in;
            output logic [$clog2(NUM_BITS)-1:0] pos );


///////Finding the Rightmost Set bit
////One Method >>> Is take 2's compliment of the Number i.e Comp(num)+1 
/////////////////////// Now and with original Number: num & (Comp(num)+1) ;
///  Second Method//// The above can be Deduced to a simpel form of <>>> : num & ~(num-1)

always_comb
begin 
  pos= num & ~(num-1);
end

endmodule

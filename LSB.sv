///Calculating Leftmost Set bit//////////////////
//Approach-1: Right Shift the Number till its greater than 0 (>0) . 
module LMB (
  input logic [NUM_PORTS-1:0] in,
            output logic [$clog2(NUM_PORTS)-1:0] pos );

//Implementation-1///////////
always_comb begin
  pos = '0;
  set = 1'b0;

  for (int i = 0; i < NUM_PORTS; i++) begin
    if (in[i] && !set) begin
      pos = i[$clog2(NUM_PORTS)-1:0];
      set = 1'b1;
    end
  end
end

///Implementation-2/////////
logic [NUM_PORTS-1:0] x_int;
//// Finding the Leaase significant set bit
assign x_int =  in & ~(in-1) ;

///finding the position of the bit to binary value            
logic [$clog2(NUM_PORTS)-1:0] pos;
always_comb begin
pos = '0;
            for(int i = 0; i < NUM_PORTS ; i++)
                        if(x_int[i] == 1'b1 ) pos = i[$clog2(NUM_PORTS)-1:0] ;
            end 
end 
endmodule 


///Approach-1

/// assign pos= x & ±(x-1)

///Calculating Leftmost Set bit//////////////////
Approach-1: Right Shift the Number till its greater than 0 (>0) . 
module LMB (
            input logic clk;
  input logic [NUM_PORTS-1:0] in,
  output logic pos );


            logic [NUM_PORTS-1:0] pos_r;
            always@(posedge clk, posedge rst)
                 begin 
                             if(rst) begin 
                                         x <= '0;
                                         pos <= '0;
                                         end
                             else if(en) x <= in;
                             else while(x>0)
                                         begin 
                                                x<= x >>1;
                                                pos=pos+1;
                                         end 
                 end 

always_comb
            if(x==0) pos = pos_r;

endmodule 


///Approach-1

/// assign pos= x & ±(x-1)

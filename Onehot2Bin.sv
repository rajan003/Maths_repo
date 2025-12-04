module OneHot2Bin (
  input logic [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH)-1:0] dout);

///Implementation-1 // This will create bigger combo as DATA WIDTh increases/////  
  always_comb
    dout = '0;
  for(i=0; i < DATA_WIDTh ; i++) 
    if(din[i]==1'b1)
      dout = i;
   else dout = 0;
//// Implementation-2 /// Combo Size optimized
  logic [$clog2(DATA_WIDTH)-1:0] dout_int; // Internal Variable//
  always_comb 
    begin 
      for(i=0 ; i< DATA_WIDTH ; i=i+$clog2(DATA_WIDTH))
        for(j=0 ; j < $clog2(DATA_WIDTH) ; j++) begin 
          if(din[i+j] == 1'b1) dout_int[i] = 1'b1 ;
          else dou_int = '0;
        end 
    end 
  assign dout = 
  
endmodule 


  

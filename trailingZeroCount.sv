module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

logic [DATA_WIDTH-1:0] pos1hot ;
logic [$clog2(DATA_WIDTH):0] dout_int;
assign pos1hot = din & ~(din-1) ;

//// One hot to Binary /////
  always_comb begin 
    dout_int = '0;
  for(int i=0; i < DATA_WIDTH ; i++) 
    if(pos1hot[i]==1'b1)
      dout_int = i;
  end 
assign dout = (din=='0) ? DATA_WIDTH : dout_int ;

endmodule

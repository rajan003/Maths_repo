module OneHot2Bin (
  input logic [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH)-1:0] dout);

  always_comb begin
    dout  = '0;
    valid = $onehot(din);

    if (valid) begin
      for (int i = 0; i < DATA_WIDTH; i++) begin
        if (din[i]) begin
          dout = i[$clog2(DATA_WIDTH)-1:0];
          break; // lowest index
        end
      end
    end
  end

endmodule 


  

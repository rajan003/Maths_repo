  module #(parameter WIDTH=4, SHIFT=0) Shift_LR_Rotate(

                  input logic [WIDTH-1:0] shift_in,
                  output logic [WIDTH-1:0] Shift_out,

  ///                input logic shift_lr_en, // Left=0, Right=1// Not Using Dynamic operation change
                  input logic [$clog2(WIDTH)-1:0] shift_num
  );

  

generate
  if(SHIFT==1) begin:right_shift_rotate // RIght Shift Rotate Operation
          assign shift_out = shift_in >> shift_num | shift_in << (WIDTH - shift_num) ;
        end 
  else        begin:left_shift_rotate // LEFT Shift Rotate Operation
    assign shift_out = (shift_in << shift_num) | shift_in >> (WIDTH - shift_num) ;
      end 
  
endgenerate

endmodule 

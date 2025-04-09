module #(parameter WIDTH=4, SHIFT=0) Shift_LR_Rotate(

                  input logic [WIDTH-1:0] shift_in,
                  output logic [WIDTH-1:0] Shift_out,

  ///                input logic shift_lr_en, // Left=0, Right=1// Not Using Dynamic operation change
                  input logic [$clog2(WIDTH)-1:0] shift_num );

  

generate
  if(SHIFT==1) begin:right_shift_rotate // RIght Shift Rotate Operation
  always_comb begin 
    shift_out = shift_in >> shift_num | shift_in << (WIDTH - shift_num) ;
  end 
  else // LEFT Shift Rotate Operation



endgenerate










/////////shift left and right by rotation
module tb;

integer bits_to_rotate;
reg [0:7] temp_1;
reg [0:7] temp_2;

initial begin
    temp_1 = 0; 
    temp_2 = 8'b0110_0010;
    for (int i=0; i<8; i++) begin
        bits_to_rotate = i;
        temp_1 = (temp_2 << bits_to_rotate) | (temp_2 >> (8-bits_to_rotate));
        $display("%0d", bits_to_rotate);
        $display("%08b", temp_2);
        $display("%08b", temp_1);
        $display;
    end
end
endmodule

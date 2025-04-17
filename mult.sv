module multi #(
    parameter WIDTH = 8  // Use '=' instead of '=='
)(
    input  logic                     clk,
    input  logic                     rst,
    input  logic                     start,
    input  logic [WIDTH-1:0]         A,
    input  logic [WIDTH-1:0]         B,
    output logic [2*WIDTH-1:0]       product,
    output logic                     done
);

//----------------------TYPE-1--------------------------------------------------//
//---------------Combinational Multiplier using Build-In Operator---------------//
////////Multiplier logic/////
///////// assign product = a * b; ///////////
///If your target synthesis tool supports it (and many modern FPGAs or ASIC flows do), you can rely on the built-in multiplication operator (*). This approach is often mapped to dedicated DSP slices within the chip.////


//----------------------TYPE-2--------------------------------------------------//
//--------------Sequential/Iterative Multiplier (Shift-and-Add)---------------//
//Smaller Hardware Footprint or you want to save on DSP usage, you might opt for a sequential (iterative) multiplier. This design uses a shift-and-add algorithm similar to long multiplication, operating over several clock cycles//
logic [2*WIDTH-1] mltpcnd;
logic [WIDTH-1:0] mltplr ;



  always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers
            mltpcnd <= {(2*WIDTH){1'b0}};
            mltplr  <= {WIDTH{1'b0}};
            product <= {(2*WIDTH){1'b0}};
            done    <= 1'b0;
            count   <= 0;
        end else begin
            if (start) begin
                // Initialize registers on start:
                // Extend the 3-bit (or WIDTH-bit) multiplicand to 2*WIDTH bits by concatenating zeros.
                mltpcnd <= {{WIDTH{1'b0}}, A};  
                mltplr  <= B;
                product <= {(2*WIDTH){1'b0}};
                done    <= 1'b0;
                count   <= WIDTH;
            end else if (count != 0) begin
                // For each iteration, if the LSB of multiplier is 1, add current multiplicand to product.
                if (mltplr[0] == 1'b1)
                    product <= product + mltpcnd;
                
                // Shift the multiplicand left (multiplies its weight by 2) and shift the multiplier right.
                mltpcnd <= mltpcnd << 1;
                mltplr  <= mltplr >> 1;
                count   <= count - 1;
                
                // Assert done when count has reached 1 (i.e. last iteration performed).
                if (count == 1)
                    done <= 1'b1;
            end
        end
    end

endmodule






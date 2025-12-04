//One-hot values have a single bit that is a 1 with all other bits being 0. Output a 1 if the input (din) is a one-hot value, and output a 0 otherwise.

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);

logic [$clog2(DATA_WIDTH)-1:0] count;
//Implementation-1
always_comb begin 
   count = 1'b0;
  for(int i=0; i< DATA_WIDTH ; i++)
    if(din[i]==1'b1) count= count+1; 
end
assign onehot= (count >1 | count==0)? 1'b0:1'b1;

///Here why Count= count+1 is not forming a combo loop
  //1. count is REASSIGNED FROM SCRATCH at the top of the block
  //2.  count= count+1 >>> But this “count” on the RHS is NOT the previous registered value of count.\
  /// It is the current temporary value inside the same always_comb evaluation ,This gets compiled into a pure combinational adder tree, not a feedback loop.

//Inside an always_comb block:
	//•	count is treated like a temporary variable
	//•	Each iteration of this loop unrolls into combinational logic

  //The synthesis view is something like: count = din[0] + din[1] + ... + din[DATA_WIDTH-1]
//count = count + 1 is NOT a combinational loop as long as:
	//1.	count is fully assigned inside the always_comb block before any read
	//2.	There is no previous stored value of count involved
	//3.	It’s part of a combinational unrolled loop

//Your code satisfies all 3 → SAFE.
  /////When their is combinational logic
  ////always_comb begin
  //if (enable)
  //  count = count + 1;   // ❌ THIS IS A REAL COMBINATIONAL LOOP
   //end
  //Why?
	//•	Because the RHS count refers to the previous driven value of count
	//•	And the LHS also drives count
  //→ Direct feedback path → actual combinationa
  //Synthesis sees:
    //count → adder( +1 ) → count
  //This is literally a ring oscillator.
  //Simulation either oscillates, or returns X.
  
endmodule

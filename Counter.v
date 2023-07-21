module Counter(
	input clk,rst,load,
	input [1:0] in,
	output reg [1:0] out);
always @(posedge clk)
	if (!rst) // active low
		out<=2'b0;
	else if (load)
		out<= in;
	else out<= out +1;
endmodule
module ram
# (parameter data_width = 8, 
	parameter addr_width = 5,
	parameter depth = 32)
(output [data_width-1:0] out,
	input [addr_width-1:0] addr,
	input [data_width-1:0] in,
	input clk,
	input rst,
	input we,
	input re);

reg [data_width-1:0]memory[addr_width-1:0];
reg [data_width-1:0]out_r;


always@(posedge clk)
begin
	if(rst )begin
		out_r <= 0;
	end else
		if(we && !re)
			memory[addr] <= in;
		else if(re && !we)
			out_r <= memory[addr];
end



assign out = out_r;
endmodule

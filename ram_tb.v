`include "ram.v"
`timescale 1ns/1ns

module ram_tb;
reg clk;
reg rst;
reg we;
reg re;
integer i;
reg [6:0]in;
reg [4:0]addr;
reg mem[4:0];
wire [6:0]out;

ram #(.data_width(7), .addr_width(5) ) rm(.clk(clk),
.rst(rst), .we(we),.in(in),
.re(re),.addr(addr),.out(out));

initial
begin
	clk = 0;
	forever #4 clk = ~clk;
end

initial
begin
	rst = 1; in = 1; addr=1; 
	#4 rst = 0; we =1;re=0; 
	for(i=0; i<5; i=i+1)
	begin
	in = i; addr = i;
        end
	#10 re = 1;we = 0;
	#50 $finish;

end

initial
begin
	$dumpfile("ram_tb.vcd");
	$dumpvars();
end
endmodule


module shift_test;
	reg clk,clear,in;
	wire out;
	integer i;
	shiftreg4bit test_sr(clk,clear,in,out);
	
	initial
		begin clk = 1'b0; #2 clear = 0; #5 clear = 1; end
	
	always #5 clk = ~clk;
	
	initial begin #2;
		repeat (2)
		begin #10 in=0; #10 in=0; #10 in=1; #10 in=1; end
		end
	
	initial
		begin
			$dumpfile ("shifter.vcd");
			$dumpvars (0,shift_test);
			#200 $finish;
		end 
endmodule



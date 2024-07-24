module test_seq;
	reg clk,x,reset;
	wire z;
	
	seq_detector seq_tb(x,clk,reset,z);
	
	initial
		begin
			$dumpfile("sequence.vcd");
			$dumpvars(0,test_seq);
			clk=0;
			reset=1;
			#15 reset=0;
		end

	always #5 clk=~clk;
	
	initial
		begin
			#12 x=0; #10 x=0; #10 x=1; #10 x=1;
			#10 x=0; #10 x=1; #10 x=1; #10 x=0;
			#10 x=0; #10 x=1; #10 x=1; #10 x=0;
			#10 $finish;
		end
endmodule
module pipe1_test;

    parameter N=10;
    wire [N-1:0] F;
    reg [N-1:0] A,B,C,D;
    reg clk;

    pipeline1 PIPE_TB(F,A,B,C,D,clk);

    initial clk=0;

    always #10 clk=~clk;
    
    initial begin
        #5 A=10; B=12; C=6; D=3; //F=75 4BH
        #20 A=10; B=10; C=5; D=3; //F=66 42H
        #20 A=20; B=11; C=1; D=4; //F=112 70H;
    end

    initial begin
        $dumpfile ("pipe1.vcd");
        $dumpvars (0, pipe1_test);
        $monitor("Time: %d, F= %d", $time, F);
        #300 $finish;
    end
endmodule
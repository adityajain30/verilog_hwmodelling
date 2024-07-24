module RAM_TEST;
    reg [9:0] address;
    wire [7:0] data_out;
    reg [7:0] data_in ;
    reg  write,cs;
    integer k,myseed;


    ram_3 RAM (data_out, data_in, address, write, cs);

    initial 
    begin
        for (k = 0; k<=1023 ; k=k+1) 
        begin
            data_in = (k+k) % 256;
            write=1; cs=1;
            #2 write=0; cs=0;
            $display ("Datain: %4d, k: %4d", data_in,k);
        end
        
        repeat(20)
        begin
            #2 address = $random(myseed) % 1024;
            write=0; cs=1;
            $display ("Address: %5d, Dataout: %4d", address,data_out);
        end
    end
    initial myseed=35;
endmodule
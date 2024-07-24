module ram_3 (data_out, data_in, addr, wr, cs);

    // parameter addr_size = 10, word_size = 8, memory_size=1024;
    // input [addr_size-1:0] addr;
    // input [word_size-1:0] data_in;
    // input wr;
    // output  [word_size-1:0] data_out;
    // reg  [word_size-1:0] temp_data_out;
    // reg [word_size-1:0] mem [memory_size-1:0];

    // //assign data_out = mem[addr];

    // always @(wr or addr) 
    // begin
    //         if (wr == 0)
    //         temp_data_out = mem[addr];
    // end

    // always @(wr or addr) 
    // begin
    //         if (wr)
    //         mem[addr] = data_in;
    // end

    // assign data_out=temp_data_out;

    
    parameter adds = 10, wsize =8, memsize =1024;
    input cs,wr;
    input [adds-1:0] addr;
    input [wsize-1 : 0]data_in;
    output [wsize-1:0]data_out;

    reg [wsize-1:0] mem [memsize-1:0];

    assign data_out = mem[addr];

    always @(cs or wr)
    begin
    if(wr) mem[addr]= data_in;
    end

endmodule

    
    // tri [7:0] Bus;
    // wire [7:0] data_out, data_in;
    // assign Bus = read ? data_out : 8'hzz;
    // assign data_in = write ? Bus : 8'hzz;
// endmodule

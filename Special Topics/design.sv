module test();
  reg [3:0] in;
  wire [15:0] out;
  
  encoder416 TEST (.in(in), .out(out));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    in = 4'b0000; #5;
    in = 4'b0001; #5;
    in = 4'b0010; #5;
    in = 4'b0011; #5;
    in = 4'b0100; #5;
    in = 4'b0101; #5;
    in = 4'b0110; #5;
    in = 4'b0111; #5;
    in = 4'b1000; #5;
    in = 4'b1001; #5;
    in = 4'b1010; #5;
    in = 4'b1011; #5;
    in = 4'b1100; #5;
    in = 4'b1101; #5;
    in = 4'b1110; #5;
    in = 4'b1111; #5; 
  end
endmodule
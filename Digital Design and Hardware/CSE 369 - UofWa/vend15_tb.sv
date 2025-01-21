module vend15_tb ();
  // signal declaration and dut instantiation
  logic clk, reset, N, D, Q, Open;
  vend15 dut (.*);

  // clock generation
  parameter T = 100;
  initial
    clk = 1'b0;
  always begin
    #(T/2)  clk <= 1'b0;
    #(T/2)  clk <= 1'b1;
  end

  initial begin
    {reset,N,D,Q} <= 4'b1000; @(posedge clk);  // reset
    {reset,N,D,Q} <= 4'b0000; @(posedge clk);  // Zero (1)
          {N,D,Q} <= 3'b001;  @(posedge clk);  // Zero (2)
          {N,D,Q} <= 3'b100;  @(posedge clk);  // Zero (3)
          {N,D,Q} <= 3'b001;  @(posedge clk);  // Five (4)
          {N,D,Q} <= 3'b100;  @(posedge clk);  // Zero (5)
          {N,D,Q} <= 3'b000;  @(posedge clk);  // Five (6)
          {N,D,Q} <= 3'b010;  @(posedge clk);  // Five (7)
          {N,D,Q} <= 3'b100;  @(posedge clk);  // Zero (8)
                              @(posedge clk);  // Five (9)
          {N,D,Q} <= 3'b001;  @(posedge clk);  // Ten  (10)
          {N,D,Q} <= 3'b010;  @(posedge clk);  // Zero (11)
                              @(posedge clk);  // Ten  (12)
                              @(posedge clk);  // Zero (13)
          {N,D,Q} <= 3'b100;  @(posedge clk);  // Ten  (14)
          {N,D,Q} <= 3'b010;  @(posedge clk);  // Zero (15)
          {N,D,Q} <= 3'b000;  @(posedge clk);  // Ten  (16)
                              @(posedge clk);  // extra
    $stop;
  end
endmodule  // vend15_tb

// note: we use 15 combination of inputs to test all transitions; there are other number of combinations however
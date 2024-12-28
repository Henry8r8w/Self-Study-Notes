// Block  Diagram 
// SW[0] ->, Sw[1] ->, SW[2] -> comparator module
// 3 bits mysterious number-> comparator module
// KEY[0] -> NOT Gate -> LED[0], LED[1], LED[2]
// islt -> LED[0]; is_eq -> LED[1]; is_gt -> LED[2]
//
// Walkthrough: we use SW[2:0] to swtich 1 and 0 to guess the 3b'XXX using comparator, where when we press KEY[0] -- that was default to false -- 
// it will light up corresponding LED to give answer to our guess, whether it is equal, less than, or greater than



module guessing_game (
  output logic [9:0] LEDR,
  input  logic [3:0] KEY,
  input  logic [9:0] SW
);
  logic is_lt, is_eq, is_gt;
  comparator_decomposed number_comparator (
    .A(SW[2:0]), 
    .B(3'b001),     
    .is_lt(is_lt), 
    .is_eq(is_eq), 
    .is_gt(is_gt)
  );
  assign LEDR[0] = is_lt & ~KEY[0];
  assign LEDR[1] = is_eq & ~KEY[0];
  assign LEDR[2] = is_gt & ~KEY[0];
endmodule  

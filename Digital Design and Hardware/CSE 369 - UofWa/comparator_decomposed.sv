
module comparator_decomposed(input  logic [2:0] A, B,
                   output logic is_lt, is_gt, is_eq);
  // subtraction result (intermediate)
  logic [2:0] sub; // 0-2 bits -> 3 bits

  assign sub = A - B; // == 1 (negtaive), == 0 (positive)

  // 1 denotes true and 0 denotes false for the conditions
  assign is_eq = ~(sub[0] | sub[1] | sub[2]);
  assign is_lt = sub[2]; // checking for the largest digit ? 1XX: 0XX
  assign is_gt = ~is_eq & ~is_lt;

endmodule  

module vend15 (
  input  logic clk, reset,
  input  logic N, D, Q,   // nickel, dime, quarter
  output logic Open
);

  // Encoding: Zero=00, Five=10, Ten=11
  enum logic [1:0] {Zero, Five=2'b10, Ten=2'b11} ps, ns;

  // Next-state logic
  always_comb
  begin
    case (ps)

      Zero: 
        case ({N, D, Q})
          3'b000: ns = Zero; // no coin: stay
          3'b100: ns = Five; // nickel
          3'b010: ns = Ten;  // dime
          3'b001: ns = Zero; // quarter
          default: ns = ps;  // any other combo
        endcase


      Five: 
        case ({N, D, Q})
          3'b000: ns = Five; // no coin: stay
          3'b010: ns = Zero; // dime -> vend -> go to 0¢
          3'b001: ns = Zero; // quarter -> vend -> go to 0¢
          3'b100: ns = Ten;  // nickel -> 10¢
          default: ns = ps;
        endcase


      Ten:
        case ({N, D, Q})
          3'b000: ns = Ten;  // no coin: stay
          3'b100: ns = Zero; // nickel -> vend -> back to 0¢
          3'b010: ns = Zero; // dime   -> vend -> back to 0¢
          3'b001: ns = Zero; // quarter-> vend -> back to 0¢
          default: ns = ps;
        endcase

      default: 
        ns = ps;
    endcase
  end

  assign Open = Q | ((ps != Zero) & D) | ((ps == Ten) & N); // 15 being the vend condition

  // State register; asynchronous reset, whenever it is pressed -- interval of clk, which gives us the immediate result
  always_ff @(posedge clk or posedge reset) begin 
    if (reset)
      ps <= Zero;
    else
      ps <= ns;
  end

endmodule
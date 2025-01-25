module light_game (input logic clk, reset, M, L, output logic W);
    enum logic [1:0] { Start = 2'b00, Mid = 2'b01, Win = 2'b10} ps, ns; // [1:0] ensures two bits assignment

    always_comb
        case (ps)
            Start: ns = (L & M) ? Mid : Start;
            Mid:   ns = (L & M) ? Win : (M ? Start : Mid);
            Win:   ns = M ? Start : Win;
        endcase

    assign W = (ns == Win);  // alt: ((ps == Mid) & L & M) | ((ps == Win) & ~M)

    always_ff @(posedge clk)
        if (reset)
            ps <= Start;
        else
            ps <= ns;

endmodule  // light_game
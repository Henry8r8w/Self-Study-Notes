module string_lights (output logic [9:0] LEDR, input logic [3:0] KEY, input logic [9:0] SW);
    logic clk, reset, in;

    assign clk = ~KEY[0];
    assign reset = SW[9];
    assign in = SW[0];

    
    always_ff @(posedge clk)
    if (reset)
        LEDR <= 10'd0; // remember that 10d'0 initate a decimal (base 10) of 0
    else
        LEDR <= {in, LEDR[9:1]}; // 10dXXXXXXXX combinations will switched along with 
endmodule // string_lights
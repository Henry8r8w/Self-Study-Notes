module string_lights_tb();
    logic [9:0] LEDR;
    logic [3:0] KEY;
    logic [9:0] SW;

    // wire conenction
    string_lights dut (.*);

    // clock generation
    parameter T = 100;
    initial
        KEY[0] = 1'b1;
    always begin
        #(T/2) KEY[0] <= 1'b0;
        #(T/2) KEY[0] <= 1'b1;
    end

    initial begin
    SW[0] <= 1'b0; SW[9] <= 1'b1; @(negedge KEY[0]); // reset
    SW[0] <= 1'b0; SW[9] <= 1'b0; @(negedge KEY[0]); // 0
    SW[0] <= 1'b1;                @(negedge KEY[0]); // 1
                                                     // finish desired pattern if desired
                                  @(negedge KEY[0]); // final delay
    $stop;
    end
 end
endmodule 
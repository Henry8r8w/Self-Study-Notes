
// The testbench
module seg7_tb ();
    logic [3:0] bcd;
    logic [6:0] leds;

    seg7 dut (.*); // no discrepenecy in signal and port names
    int i;
    initial begin
        for (i = 0; i < 16; i++) begin // looping through the 4 bits assignments
            bcd = i; #20;
        end
        $stop;
    end
endmodule

// Given Module seg7
module seg7 (bcd, leds);
    input logic [3:0] bcd;
    output logic [6:0] leds;

    always comb // combine (allow) multple assignments
        case (bcd)
                         //6543210
        4'b0000: leds = 7'b0111111; // 0
        ... // implementation
        4'b1001: leds = 7'b1101111; // 9
        default: leds = 7'bX;
    endcase
endmodule
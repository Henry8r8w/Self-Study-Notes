module guessing_game ()
    logic [9:0] LEDR;
    logic [3:0] KEY;
    logic [9:0] SW;

    guess dut (.*); 

    int i
    initial begin
    KEY[0] = 1'b1; #10; // recall the NOT gate from the block diagram and LED assign
        for (i = 0; i <8; i++)
            SW[2:0] = i; KEY[0] = 1'b1;# 20;
                         KEY[0] = 1'b1; #20; // reset 
        end
        $stop
    end
endmodule  

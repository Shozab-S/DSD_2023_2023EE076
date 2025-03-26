`timescale 1ns / 1ps

module exp7_tb;

    logic clk, rst, wr;
    logic [2:0] addr;
    logic [3:0] value;
    logic [6:0] seg_out;
    logic [7:0] an_out;

    // Instantiate DUT (Device Under Test)
    exp7 dut (
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .addr(addr),
        .value(value),
        .seg_out(seg_out),
        .an_out(an_out)
    );

    // Clock Generator (50 MHz = 20ns period)
    always #10 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        wr = 0;
        addr = 3'b000;
        value = 4'b0000;
        
        #50 rst = 0; // Release reset after 50ns

        // Write Different Numbers to Each Display
        wr = 1;
        addr = 3'b000; value = 4'hA; #20;
        addr = 3'b001; value = 4'h1; #20;
        addr = 3'b010; value = 4'h5; #20;
        addr = 3'b011; value = 4'h9; #20;
        addr = 3'b100; value = 4'hF; #20;
        addr = 3'b101; value = 4'h2; #20;
        addr = 3'b110; value = 4'h7; #20;
        addr = 3'b111; value = 4'h0; #20;

        wr = 0; // Disable Write
        
        // Let the display cycle through each segment
        #500;
        
        $display("Test Completed.");
        $stop; // End simulation
    end
endmodule


`timescale 1ns / 1ps

module exp7 (
    input logic clk, rst, wr, 
    input logic [2:0] addr,   
    input logic [3:0] value,  
    output logic [6:0] seg_out, 
    output logic [7:0] an_out  
);

    logic slow_clk;
    logic [19:0] clk_count;
    logic [2:0] active_display;
    logic [3:0] display_mem [7:0];  

    // Clock Divider 
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_count <= 0;
            slow_clk <= 0;
        end else begin
            if (clk_count == 20'd499999) begin
                clk_count <= 0;
                slow_clk <= ~slow_clk; 
            end else begin
                clk_count <= clk_count + 1;
            end
        end
    end

    // Display Selector
    always_ff @(posedge slow_clk or posedge rst) begin
        if (rst)
            active_display <= 3'b000;
        else
            active_display <= active_display + 1;
    end

    // Anode Activation 
    always_ff @(posedge slow_clk or posedge rst) begin
        if (rst)
            an_out <= 8'b11111111;
        else begin
            case (active_display)
                3'b000: an_out <= 8'b11111110;
                3'b001: an_out <= 8'b11111101;
                3'b010: an_out <= 8'b11111011;
                3'b011: an_out <= 8'b11110111;
                3'b100: an_out <= 8'b11101111;
                3'b101: an_out <= 8'b11011111;
                3'b110: an_out <= 8'b10111111;
                3'b111: an_out <= 8'b01111111;
                default: an_out <= 8'b11111111;
            endcase
        end
    end

    // Memory Storage 
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            
        end else if (wr) begin
            display_mem[addr] <= value;
        end
    end

    // Seven-Segment Decoder 
    always_ff @(posedge slow_clk or posedge rst) begin
        if (rst)
            seg_out <= 7'b1111111; // Default: OFF
        else begin
            case (display_mem[active_display])
                4'h0: seg_out <= 7'b1000000;
                4'h1: seg_out <= 7'b1111001;
                4'h2: seg_out <= 7'b0100100;
                4'h3: seg_out <= 7'b0110000;
                4'h4: seg_out <= 7'b0011001;
                4'h5: seg_out <= 7'b0010010;
                4'h6: seg_out <= 7'b0000010;
                4'h7: seg_out <= 7'b1111000;
                4'h8: seg_out <= 7'b0000000;
                4'h9: seg_out <= 7'b0010000;
                4'hA: seg_out <= 7'b0001000;
                4'hB: seg_out <= 7'b0000011;
                4'hC: seg_out <= 7'b1000110;
                4'hD: seg_out <= 7'b0100001;
                4'hE: seg_out <= 7'b0000110;
                4'hF: seg_out <= 7'b0001110;
                default: seg_out <= 7'b1111111;
            endcase
        end
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 02:10:49 PM
// Design Name: 
// Module Name: lab_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_4(
input logic [1:0]a,
input logic [1:0]b,
output logic red,green,blue
    );
assign red = (~b[0]&~b[1]) | (~a[0]&a[1]) | (a[0]&~b[0]&~b[1]) | (a[0]&a[1]);
assign green = (~a[0]&~a[1]) | (~b[0]&b[1]) | (a[0]&~a[1]) | (b[0]&b[1]);
assign blue = (~a[0]&~a[1]&b[1]) | (~a[0]&b[0]&~b[1]) | (a[1]&~b[0]&~b[1]) | (a[0]&~a[1]&~b[0]) | (a[0]&a[1]&b[1]) | (b[0]&b[1]); 
endmodule


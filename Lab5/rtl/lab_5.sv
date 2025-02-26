`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2025 10:08:05 PM
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


module lab_5(
input logic a,
input logic b,
input logic c,
input logic d,
output logic A,B,C,D,E,F,G

    );
assign A = (~a&~b&~c&d) | (~a&b&~c&~d) | (a&b&~c&d) | (a&~b&c&d);
assign B = (~a&b&~c&d) | (~a&b&c&~d) | (a&b&~c&~d) | (a&b&c) | (a&~b&c&d);
assign C = (~a&~b&c&~d) | (a&b&~d) | (a&b&c);
assign D = (~a&~b&~c&d) | (~a&b&~c&~d) | (b&c&d)| (a&~b&c&~d);
assign E = (~a&~b&d) | (~a&b&~c)|(~a&c&d)| (~b&~c&d) ;
assign F = (~a&~b&d)| (~a&~b&c)|(~a&c&d)|(a&b&~c&d)  ;
assign G = (~a&~b&~c)| (~a&b&c&d)|(a&b&~c&~d)  ;
endmodule

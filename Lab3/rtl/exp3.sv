`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 08:31:46 PM
// Design Name: 
// Module Name: exp3
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


module exp3(
  input a,b,c,
  output x,y

    );
  assign x = (a|b) ^ (~c); 
  assign y = (a|b) & ((~(a&b)) ^ (a|b));
endmodule

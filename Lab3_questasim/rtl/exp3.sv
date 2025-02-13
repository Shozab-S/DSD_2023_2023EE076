
module exp3(
  input a,b,c,
  output x,y

    );
  assign x = (a|b) ^ (~c); 
  assign y = (a|b) & ((~(a&b)) ^ (a|b));
endmodule

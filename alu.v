//Verilog Code for ALU
module alu(A, B, select, zero, carry, sign, parity, overflow, out);

  input [3:0] A, B;
  input [1:0] select;

  output reg [3:0] out;
  output reg zero, carry, sign, parity, overflow;

  always @ (A or B)
  begin
    if (select == 0) // Addition
    begin
      {carry,out} = A + B;
     
    end
    else if (select == 1) // Subtraction
    begin
      {carry,out} = A - B;
    
    end
    else if (select == 2) // Multiplication
    begin
      {carry,out} = A * B;
     
    end
    else if (select == 3) // Division (if A|B != 0)
    begin
      if (~(A | B) == 0)
      begin
        {carry,out} = A / B;
       
      end
    end

    zero = ~|out;
    sign = out[3];
    parity = ~^out;
    overflow = (A[3] & B[3] & ~out[3]) | (~A[3] & ~B[3] & out[3]);

  end
endmodule

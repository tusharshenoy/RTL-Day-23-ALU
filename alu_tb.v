//Testbench Code for ALU
module alu_tb;

reg [3:0] A, B;                
reg [1:0] select;            
wire [3:0] out;                
wire zero, carry, sign, parity, overflow;


alu dut (.A(A),.B(B),.select(select),.zero(zero),.carry(carry),.sign(sign),.parity(parity),.overflow(overflow),.out(out));

initial begin
  repeat (100) 
  begin
    stimulus();              
    #10$display("A = %b, B = %b, select = %b, out = %b, zero = %b, carry = %b, sign = %b, parity = %b, overflow = %b", A, B, select, out, zero, carry, sign, parity, overflow);
  end
  $finish;
end

task stimulus;
begin
  A = $random;                
  B = $random;             
  select = $random;         
end
endtask

endmodule

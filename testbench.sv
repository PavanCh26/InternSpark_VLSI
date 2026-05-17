// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_alu_8bit;

reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;
wire [7:0] result;
wire carry;
wire zero;
alu_8bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu_8bit);
    // ADD
    A = 8'd10; B = 8'd5; opcode = 3'b000;
    #10;
    // SUB
    A = 8'd20; B = 8'd4; opcode = 3'b001;
    #10;
    // AND
    A = 8'b11001100; B = 8'b10101010; opcode = 3'b010;
    #10;
    // OR
    opcode = 3'b011;
    #10;
    // XOR
    opcode = 3'b100;
    #10;
    // LEFT SHIFT
    A = 8'd8; opcode = 3'b101;
    #10;
    // RIGHT SHIFT
    opcode = 3'b110;
    #10;
    // COMPARE
    A = 8'd15; B = 8'd15; opcode = 3'b111;
    #10;
    $finish;
end
endmodule
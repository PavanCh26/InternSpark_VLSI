// Code your design here
module alu_8bit(
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg carry,
    output reg zero
);

always @(*) begin
    carry = 0;

    case(opcode)

        3'b000: begin
            {carry, result} = A + B;
        end

        3'b001: begin
            {carry, result} = A - B;
        end

        3'b010: begin
            result = A & B;
        end

        3'b011: begin
            result = A | B;
        end

        3'b100: begin
            result = A ^ B;
        end

        3'b101: begin
            result = A << 1;
        end

        3'b110: begin
            result = A >> 1;
        end

        3'b111: begin
            result = (A == B) ? 8'b00000001 : 8'b00000000;
        end

        default: begin
            result = 8'b00000000;
        end

    endcase

    zero = (result == 8'b00000000);

end

endmodule
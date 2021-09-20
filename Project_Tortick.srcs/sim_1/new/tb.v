`define SUM 5'b00000
`define MIN 5'b01000
`define MOVL 5'b00001
`define LESS_LEFT 5'b00010
`define UNSIGNED_LESS 5'b00011
`define POWER 5'b00100
`define MOVR 5'b00101
`define MOVED 5'b01101
`define OR 5'b00110
`define AND 5'b00111
`define EQUAL 5'b11000
`define UNQUAL 5'b11001
`define LESS_LEFT_FLAG 5'b11100
`define LESS_RIGHT_OR_EQ 5'b11101
`define LESS_LEFT_UNSIGNED_FLAG 5'b11110
`define LESS_OR_EQ_RIGHT_UNSIGNED_FLAG 5'b11111



module top_tb;

wire Flag;
wire [31:0] Result;
reg [4:0] ALUOp;
reg [31:0] A;
reg [31:0] B;

top dut(ALUOp, A, B, Result, Flag);

initial begin
add_op(10, 15);
and_op(10, 15);
un_eq_op(10, 15);
$stop;
end

// task initializes the operatopns
task add_op;
    input [31:0] a_op, b_op;
begin
A = a_op;
B = b_op;
ALUOp = `SUM;
#100;
if (Result == (A + B +1))
    $display("good %d + %d = %d", A, B, Result);
else
    $display("bad %d + %d = %d", A, B, Result);
#10;
end
endtask

task and_op;
    input [31:0] a_op, b_op;
begin
A = a_op;
B = b_op;
ALUOp = `AND;
#100;
if (Result == (A&B))
    $display("good %d + %d = %d", A, B, Result);
else
    $display("bad %d + %d = %d", A, B, Result);
#10;
end
endtask


task un_eq_op;
    input [31:0] a_op, b_op;
begin
A = a_op;
B = b_op;
ALUOp = `UNQUAL;
#100;
if (Result == (A != B))
    $display("good %d + %d = %d", A, B, Result);
else
    $display("bad %d + %d = %d", A, B, Result);
#10;
end
endtask





endmodule
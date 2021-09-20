//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 06.09.2021 17:23:32
// Design Name:
// Module Name: ALU
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
// ALU
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

module top(
input [4:0] ALUOp,
input [31:0] A,
input [31:0] B,
output reg [31:0] Result,
output reg Flag
);



always @(*)begin
case(ALUOp)
`SUM: begin  Result <= A+B; Flag <= 0; end
`MIN : begin Result <= A-B; Flag <= 0; end
`MOVL : begin Result <= A << B; Flag <= 0; end
`LESS_LEFT :  begin Result <= ($signed(A)<$signed(B)) ? 1:0; Flag <= 0; end 
`UNSIGNED_LESS : begin Result <= ($unsigned(A)<$unsigned(B)) ? 1:0; Flag <= 0; end
`POWER : begin  Result <= A^B; Flag <= 0; end
`MOVR : begin Result <= A >> B; Flag <= 0; end
`MOVED : begin  Result <= A >>> B; Flag <= 0; end
`OR : begin Result <= A|B; Flag <= 0; end
`AND :  begin Result <= A&B; Flag <= 0; end
`EQUAL : begin Result <= A==B; Flag <= 1; end
`UNQUAL : begin  Result <= A!=B; Flag <= 1; end
`LESS_LEFT_FLAG : begin Result <= ($signed(A)<$signed(B)) ? 1:0; Flag <= 1; end
`LESS_RIGHT_OR_EQ : begin  Result <= ($signed(A)>=$signed(B)) ? 1:0; Flag <= 1; end
`LESS_LEFT_UNSIGNED_FLAG : begin Result <= ($unsigned(A)<$unsigned(B)) ? 1:0; Flag <= 1; end
`LESS_OR_EQ_RIGHT_UNSIGNED_FLAG : begin Result <= ($unsigned(A)>=$unsigned(B)) ? 1:0; Flag <= 1; end

endcase
end
endmodule 


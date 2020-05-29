`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2020 02:27:58 AM
// Design Name: 
// Module Name: ALU_16_Testbench
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


module ALU_16_Testbench(

    );
    
    
    reg[15:0] a, b;
reg cin, ainvert, bnegate;
reg[2:0] op;
wire[15:0] result;
wire cout;

initial 
$monitor ("a = %d, b = %d, cin = %b, cout = %b, op2 = %b, op1 = %b, op0 = %b, ainvert = %b, bnegate = %b, result=%d",
a, b, cin, cout, op[2],op[1], op[0], ainvert, bnegate, result);


initial
begin

//AND
#0 a=0; b=0; cin=0; ainvert=0; bnegate=0; op[2] = 0;op[1]=0; op[0]=0; //r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0; op[2] = 0; op[1]=0; op[0]=0;//r=0 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0; op[2] = 0; op[1]=0; op[0]=0;//r=1 cout=0
//OR
#10 a=0; b=0; cin=0; ainvert=0; bnegate=0;  op[2] = 0; op[1]=1; op[0]=0;//r=0 cout=0
#10 a=1; b=0; cin=0; ainvert=0; bnegate=0;  op[2] = 0; op[1]=1; op[0]=0;//r=1 cout=0
#10 a=1; b=1; cin=0; ainvert=0; bnegate=0;  op[2] = 0; op[1]=1; op[0]=0;//r=1 cout=0

//ADD
#10 a=8'h0000000f; b=8'h0000000e;cin=0; ainvert=0; bnegate=0; op[2]= 0;op[1]=0; op[0]=1;//r=0 cout=0
#10 a=8'h00000000; b=8'h00000000;cin=0; ainvert=0; bnegate=0; op[2]= 0;op[1]=0; op[0]=1;//r=0 cout=0
//SUB
#10 a=16'h0000000f; b=16'h0000000e; cin=1; ainvert=0; bnegate=1; op[2]= 0;op[1]=0; op[0]=1;//r=1 cout=0
#10 a=16'd1001; b=16'd12341; cin=1; ainvert=0; bnegate=1; op[2]= 0;op[1]=0; op[0]=1;//r=0 cout=0
//XOR
  #10 a=0; b=0; cin=0; ainvert=0;  op[2]=1; op[1]=1; op[0]=0;bnegate=0;
  #10 a=0; b=1; cin=0;ainvert=0;  op[2]=1; op[1]=1; op[0]=0;bnegate=0;
  #10 a=1; b=0; cin=0; ainvert=0; op[2]=1; op[1]=1; op[0]=0;bnegate=0;
  #10 a=1; b=1; cin=0;ainvert=0;  op[2]=1; op[1]=1; op[0]=0;bnegate=0;
//SLL
#10 a=result; b=16'b1010101010101010; cin=0; ainvert=0; bnegate=0; op[2]= 1;op[1]=0; op[0]=0;//sll
//SRL
#10 a=result; b=16'h0000000e; cin=1; ainvert=0; bnegate=1; op[2]= 0;op[1]=1; op[0]=1;//r=1 cout=0
#10 $stop;
end

alu_16bit a16(a, b, cin, ainvert, bnegate, op, result, cout);
endmodule

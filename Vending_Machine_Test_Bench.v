`timescale 1ns/1ns
`include "Vending_Machine_FSM.v"
module V1_th;
reg clk,clk2;
reg [4:0]itemS;
reg [4:0] val;
wire[4:0] change;
wire out;
wire [4:0] state;
V1 VendingMachine(clk,clk2,itemS,val,out,change,state);
initial begin
    clk=0;
    forever begin
        #5clk=~clk;
    end
end
initial
val=0;
always@(posedge clk) begin
#1 val=0;clk2=0; end
initial begin
    #3 itemS=4;
end
initial
begin 
       $dumpfile("V1.vcd");
        $dumpvars(0,V1_th);
    #14 val=10;clk2=1; #10 val=20;clk2=1; #10 val=10;clk2=1;#2
    $display(" out=%d, change=%d, item_selected=%d,state=%d",out,change,itemS,state,$time);
    #100 $finish;
end
endmodule

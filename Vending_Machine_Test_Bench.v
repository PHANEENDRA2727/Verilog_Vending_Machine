`timescale 1ns/1ns
`include "V1.v"
module V1_th;
reg clk,clk2;
reg [4:0]itemS;
reg [4:0] val;
wire[4:0] change;
wire out;
wire [4:0] state;
// reg[99:0] itemO;
parameter Grape=1,Orange=2,Mango=3,Pineapple=4;
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
    #3 itemS=Orange;
end
function[99:0] itemO;
    input[4:0] itemS;
    begin 
        if(itemS==1)
        itemO="Grape";
        else if(itemS==2)
        itemO="Orange";
        else if(itemS==3)
        itemO="Mango";
        else if(itemS==4)
        itemO="Pineapple";
    end
endfunction
initial
begin 
       $dumpfile("V1.vcd");
        $dumpvars(0,V1_th);
    #14 val=10;clk2=1; #10 val=20;clk2=1; #10 val=10;clk2=1;#2
    $display(" out=%d, change=%d, item_Out=%0s,state=%d,time=%0t",out,change,itemO(itemS),state,$time);
    #100 $finish;
end
endmodule

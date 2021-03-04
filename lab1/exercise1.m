%%Problem 1
%monthly payment calculator
clear;clc;
N=0.5:0.1:20;     %number of years 
r=0.15;           %interest rate in percentage 
L=50000;          %loan amount in Dollar
p=r*L*power((1+r/12),12*N)./(12*(power((1+r/12),12*N)-1));
plot(N,p);
xlabel("months");
ylabel("monthly payment")
text(10,500,"Jiyuan Jia")




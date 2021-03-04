%% JIA Jiyuan 20210303 ICE#3 Class 01
clear;clc;

%% Problem 1:
clear;clc;
syms x;
t=60*24*3600;
Ts=-15;
Ti=20;
alpha=1.38*10^(-7);
T=@(x) (erf(x/(2*sqrt(alpha*t))))*(Ti-Ts)+Ts;
fplot(x,T)
x=fzero(T,0);
disp(x)
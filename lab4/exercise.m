clear;clc; 
syms belta L
belta=0.3
y= @(L) 1+cosh(belta*L)*cos(belta*L)
fplot(L,y)
fzero(y,1)
%% JIA Jiyuan 20210303 ICE#3 Class 01
clear;clc;

%% Problem 1:
clear;clc;
syms x;
% parameter
t=60*24*3600;
Ts=-15;
Ti=20;
alpha=1.38*10^(-7);
% function
T=@(x) (erf(x/(2*sqrt(alpha*t))))*(Ti-Ts)+Ts;
% plot
% fplot(x,T);
% root
x=fzero(T,0);
fprintf("The deapth is %.2f meter.",x)

%% Problem 2:
clear;clc;
% parameter
syms belta;
L = 4.2; 
% function
f=@(belta) 1+cosh(belta*L)*cos(belta*L);
% plot
% fplot(belta,f);
% root1
belta1 = fzero(f,3);
% answer
fprintf("belta1 is %.2f\n",belta1);
% root2
belta2 = fzero(f,4);
% answer
fprintf("belta2 is %.2f",belta2);

%% Problem 3:
clear;clc;
% parameter
x = 1:10;
y = [10 14 16 18 19 20 21 22 23 23];
% polyfit first degree
p = polyfit(log(x),y,1);
% y(2.5) and y(11)
y1 = p(2) + p(1)*log(2.5);
y2 = p(2) + p(1)*log(11);
fprintf("a_1 = %.2f, a_2 = %.2f\n",p(2),p(1));
fprintf("y(2.5) = %.2f, y(11) = %.2f",y1,y2);

%% Problem 4:
clear;clc;
% parameter
t = [0 3.15 6.2 10 18.3 30.8 43.8];
C = [0.1039 0.0896 0.0776 0.0639 0.0353 0.0207 0.0101];
% polyfit first degree
p = polyfit(t,log(C),1);
fprintf("k = %.2f",-p(1))

%% Problem 5:
% parameter
clear;clc;
t = 1:1:10;
P = [26.1 27 28.2 29 29.8 30.6 31.1 31.3 31 30.5];

subplot(3,1,1);
% plot original value as dots
plot(t,P,'o');
hold on;
% polyfit first degree
p = polyfit(t,P,1);
% fit function
P1 = p(1)*t+p(2);
% error
err = sum((P1-P).^2);
fprintf("first degreee: error = %.2f psi\n",err);
% fit funciton curve
plot(t,P1);
xlabel("Time");
ylabel("Pressure");
title("first degree");
% estimate value for t =11
P1 = p(1)*11+p(2);
fprintf("first degreee: P(11) = %.2f psi\n",P1);

subplot(3,1,2);
% plot original value as dots
plot(t,P,'o');
hold on;
% polyfit second degree
p = polyfit(t,P,2);
% fit function
P2 = p(1)*t.^2+p(2)*t+p(3); 
% error
err = sum((P2-P).^2);
fprintf("second degreee: error = %.2f psi\n",err);
% fit funciton curve
plot(t,P2);
xlabel("Time");
ylabel("Pressure");
title("second degree");
% estimate value for t =11
P2 = p(1)*11.^2+p(2)*11+p(3);
fprintf("second degree: P(11) = %.2f psi\n",P2);

subplot(3,1,3);
% plot original value as dots
plot(t,P,'o');
hold on;
% polyfit third degree
p = polyfit(t,P,3);
% fit function
P3 = p(1)*t.^3+p(2)*t.^2+p(3)*t+p(4); 
% error
err = sum((P3-P).^2);
fprintf("third degreee: error = %.2f psi\n",err);
% fit funciton curve
plot(t,P3);
xlabel("Time");
ylabel("Pressure");
title("third degree");
% estimate value for t =11
P3 = p(1)*11.^3+p(2)*11.^2+p(3)*11+p(4); 
fprintf("third degree: P(11) = %.2f psi\n",P3);

fprintf("third degree is best");
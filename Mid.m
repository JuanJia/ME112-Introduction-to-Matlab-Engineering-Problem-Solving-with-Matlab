%% JIA Jiyuan 20210409 Mid Class 01
clear;clc;

%% Problem 1:
clear;clc;
F = [10 50 109 180 300 420 565 771];
V = [20 40 60 80 100 120 140 160];
density = 1.2;
a = polyfit(V,F,2);
CdA = a(1)*2;
fprintf("C_dA is %.4f 10^(-6)*Nmh^2/kg",CdA);

%% Problem 2:
clear;clc;
t = 0:10;
plotvals = 0:0.1:10;
T = [72.5 78.1 86.4 92.3 110.6 111.5 109.3 110.2 110.5 109.9 110.2];
T_linear = interp1(t,T,plotvals,'linear');
fprintf("The temperature at 1.7 s is %.4f F.\n",T_linear(18));
T_spline = interp1(t,T,plotvals,'spline');
plot(plotvals,T_spline);
title("Temperature");
xlabel("Date");
ylabel("Temperature");

fprintf("The temperature at 1.7 s is %.4f F.\n",T_spline(18));
%t = 0:5;
%T = [72.5 78.1 86.4 92.3 110.6 111.5];
%plotvals = 72.5:0.1:111.5;
%t_spline = interp1(T,t,plotvals,'spline');
%plot(t_spline,plotvals);
%plot(T,t);
clear;
t = 0:10;
plotvals = 0:0.001:10;
T = [72.5 78.1 86.4 92.3 110.6 111.5 109.3 110.2 110.5 109.9 110.2];
T_spline = interp1(t,T,plotvals,'spline');
fprintf("The time for 100 F is %.4f s.\n",plotvals(3420));

%% Problem 3:
clear;clc;
t = 1:1000;
Xm = @(t) -11.9084+57.9117*cos(2*pi*t/87.97);
Ym = @(t) 56.6741*sin(2*pi*t/87.97);
Xe = @(t) -2.4987+149.6041*cos(2*pi*t/365.25);
Ye = @(t) 149.8532*sin(2*pi*t/365.25);
%d = @(t) ((Xe-Xm)^2 + (Ye-Ym)^2)^0.5;
d = @(t) (((-2.4987+149.6041*cos(2*pi*t/365.25))-(-11.9084+57.9117*cos(2*pi*t/87.97))).^2 + ((149.8532*sin(2*pi*t/365.25))-(56.6741*sin(2*pi*t/87.97))).^2).^0.5;
plot(t,d(t));
title("Distance");
xlabel("Time");
ylabel("Distance");
%[x,fval] = fminbnd(d,1,1000)
a = d(t)';
[M,Imax] = max(a);
[m,Imin] = min(a);
fprintf("The maximum distance is %.4f Gm at %d day.\nThe minimum distance is %.4f Gm at %d day",M,Imax,m,Imin);

%% Problem 4:
clear;clc;
sigma = 3*10^(-4);
z = 0.05;
R = 0.06;
epsilon0 = 8.85*10^(-12);
f = @(r) 2*r./((z^2+r.^2).^1.5);
E = (sigma*z/(4*epsilon0))*integral(f,0,R);
fprintf("The E is %.2f N/C",E);
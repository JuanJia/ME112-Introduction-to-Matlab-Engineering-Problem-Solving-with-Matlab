%% JIA Jiyuan 20210303 ICE#4 Class 01
clear;clc;

%% Problem 1:
clear;clc;
% load parameter
X = [0 0.25 0.75 1.25 1.5 1.75 1.875 2 2.125 2.25];
Y = [1.2 1.18 1.1 1 0.92 0.8 0.7 0.55 0.35 0];
% plot original data
figure(1);
plot(X,Y,'o');
hold on
xlabel('X(ft)');
ylabel('Y');
% interpolation
plotvals=0:0.1:3;
yvals=interp1(X,Y,plotvals,'linear');
plot(plotvals,yvals,'LineWidth',4);
hold on
yvals=interp1(X,Y,plotvals,'spline');
plot(plotvals,yvals,'LineWidth',2);
hold on

%% Problem 2:
clear;clc;
T = 0:8:40;
% load original data
o = [14.621 11.843 9.870 8.418 7.305 6.413];
figure(2);
plot(T,o,'o','MarkerSize',10);
xlabel('T(^oC)');
ylabel('mg/L');
hold on
plotvals=0:0.1:40;
% interpolation
yvals=interp1(T,o,plotvals,'linear');
plot(plotvals,yvals,'LineWidth',4);
hold on
yvals=interp1(T,o,plotvals,'spline');
plot(plotvals,yvals,'LineWidth',2);
hold on

%% Problem 3
clear;clc;
% load function
f = @(t) (sin(t)).^2;
t = 0:pi/4:2*pi;
% plot original data
figure(3);
plot(t,f(t),'o','MarkerSize',10);
xlabel('t');
ylabel('f(t)');
hold on
%fit

p=polyfit(t,f(t),7);
P = p(1)*t.^7+p(2)*t.^6+p(3)*t.^5+p(4)*t.^4+p(5)*t.^3+p(6)*t.^2+p(7)*t.^1+p(8); 
plot(t,P);
hold on;
% interpolation
plotvals=0:0.1:2*pi

yvals=interp1(t,f(t),plotvals,'spline');
plot(plotvals,yvals,'LineWidth',2);
hold on
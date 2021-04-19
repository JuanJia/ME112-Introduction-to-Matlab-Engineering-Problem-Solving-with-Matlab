%% JIA Jiyuan 20210414 HW#08 Class 01
clear;clc;

%% Problem 1:
clear;clc;
tr = [0 50];
initial = 10000;
[t,y] = ode45(@insect,tr,initial);
figure
plot(t,y)
ylabel('population')
xlabel('day')
disp("Steady state population is 3874");
disp("It costs 43 day");

%% Problem 2:
clear;clc;
tspan=[0 40/0.8];
wnot=0;
[t,y]=ode45(@rkrocket,tspan,wnot);
plot(t,y)
xlabel('time (s)')
ylabel('V (m/s)')
fprintf('Final velocity is %.2f m/s at 50s.',y(50))

%% Problem 3:
clear;clc;
tr = [0 50];
theta = pi/8;
initial = [theta 0];
[t,y] = ode45(@pendulum, tr,initial);
figure;
subplot(3,1,1);
plot(t,y);
legend("theta (rad)","angular velocity (rad/s)");
ylabel('parameter');
xlabel('time(s)');
title("pi/8");

theta = pi/2;
initial = [theta 0];
[t,y] = ode45(@pendulum, tr,initial);
subplot(3,1,2);
plot(t,y);
legend("theta (rad)","angular velocity (rad/s)");
ylabel('parameter')
xlabel('time(s)')
title("pi/2");

theta = 0.1;
initial = [theta sqrt(2*9.81*2*cos(0.1))*sin(0.1)];
[t,y] = ode45(@pendulum, tr,initial);
subplot(3,1,3);
plot(t,y);
legend("theta (rad)","angular velocity (rad/s)");
ylabel('parameter')
xlabel('time(s)')
title("pi-0.1 String");

%% Problem 4:
clear;clc;
tr = [0 50];
initial = [300 150];
[t,y] = ode45(@ecosystem,tr,initial);
figure
plot(t,y);
legend("rabbit","fox");
ylabel('parameter')
xlabel('time')

%% Attachment
clear;clc;
function r = insect(t,N)
R = 0.55;
C = 10000;
Nc = 10000;
r = 10000;
r = R*N*(1-N/C)-r*N^2/(Nc^2+N^2);
end

function p=rkrocket(t,w)
T=48000;
g=9.81;
r=0.8;
b=40;
mo=2200;
m=mo*(1-r*t/b);
p= T/m-g;
end

function r = pendulum(t,z)
r = zeros(2,1);
r(1) = z(2);
r(2) = -9.81/1*sin(z(1));
end

function r = ecosystem(t,rf)
r = zeros(2,1);
r(1) = 2*rf(1)-0.01*rf(1)*rf(2);
r(2) = -rf(2)+0.01*rf(1)*rf(2);
end
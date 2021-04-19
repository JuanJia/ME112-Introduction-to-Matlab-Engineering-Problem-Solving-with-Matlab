%% JIA Jiyuan 20210122 HW#07 Class 01
clear;clc;

%% Problem 1:
clear;clc;
f = @(x) (x+1./x).^2;
for n = 1:4
    t = linspace(1,2,n+1);
    a = f(t);
    result(n) = trapz(t,a);
end
error = abs(result-29/6)./(29/6);
disp("result:");
disp(result);
disp("error:");
disp(error);

%% Problem 2:
clear;clc;
f = @(x) (4*x-3).^3;
for n = 4:5
    t = linspace(-3,5,n+1);
    result(n-3)=0;
    for i = 1:n
        result(n-3) = quad(f,t(i),t(i+1))+result(n-3);
    end
end
error = abs(result-(17^4-15^4)/16)./((17^4-15^4)/16);
disp("result:");
disp(result);
disp("error:");
disp(error);

%% Problem 3:
clear;clc;
f = @(x) (x.^2.*exp(x));
t = linspace(0,3,5);
a = f(t);
result = trapz(t,a);
error = abs(result-(5*exp(3)-2))./(5*exp(3)-2);
disp("result:");
disp(result);
disp("error:");
disp(error);
    
result=0;
for i = 1:4
    result = quad(f,t(i),t(i+1))+result;
end
error = abs(result-(5*exp(3)-2))./(5*exp(3)-2);
disp("result:");
disp(result);
disp("error:");
disp(error);

%% Problem 4:
clear;clc;
y = [0 1 3 5 7 8 9 10];
H = [0 1 1.5 3 3.5 3.2 2 0];
U = [0 0.1 0.12 0.2 0.25 0.3 0.15 0];
averagedepth = trapz(y,H)/10;
area = trapz(y,H);
averagevelocity = trapz(y,H.*U)/area;
flowrate = trapz(y,H.*U);
disp("averagedepth: (m)");
disp(averagedepth);
disp("area:(m^2)");
disp(area);
disp("averagevelocity: (m/s)");
disp(averagevelocity);
disp("flowrate: (m^3/s)");
disp(flowrate);

%% Problem 5:
clear;clc;
t = [0 1 5.5 10 12 14 16 18 20 24];
c = [1 1.5 2.3 2.1 4 5 5.5 5 3 1.2];
Q = @(t) 20 + 10. * sin(pi./12.*(t-10));
A = trapz(t,Q(t).*c);
B = quad(Q,0,24);
c_average = A/B;
disp("c_average: (mg/L)");
disp(c_average);

%% Problem 6:
clear;clc;
T = [0 15 30 45 60 75];
R = [18 24 26 20 18 9];
total = trapz(T,R/4);
rate = total/75;
disp("total");
disp(total);
disp("rate");
disp(rate);
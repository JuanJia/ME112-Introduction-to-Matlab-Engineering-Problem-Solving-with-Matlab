%% JIA Jiyuan 20210122 HW#05-1 Class 01
clear;clc;

%% Problem 1:
% a.
clear; clc;
A = [2 1;3 -9];
B = [5; 7];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp("answer is ")
disp(X);

% b.
clear; clc;
A = [-8 -5;-2 7];
B = [4; 10];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp("answer is ")
disp(X);

% c.
clear; clc;
A = [12 -5 0;-3 4 7; 6 2 3];
B = [11; -3; 7];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp("answer is ")
disp(X);

% d.
clear; clc;
A = [6 -3 4;12 5 -7; -5 2 6];
B = [41; -26; 16];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp("answer is ")
disp(X);

%% Problem 2:
% a.
clear; clc;
disp("C = B \ (A \ B - A)");
% b.
clear;
A = [7 9; -2 4];
B = [4 -3; 7 6];
r1 = rank(A*B);
r2 = rank([A*B,B-A*A]);
disp("rank(A*B) is "+r1);
disp("rank([A*B,B-A*A]) is "+r2);
C = A*B\(B-A*A);
disp("answer is ")
disp(C);

%% Problem 3:
% a.
clear; clc;
A = [-2 1;-2 1];
B = [-5; 3];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
if r1==r2&&r1==size(A,1)
    X = A\B;
    disp("answer is ")
    disp(X);
else
    disp("singular matrix");
end

% b.
clear;
A = [-2 1;-8 4];
B = [3; 12];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
if r1==r2&&r1==size(A,1)
    X = A\B;
    disp("answer is ")
    disp(X);
else
    disp("singular matrix");
end

% c.
clear;
A = [-2 1;-2 1];
B = [-5; -5.00001];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
if r1==r2&&r1==size(A,1)
    X = A\B;
    disp("answer is ")
    disp(X);
else
    disp("singular matrix");
end

% d.
clear;
A = [1 5 -1 6; 2 -1 1 -2; -1 4 -1 3; 3 -7 -2 1];
B = [19; 7; 30; -75];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
if r1==r2
    X = A\B;
    disp("answer is ")
    disp(X);
else
    disp("singular matrix");
end

%% Problem 4:
clear; clc;
syms c;
A = [1 -5 -2; 6 3 1; 7 3 -5];
B = [ 11*c; 13*c; 10*c];
X = A\B;
disp(X);
c = -10:0.1:10;
x = 3*c;
y = -2*c;
z = c;
plot(c,x,c,y,c,z);
legend("x","y","z");
xlabel("c");
ylabel("parameter")

%% Problem 5:
% a.
clear; clc;
syms tf theta1_tf theta1_0 a1 a2 a3 b1 b2 b3;
A = [tf^3 tf^4 tf^5;
    3*tf^2 4*tf^3 5*tf^4;
    6*tf 12*tf^2 20*tf^3];
b = [theta1_tf - theta1_0;0 ;0];
X1 = [a1; a2; a3];
X2 = [b1; b2; b3];
disp("A = ");
disp(A);
disp("b = ");
disp(b);
disp("X1 = ");
disp(X1);
disp("X2 = ");
disp(X2);
% b.
A = [8 16 32;
    12 32 80;
    12 48 160];
b1 = [62; 0; 0];
b2 = [107; 0; 0];
X1 = A\b1;
X2 = A\b2;
fprintf("\ta1 = %.3f\n \ta2 = %.3f\n \ta3 = %.3f\n",X1(1),X1(2),X1(3));
fprintf("\tb1 = %.3f\n \tb2 = %.3f\n \tb3 = %.3f\n",X2(1),X2(2),X2(3));
disp("theta1 = -19 +77.5*t^3-58.13*t^4+11.625*t^5")
disp("theta2 = 44 +133.75*t^3-100.3125*t^4+20.0625*t^5")
% c.
clear; 
A = [8 16 32;
    12 32 80;
    12 48 160];
b1 = [62; 0; 0];
b2 = [107; 0; 0];
X1 = A\b1;
X2 = A\b2;
t = 0:0.0001:2;
theta1 = -19 +77.5*t.^3-58.13*t.^4+11.625*t.^5;
theta2 = 44 +133.75*t.^3-100.3125*t.^4+20.0625*t.^5;
x = 4*cos(theta1/180*pi)+3*cos((theta1+theta2)/180*pi);
y = 4*sin(theta1/180*pi)+3*sin((theta1+theta2)/180*pi);
plot(x,y);
xlabel("x");
ylabel("y");

%% Problem 6:
clear; clc;
Ta = 150;
Tb = 20;
A = [0.036 1 0 0;4.01 -1 1 0;0.408 0 -1 1; 0.038 0 0 -1];
B = [20; 0; 0; -10];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
fprintf("\tq = %.2f W \n \tT1 = %.2f celcius\n \tT2 = %.2f celcius\n \tT3 = %.2f celcius",X(1)*10,X(2),X(3),X(4));
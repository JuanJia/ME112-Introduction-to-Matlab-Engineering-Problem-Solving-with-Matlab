%% JIA Jiyuan 20210122 HW#05-2 Class 01
clear;clc;

%% Problem 1:
clear; clc;
A = [7 9 -9;3 2 -4;1 5 -1];
B = [22; 12; -2];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
disp("singular matrix");
disp("one possible answer")
X = A\B;
disp(X);

%% Problem 2:
% a.
clear; clc;
A = [1 1 1;16 4 1;25 5 1];
B = [4; 73; 120];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp(X);
% b.
A = [1 1 1 1;64 16 4 1;125 25 5 1];
B = [4; 73; 120];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
disp("singular matrix");
disp("one possible answer")
X = A\B;
disp(X);
%% Problem 3:
clear; clc;
Ta = 150;
Tb = 20;
A = [1 -1/3 -1/3 0;-0.5 1 0 -0.5;-0.5 0 1 -0.5; 0 -1/3 -1/3 1];
B = [1/3*Ta; 0; 0; 1/3*Tb];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp(X);

%% Problem 4:
% the temperature of each subsquare is the average of the temperatures in
% the adjacent
clear; clc;
Ta = 150;
Tb = 20;
A = [3 -1 0 -1 0 0 0 0 0;
    -1 3 -1 0 -1 0 0 0 0;
     0 -1 2 0 0 -1 0 0 0;
     -1 0 0 3 -1 0 -1 0 0;
     0 -1 0 -1 4 -1 0 -1 0;
     0 0 -1 0 -1 3 0 0 -1;
     0 0 0 -1 0 0 2 -1 0;
     0 0 0 0 -1 0 -1 3 -1;
     0 0 0 0 0 -1 0 -1 3];
B = [Ta;0;0;0;0;0;0;0;Tb];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
X = A\B;
disp(X);

%% Problem 5:
% a.
clear;clc;
A = [6 2 10;3 5 2];
B = [35; 40];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
C = rref([A,B]);
disp(C);
% b.
disp("x = -1.9167*z + 3.9583");
disp("y = -0.75*z + 5.625");
fprintf("0 <= z <= %.5f\n",3.9583/1.9167);
fprintf("0 <= y <= 5.625\n");
fprintf("0 <= x <= 3.9583\n");
% c.
f = [-200 -300 -100];
lb = [0 0 0];
[x,fval] = linprog(f, A,B,[],[],lb,[]);
disp("value of x y z")
disp(x);
disp("maximum profit")
disp(-fval);
% d.
f = [-200 -500 -100];
lb = [0 0 0];
[x,fval] = linprog(f, A,B,[],[],lb,[]);
disp("value of x y z")
disp(x);
disp("maximum profit")
disp(-fval);

%% Problem 6:
clear; clc;
A = [1 0 1 0 0 0 0;
     1 -1 0 -1 0 0 0;
     0 1 0 0 1 0 0;
     0 0 1 0 0 1 0;
     0 0 0 1 0 -1 1;
     0 0 0 0 1 0 1];
B = [300;-300;600;400;200;600];
r1 = rank(A);
r2 = rank([A,B]);
disp("rank(A) is "+r1);
disp("rank([A,B]) is "+r2);
C = rref([A,B]);
disp(C);
disp("2 sensors are needed");


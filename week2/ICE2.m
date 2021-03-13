%% JIA Jiyuan 20210122 ICE#2 Class 01
clear;clc;

%% Problem 1:
% returns a matrix that contains only those elements of M that are in even 
% rows and columns
clear;clc;
% random matrix
M = 100*rand(7,7)
% give elements in even rows and columns
even_index(M)

%% Problem 2:
% opposite order
clear;clc;
% give random matrix
N = 100*rand(1,10)
% flip order
flip_it(N)

%% Problem 3:
% top right corner of N
clear;clc;
% random matrix N's size and reduced matrix's size
x=fix(rand()*10);
y=fix(rand()*15);
n = min(x,y)-1;
% random matrix N
N = 100*rand(x,y)
% top right matrix
top_right(N,n)

%% Problem 4:
% adds together the elements in the first and last rows and columns
% random matrix N's size
clear;clc;
x=fix(rand()*10+2);
y=fix(rand()*15+2);
% random matrix N
N = 100*rand(x,y)
% give out peri_sum
peri_sum(N)

%% Problem 5:
clear;clc
% the sum of n_th above terms
sum = 0;
n = 0;
x=pi/2;
% function of term in series
f= @(m,x) (-1)^((m-1)/2)*x^m/factorial(m);
% the error between sin(x) and sum
err=sin(x);
while(1)
    % precision judgement
    if(abs(err)<0.01)
        break;
    end
    % give out each term's value
    term = f(2*n+1,x);
    n = n+1;
    % add rach term to sum
    sum = sum+term;
    err = (sin(x)-sum)/sin(x);
end
fprintf("%d terms are needed",n)

%% Problem 6:
% the height after the 8th bounce?
clear;clc
hInitial=2;
hFinal=(0.85^2)^8;
fprintf("The height after the 8^(th)bounce is %.2f meters",hFinal)

%% Problem 7:
% pressure vs. volume
clear;clc
% parameter
V = 0.08:0.1:6;
n=1;
T=300;
R=0.08206;
a=1.39;
b=0.039;
% funciton of P, as V is independent variable
P = n*R*T./(V-n*b)-n^2*a./(V.^2);
% draw the picture
plot(V,P)
axis([0.08,6,0,400])
% xlabel
xlabel("Volume");
% ylabel
ylabel("Pressure");

%% Problem 8:
clear;clc;
% random a matrix x
x = 10*rand(ceil(10*rand)+2,1);
mysum=0;
% adding each term to get sum
for li=1:size(x)
    mysum = mysum+x(li);
end
% answer judgement
if mysum == sum(x)
    disp('Congratulations!!, you did it right')
    load handel; sound(y,Fs)
else
    fprintf('Sorry, %.2f != %.2f. Please try again.\n',mysum,sum(x))
end
% repeat but use 'while' loop
mysum=0;
lj=1;
[r,c]= size(x);
while(lj<=r)
    mysum = mysum+x(lj);
    lj=lj+1;
end
% answer judgement
if mysum == sum(x)
    disp('Congratulations!!, you did it right')
    load handel; sound(y,Fs)
else
    fprintf('Sorry, %.2f != %.2f. Please try again.\n',mysum,sum(x))
end
%% Attachment of function
clear;clc;

% Problem 1:
function r = even_index(M)
% get size of M
[r,c] = size(M);
A = [];
% get the even row and column element when both of row and column >1
if (r>1)
    if(c>1)
        for li=2:2:r
            % add new element in to new row B
            B = [];
            for lj=2:2:c
                B=[B,M(li,lj)];
            end
            % add new row into new matrix A
            A =[A;B];
        end
    else
        % row > 1 but column = 1
        % one time traverse
        for li=2:2:r
            A = [A;M(li,lj)];
        end
    end
else
    % row = 1 but column > 1
    % one time traverse
    if(c>1)
        for lj=2:2:c
            A = [A;M(li,lj)];
        end
    else
        % row = 1 and column = 1
        % no answer
        fprintf("sorry, no answer")
    end
end
r=A;
end

% Problem 2:
function f=flip_it(N)
% new matrix A to keep flip ordered elements
A = [];
% get the size of N
[r,c]=size(N);
for li=c:-1:1
    %traverse the matrix N and add element into A in flipped order
    A = [A,N(1,li)];
end
f = A;
end

% Problem 3:
function f = top_right(N,n)
% get the size of N
[r,c]=size(N);
% new matrix A to keep flip ordered elements
A=[];
for li = 1:r
    % add new element in to new row B
    B=[];
    for lj = c-n+1:c
        B=[B N(li,lj)];
    end
    % add new row into new matrix A
    A = [A;B];
end
f = A;
end

% Problem 4:
function f = peri_sum(N)
% get the size of N
[r,c] = size(N);
sum = 0;
% sum of first raw
for lj = 1:c
    sum = sum + N(1,lj);
end
% sum of last raw
for lj = 1:c
    sum = sum + N(r,lj);
end
% if raw > 2
% sum of first column except the firt one and last one
% "if" judgement is not necessary,if 2<r-1 no error in matlab
% li will be null
if(r>2)
    for li = 2:r-1
        sum = sum + N(li,1);
    end
    for li = 2:r-1
        sum = sum + N(li,c);
    end  
end
f=sum;
end
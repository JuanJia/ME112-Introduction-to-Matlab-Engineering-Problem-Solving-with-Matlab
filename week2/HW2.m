%% JIA Jiyuan 20210122 HW#2 Class 01
clear;clc;

%% Problem 1:
clear;clc;
%create matrix A
A = [0 -1 4;9 -14 25;-34 49 64];
%get the size of A
[r,c] = size(A);
B = zeros(r,c);
%traverse the element
for li = 1:r
    for lj = 1:c
        if(A(li,lj)<0)
            %add 50 to the neagtive element
            B(li,lj)=A(li,lj)+50;
        else
            %do sqrt to the non negative element
            B(li,lj)=sqrt(A(li,lj));
        end
    end
end
%give out answer
disp(B)
%% Problem 2:
clear;clc;
%initially deposit
bankAccount = 500;
%years
years = 0;
%interests every year
interests = 0;
%achievement of goal
while (bankAccount<10000)
    years = years+1;
    %interests calculation
    interests = bankAccount*0.05;
    %refreshing the bankAccount
    bankAccount = bankAccount+interests+500;
end
fprintf("%2d years is needed",years)

%% Problem 3:
clear; clc;
%price of stock
price = [19,18,22,21,25,19,17,21,27,29];
[r,c] = size(price);
%initial price
shares = 1000;
%amount spent in buying
amountBuying = 0;
%amount received from saling
amountReceived = 0;
for li = 1:c
    %buying at the low price
    if price(li) < 20
        shares = shares+100;
        amountBuying = price(li)*100;
    else
        %saling at the high price
        if price(li) > 25
            shares = shares-100;
            amountReceived = price(li)*100;
        end
    end
end
%give out the answer
fprintf("The amount you spent in buying shares is %2d$\n",amountBuying);
fprintf("The amount you received from saling is %2d$\n",amountReceived);
fprintf("The total number of shares is %2d\n", shares);
fprintf("The net increase is %2d$\n",29*shares-19*1000);

%% Problem 4:
clear;clc;
%load customer's information
infoCustomer = [1 28 3;7 18 7;8 16 4;17 2 5;22 10 2;27 8 6];
[r,c] = size(infoCustomer);
%initial cost
cost = 6*30*1.414*7;
%initial location of distribution center
locationDistribution = [0 0];
%check every possible poitnt
for li = 0:1:30
    for lj = 0:1:30
        %sum of cost of every point
        costTemp = 0;
        for lk = 1:r
            %distance
            d = sqrt((li-infoCustomer(lk,1))^2+(lj-infoCustomer(lk,2))^2);
            %Volume
            V = infoCustomer(lk,3);
            %cost
            c = 0.5*d*V;
            %cost accumulated
            costTemp = costTemp + c;
        end
        %find the minimum cost and center's location
        if costTemp < cost
            cost = costTemp;
            locationDistribution = [infoCustomer(lk,1) infoCustomer(lk,2)];
        end
    end
end
fprintf("The x and y location of distribution center are %d,%d",locationDistribution);
%% Problem 5:
clear;clc;
%a
%Calculate each term in series
term=[];
for n = 1:2:19
    term = [term abs((2/n*sin(n*pi/2)*sinh(n*pi/2)/sinh(n*pi*2/2)))];
end
disp(term)

%b
%The function to calculate temperature
T = @(w) (200-70)*w+70;
term =@(x,y,n) 2/n*sin(n*pi*x/2)*sinh(n*pi*y/2)/sinh(n*pi*2/2);
n = 1;
%n_th former terms's sum
sum = term(1,1,n);
while(1)
    n = n + 2;
    %precision judgement
    if((T(2/pi*(sum+term(1,1,n)))/T(2/pi*(sum))-1)<=0.01)
        break;
    end
    %n_th former terms's sum
    sum = sum + term(1,1,n);
end
T(2/pi*sum)
disp("strange answer")
%c
x=0:0.2:2;
y=0:0.2:2;
%meshgrid for surf
[xgrid, ygrid] = meshgrid(x,y);
%obtain zgrid
zgrid = [];
for lj=0:0.2:2
    A=[];
    for li=0:0.2:2
        %let %b be a function temperature, then get each point's T
        A=[A temperature(li,lj)];
    end
    zgrid=[zgrid;A];
end
%draw the figure
surf(xgrid,ygrid,zgrid);
%title
title("Temperature distribution");
%give the label
xlabel("X axis");
ylabel("Y axis");
zlabel("Temperature centigrade");

%% Problem 6:
clear;clc;
%initial lnumber of the current month
numberMonth = 0;
%initial interest rate for current month
interestRate = 0.01;
%initial interest earned in current month
interestCurrentMonth = 0;
%initial balance
balance = 10000;
%initial total interest accumulated
interestTotal = 0;
%headers
fprintf("Month  InterestRate  Interest current month  Balance  Total interest\n")
for li=1:12
    %get month
    numberMonth = li;
    %get interest rate
    if balance>20000
        interestRate = 0.02;
    else
        if balance>15000
            interestRate = 0.015;
        end
    end
    %get interest earned in current month
    interestCurrentMonth = interestRate*balance;
    %get new balance
    balance = balance + interestCurrentMonth + 1000;
    %get total interest accumulated
    interestTotal = interestTotal + interestCurrentMonth;
    %give info
    fprintf(" %2d        %.1f%%              $%.2f        $%.2f     $%.2f\n",numberMonth,interestRate*100,interestCurrentMonth,balance,interestTotal)
end

%% Problem 7:
% This MATLAB script tests a user-defined function that place a name
%in randomly sizes plots
clear;clc;
% x data
xmin = (-10)+(10-(-10)).*rand;
%Generate random number between -10 and 10
xrange = 2 + (5-2).*rand;
%Generate random number between 2 and 5
xmax = xmin + xrange;
numPts = 150;
%Number of data points
x = linspace(xmin,xmax,numPts);
x2 = x-0.2*xrange;

% y data
%Generate random amplitude between 0.5 and 2
Amp = 0.5 + 0.5 +(2-0.5).* rand;
%Generate random freq between 0.5 and 1,5
Freq = 0.5 +(1.5-0.5).*rand;
y=Amp*sin(2*pi*Freq*x);
y2=2*Amp*cos(2*pi*Freq*x2);
% Plot data and test your function
%number of subplot rows
r = 2;
%number of subplot columns
c = 2;

subplot(r,c,1)
plot(x,y)
UpperLeft

subplot(r,c,2)
plot(x2,y2)
UpperRight

subplot(r,c,3)
plot([-5*rand 3*rand],'o');
LowerLeft;

subplot(r,c,4)
plot([5*rand 5*rand],[2*rand,6*rand])
LowerRight

%% Attachment of function
clear;clc;
% Problem 5:
function f = temperature(x,y)
%The function to calculate temperature
T = @(w) (200-70)*w+70;
%Calculate each term in series
term = @(x,y,n) 2/n*sin(n*pi*x/2)*sinh(n*pi*y/2)/sinh(n*pi*2/2);
n = 1;
sum = term(x,y,n);
% for n=3:2:100*rand*2+3
for n=3:2:225
    sum=sum+term(x,y,n);
end
f=T(2/pi*sum);
% while(1)
%     n = n + 2;
%     %precision judgement
%     if((T(2/pi*(sum+term(x,y,n)))/T(2/pi*(sum))-1)<=10^(-2^11111111))
%         break;
%     end
%     % n_th former terms's sum
%     sum = sum + term(x,y,n);
% end
% f=T(2/pi*sum);
end

% Problem 7：
function UpperLeft
%range of xaxis
tempx = xlim;
%range of yaxis
tempy = ylim;
%normalization location
xLocation = (tempx(2)-tempx(1))*0.1+tempx(1);
yLocation = (tempy(2)-tempy(1))*0.9+tempy(1);
%set label
text(xLocation,yLocation,"YOUR NAME HERE")
end

function UpperRight
%range of xaxis
tempx = xlim;
%range of yaxis
tempy = ylim;
%normalization location
xLocation = (tempx(2)-tempx(1))*0.3+tempx(1);
yLocation = (tempy(2)-tempy(1))*0.9+tempy(1);
%set label
text(xLocation,yLocation,"YOUR NAME HERE")
end

function LowerLeft
%range of xaxis
tempx = xlim;
%range of yaxis
tempy = ylim;
%normalization location
xLocation = (tempx(2)-tempx(1))*0.1+tempx(1);
yLocation = (tempy(2)-tempy(1))*0.1+tempy(1);
%set label
text(xLocation,yLocation,"YOUR NAME HERE")
end

function LowerRight
%range of xaxis
tempx = xlim;
%range of yaxis
tempy = ylim;
%normalization location
xLocation = (tempx(2)-tempx(1))*0.3+tempx(1);
yLocation = (tempy(2)-tempy(1))*0.1+tempy(1);
%set label
text(xLocation,yLocation,"YOUR NAME HERE")
end
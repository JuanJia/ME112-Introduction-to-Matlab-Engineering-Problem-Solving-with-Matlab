%% JIA Jiyuan 20210115 HW#1 Class 01
clear;clc;

%% Problem 1:
%monthly payment calculator
clear;clc
N=0.5:0.1:20;     %number of years 
r=0.15;           %interest rate in percentage 
L=50000;          %loan amount in Dollar
p=r*L*power((1+r/12),12*N)./(12*(power((1+r/12),12*N)-1));   %formula for monthly payment

figure(1)
plot(N,p); %plot fogure
xlabel("months"); %xlabel
ylabel("monthly payment"); %ylabel
text(10,500,"Jiyuan Jia"); %text on

%% Problem 2:
clear;clc
A = [20 4 2 6; 6 37 2 3; 8 5 9 9]  %matrix A
x1 = A(1,:)         %first row of A to a vector called x1 
y = A(end-1:end,:)  %last 2 rows of A to an array called y
B = A(:,2:2:end)    %even-numbered columns of A to an array called B
C = A'              %transpose of A to C 
reciprocal = 1./A   %reciprocal of each element o
A(3,2)=100          %change the number in column 2, row 3 of A to 100

%% Problem 3:
clear;clc
t = 0:0.001:2*pi;           %set independent variable
y = sin(4*t).*cos(2*t);     %set dependent variable
figure(2);                  %set figure
subplot(1,2,1);             %set subplot format
plot(t,y);                  %plot normal plot
grid on;                    %set grid on 
legend('y_m_a_x^k = sin(4t)cos(2t)') %set legend
axis([0,7,-0.8,0.8]);

subplot(1,2,2);             %set subplot format
polarplot(t,y);             %plot polar plot
text(0,0,"Jia Jiyuan");     %set text

%% Problem 4:
clear;clc
lengthInch = input("Enter a number:");  %input block
% lengthInch = 5                            %input block for publishing
lengthCentimeters = lengthInch*2.54;    %convert inch into centimeter
lengthMilimeters = lengthInch*2.54*10;  %convert inch into milimeter
fprintf("%.2f inches is %.2f cm\n",lengthInch,lengthCentimeters); %print out result
disp([num2str(lengthInch,'%.2f') ' inches is also ' num2str(lengthMilimeters,'%.2f') ' mm']);  %print out result

%% Problem 5:
clear;clc
N = logspace(4,8);              %independent variable for D/\epsilon !=0
p = [20 100 1000 10000 100000]; %parameter
figure(3);
for li = 1:1:5                  %draw the figures for different parameters
    f = 0.25./((log10(1./(3.7.*p(li))+5.74./(N.^0.9))).^2);  %the formula to get f
    loglog(N,f,'DisplayName',"D/\epsilon = " + num2str(p(li))) %plot and lengend
    hold on
end

N = logspace(2.8,3.3);          %independent variable forlaminar flow
loglog(N,64./N,'DisplayName',"Laminar flow") %plot and legend
hold off 
axis([10^2.8,10^8,10^-2.1,10^-1]) %axis limited
grid on
title("Moody's Diagram")        %title
xlabel("Reynolds Number N_R");  %xlabel
ylabel("Friction Factor f");    %ylabel
legend     %legend on
text(10^3,10^-2,"Jia Jiyuan")  %text

%% Problem 6:
clear;clc
x = -2:0.1:2;  %independent variable x
y = -2:0.1:2;  %independent variable y
[xgrid, ygrid] = meshgrid(x,y); %meshgrid for surf
zgrid = 50*(ygrid.^2).*exp(-xgrid.^2-0.5*ygrid.^2); %obtain zgrid
figure(4);
surf(xgrid,ygrid,zgrid);    %draw the figure
title("My Plot Title Jia Jiyuan"); %title
zlabel("f(x,y) = 50y^2e^{-x^2-0.5y^2}") %give the label

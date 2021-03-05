clc;clear;close all;
%{
Spring 2020
Aero 300 
Lab3
Eddie Hsieh
%}
%% Variable Setting
f = @(x) x.^3 + 1.0142*x.^2 - 19.3629*x + 15.8398;%Target function p(x)
fp = @(x) 3*x.^2 + 2*1.0142*x - 19.3629;%First order derivative of p(x)
fpp = @(x) 6*x + 2*1.0142;%second order derivative of p(x)
TOL = 0.5e-6;             %Tolerance
roots = mybracketing(f,-2,0.4,3);%Roots founded from bracketing function
sz = size(roots);%the size of the roots stored matrix
%% Bisection Method
tic%start timing
for k1 = 1:10000%10000 loop running
    for i = 1:sz(1) %Plug in each root founded
        %Run Bisetion method
        [r_bi(i),x_bi(:,i),y_bi(:,i),error_bi(:,i),n_bi] =...
            mybisection(f,roots(i,1),roots(i,2),TOL);   
    end
end
disp('Average solve time for Bisection method running 10000 times is')
t1 = toc/10000 %end of timing and devided by 10000 to get average time
i = 1;%reset i variable to 1 for next method
%% Newton's Method
tic%start timing
for k2 = 1:10000%10000 loop running
    for i = i:sz(1)%Plug in each root founded
        %Run Newtons method
        [r_nw(i),x_nw(:,i),y_nw(:,i),error_nw(:,i),n_nw] =...
            mynewton(f,fp,roots(i,1),TOL);
    end
end
disp('Average solve time for Newtons method running 10000 times is')
t2 = toc/10000 %end of timing and devided by 10000 to get average time
i = 1;%reset i to 1 for next method
%% Halley's Method
tic%start timing
for k3 = 1:10000%10000 loop running
    for i = i:sz(1)%Plug in each root founded
        %Run Halleys method
        [r_hy(i),x_hy(:,i),y_hy(:,i),error_hy(:,i),n_hy] =...
            myhalley(f,fp,fpp,roots(i,1),TOL);
    end
end
disp('Average solve time for Halleys method running 10000 times is')
t3 = toc/10000%end of timing and devided by 10000 to get average time
disp('The fastest solving method is Halleys method,and then the second')
disp('fast method is the Newtons method, which takes around 3x10^-6 more')
disp('than the Halleys method. Lastly, Bisection method takes 10^2 times')
disp('larger than the previous two methods.')
%% Figure 1
figure(1)           %open figure 1
x = linspace(-8,8); %create x array for function to plot
plot(x,f(x),'b','LineWidth',2); %Plot function
grid on                         %show grid
xlabel('x');                    %label x axis
ylabel('y = p(x)')              %label y axis
title('Function: p(x) = x^3+1.0142x^2-19.3629x+15.8398');%label title 
legend('y = p(x)')              %turn on legend
set(gca,'FontSize',13);         %set fontsize
%% Figure 2
figure(2)           %open figure1
semilogy(1:n_bi,error_bi(:,1),'LineWidth',2);%plot error vs n on log y axis
slope1 = (error_bi(end,1) - error_bi(1,1))/n_bi;
grid on             %show grid
hold on             %hold the first plot
semilogy(1:n_nw,error_nw(:,1),'LineWidth',2);%plot newtons method error
slope2 = (error_nw(end,1) - error_nw(1,1))/n_nw;
semilogy(1:n_hy,error_hy(:,1),'LineWidth',2);%plot halley's method error
slope3 = (error_hy(end,1) - error_hy(1,1))/n_hy;
xlabel('Number of iteration [n]');           %label x
ylabel('Absolute Error')                     %label y
title('Absolute Error vs. Iteration Number for root 0.8976'); %label title
legend('Bisection method','Newtons Method','Halleys Method');%show legend
set(gca,'FontSize',13);%set the fontsize
disp('------------------------------------------------------------------');
disp('The slopes for Bisection, Newtons, Halleys method are, respectively')
slope1
slope2
slope3
disp('The method which has a smaller slope has a faster convergence rate.') 
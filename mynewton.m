%% Newtons Function
function [r,x,y,error,n] = mynewton(f,fp,x_0,TOL)
%{
Spring 2020
Aero 300 
Lab3
Eddie Hsieh
Newton method function 
-------------------------------------------------------
Inputs:
     f = target function
     fp = first order diffrentiation of target function
     x_0 = initial guess  
     TOL = tolerance
Outputs:
     x = estimate roots
     y = value of function with x
     error = errors for each estimate
     n = number of steps
%}
%apply newtons method x_1 = x_0 - f(x_0)/f'(x_0).
x_1 = x_0 - f(x_0)/fp(x_0);
%record x_1
x = x_1;
%record the value of function when x = x_1
y = f(x_1);
%error = abs(x_1-x_0)
err = abs(x_1-x_0);
error = err;
%iteration start from 1
n = 1;
%As long as error is larger then tolerance,run one more iteration
while err>TOL
%   plus one iteration
    n = n + 1;
%   set x_0 = x_1
    x_0 = x_1;
%   Let x_1 = x_0 - f(x_0)/f'(x_0)
    x_1 = x_0 - f(x_0)/fp(x_0);
%   record: x_1,f(x_1)
    x = [x;x_1];
    y = [y;f(x_1)];
%   error = abs(x_1-x_0) and record error
    err = abs(x_1-x_0);
    error = [error;err];    
%end of one iteration
end
%let root be the last element of x vector
r = x(end);
end



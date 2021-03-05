%% Halley's Function
function [r,x,y,error,n] = myhalley(f,fp,fpp,x_0,TOL)
%{
Spring 2020
Aero 300 
Lab3
Eddie Hsieh
Halley method function 
-------------------------------------------------------
Inputs:
     f = target function
     fp = first order diffrentiation of target function
     fpp = Second order diffrentiation of target function
     x_0 = initial guess  
     TOL = tolerance
Outputs:
     x = estimate roots
     y = value of function with x
     error = errors for each estimate
     n = number of steps
%}
%Start the first iteration
x_1 = x_0 - ((2*f(x_0)*fp(x_0))/(2*(fp(x_0).^2) - (f(x_0)*fpp(x_0))));
% Record the first estimate root
x = x_1;
% record the first value of the function
y = f(x_1);
% first iteration is done
n = 1;
%error = abs(x_1-x_0)
err = abs(x_1-x_0);
%record error
error = err;
%As long as error is larger then tolerance,run one more iteration
while err>TOL
%   plus one iteration
    n = n + 1;
%   set x_0 = x_1
    x_0 = x_1;
%   Run the next Halley method iteration
    x_1 = x_0 - ((2*f(x_0)*fp(x_0))/(2*(fp(x_0).^2) - (f(x_0)*fpp(x_0))));
%   record root
    x = [x;x_1];
%   Record value of function
    y = [y;f(x_1)];
%   error = abs(x_1-x_0)
    err = abs(x_1-x_0);
%   record error  
    error = [error;err];    
%end of one iteration
end
%let root be the last element of x vector
r = x(end);
end
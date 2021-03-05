%% Bisection function
function [r,x,y,error,n] = mybisection(f,a,b,TOL)
%{
Spring 2020
Aero 300 
Lab3
Eddie Hsieh
Bracketing function 
-------------------------------------------------------
Inputs:
     f = target function 
     a = guess one from brakcket 
     b = guess two from brakcket  
     TOL = tolerance
Outputs:
     x = estimate roots
     y = value of function with x
     error = errors for each estimate
     n = number of steps
%}
%Given [a b] such that f(a)*f(b)<0 and store x as the first estimate
x = (a+b)/2;
%Store the function value of first estimate
y = f((a+b)/2);
%Set error to abs((b-a)/2)
err = abs(a - b)/2;
error = err;%This one will be the vector store every errors
%stat the iteration from 0
n = 1;
%start while loop when satisfy condtion error<tolerance
while err > TOL
%   iteration + 1
    n = n + 1;
%   let c = (a+b)/2
    c = (a+b)/2;
%   if f(c) = 0, which means c is the root   
    if f(c) == 0
%       return c
        a = c;
        b = c;
%   elseif f(a)*f(c)<0, root exist between [a c]
    elseif f(a)*f(c) < 0
%       let b = c
        b = c;
%   else f(a)*f(c)>0 no root between [a c]
    else
%       let a = c 
        a = c;
%   End of the if loop
    end
%   record x value
    x = [x;(a+b)/2];
%   record error
    err = abs(a - b)/2;
    error = [error;err];
%   record f(x) value
    y = [y;f((a+b)/2)];
%   end of one iteration
end
% Let Root to be the final term of x vector
r = x(end);

end
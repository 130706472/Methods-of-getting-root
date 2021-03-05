%% Bracketing function
function final = mybracketing(f,g,h,n)
%{
Spring 2020
Aero 300 
Lab3
Eddie Hsieh
Bracketing function 
-------------------------------------------------------
Inputs:
     g = the initial guess, 
     h = the step size, 
     n = the expected number of roots, 
     f = the function handle to the polynomial
Outputs:
     final = [Ai Bi;...;An Bn]
     A = lower bound
     B = upper bound
%}
final = zeros(n,2);%create a final answer vector
i = 1;             %i is the number of roots founded
a = g;             %push two guesses to their mid point
b = g;
% while  i (iteration) <= n roots
while i <= n       
% let b = b+h
    b = b + h;     

%if the sign changes compare to the previous f(a)*f(b), and if f(b) changes
%while moving to right, save this pair of b

%   if f(a)*f(b - h) changes sign and f(b)*f(b - h)<0  
    if sign(f(a)*f(b)) ~= sign(f(a)*f(b-h)) && f(b-h)*f(b) < 0
%       let bracket(i, 1) = b - h 
        final(i,1) = b - h; 
%       let bracket(i, 2) = b         
        final(i,2) = b;     
%       iteration += 1
        i = i + 1;         

%if f(b) doesn't change sign while steping right, check f(a) while stepping
%left, if changes, save this pair of a

%   elseif f(a)*f(a+h) <0    
    elseif f(a)*f(a+h) < 0
%       let bracket(i, 1) = a      
        final(i,1) = a;     
%       let bracket(i, 1) = a + h
        final(i,2) = a + h;
%       iteration += 1
        i = i + 1;          
%       let a = a - h; 
        a = a - h; 
    else
     %If nothing satisfied the previous statements,a move left one step   
%      let a = a - h;   
     a = a - h;
    end
%       no roots founded so i remain the same
end
end

    





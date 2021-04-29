function [root] = newRaphGen_04(func, x0)
%NEWRAPH_04 Function takes 2 arguments - function func and point x0, near
%which we search for a root of the function using the Newton Raphson method
%   Detailed explanation goes here

    % Assignment so we could enter the loop
    x1 = x0;
    x0 = 0;
    
    % Introduce a symbol to be able to differentiate func
    syms x;
    deriv = diff(func(x));
    % A loop with limiting accuracy of 1e-10
    while abs(x1-x0)>=1e-10
        % Swap the old value as the argument for the new one
        x0 = x1;
        % Calculating the new value of x
        a = func(x0);
        b = double(subs(deriv, x0));
        x1 = x0 - a/b;
    end
    % Setting the root as the last value of x
    root = x1;
end


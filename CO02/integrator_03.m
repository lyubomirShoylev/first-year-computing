function [value] = integrator_03(func, x, n)
%INTEGRATOR_03 Function recieves 3 variables:
%   - func - a function handle
%   - x - upper limit of integration (lower limit is zero by def)
%   - n - number of sections to divide [0,x] into
%   The returned double 'value' is the result of numerical integration by
%   Simpson's rule.
%   Detailed explanation goes here

    % Small increment
    h = x/n;
    
    % Symbolic solution, deprecated because of speed
    % Useful to wrap around any function(not sensitive to element-wise ops)
    % syms k;
    % value = double(h*(func(0) + func(x) + 2*symsum(func(k*h), k, 1, n-1) +...
    %               4*symsum(func((k-0.5)*h), k, 1, n))/6);
    
    % Arrays for the sums of func
    n1 = 1:(n-1);
    n2 = 1:n;
    % Numeric integration, assumes func can handle element-wise ops
    value = h*(func(0) + func(x) + 2*sum(func(n1.*h)) +...
               4*sum(func((n2-0.5).*h)))/6;
end


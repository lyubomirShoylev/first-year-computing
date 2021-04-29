clear all
close all

% The function as given in the problem text
f = @(x) 3*exp(-x) - x + 3;

% Root by Bisection method
x1 = bisec_04(f, 2, 4);

% Root by Newton Raphson method
x2 = newRaphGen_04(f, 3);

% Root by MATLAB function fzero()
x3 = fzero(f, 3);

% Print all to 10 digits after the fp
fprintf('|%12s|%12s|%12s|\n', 'Bisection', 'New-Raph', 'fzero()');
fprintf('|------------|------------|------------|\n');
fprintf('|%.10f|%.10f|%.10f|\n', x1, x2, x3);
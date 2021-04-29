clear all
close all

% Arrays for x and n values in the problem text
x = [0.2, 0.4, 0.6, 0.8, 1.0];
n = [1, 10, 1000];

% Declare the function we want to integrate
%funcErf = @(x) exp(-x.^2);
funcErf = @(x) (sin(100*pi*x).^2).* exp(-x.^2);

% Simpson values of the integral for every x & n presented in a matrix form
% cell2mat to transform the initial output to a matrix, since the outer
% arrayfun() recieves a matrix(vector of vectors) rather than a plain
% vector, and can output only a cell array.
simpsonValInt = cell2mat(arrayfun(@(k) arrayfun(@(y) integrator_03(funcErf,...
                               y, k), x'),...
                      n,'UniformOutput', false));
% The actual value of the erf calculated via Simpson's rule
simpsonErf = 2*simpsonValInt/sqrt(pi);

% Assemble all data in columns as [x, err(x), [simpsonErf(x, n)]], where
% err(x) is the value of the function included in MATLAB.
data = [x' erf(x)' simpsonErf];

% Print the values in a formatted table(results to 10 digits after the fp)
fprintf('|%3s|%12s|%12s|%12s|%12s|\n', 'x', 'erf', 'n = 1', 'n = 10', 'n = 100');
fprintf('|---|------------|------------|------------|------------|\n');
fprintf('|%.1f|%.10f|%.10f|%.10f|%.10f|\n', data');

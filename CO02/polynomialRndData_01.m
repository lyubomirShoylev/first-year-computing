function [matrixData] = polynomialRndData_01(n, m, listA, rms)
%POLYNOMIALRNDDATA_01 Function takes  the number of data points or x values
%   (n), order of the polynomial (m), the coeffitients(listA - a list of
%   m+1 values), and experimental rms value (rms). The output is a n x 2
%   matrix, where the first column represents the x values, and the second
%   column represents y_fit = y + rms*g, y - value of polynomial at some x,
%   e*g - value of the random error.
%
%   Detailed explanation goes here

    % Produce an array (row vector) of x values
    xVal = [-5:10/(n-1):5];
    
    % Compute y values using the function polyval
    yVal = polyval(flip(listA), xVal) + rms*randn(1, n);
    
    % Or, alternatively, using a for loop:
    % yVal = zeros(1,n);
    % for k=1:m+1
    %   yVal = yVal + listA(k)*xVal.^(k-1)
    % end
    
    matrixData = [xVal' yVal'];
end


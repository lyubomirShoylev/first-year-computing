function [coeffA] = polynomialFit_01(xVal, yVal, m)
%POLYNOMIALFIT_01 Function calculates the coeffitients of a polynomial fit
%for the dataset (xVal, yVal) of the kind y_fit = a_i*x^i, i=0..m. Returns
%them as a row vector coeffA = [a_0, a_1, .. a_m]
    
    % The following function works in two steps:
    %   1) establish the polynomial of x: x^k for k in [0:2m]
    %   2) calculate the value of this polynomial for every xVal
    % The output is a cell array, which we convert to a numel(xVal)x(2m+1)
    % matrix, of which we sum all columns to form a row vector - matrixArrX
    cellArrX = arrayfun(@(x) x.^[0:2*m], xVal, 'UniformOutput', false);
    matrixArrX = sum(cell2mat(cellArrX));
    
    % Now, we create a (2m+1)x(2m+1) matrix of zeros, which we populate
    % such that X(i,j) = x_n^(i+j-2) summed over n=1..N - num of data point
    X = zeros(m+1);
    for k1=1:m+1
        for k2=1:m+1
            X(k1, k2) = matrixArrX(k1+k2-1);
        end
    end
    
    % Similarly to the X values, we calculate the Y values with a sum over
    % the cellArrY of all y*x^k
    cellArrY = arrayfun(@(x, y) y*x.^[0:m], xVal, yVal, 'UniformOutput', false);
    Y = sum(cell2mat(cellArrY));
    
    % Y is a row vector, so we transpose it in order to use -> Y'
    coeffA = (X\Y')';
end


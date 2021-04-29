function [a, b, xRMS] = linearFit_01(xVal, yVal)
%LINEARFIT_01 Produces coeffitients of linear fit to a dataset (xVal,yVal)
%and a RMS value of the dataset. Returns the results as a list [a, b, xRMS]
%
%   Detailed explanation goes here
    
    % Produce matricies for to compute the linear fit
    X = [numel(xVal), sum(xVal);
         sum(xVal), sum(xVal.^2)];
    Y = [sum(yVal);
         sum(xVal.*yVal)];
    
    % Calculate the a column vector A=[a;b]
    A = X\Y;    % This uses Gaussian elimination (correct way to do)
    a = A(1);
    b = A(2);
    
    % Calculate RMS value of the set (function rms if you have Signal
    % Processing Toolbox installed).
    xRMS = rms(xVal);
    % alternatively use:
    % xRMS = sqrt(sum(xVal.^2))/numel(xVal);
end


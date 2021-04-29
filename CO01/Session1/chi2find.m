clear all
close all

% loading data from chi2fit.csv and choosing column 1, 2 and 3
data = csvread('dataFiles/chi2fit.csv');
xValues = data(:, 1);
yValues = data(:, 2);    % we need only column 2 and 3 for calculating chi2
fValues = data(:, 3);

% calculate a new matrix by element-wise calcs; then sum over
deltaY = 5;     % the error, it is defined to be a constant 5
chi2 = sum(((yValues - fValues)/deltaY).^2);    % inside sum() is the element-
                                                % wise matrix
% display answer
disp(chi2);

% opem figure plot & draw plots
fig1 = figure();
errorbar(xValues, yValues, 5*ones(size(data, 1), 1));
% plots the y-values with errorbars^^
hold on;                   % to allow several datasets on 1 plot
plot(xValues, fValues);    % plots theoretical data in solid line


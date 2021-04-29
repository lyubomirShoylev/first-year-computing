clear all
close all

% Take user input
% n = input('Value for number of data points n: ');
% m = input('Value for the order of the polynomial m: ');
% coeffA = input('Value for coeffitients [a_0, a_1, ..., a_m]: ');
% e = input('Value for experimental rms value e: ');
n = 100;
m = 3;
coeffA = [1.5, -2.5, 0.7, -1.2];
e = 10;

% Produce 'experimental data' via user created function
expData = polynomialRndData_01(n, m, coeffA, e);

% Fit a polynomial curve to the 'experimental data' via user created func
coeffAFit = polynomialFit_01(expData(:, 1), expData(:, 2), m);

% Produce the theoretical data given coeffAFit
yFitVal = polyval(flip(coeffAFit), expData(:, 1), m);

% Plot y(x) and y_fit(x) on the same plot
fig1 = figure();

plot(expData(:,1), expData(:,2));
hold on;
plot(expData(:,1), yFitVal);
hold off

% Put labeling and legend
title('Polynomial fit to user created ''Experimental'' dataset');
xlabel('X values');
ylabel('Y values');
legend('''Experim.'' Y vales', 'Fitted Y values', 'Location', 'northwest');

% Put user and fit values of polynomial coeff
% Agreement as delta A / A * 100%
agreement = max(abs((coeffA - coeffAFit)./coeffA)*100);
dim = [0.545, 0.6, 0.3, 0.3];
str = {sprintf('n = %.5f', n), sprintf('m = %.5f', m),...
       sprintf('coeffA = [%.1f, %.1f, %.1f, %.1f]', coeffA),...
       sprintf('e = %.5f', e),...
       sprintf('coeffFit = [%.1f, %.1f, %.1f, %.1f]', coeffAFit),...
       sprintf('They agree to %.1f%% or less', agreement)};
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on',...
           'BackgroundColor', 'w'); 
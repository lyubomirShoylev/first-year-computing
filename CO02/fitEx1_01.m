clear all
close all

% Loading data from datafile and choosing column 1, 2 for xValues & yValues
fileName = 'dataFiles/linear.csv';
data = csvread(fileName);
xValues = data(:, 1);
yValues = data(:, 2);

% Call linearFit_01 and record values
[a, b, xRMS] = linearFit_01(xValues, yValues);

% Calculate fit values
yFitValues = a + b * xValues;



% Formatted display of x, y, y_fit
disp([sprintf('|%10.5s|%10.5s|%10.5s|\n', 'x', 'y', 'y_fit'),...
      sprintf('|----------|----------|----------|\n'),...
      sprintf('|%10.5f|%10.5f|%10.5f|\n', xValues, yValues, yFitValues)]);

% Formatted display of a, b, xRMS
disp([sprintf('|%10.5s|%10.5s|%10.5s|\n', 'a', 'b', 'xRMS'),...
      sprintf('|----------|----------|----------|\n'),...
      sprintf('|%10.5f|%10.5f|%10.5f|\n', a, b, xRMS)]);

% Plot y(x) and y_fit(x) on the same plot
fig1 = figure();

plot(xValues, yValues);
hold on;
plot(xValues, yFitValues);
hold off

% Put labeling and legend
title(compose('Linear fit to dataset %s', fileName));
xlabel('X values');
ylabel('Y values');
legend('Experim. Y vales', 'Fitted Y values', 'Location', 'northwest');

% Put a, b, xRMS values on the plot in a box
dim = [0.65, 0, 0.3, 0.3];
str = {sprintf('a = %.5f', a), sprintf('b = %.5f', b),...
       sprintf('xRMS = %.5f', xRMS)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
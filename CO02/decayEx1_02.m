clear all
close all

% Take user input for half-lives
halfLifeX = 2; % input('Value for half-life of isotope X: ');
halfLifeY = 16;% input('Value for half-life of isotope Y: ');

% The time array for years 1-50
time = 1:50;

% Calculate all population at years 1-50 considering we have half-times and
% Have to give decay rates to our function.
[popX, popY, popZ] = arrayfun(@(t) populationDecay_02(log(2)/halfLifeX,...
                              log(2)/halfLifeY, t), time);
% Collect all population values in a single matrix
popXYZ = [[1, 0, 0]; [popX' popY' popZ']];
% Add year 0 to time array so we have equal number of x-y coords
time = [0 time];

% Plot populations against time on a single plot
fig1 = figure();

plot(time, popXYZ(:, 1));
hold on;
plot(time, popXYZ(:, 2));
plot(time, popXYZ(:, 3));
hold off;

% Put labeling and legend
title('Relative population of isotopes X\rightarrowY\rightarrowZ agains time');
xlabel('Time, yr');
ylabel('Relative population N_i/N_{tot}');
legend('Population of X', 'Population of Y', 'Population of Z',...
       'Location', 'northwest');
   
% Put half-lifes of X and Y
dim = [0.70, 0.3, 0.3, 0.3];
str = {sprintf('T_X^{1/2} = %.1f yr', halfLifeX),...
       sprintf('T_y^{1/2} = %.1f yr', halfLifeY)};
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on',...
           'BackgroundColor', 'w'); 
clear all
close all

% Take user input for half-lives from file
fileName = input('Name of file containin half-lifes: ', 's');
readFile = fopen(fileName, 'r');
halfLifesXY = fscanf(readFile, '%f %f', [2, inf]);
fclose(readFile);

% The time array for years 1-50
time = 1:50;

% Counter for file names
counter = 1;
for hl=halfLifesXY
    % Calculate all population at years 1-50 considering we have half-times and
    % Have to give decay rates to our function.
    [popX, popY, popZ] = arrayfun(@(t) populationDecay_02(log(2)/hl(1),...
                                  log(2)/hl(2), t), time);
    
    % Write N(t) to a respective datafile
    writeFile = fopen(sprintf('populations_%d.csv', counter), 'w');
    % Since fprintf reads column-by-column, we write 4x(num of data) matrix
    fprintf(writeFile, '%.7f %.7f %.7f %.7f\n', [[0 time]; [1 popX];...
                                                 [0 popY]; [0 popZ]]);
    fclose(writeFile);
    
    counter = counter + 1;
end

% To make sure everything is closed
close('all');
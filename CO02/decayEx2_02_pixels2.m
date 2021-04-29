clear all
close all

% Take user input for half-lives
halfLifeX = 2; % input('Value for half-life of isotope X: ');
halfLifeY = 16;% input('Value for half-life of isotope Y: ');

% Initialize membership of atoms 1:initialNAtoms
initialNAtoms = 1000;
popX = [1:initialNAtoms];
popY = [];
popZ = [];
deltaT = 1; % Time interval between 'measurements'

% Initialize a 3D matrix representation of out RGB image (double)
pic = zeros(initialNAtoms, 51, 3);
% The first 3 default colours of MATLAB used for plotting; using them to
% make everything pretty and no other reason
blue = [0, 0.4470, 0.7410];
red = [0.8500, 0.3250, 0.0980];
yellow = [0.9290, 0.6940, 0.1250];

% Add first column of data - the first horizontal slice
for n=popX
    pic(n, 1, 1:3) = blue;
end

% Initialize video file to record animation
v = VideoWriter('02_Ex2_decay_pixels2.avi');
v.Quality = 100;
open(v);

% Initialize plot frame
figure();   %'Position',[0 0 1600 1200]);% - for higher resolution

% Put the image on the frame
image(pic);
% Put labeling and legend - do every time image is drawn - should be more
% effective way
title('Visualising population of isotopes X\rightarrowY\rightarrowZ agains time');
xlabel('Time, yr');
ylabel('# of individual atoms');
legend([patch(nan,nan,blue), patch(nan,nan,red), patch(nan,nan,yellow)],...
       {'Isotope X', 'Isotope Y', 'Isotope Z'}, 'Location', 'northeastoutside');
set(gca,'YDir','normal'); % Flips the y axis for nice labeling

% Put half-lifes of X and Y
dim = [0.745, 0.45, 0.3, 0.3];
str = {sprintf('T_X^{1/2} = %.1f yr', halfLifeX),...
       sprintf('T_y^{1/2} = %.1f yr', halfLifeY)};
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on',...
           'BackgroundColor', 'w');

% Captures the current content of the figure and appends it to the video
frame = getframe(gcf);
writeVideo(v,frame);
pause(0.1);

for k=2:51
    [popX, popY, popZ] = populationProb_02(popX, popY, popZ,...
                         log(2)/halfLifeX, log(2)/halfLifeY, deltaT);
    
    % Add column of data - horizontal slice
    for n=1:numel(popX)
        pic(n, k, 1:3) = blue;
    end
    for n=numel(popX)+1:numel(popX)+numel(popY)
        pic(n, k, 1:3) = red;
    end
    for n=numel(popX)+numel(popY)+1:numel(popX)+numel(popY)+numel(popZ)
        pic(n, k, 1:3) = yellow;
    end

    % Put the image on the frame
    image(pic);
    title('Visualising population of isotopes X\rightarrowY\rightarrowZ agains time');
    xlabel('Time, yr');
    ylabel('# of individual atoms');
    legend([patch(nan,nan,blue), patch(nan,nan,red), patch(nan,nan,yellow)],...
           {'Isotope X', 'Isotope Y', 'Isotope Z'}, 'Location', 'northeastoutside');
    set(gca,'YDir','normal');
    pause(0.1);
    
    % Captures the current content of the figure and appends it to the video
    frame = getframe(gcf);
    writeVideo(v,frame);
end

% Close the video file and save it
close(v);
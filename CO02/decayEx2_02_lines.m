clear all
close all

% Take user input for half-lives
halfLifeX = 2; % input('Value for half-life of isotope X: ');
halfLifeY = 16;% input('Value for half-life of isotope Y: ');

% Initialize membership of atoms 1:initialNAtoms
initialNAtoms = 10000;
popX = [1:initialNAtoms];
popY = [];
popZ = [];
deltaT = 1; % Time interval between 'measurements'

% The first 3 default colours of MATLAB used for plotting; using them to
% make everything pretty and no other reason
blue = [0, 0.4470, 0.7410];
red = [0.8500, 0.3250, 0.0980];
yellow = [0.9290, 0.6940, 0.1250]; 

% Initialize video file to record animation
v = VideoWriter('02_Ex2_decaylines.avi');
v.Quality = 100;
open(v);

% Initialize plot frame
figure();%'Position',[0 0 1600 1200]);% - for higher resolution
axis([0,50,0,1]);
box on;
% Put labeling and legend
title('Relative population of isotopes X\rightarrowY\rightarrowZ agains time');
xlabel('Time, yr');
ylabel('Relative population N_i/N_{tot}');

% Initialize dynamically drawn lines
lineX = animatedline('Color', blue);
lineY = animatedline('Color', red);
lineZ = animatedline('Color', yellow);
legend('Population of X', 'Population of Y', 'Population of Z',...
       'Location', 'northwest');
% Put half-lifes of X and Y
dim = [0.70, 0.3, 0.3, 0.3];
str = {sprintf('T_X^{1/2} = %.1f yr', halfLifeX),...
       sprintf('T_y^{1/2} = %.1f yr', halfLifeY)};
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on',...
           'BackgroundColor', 'w'); 
% Starting points at t = 0;
addpoints(lineX,0,numel(popX)/initialNAtoms);
addpoints(lineY,0,0);
addpoints(lineZ,0,0);
drawnow;    % Puts new points along the old ones

% Captures the current content of the figure and appends it to the video
frame = getframe(gcf);
writeVideo(v,frame);
pause(0.1);
    
for k=2:51
    % Use our function to find the new set of data from previous one
    [popX, popY, popZ] = populationProb_02(popX, popY, popZ,...
                         log(2)/halfLifeX, log(2)/halfLifeY, deltaT);
    
    % Add new datapoints to the plot
    addpoints(lineX,k-1,numel(popX)/initialNAtoms);
    addpoints(lineY,k-1,numel(popY)/initialNAtoms);
    addpoints(lineZ,k-1,numel(popZ)/initialNAtoms);
    drawnow;
    pause(0.1);     % So we could see how it is drawn
    
    % Captures the current content of the figure and appends it to the video
    frame = getframe(gcf);
    writeVideo(v,frame);
end

% Close the video file and save it
close(v);
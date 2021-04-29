% Author: Lyubomir Shoylev, lyubomir-shoylev@st-hildas.ox.ac.uk , Date: 23/01/2020
%
% NB: The calculation method is the improved Euler method.
%
% Set the initial conditions of the system. Simulate the rocket trajectory 
% with the earth and moon influence using the user-created function 
% simulate_rocket. After that, plot the trajectory (showing its direction)
% toghether with the Earth and Moon to show what the flight path was.
clear all, close all

% Inital conditions of the system
init_pos = [0, 3.7];

theta = 52.1*pi/180;
init_vel = 0.0066 * [cos(theta), sin(theta)];

Omega = 2.6615e-6;
moon_pos = @(t) 222*[cos(Omega*t), sin(Omega*t)];

t = 0:10:300000; % linspace(0, 1000000, 100000);

% Computation position of projectile
[tout, pos, vel] = simulate_rocket_improved(init_pos, init_vel, moon_pos, t);

v = VideoWriter('kekisimo.avi');
v.Quality = 100;
open(v);

fig = figure();%'Position',[0 0 1600 1200]); - for higher resolution

% Plot position of projectile and Earth and Moon
pa = pos(1,:);
% Projectile trajectory 
line = plot(pa(:,1), pa(:,2));
hold on;
line.XDataSource = 'pa(:,1)';
line.YDataSource = 'pa(:,2)';
% axis limits
xlim([-30 330]);
ylim([-5 280]);
%axis equal;
% Arrows showing direction of movement of projectile
%quiver(pos(1:2000:end,1), pos(1:2000:end,2), vel(1:2000:end,1), vel(1:2000:end,2), 'LineWidth', 1);

% Draw circle to show Earth
pp1 = [-3.7 -3.7 7.4 7.4];
rectangle('Position',pp1,'Curvature',[1 1]);

% Draw circle to show Moon
k = 1;
place = moon_pos(tout(k)) - [1 1]; k = k + 1;
pp2 = [place 2 2];
rect = rectangle('Position',pp2,'Curvature',[1 1]);
% Make the scale equal in x & y
% axis equal;
%
hold off;

% Put labeling and legend
title('Rocket trajectory');
xlabel('x coordinates');
ylabel('y coordinates');
legend('The trajectory', 'The velocity vectors to scale', 'Location', 'northwest');

frame = getframe(gcf);
writeVideo(v,frame);
pause(0.1);

while k<=(numel(tout))
    
    % Add column of data - horizontal slice
    pa = [pa; pos(k,:)];
    refreshdata(line);
    delete(rect);
    place = moon_pos(tout(k)) - [1 1]; k = k + 1;
    pp2 = [place 2 2];
    rect = rectangle('Position',pp2,'Curvature',[1 1]);
    % Put the image on the frame
    % image(pic);
    
    % Captures the current content of the figure and appends it to the video
    if rem(k,100) == 0
        frame = getframe(gcf);
        writeVideo(v,frame);
    end
    
    k = k + 1;
end

% Close the video file and save it
close(v);
% Author: Lyubomir Shoylev, lyubomir-shoylev@st-hildas.ox.ac.uk , Date: 23/01/2020
%
% NB: The calculation method is the improved Euler method.
%
% Set the initial conditions of the system. Simulate the rocket trajectory 
% with the earth and moon influence using the user-created function 
% simulate_rocket. After that, plot the trajectory (showing its direction)
% toghether with the Earth and Moon to show what the flight path was.
clear, close all

% Inital conditions of the system
init_pos = [0, 3.7];

theta = 52.5*pi/180;
init_vel = 0.0066 * [cos(theta), sin(theta)];

Omega = 2.6615e-6;
moon_pos = @(t) 222*[cos(Omega*t), sin(Omega*t)];

t = 0:10:300000; % linspace(0, 1000000, 100000);

% Computation position of projectile
[tout, pos, vel,~] = simulate_rocket_improved(init_pos, init_vel, moon_pos, t);

% Plot position of projectile and Earth and Moon

%% Projectile trajectory 
plot(pos(:,1), pos(:,2));
hold on;

% Arrows showing direction of movement of projectile
quiver(pos(1:2000:end,1), pos(1:2000:end,2), vel(1:2000:end,1), vel(1:2000:end,2), 'LineWidth', 1);

moonTrace = moon_pos(tout);
moonTrace=reshape(moonTrace,length(tout),2);
plot(moonTrace(:,1), moonTrace(:,2),'-*r');

% Draw circle to show Earth
pp1 = [-3.7 -3.7 7.4 7.4];
rectangle('Position',pp1,'Curvature',[1 1]);

% Draw circle to show Moon
place = moon_pos(tout(end)) - [1 1];
pp2 = [place 2 2];
rectangle('Position',pp2,'Curvature',[1 1]);

% Make the scale equal in x & y
axis equal;
hold off;

% Put labeling and legend
title('Rocket trajectory');
xlabel('x coordinates');
ylabel('y coordinates');
legend('The trajectory', 'The velocity vectors to scale', 'Location', 'northwest');
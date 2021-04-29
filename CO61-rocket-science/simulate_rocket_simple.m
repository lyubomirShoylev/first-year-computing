function [tout, pos, vel] = simulate_rocket_simple(init_pos, init_vel, moon_pos, t)
% Author: Lyubomir Shoylev, lyubomir-shoylev@st-hildas.ox.ac.uk , Date: 15/12/2019
%
% NB: The calculation method is the simplest Euler method.
%
% Simulate the rocket trajectory with the earth and moon influence. The coordinate
% used in this function is centred at earth’s centre (i.e. earth centre at (0,0) )
% and scaled in moon?radius.
% The simulation finishes when it simulates for the whole t, or the rocket landed
% on the moon.
% Input:
% * init_pos: 2-elements vector (x, y) indicating the initial position of the rocket.
% * init_vel: 2-elements vector (vx, vy) of the initial velocity of the rocket.
% * moon_pos: a function that receives time, t, and return a 2-elements vector (x, y)
%               (see hint) indicating the moon position relative to earth.
% * t: an N-    elements vector of the time step where the position of the rocket will be
%               returned.
%
% Output:
% * tout: an M-elements vector of the time step where the position is described,
%           if the rocket does not land on the moon, M = N.
% * pos: (M x 2) matrix indicating the positions of the rocket as function of time,
%           with the first column is x and the second column is y.
% * vel: (M x 2) matrix indicating the velocities of the rocket as function of time,
%           with the first column is x and the second column is y.
%
% Example use:
% >> init_pos = [0, 3.7];
% >> init_vel = 0.0066 * [cosd(89.9), sind(89.9)];
% >> moon_pos = @(t) [0, 222];
% >> t = linspace(0, 10000, 1000);
% >> [tout, pos] = simulate_rocket(init_pos, init_vel, moon_pos, t);
% >> plot(pos(:,1),pos(:,2));

    % Constants:
    M_m = 1.0;      % mass of the Moon in Moon masses
    M_e = 83.3;     % mass of the Earth in Moon masses
    R_m = 1.0;      % radius of the Moon in Moon radii
    R_e = 3.7;      % radius of the Moon in Moon radii
    G = 9.63e-7;    % gravitational constant in new lenght and mass units

    % Helper functions
    % Function giving magnitude of vector v
    mag_vec = @(v) sqrt(v(1)^2 + v(2)^2);
    % Acceleration in a given direction, given by:
    %   -p1: 2-elements (x, y) position vector of projectile realtive to Earth
    %   -p2: 2-elements (x, y) position vector of projectile realtive to Moon
    %   -dir: integer showing the desired component of accel to be calculated
    %         1==x, 2==y 
    a_dir = @(p1, p2, dir)...
            -1*(G*M_e)*p1(dir)/(mag_vec(p1))^3 - (G*M_m)*p2(dir)/(mag_vec(p2))^3;
    
    % Initialize the output variables
    tout = [t(1)];
    pos = [init_pos];
    vel = [init_vel];
    % Initialize the small time interval
    delta_t = t(2);    

    for n=2:numel(t)
        % the current position of the moon
        m_pos = moon_pos(t(n-1));
        
        % compute acceleration in x and y directions
        a_x = a_dir(init_pos, init_pos - m_pos, 1);
        a_y = a_dir(init_pos, init_pos - m_pos, 2);
        
        % compute new position and velocities
        init_pos = init_pos + delta_t*init_vel;
        init_vel = init_vel + delta_t*[a_x, a_y];

        % record the new values for position and velocity
        tout = [tout, t(n)];
        pos = [pos; init_pos];
        vel = [vel;init_vel];

        % Terminating condition
        if (mag_vec(init_pos) <= R_e) || (mag_vec(init_pos - m_pos) <= R_m)
            break;
        end

    end


end


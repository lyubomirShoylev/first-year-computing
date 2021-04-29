function [imageOut] = slantedImage(imageIn)
%slantedImage Creates the efect of slanting the image with an angle theta.
%   Detailed explanation goes here

    Y = size(imageIn, 1);
    X = size(imageIn, 2);
    theta = 5;
    % Round the shift to the nearest integer above Y*tan(theta).  Use
    % tand(theta) since theta is in degrees and not radians.
    %
    % max_shift is the greatest amount of shift that we will see
    maxShift = ceil(Y*tand(theta));
    imageOut = zeros(Y, X+maxShift, 3);
    for y=1:Y
        local_shift = ceil(y*tand(theta));
        local_x = 1:X;
        local_x = local_x + local_shift;
        imageOut(y, local_x, :)=imageIn(y, :, :);
    end
end


function [imageOut] = sinusoidalShiftImage(imageIn)
%sinusoidalShiftImage Creates the efect of sine shifting the image along
%   the Y axis.
%   Detailed explanation goes here

    Y = size(imageIn, 1);
    X = size(imageIn, 2);
    amplitude = 14;  % amplitude of the sine shift
    waveNumber = 5;  % degrees per pixel in y dimension
    % Used shift is deltaX = amplitude + amplitude
    % max_shift is the greatest amount of shift that we will see
    maxShift = 2*amplitude;
    imageOut = zeros(Y, X+maxShift, 3);
    for y=1:Y
        localShift = ceil(amplitude * (1 + sind(waveNumber*y)));
        localX = 1:X;
        localX = localX + localShift;
        imageOut(y, localX, :)=imageIn(y, :, :);
    end
end


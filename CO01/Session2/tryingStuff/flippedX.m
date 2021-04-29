function [imageOut] = flippedX(imageIn)
%flippedX Flip imageIn on X axis
%   Detailed explanation goes here

    imageOut = imageIn(:, end:-1:1, :);
end


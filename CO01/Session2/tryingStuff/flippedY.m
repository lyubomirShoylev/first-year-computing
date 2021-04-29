function [imageOut] = flippedY(imageIn)
%flippedY Flip imageIn on Y axis
%   Detailed explanation goes here
    
    imageOut = imageIn(end:-1:1, :, :);
end


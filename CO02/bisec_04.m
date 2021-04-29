function [root] = bisec_04(func, x1, x2)
%BISEC_04 Function takes 3 arguments - function func and endpoints of the
%interval [x1, x2]. By repreated halving of the interval in the apporpriate
%side it finds *a* root in the interval (there could be more roots in the
%interval).
%   Detailed explanation goes here
    
    % Value of func at the 2 initial points (should be different sign)
    y1 = func(x1);
    y2 = func(x2);
    
    % A loop with limiting accuracy of 1e-10
    while (x2-x1)>= 1e-10
        % Mid-point of [x1, x2]
        x3 = 0.5*(x1 + x2);
        % Based on sign(func(x3)) choose substitution
        if sign(func(x3)) == sign(y1)
            x1 = x3;
        elseif sign(func(x3)) == sign(y2)
            x2 = x3;
        elseif sign(func(x3)) == 0
            % In case it is equal to zero, this is *the root*
            root = x3;
            % Break to leave x3 as the value of root
            break;
        end
        % Assign upper limit as answer
        root = x2;
    end
end


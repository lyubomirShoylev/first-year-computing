function [root] = newRaphCon_04(x0)
%NEWRAPHCON The same method as newRaphGen_04, but substituting directly
%what func is.
%   Detailed explanation goes here

    x1 = x0;
    x0 = 0;

    while abs(x1-x0)>=1e-10
        x0 = x1;
        a = 3*exp(-x0) - x0 + 3;
        b = (-3)*exp(-x0) - 1;
        x1 = x0 - a/b;
    end
    root = x1;
end


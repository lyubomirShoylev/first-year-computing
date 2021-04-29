function [popX, popY, popZ] = populationDecay_02(decayX, decayY, time)
%POPULATION Function calculates population values for isotopes X, Y and Z
%when the relationship is X->Y->Z with decay rates respectively of decayX
%and decayY at the moment of time 'time'. It is assumed inital conditions
%are such that popX = 1, popY = 0, popZ = 0.
%   Detailed explanation goes here
    
    % Total pop normalized to 1
    POP_TOTAL = 1;
    
    % Population of X
    popX = POP_TOTAL * exp(-decayX * time);
    
    % Population of Y with considering decayX = decayY
    if decayX ~= decayY
        popY = POP_TOTAL*decayX*exp(-decayY * time)*...
               (expm1((decayY - decayX)*time))/(decayY - decayX);
    elseif decayX == decayY
        popY = POP_TOTAL*decayX*time*exp(-decayX*time);
    end
    
    % Population of Z
    popZ = POP_TOTAL - popX - popY;
end


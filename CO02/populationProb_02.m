function [popX, popY, popZ] = populationProb_02(popX0, popY0, popZ0, decayX, decayY, deltaT)
%POPULATIONPROB Function recieves arrays with number of atoms in arrays
%such that if number n is in array popX0, the n-th atom is in the isotope
%form X. Other input include half-lives of X and Y and the time interval.
%The output is arrays populated in similar fashion after determining which
%atoms undergo decay.
%   Detailed explanation goes here
    
    % Computing probabilities of decay for isotopes X and Y; they are in
    % the range (0,1).
    probX = (-1)*expm1(-decayX*deltaT);
    probY = (-1)*expm1(-decayY*deltaT);
    
    % Decide which atoms of isotope Y undergo decay and which remain in
    % form Y:
    % Produce a random number in the interval [0,1] for every atom
    indY = rand(1, numel(popY0));
    % Atoms with numbers < probY undergo decay, added to list of Z
    popZ = [popZ0 popY0(indY<probY)];
    % Atoms with numbers >= probY remain as Y, added to list of Y
    popY = popY0(~(indY<probY));
    
    % The same mechanism in determining decay X->Y as in Y->Z
    indX = rand(1, numel(popX0));
    popY = [popY popX0(indX<probX)];
    popX = popX0(~(indX<probX));
end

